package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import model.Order;
import model.OrderItem;
import util.DBConnection;

/**
 * DAO để thao tác với bảng orders và order_items
 */
public class OrderDAO {
    
    private Connection getConnection() {
        return DBConnection.getInstance().getConnection();
    }
    
    /**
     * Tạo đơn hàng mới
     */
    public boolean createOrder(Order order, List<OrderItem> items) {
        Connection conn = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction
            
            // Tạo mã đơn hàng
            if (order.getOrderCode() == null) {
                order.setOrderCode(generateOrderCode());
            }
            
            // Insert order
            String orderSql = "INSERT INTO orders (order_code, user_id, receiver_name, receiver_phone, " +
                            "receiver_email, shipping_address, note, subtotal, shipping_fee, discount, " +
                            "total, payment_method, payment_status, order_status) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement psOrder = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);
            psOrder.setString(1, order.getOrderCode());
            if (order.getUserId() != null) {
                psOrder.setInt(2, order.getUserId());
            } else {
                psOrder.setNull(2, Types.INTEGER);
            }
            psOrder.setString(3, order.getReceiverName());
            psOrder.setString(4, order.getReceiverPhone());
            psOrder.setString(5, order.getReceiverEmail());
            psOrder.setString(6, order.getShippingAddress());
            psOrder.setString(7, order.getNote());
            psOrder.setBigDecimal(8, order.getSubtotal());
            psOrder.setBigDecimal(9, order.getShippingFee() != null ? order.getShippingFee() : BigDecimal.ZERO);
            psOrder.setBigDecimal(10, order.getDiscount() != null ? order.getDiscount() : BigDecimal.ZERO);
            psOrder.setBigDecimal(11, order.getTotal());
            psOrder.setString(12, order.getPaymentMethod() != null ? order.getPaymentMethod() : "cod");
            psOrder.setString(13, order.getPaymentStatus() != null ? order.getPaymentStatus() : "pending");
            psOrder.setString(14, order.getOrderStatus() != null ? order.getOrderStatus() : "pending");
            
            int rows = psOrder.executeUpdate();
            if (rows == 0) {
                conn.rollback();
                return false;
            }
            
            ResultSet rs = psOrder.getGeneratedKeys();
            if (rs.next()) {
                order.setId(rs.getInt(1));
            }
            
            // Insert order items
            String itemSql = "INSERT INTO order_items (order_id, product_id, product_name, " +
                           "product_image, price, quantity, total) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement psItem = conn.prepareStatement(itemSql);
            
            for (OrderItem item : items) {
                psItem.setInt(1, order.getId());
                if (item.getProductId() != null) {
                    psItem.setInt(2, item.getProductId());
                } else {
                    psItem.setNull(2, Types.INTEGER);
                }
                psItem.setString(3, item.getProductName());
                psItem.setString(4, item.getProductImage());
                psItem.setBigDecimal(5, item.getPrice());
                psItem.setInt(6, item.getQuantity());
                psItem.setBigDecimal(7, item.getTotal());
                psItem.addBatch();
            }
            psItem.executeBatch();
            
            conn.commit();
            return true;
            
        } catch (SQLException e) {
            System.err.println("Lỗi tạo order: " + e.getMessage());
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }
    
    /**
     * Lấy đơn hàng theo ID
     */
    public Order findById(int id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Order order = mapResultSetToOrder(rs);
                order.setOrderItems(findOrderItems(id));
                return order;
            }
        } catch (SQLException e) {
            System.err.println("Lỗi tìm order: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    /**
     * Lấy đơn hàng theo mã đơn hàng
     */
    public Order findByOrderCode(String orderCode) {
        String sql = "SELECT * FROM orders WHERE order_code = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, orderCode);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Order order = mapResultSetToOrder(rs);
                order.setOrderItems(findOrderItems(order.getId()));
                return order;
            }
        } catch (SQLException e) {
            System.err.println("Lỗi tìm order theo code: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    /**
     * Lấy danh sách đơn hàng của user
     */
    public List<Order> findByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Order order = mapResultSetToOrder(rs);
                order.setOrderItems(findOrderItems(order.getId()));
                orders.add(order);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy orders của user: " + e.getMessage());
            e.printStackTrace();
        }
        return orders;
    }
    
    /**
     * Lấy tất cả đơn hàng (cho Admin)
     */
    public List<Order> findAll() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY created_at DESC";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                orders.add(mapResultSetToOrder(rs));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy all orders: " + e.getMessage());
            e.printStackTrace();
        }
        return orders;
    }
    
    /**
     * Lấy đơn hàng với phân trang (cho Admin)
     */
    public List<Order> findWithPagination(int page, int limit) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY created_at DESC LIMIT ? OFFSET ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, limit);
            ps.setInt(2, (page - 1) * limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                orders.add(mapResultSetToOrder(rs));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy orders phân trang: " + e.getMessage());
            e.printStackTrace();
        }
        return orders;
    }
    
    /**
     * Lấy đơn hàng theo trạng thái
     */
    public List<Order> findByStatus(String status) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE order_status = ? ORDER BY created_at DESC";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                orders.add(mapResultSetToOrder(rs));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy orders theo status: " + e.getMessage());
            e.printStackTrace();
        }
        return orders;
    }
    
    /**
     * Cập nhật trạng thái đơn hàng
     */
    public boolean updateStatus(int orderId, String status) {
        String sql = "UPDATE orders SET order_status = ?, updated_at = CURRENT_TIMESTAMP";
        
        // Nếu đã giao hàng, cập nhật delivered_at
        if ("delivered".equals(status)) {
            sql += ", delivered_at = CURRENT_TIMESTAMP";
        }
        sql += " WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ps.setInt(2, orderId);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi cập nhật order status: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * Cập nhật trạng thái thanh toán
     */
    public boolean updatePaymentStatus(int orderId, String paymentStatus) {
        String sql = "UPDATE orders SET payment_status = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, paymentStatus);
            ps.setInt(2, orderId);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi cập nhật payment status: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * Hủy đơn hàng
     */
    public boolean cancelOrder(int orderId, String reason) {
        String sql = "UPDATE orders SET order_status = 'cancelled', cancelled_reason = ?, " +
                    "updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, reason);
            ps.setInt(2, orderId);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi hủy order: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * Lấy chi tiết đơn hàng (order items)
     */
    public List<OrderItem> findOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                items.add(mapResultSetToOrderItem(rs));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy order items: " + e.getMessage());
            e.printStackTrace();
        }
        return items;
    }
    
    /**
     * Đếm tổng số đơn hàng
     */
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM orders";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi đếm orders: " + e.getMessage());
        }
        return 0;
    }
    
    /**
     * Đếm đơn hàng theo trạng thái
     */
    public int countByStatus(String status) {
        String sql = "SELECT COUNT(*) FROM orders WHERE order_status = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi đếm orders theo status: " + e.getMessage());
        }
        return 0;
    }
    
    /**
     * Tính tổng doanh thu
     */
    public BigDecimal getTotalRevenue() {
        String sql = "SELECT SUM(total) FROM orders WHERE order_status = 'delivered' AND payment_status = 'paid'";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                BigDecimal total = rs.getBigDecimal(1);
                return total != null ? total : BigDecimal.ZERO;
            }
        } catch (SQLException e) {
            System.err.println("Lỗi tính doanh thu: " + e.getMessage());
        }
        return BigDecimal.ZERO;
    }
    
    /**
     * Tạo mã đơn hàng unique
     */
    private String generateOrderCode() {
        String timestamp = String.valueOf(System.currentTimeMillis()).substring(5);
        String uuid = UUID.randomUUID().toString().substring(0, 4).toUpperCase();
        return "DH" + timestamp + uuid;
    }
    
    /**
     * Map ResultSet sang Order
     */
    private Order mapResultSetToOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setId(rs.getInt("id"));
        order.setOrderCode(rs.getString("order_code"));
        
        int userId = rs.getInt("user_id");
        order.setUserId(rs.wasNull() ? null : userId);
        
        order.setReceiverName(rs.getString("receiver_name"));
        order.setReceiverPhone(rs.getString("receiver_phone"));
        order.setReceiverEmail(rs.getString("receiver_email"));
        order.setShippingAddress(rs.getString("shipping_address"));
        order.setNote(rs.getString("note"));
        order.setSubtotal(rs.getBigDecimal("subtotal"));
        order.setShippingFee(rs.getBigDecimal("shipping_fee"));
        order.setDiscount(rs.getBigDecimal("discount"));
        order.setTotal(rs.getBigDecimal("total"));
        order.setPaymentMethod(rs.getString("payment_method"));
        order.setPaymentStatus(rs.getString("payment_status"));
        order.setOrderStatus(rs.getString("order_status"));
        order.setCancelledReason(rs.getString("cancelled_reason"));
        order.setDeliveredAt(rs.getTimestamp("delivered_at"));
        order.setCreatedAt(rs.getTimestamp("created_at"));
        order.setUpdatedAt(rs.getTimestamp("updated_at"));
        return order;
    }
    
    /**
     * Map ResultSet sang OrderItem
     */
    private OrderItem mapResultSetToOrderItem(ResultSet rs) throws SQLException {
        OrderItem item = new OrderItem();
        item.setId(rs.getInt("id"));
        item.setOrderId(rs.getInt("order_id"));
        
        int productId = rs.getInt("product_id");
        item.setProductId(rs.wasNull() ? null : productId);
        
        item.setProductName(rs.getString("product_name"));
        item.setProductImage(rs.getString("product_image"));
        item.setPrice(rs.getBigDecimal("price"));
        item.setQuantity(rs.getInt("quantity"));
        item.setTotal(rs.getBigDecimal("total"));
        item.setCreatedAt(rs.getTimestamp("created_at"));
        return item;
    }
    
    /**
     * Đếm tổng số orders
     */
    public int getTotalOrders() {
        String sql = "SELECT COUNT(*) FROM orders";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi đếm tổng orders: " + e.getMessage());
        }
        return 0;
    }
    
    /**
     * Lấy danh sách orders gần đây
     */
    public List<Order> getRecentOrders(int limit) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY created_at DESC LIMIT ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                orders.add(mapResultSetToOrder(rs));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy recent orders: " + e.getMessage());
        }
        return orders;
    }
}
