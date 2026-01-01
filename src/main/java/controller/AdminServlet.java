package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.CategoryDAO;
import dao.ContactDAO;
import dao.CouponDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import model.Category;
import model.Contact;
import model.Coupon;
import model.Order;
import model.Product;
import model.User;

@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {
    private UserDAO userDAO;
    private ProductDAO productDAO;
    private OrderDAO orderDAO;
    private CategoryDAO categoryDAO;
    private CouponDAO couponDAO;
    private ContactDAO contactDAO;
    private Gson gson;

    @Override
    public void init() {
        userDAO = new UserDAO();
        productDAO = new ProductDAO();
        orderDAO = new OrderDAO();
        categoryDAO = new CategoryDAO();
        couponDAO = new CouponDAO();
        contactDAO = new ContactDAO();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Kiểm tra đăng nhập và quyền admin
        if (!checkAdmin(request, response)) {
            return;
        }

        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/") || pathInfo.equals("/dashboard")) {
            showDashboard(request, response);
        } else if (pathInfo.equals("/users")) {
            showUsers(request, response);
        } else if (pathInfo.equals("/products")) {
            showProducts(request, response);
        } else if (pathInfo.equals("/orders")) {
            showOrders(request, response);
        } else if (pathInfo.equals("/categories")) {
            showCategories(request, response);
        } else if (pathInfo.startsWith("/api/")) {
            handleApiGet(request, response, pathInfo);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        if (!checkAdmin(request, response)) {
            return;
        }

        String pathInfo = request.getPathInfo();
        
        if (pathInfo != null && pathInfo.startsWith("/api/")) {
            handleApiPost(request, response, pathInfo);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        if (!checkAdmin(request, response)) {
            return;
        }

        String pathInfo = request.getPathInfo();
        
        if (pathInfo != null && pathInfo.startsWith("/api/")) {
            handleApiDelete(request, response, pathInfo);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private boolean checkAdmin(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }

        User user = (User) session.getAttribute("user");
        if (!"admin".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập trang này");
            return false;
        }

        return true;
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Lấy thống kê
        int totalUsers = userDAO.getTotalUsers();
        int totalProducts = productDAO.getTotalProducts();
        int totalOrders = orderDAO.getTotalOrders();
        java.math.BigDecimal totalRevenue = orderDAO.getTotalRevenue();
        
        // Lấy đơn hàng mới nhất
        List<Order> recentOrders = orderDAO.getRecentOrders(10);
        
        // Lấy sản phẩm bán chạy
        List<Product> topProducts = productDAO.findBestSellers(5);

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("recentOrders", recentOrders);
        request.setAttribute("topProducts", topProducts);

        request.getRequestDispatcher("/view/admin.jsp").forward(request, response);
    }

    private void showUsers(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin.jsp").forward(request, response);
    }

    private void showProducts(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin.jsp").forward(request, response);
    }

    private void showOrders(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin.jsp").forward(request, response);
    }

    private void showCategories(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin.jsp").forward(request, response);
    }

    private void handleApiGet(HttpServletRequest request, HttpServletResponse response, String pathInfo) 
            throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        Map<String, Object> result = new HashMap<>();
        
        try {
            if (pathInfo.equals("/api/users")) {
                List<User> users = userDAO.findAll();
                result.put("success", true);
                result.put("data", users);
            } else if (pathInfo.equals("/api/products")) {
                List<Product> products = productDAO.findAllIncludeInactive();
                result.put("success", true);
                result.put("data", products);
            } else if (pathInfo.startsWith("/api/product/")) {
                int productId = Integer.parseInt(pathInfo.substring("/api/product/".length()));
                Product product = productDAO.findById(productId);
                if (product != null) {
                    result.put("success", true);
                    result.put("data", product);
                } else {
                    result.put("success", false);
                    result.put("message", "Không tìm thấy sản phẩm");
                }
            } else if (pathInfo.equals("/api/orders")) {
                List<Order> orders = orderDAO.findAll();
                result.put("success", true);
                result.put("data", orders);
            } else if (pathInfo.startsWith("/api/order/")) {
                int orderId = Integer.parseInt(pathInfo.substring("/api/order/".length()));
                Order order = orderDAO.findById(orderId);
                if (order != null) {
                    result.put("success", true);
                    result.put("data", order);
                } else {
                    result.put("success", false);
                    result.put("message", "Không tìm thấy đơn hàng");
                }
            } else if (pathInfo.equals("/api/categories")) {
                List<Category> categories = categoryDAO.findAllIncludeInactive();
                result.put("success", true);
                result.put("data", categories);
            } else if (pathInfo.startsWith("/api/category/")) {
                int categoryId = Integer.parseInt(pathInfo.substring("/api/category/".length()));
                Category category = categoryDAO.findById(categoryId);
                if (category != null) {
                    result.put("success", true);
                    result.put("data", category);
                } else {
                    result.put("success", false);
                    result.put("message", "Không tìm thấy danh mục");
                }
            } else if (pathInfo.equals("/api/coupons")) {
                List<Coupon> coupons = couponDAO.findAll();
                result.put("success", true);
                result.put("data", coupons);
            } else if (pathInfo.startsWith("/api/coupon/")) {
                int couponId = Integer.parseInt(pathInfo.substring("/api/coupon/".length()));
                Coupon coupon = couponDAO.findById(couponId);
                if (coupon != null) {
                    result.put("success", true);
                    result.put("data", coupon);
                } else {
                    result.put("success", false);
                    result.put("message", "Không tìm thấy mã giảm giá");
                }
            } else if (pathInfo.equals("/api/contacts")) {
                String status = request.getParameter("status");
                List<Contact> contacts;
                if (status != null && !status.isEmpty()) {
                    contacts = contactDAO.findByStatus(status);
                } else {
                    contacts = contactDAO.findAll();
                }
                result.put("success", true);
                result.put("data", contacts);
            } else if (pathInfo.startsWith("/api/contact/")) {
                int contactId = Integer.parseInt(pathInfo.substring("/api/contact/".length()));
                Contact contact = contactDAO.findById(contactId);
                if (contact != null) {
                    result.put("success", true);
                    result.put("data", contact);
                } else {
                    result.put("success", false);
                    result.put("message", "Không tìm thấy liên hệ");
                }
            } else if (pathInfo.equals("/api/stats")) {
                Map<String, Object> stats = new HashMap<>();
                stats.put("totalUsers", userDAO.getTotalUsers());
                stats.put("totalProducts", productDAO.getTotalProducts());
                stats.put("totalOrders", orderDAO.getTotalOrders());
                stats.put("totalRevenue", orderDAO.getTotalRevenue());
                stats.put("totalCoupons", couponDAO.getTotalCoupons());
                stats.put("totalContacts", contactDAO.getTotalContacts());
                stats.put("pendingOrders", orderDAO.countByStatus("pending"));
                stats.put("confirmedOrders", orderDAO.countByStatus("confirmed"));
                stats.put("shippingOrders", orderDAO.countByStatus("shipping"));
                stats.put("deliveredOrders", orderDAO.countByStatus("delivered"));
                stats.put("cancelledOrders", orderDAO.countByStatus("cancelled"));
                stats.put("newContacts", contactDAO.countByStatus("new"));
                result.put("success", true);
                result.put("data", stats);
            } else {
                result.put("success", false);
                result.put("message", "API không tồn tại: " + pathInfo);
            }
        } catch (NumberFormatException e) {
            System.err.println("[AdminServlet] Invalid ID format: " + e.getMessage());
            result.put("success", false);
            result.put("message", "ID không hợp lệ");
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error in handleApiGet: " + e.getMessage());
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "Lỗi server: " + e.getMessage());
        }
        
        response.getWriter().write(gson.toJson(result));
    }

    private void handleApiPost(HttpServletRequest request, HttpServletResponse response, String pathInfo) 
            throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        Map<String, Object> result = new HashMap<>();
        
        try {
            switch (pathInfo) {
                case "/api/product/add":
                    handleAddProduct(request, result);
                    break;
                    
                case "/api/product/update":
                    handleUpdateProduct(request, result);
                    break;
                    
                case "/api/category/add":
                    handleAddCategory(request, result);
                    break;
                    
                case "/api/category/update":
                    handleUpdateCategory(request, result);
                    break;
                    
                case "/api/product/toggle-active":
                    int productId = Integer.parseInt(request.getParameter("id"));
                    boolean productSuccess = productDAO.toggleActive(productId);
                    result.put("success", productSuccess);
                    result.put("message", productSuccess ? "Cập nhật trạng thái sản phẩm thành công" : "Cập nhật thất bại");
                    break;
                    
                case "/api/order/update-status":
                    int orderId = Integer.parseInt(request.getParameter("id"));
                    String orderStatus = request.getParameter("status");
                    boolean orderSuccess = orderDAO.updateStatus(orderId, orderStatus);
                    result.put("success", orderSuccess);
                    result.put("message", orderSuccess ? "Cập nhật trạng thái đơn hàng thành công" : "Cập nhật thất bại");
                    break;
                    
                case "/api/user/update-status":
                    int userId = Integer.parseInt(request.getParameter("id"));
                    String userStatus = request.getParameter("status");
                    boolean userSuccess = userDAO.updateStatus(userId, userStatus);
                    result.put("success", userSuccess);
                    result.put("message", userSuccess ? "Cập nhật trạng thái người dùng thành công" : "Cập nhật thất bại");
                    break;
                    
                case "/api/coupon/add":
                    handleAddCoupon(request, result);
                    break;
                    
                case "/api/coupon/update":
                    handleUpdateCoupon(request, result);
                    break;
                    
                case "/api/coupon/toggle-active":
                    int couponId = Integer.parseInt(request.getParameter("id"));
                    boolean couponSuccess = couponDAO.toggleActive(couponId);
                    result.put("success", couponSuccess);
                    result.put("message", couponSuccess ? "Cập nhật trạng thái mã giảm giá thành công" : "Cập nhật thất bại");
                    break;
                    
                case "/api/contact/update-status":
                    int contactId = Integer.parseInt(request.getParameter("id"));
                    String contactStatus = request.getParameter("status");
                    boolean contactSuccess = contactDAO.updateStatus(contactId, contactStatus);
                    result.put("success", contactSuccess);
                    result.put("message", contactSuccess ? "Cập nhật trạng thái liên hệ thành công" : "Cập nhật thất bại");
                    break;
                    
                default:
                    result.put("success", false);
                    result.put("message", "API không tồn tại: " + pathInfo);
            }
        } catch (NumberFormatException e) {
            System.err.println("[AdminServlet] Invalid number format: " + e.getMessage());
            result.put("success", false);
            result.put("message", "Tham số không hợp lệ");
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error in handleApiPost: " + e.getMessage());
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "Lỗi server: " + e.getMessage());
        }
        
        response.getWriter().write(gson.toJson(result));
    }
    
    private void handleAddProduct(HttpServletRequest request, Map<String, Object> result) {
        try {
            String name = request.getParameter("name");
            String slug = request.getParameter("slug");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            String salePriceStr = request.getParameter("salePrice");
            BigDecimal salePrice = (salePriceStr != null && !salePriceStr.isEmpty()) ? new BigDecimal(salePriceStr) : null;
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryIdStr = request.getParameter("categoryId");
            Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr) : null;
            String description = request.getParameter("description");
            String shortDescription = request.getParameter("shortDescription");
            String image = request.getParameter("image");
            String isFeaturedStr = request.getParameter("isFeatured");
            boolean isFeatured = "true".equalsIgnoreCase(isFeaturedStr) || "on".equalsIgnoreCase(isFeaturedStr);
            
            Product newProduct = new Product();
            newProduct.setName(name);
            newProduct.setSlug(slug != null && !slug.isEmpty() ? slug : generateSlug(name));
            newProduct.setPrice(price);
            newProduct.setSalePrice(salePrice);
            newProduct.setQuantity(quantity);
            newProduct.setCategoryId(categoryId);
            newProduct.setDescription(description);
            newProduct.setShortDescription(shortDescription);
            newProduct.setImage(image);
            newProduct.setFeatured(isFeatured);
            newProduct.setActive(true);
            
            boolean success = productDAO.insert(newProduct);
            result.put("success", success);
            result.put("message", success ? "Thêm sản phẩm thành công" : "Thêm sản phẩm thất bại");
            if (success) {
                result.put("productId", newProduct.getId());
            }
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error adding product: " + e.getMessage());
            result.put("success", false);
            result.put("message", "Lỗi: " + e.getMessage());
        }
    }
    
    private void handleUpdateProduct(HttpServletRequest request, Map<String, Object> result) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.findById(id);
            if (product == null) {
                result.put("success", false);
                result.put("message", "Không tìm thấy sản phẩm");
                return;
            }
            
            String name = request.getParameter("name");
            String slug = request.getParameter("slug");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            String salePriceStr = request.getParameter("salePrice");
            BigDecimal salePrice = (salePriceStr != null && !salePriceStr.isEmpty()) ? new BigDecimal(salePriceStr) : null;
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryIdStr = request.getParameter("categoryId");
            Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr) : null;
            String description = request.getParameter("description");
            String shortDescription = request.getParameter("shortDescription");
            String image = request.getParameter("image");
            String isFeaturedStr = request.getParameter("isFeatured");
            boolean isFeatured = "true".equalsIgnoreCase(isFeaturedStr) || "on".equalsIgnoreCase(isFeaturedStr);
            
            product.setName(name);
            product.setSlug(slug);
            product.setPrice(price);
            product.setSalePrice(salePrice);
            product.setQuantity(quantity);
            product.setCategoryId(categoryId);
            product.setDescription(description);
            product.setShortDescription(shortDescription);
            if (image != null && !image.isEmpty()) {
                product.setImage(image);
            }
            product.setFeatured(isFeatured);
            
            boolean success = productDAO.update(product);
            result.put("success", success);
            result.put("message", success ? "Cập nhật sản phẩm thành công" : "Cập nhật sản phẩm thất bại");
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error updating product: " + e.getMessage());
            result.put("success", false);
            result.put("message", "Lỗi: " + e.getMessage());
        }
    }
    
    private void handleAddCategory(HttpServletRequest request, Map<String, Object> result) {
        try {
            String name = request.getParameter("name");
            String slug = request.getParameter("slug");
            String description = request.getParameter("description");
            String image = request.getParameter("image");
            String parentIdStr = request.getParameter("parentId");
            Integer parentId = (parentIdStr != null && !parentIdStr.isEmpty()) ? Integer.parseInt(parentIdStr) : null;
            
            Category newCategory = new Category();
            newCategory.setName(name);
            newCategory.setSlug(slug != null && !slug.isEmpty() ? slug : generateSlug(name));
            newCategory.setDescription(description);
            newCategory.setImage(image);
            newCategory.setParentId(parentId);
            newCategory.setActive(true);
            
            boolean success = categoryDAO.insert(newCategory);
            result.put("success", success);
            result.put("message", success ? "Thêm danh mục thành công" : "Thêm danh mục thất bại");
            if (success) {
                result.put("categoryId", newCategory.getId());
            }
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error adding category: " + e.getMessage());
            result.put("success", false);
            result.put("message", "Lỗi: " + e.getMessage());
        }
    }
    
    private void handleUpdateCategory(HttpServletRequest request, Map<String, Object> result) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Category category = categoryDAO.findById(id);
            if (category == null) {
                result.put("success", false);
                result.put("message", "Không tìm thấy danh mục");
                return;
            }
            
            String name = request.getParameter("name");
            String slug = request.getParameter("slug");
            String description = request.getParameter("description");
            String image = request.getParameter("image");
            String parentIdStr = request.getParameter("parentId");
            Integer parentId = (parentIdStr != null && !parentIdStr.isEmpty()) ? Integer.parseInt(parentIdStr) : null;
            
            category.setName(name);
            category.setSlug(slug);
            category.setDescription(description);
            if (image != null && !image.isEmpty()) {
                category.setImage(image);
            }
            category.setParentId(parentId);
            
            boolean success = categoryDAO.update(category);
            result.put("success", success);
            result.put("message", success ? "Cập nhật danh mục thành công" : "Cập nhật danh mục thất bại");
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error updating category: " + e.getMessage());
            result.put("success", false);
            result.put("message", "Lỗi: " + e.getMessage());
        }
    }
    
    private void handleAddCoupon(HttpServletRequest request, Map<String, Object> result) {
        try {
            String code = request.getParameter("code");
            String description = request.getParameter("description");
            String discountType = request.getParameter("discountType");
            BigDecimal discountValue = new BigDecimal(request.getParameter("discountValue"));
            
            String minOrderValueStr = request.getParameter("minOrderValue");
            BigDecimal minOrderValue = (minOrderValueStr != null && !minOrderValueStr.isEmpty()) 
                ? new BigDecimal(minOrderValueStr) : null;
                
            String maxDiscountStr = request.getParameter("maxDiscount");
            BigDecimal maxDiscount = (maxDiscountStr != null && !maxDiscountStr.isEmpty()) 
                ? new BigDecimal(maxDiscountStr) : null;
                
            String usageLimitStr = request.getParameter("usageLimit");
            Integer usageLimit = (usageLimitStr != null && !usageLimitStr.isEmpty()) 
                ? Integer.parseInt(usageLimitStr) : null;
            
            Coupon newCoupon = new Coupon();
            newCoupon.setCode(code);
            newCoupon.setDescription(description);
            newCoupon.setDiscountType(discountType);
            newCoupon.setDiscountValue(discountValue);
            newCoupon.setMinOrderValue(minOrderValue);
            newCoupon.setMaxDiscount(maxDiscount);
            newCoupon.setUsageLimit(usageLimit);
            newCoupon.setActive(true);
            
            boolean success = couponDAO.insert(newCoupon);
            result.put("success", success);
            result.put("message", success ? "Thêm mã giảm giá thành công" : "Thêm mã giảm giá thất bại");
            if (success) {
                result.put("couponId", newCoupon.getId());
            }
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error adding coupon: " + e.getMessage());
            result.put("success", false);
            result.put("message", "Lỗi: " + e.getMessage());
        }
    }
    
    private void handleUpdateCoupon(HttpServletRequest request, Map<String, Object> result) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Coupon coupon = couponDAO.findById(id);
            if (coupon == null) {
                result.put("success", false);
                result.put("message", "Không tìm thấy mã giảm giá");
                return;
            }
            
            String code = request.getParameter("code");
            String description = request.getParameter("description");
            String discountType = request.getParameter("discountType");
            BigDecimal discountValue = new BigDecimal(request.getParameter("discountValue"));
            
            String minOrderValueStr = request.getParameter("minOrderValue");
            BigDecimal minOrderValue = (minOrderValueStr != null && !minOrderValueStr.isEmpty()) 
                ? new BigDecimal(minOrderValueStr) : null;
                
            String maxDiscountStr = request.getParameter("maxDiscount");
            BigDecimal maxDiscount = (maxDiscountStr != null && !maxDiscountStr.isEmpty()) 
                ? new BigDecimal(maxDiscountStr) : null;
                
            String usageLimitStr = request.getParameter("usageLimit");
            Integer usageLimit = (usageLimitStr != null && !usageLimitStr.isEmpty()) 
                ? Integer.parseInt(usageLimitStr) : null;
            
            coupon.setCode(code);
            coupon.setDescription(description);
            coupon.setDiscountType(discountType);
            coupon.setDiscountValue(discountValue);
            coupon.setMinOrderValue(minOrderValue);
            coupon.setMaxDiscount(maxDiscount);
            coupon.setUsageLimit(usageLimit);
            
            boolean success = couponDAO.update(coupon);
            result.put("success", success);
            result.put("message", success ? "Cập nhật mã giảm giá thành công" : "Cập nhật mã giảm giá thất bại");
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error updating coupon: " + e.getMessage());
            result.put("success", false);
            result.put("message", "Lỗi: " + e.getMessage());
        }
    }
    
    private String generateSlug(String name) {
        return name.toLowerCase()
                .replaceAll("[àáạảãâầấậẩẫăằắặẳẵ]", "a")
                .replaceAll("[èéẹẻẽêềếệểễ]", "e")
                .replaceAll("[ìíịỉĩ]", "i")
                .replaceAll("[òóọỏõôồốộổỗơờớợởỡ]", "o")
                .replaceAll("[ùúụủũưừứựửữ]", "u")
                .replaceAll("[ỳýỵỷỹ]", "y")
                .replaceAll("[đ]", "d")
                .replaceAll("[^a-z0-9\\s-]", "")
                .replaceAll("\\s+", "-")
                .replaceAll("-+", "-")
                .replaceAll("^-|-$", "");
    }

    private void handleApiDelete(HttpServletRequest request, HttpServletResponse response, String pathInfo) 
            throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        Map<String, Object> result = new HashMap<>();
        
        try {
            if (pathInfo.startsWith("/api/product/")) {
                int productId = Integer.parseInt(pathInfo.substring("/api/product/".length()));
                boolean success = productDAO.delete(productId);
                result.put("success", success);
                result.put("message", success ? "Xóa sản phẩm thành công" : "Không thể xóa sản phẩm");
            } else if (pathInfo.startsWith("/api/user/")) {
                int userId = Integer.parseInt(pathInfo.substring("/api/user/".length()));
                boolean success = userDAO.delete(userId);
                result.put("success", success);
                result.put("message", success ? "Xóa người dùng thành công" : "Không thể xóa người dùng");
            } else if (pathInfo.startsWith("/api/category/")) {
                int categoryId = Integer.parseInt(pathInfo.substring("/api/category/".length()));
                boolean success = categoryDAO.delete(categoryId);
                result.put("success", success);
                result.put("message", success ? "Xóa danh mục thành công" : "Không thể xóa danh mục");
            } else if (pathInfo.startsWith("/api/coupon/")) {
                int couponId = Integer.parseInt(pathInfo.substring("/api/coupon/".length()));
                boolean success = couponDAO.delete(couponId);
                result.put("success", success);
                result.put("message", success ? "Xóa mã giảm giá thành công" : "Không thể xóa mã giảm giá");
            } else if (pathInfo.startsWith("/api/contact/")) {
                int contactId = Integer.parseInt(pathInfo.substring("/api/contact/".length()));
                boolean success = contactDAO.delete(contactId);
                result.put("success", success);
                result.put("message", success ? "Xóa liên hệ thành công" : "Không thể xóa liên hệ");
            } else {
                result.put("success", false);
                result.put("message", "API không tồn tại: " + pathInfo);
            }
        } catch (NumberFormatException e) {
            System.err.println("[AdminServlet] Invalid ID format: " + e.getMessage());
            result.put("success", false);
            result.put("message", "ID không hợp lệ");
        } catch (Exception e) {
            System.err.println("[AdminServlet] Error in handleApiDelete: " + e.getMessage());
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "Lỗi server: " + e.getMessage());
        }
        
        response.getWriter().write(gson.toJson(result));
    }
}
