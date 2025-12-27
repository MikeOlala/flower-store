package dao;

import model.Product;
import model.Category;
import util.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO để thao tác với bảng products
 */
public class ProductDAO {
    
    private Connection getConnection() {
        return DBConnection.getInstance().getConnection();
    }
    
    /**
     * Lấy tất cả sản phẩm đang active
     */
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_active = TRUE " +
                    "ORDER BY p.created_at DESC";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy danh sách products: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm với phân trang
     */
    public List<Product> findWithPagination(int page, int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_active = TRUE " +
                    "ORDER BY p.created_at DESC " +
                    "LIMIT ? OFFSET ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, limit);
            ps.setInt(2, (page - 1) * limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy products với phân trang: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm theo danh mục
     */
    public List<Product> findByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.category_id = ? AND p.is_active = TRUE " +
                    "ORDER BY p.created_at DESC";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy products theo category: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm theo slug danh mục
     */
    public List<Product> findByCategorySlug(String categorySlug) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "JOIN categories c ON p.category_id = c.id " +
                    "WHERE c.slug = ? AND p.is_active = TRUE " +
                    "ORDER BY p.created_at DESC";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, categorySlug);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy products theo category slug: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm nổi bật
     */
    public List<Product> findFeatured(int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_featured = TRUE AND p.is_active = TRUE " +
                    "ORDER BY p.created_at DESC LIMIT ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy featured products: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm mới nhất
     */
    public List<Product> findLatest(int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_active = TRUE " +
                    "ORDER BY p.created_at DESC LIMIT ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy latest products: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm bán chạy
     */
    public List<Product> findBestSellers(int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.is_active = TRUE " +
                    "ORDER BY p.sold_count DESC LIMIT ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy best sellers: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Lấy sản phẩm đang giảm giá
     */
    public List<Product> findOnSale(int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.sale_price IS NOT NULL AND p.sale_price < p.price " +
                    "AND p.is_active = TRUE " +
                    "ORDER BY (p.price - p.sale_price) / p.price DESC LIMIT ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy sale products: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Tìm sản phẩm theo ID
     */
    public Product findById(int id) {
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToProduct(rs, true);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi tìm product theo ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    /**
     * Tìm sản phẩm theo slug
     */
    public Product findBySlug(String slug) {
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.slug = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, slug);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToProduct(rs, true);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi tìm product theo slug: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    /**
     * Tìm kiếm sản phẩm theo từ khóa
     */
    public List<Product> search(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE (p.name LIKE ? OR p.description LIKE ?) AND p.is_active = TRUE " +
                    "ORDER BY p.name";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi tìm kiếm products: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Lọc sản phẩm theo giá
     */
    public List<Product> findByPriceRange(BigDecimal minPrice, BigDecimal maxPrice) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE COALESCE(p.sale_price, p.price) BETWEEN ? AND ? " +
                    "AND p.is_active = TRUE " +
                    "ORDER BY COALESCE(p.sale_price, p.price)";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setBigDecimal(1, minPrice);
            ps.setBigDecimal(2, maxPrice);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lọc products theo giá: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
    
    /**
     * Thêm sản phẩm mới
     */
    public boolean insert(Product product) {
        String sql = "INSERT INTO products (category_id, name, slug, description, short_description, " +
                    "price, sale_price, quantity, image, images, is_featured, is_active) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            if (product.getCategoryId() != null) {
                ps.setInt(1, product.getCategoryId());
            } else {
                ps.setNull(1, Types.INTEGER);
            }
            ps.setString(2, product.getName());
            ps.setString(3, product.getSlug());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getShortDescription());
            ps.setBigDecimal(6, product.getPrice());
            ps.setBigDecimal(7, product.getSalePrice());
            ps.setInt(8, product.getQuantity());
            ps.setString(9, product.getImage());
            ps.setString(10, product.getImages());
            ps.setBoolean(11, product.isFeatured());
            ps.setBoolean(12, product.isActive());
            
            int rows = ps.executeUpdate();
            if (rows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    product.setId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Lỗi thêm product: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * Cập nhật sản phẩm
     */
    public boolean update(Product product) {
        String sql = "UPDATE products SET category_id = ?, name = ?, slug = ?, description = ?, " +
                    "short_description = ?, price = ?, sale_price = ?, quantity = ?, image = ?, " +
                    "images = ?, is_featured = ?, is_active = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            if (product.getCategoryId() != null) {
                ps.setInt(1, product.getCategoryId());
            } else {
                ps.setNull(1, Types.INTEGER);
            }
            ps.setString(2, product.getName());
            ps.setString(3, product.getSlug());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getShortDescription());
            ps.setBigDecimal(6, product.getPrice());
            ps.setBigDecimal(7, product.getSalePrice());
            ps.setInt(8, product.getQuantity());
            ps.setString(9, product.getImage());
            ps.setString(10, product.getImages());
            ps.setBoolean(11, product.isFeatured());
            ps.setBoolean(12, product.isActive());
            ps.setInt(13, product.getId());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi cập nhật product: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * Xóa sản phẩm (soft delete)
     */
    public boolean delete(int id) {
        String sql = "UPDATE products SET is_active = FALSE, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi xóa product: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * Tăng view count
     */
    public boolean incrementViewCount(int productId) {
        String sql = "UPDATE products SET view_count = view_count + 1 WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, productId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi tăng view count: " + e.getMessage());
        }
        return false;
    }
    
    /**
     * Cập nhật số lượng đã bán
     */
    public boolean updateSoldCount(int productId, int quantity) {
        String sql = "UPDATE products SET sold_count = sold_count + ?, quantity = quantity - ? WHERE id = ? AND quantity >= ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, quantity);
            ps.setInt(2, quantity);
            ps.setInt(3, productId);
            ps.setInt(4, quantity);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi cập nhật sold count: " + e.getMessage());
        }
        return false;
    }
    
    /**
     * Đếm tổng số sản phẩm
     */
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM products WHERE is_active = TRUE";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi đếm products: " + e.getMessage());
        }
        return 0;
    }
    
    /**
     * Lấy sản phẩm liên quan (cùng category)
     */
    public List<Product> findRelated(int productId, int categoryId, int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, c.slug as category_slug " +
                    "FROM products p " +
                    "LEFT JOIN categories c ON p.category_id = c.id " +
                    "WHERE p.category_id = ? AND p.id != ? AND p.is_active = TRUE " +
                    "ORDER BY RAND() LIMIT ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, categoryId);
            ps.setInt(2, productId);
            ps.setInt(3, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs, true));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy related products: " + e.getMessage());
        }
        return products;
    }
    
    /**
     * Map ResultSet sang Product object
     */
    private Product mapResultSetToProduct(ResultSet rs, boolean includeCategory) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        
        int categoryId = rs.getInt("category_id");
        product.setCategoryId(rs.wasNull() ? null : categoryId);
        
        product.setName(rs.getString("name"));
        product.setSlug(rs.getString("slug"));
        product.setDescription(rs.getString("description"));
        product.setShortDescription(rs.getString("short_description"));
        product.setPrice(rs.getBigDecimal("price"));
        product.setSalePrice(rs.getBigDecimal("sale_price"));
        product.setQuantity(rs.getInt("quantity"));
        product.setImage(rs.getString("image"));
        product.setImages(rs.getString("images"));
        product.setFeatured(rs.getBoolean("is_featured"));
        product.setActive(rs.getBoolean("is_active"));
        product.setViewCount(rs.getInt("view_count"));
        product.setSoldCount(rs.getInt("sold_count"));
        product.setCreatedAt(rs.getTimestamp("created_at"));
        product.setUpdatedAt(rs.getTimestamp("updated_at"));
        
        // Map category nếu có
        if (includeCategory) {
            try {
                String categoryName = rs.getString("category_name");
                if (categoryName != null) {
                    Category category = new Category();
                    category.setId(categoryId);
                    category.setName(categoryName);
                    category.setSlug(rs.getString("category_slug"));
                    product.setCategory(category);
                }
            } catch (SQLException ignored) {
                // Column không tồn tại, bỏ qua
            }
        }
        
        return product;
    }
}
