package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Product;

/**
 * Servlet xử lý hiển thị sản phẩm
 */
@WebServlet(urlPatterns = {"/products", "/products/*", "/san-pham", "/san-pham/*"})
public class ProductServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;
    private Gson gson;
    
    private static final int PRODUCTS_PER_PAGE = 12;
    
    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
        gson = new Gson();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String pathInfo = request.getPathInfo();
        
        // Nếu là API request
        if (request.getParameter("ajax") != null) {
            handleAjaxRequest(request, response);
            return;
        }
        
        // Xử lý theo path
        if (pathInfo == null || pathInfo.equals("/")) {
            // Kiểm tra có parameter category không
            String categoryParam = request.getParameter("category");
            if (categoryParam != null && !categoryParam.isEmpty()) {
                showProductsByCategory(request, response, categoryParam);
            } else {
                // Hiển thị tất cả sản phẩm
                showAllProducts(request, response);
            }
        } else if (pathInfo.startsWith("/category/") || pathInfo.startsWith("/danh-muc/")) {
            // Hiển thị sản phẩm theo danh mục
            String categorySlug = pathInfo.substring(pathInfo.lastIndexOf("/") + 1);
            showProductsByCategory(request, response, categorySlug);
        } else if (pathInfo.startsWith("/search") || pathInfo.startsWith("/tim-kiem")) {
            // Tìm kiếm sản phẩm
            searchProducts(request, response);
        } else {
            // Xem chi tiết sản phẩm theo slug
            String slug = pathInfo.substring(1);
            showProductDetail(request, response, slug);
        }
    }
    
    /**
     * Hiển thị tất cả sản phẩm
     */
    private void showAllProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy tham số phân trang
        int page = 1;
        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                page = Integer.parseInt(pageParam);
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        
        // Lấy tham số sắp xếp
        String sort = request.getParameter("sort");
        
        // Lấy tham số lọc giá
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        
        // Lấy sản phẩm
        List<Product> products;
        int totalProducts;
        
        if (minPriceStr != null && maxPriceStr != null) {
            BigDecimal minPrice = new BigDecimal(minPriceStr);
            BigDecimal maxPrice = new BigDecimal(maxPriceStr);
            products = productDAO.findByPriceRange(minPrice, maxPrice);
            totalProducts = products.size();
        } else {
            products = productDAO.findWithPagination(page, PRODUCTS_PER_PAGE);
            totalProducts = productDAO.countAll();
        }
        
        // Sắp xếp nếu cần
        if (sort != null) {
            sortProducts(products, sort);
        }
        
        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
        
        // Lấy danh mục cho sidebar/filter
        List<Category> categories = categoryDAO.findAll();
        List<Category> parentCategories = categoryDAO.findParentCategories();
        
        // Lấy sản phẩm nổi bật cho sidebar
        List<Product> featuredProducts = productDAO.findFeatured(4);
        
        // Set attributes
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("parentCategories", parentCategories);
        request.setAttribute("featuredProducts", featuredProducts);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("pageTitle", "Tất cả sản phẩm");
        
        request.getRequestDispatcher("/view/products.jsp").forward(request, response);
    }
    
    /**
     * Hiển thị sản phẩm theo danh mục
     */
    private void showProductsByCategory(HttpServletRequest request, HttpServletResponse response, String categorySlug)
            throws ServletException, IOException {
        
        // Tìm category
        Category category = categoryDAO.findBySlug(categorySlug);
        
        if (category == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Danh mục không tồn tại");
            return;
        }
        
        // Lấy sản phẩm theo category
        List<Product> products = productDAO.findByCategorySlug(categorySlug);
        
        // Lấy sản phẩm của các danh mục con (nếu có)
        List<Category> childCategories = categoryDAO.findByParentId(category.getId());
        for (Category child : childCategories) {
            List<Product> childProducts = productDAO.findByCategory(child.getId());
            products.addAll(childProducts);
        }
        
        // Lấy tham số sắp xếp
        String sort = request.getParameter("sort");
        if (sort != null) {
            sortProducts(products, sort);
        }
        
        // Lấy danh mục cho sidebar
        List<Category> categories = categoryDAO.findAll();
        List<Category> parentCategories = categoryDAO.findParentCategories();
        
        // Set attributes
        request.setAttribute("products", products);
        request.setAttribute("category", category);
        request.setAttribute("childCategories", childCategories);
        request.setAttribute("categories", categories);
        request.setAttribute("parentCategories", parentCategories);
        request.setAttribute("totalProducts", products.size());
        request.setAttribute("pageTitle", category.getName());
        
        request.getRequestDispatcher("/view/products.jsp").forward(request, response);
    }
    
    /**
     * Tìm kiếm sản phẩm
     */
    private void searchProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String keyword = request.getParameter("q");
        
        List<Product> products;
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = productDAO.search(keyword.trim());
        } else {
            products = productDAO.findAll();
        }
        
        // Lấy danh mục cho sidebar
        List<Category> categories = categoryDAO.findAll();
        List<Category> parentCategories = categoryDAO.findParentCategories();
        
        // Set attributes
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("parentCategories", parentCategories);
        request.setAttribute("searchKeyword", keyword);
        request.setAttribute("totalProducts", products.size());
        request.setAttribute("pageTitle", "Kết quả tìm kiếm: " + keyword);
        
        request.getRequestDispatcher("/view/products.jsp").forward(request, response);
    }
    
    /**
     * Hiển thị chi tiết sản phẩm
     */
    private void showProductDetail(HttpServletRequest request, HttpServletResponse response, String slug)
            throws ServletException, IOException {
        
        Product product = productDAO.findBySlug(slug);
        
        if (product == null) {
            // Thử tìm theo ID
            try {
                int id = Integer.parseInt(slug);
                product = productDAO.findById(id);
            } catch (NumberFormatException e) {
                // Không phải ID
            }
        }
        
        if (product == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sản phẩm không tồn tại");
            return;
        }
        
        // Tăng view count
        productDAO.incrementViewCount(product.getId());
        
        // Lấy sản phẩm liên quan
        List<Product> relatedProducts = null;
        if (product.getCategoryId() != null) {
            relatedProducts = productDAO.findRelated(product.getId(), product.getCategoryId(), 4);
        }
        
        // Lấy category
        Category category = null;
        if (product.getCategoryId() != null) {
            category = categoryDAO.findById(product.getCategoryId());
        }
        
        // Lấy danh mục cho breadcrumb
        List<Category> categories = categoryDAO.findAll();
        
        // Set attributes
        request.setAttribute("product", product);
        request.setAttribute("category", category);
        request.setAttribute("relatedProducts", relatedProducts);
        request.setAttribute("categories", categories);
        request.setAttribute("pageTitle", product.getName());
        
        request.getRequestDispatcher("/view/product-detail.jsp").forward(request, response);
    }
    
    /**
     * Xử lý AJAX request
     */
    private void handleAjaxRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        JsonObject jsonResponse = new JsonObject();
        
        String action = request.getParameter("action");
        
        try {
            switch (action) {
                case "featured":
                    int limitFeatured = getIntParam(request, "limit", 8);
                    List<Product> featuredProducts = productDAO.findFeatured(limitFeatured);
                    jsonResponse.addProperty("success", true);
                    jsonResponse.add("products", gson.toJsonTree(featuredProducts));
                    break;
                    
                case "latest":
                    int limitLatest = getIntParam(request, "limit", 8);
                    List<Product> latestProducts = productDAO.findLatest(limitLatest);
                    jsonResponse.addProperty("success", true);
                    jsonResponse.add("products", gson.toJsonTree(latestProducts));
                    break;
                    
                case "bestsellers":
                    int limitBest = getIntParam(request, "limit", 8);
                    List<Product> bestProducts = productDAO.findBestSellers(limitBest);
                    jsonResponse.addProperty("success", true);
                    jsonResponse.add("products", gson.toJsonTree(bestProducts));
                    break;
                    
                case "onsale":
                    int limitSale = getIntParam(request, "limit", 8);
                    List<Product> saleProducts = productDAO.findOnSale(limitSale);
                    jsonResponse.addProperty("success", true);
                    jsonResponse.add("products", gson.toJsonTree(saleProducts));
                    break;
                    
                case "category":
                    String categorySlug = request.getParameter("slug");
                    if (categorySlug != null) {
                        List<Product> catProducts = productDAO.findByCategorySlug(categorySlug);
                        jsonResponse.addProperty("success", true);
                        jsonResponse.add("products", gson.toJsonTree(catProducts));
                    } else {
                        jsonResponse.addProperty("success", false);
                        jsonResponse.addProperty("message", "Missing category slug");
                    }
                    break;
                    
                case "search":
                    String keyword = request.getParameter("q");
                    if (keyword != null && !keyword.trim().isEmpty()) {
                        List<Product> searchResults = productDAO.search(keyword.trim());
                        jsonResponse.addProperty("success", true);
                        jsonResponse.add("products", gson.toJsonTree(searchResults));
                    } else {
                        jsonResponse.addProperty("success", false);
                        jsonResponse.addProperty("message", "Missing search keyword");
                    }
                    break;
                    
                case "detail":
                    int productId = getIntParam(request, "id", 0);
                    if (productId > 0) {
                        Product product = productDAO.findById(productId);
                        if (product != null) {
                            jsonResponse.addProperty("success", true);
                            jsonResponse.add("product", gson.toJsonTree(product));
                        } else {
                            jsonResponse.addProperty("success", false);
                            jsonResponse.addProperty("message", "Product not found");
                        }
                    }
                    break;
                    
                default:
                    jsonResponse.addProperty("success", false);
                    jsonResponse.addProperty("message", "Unknown action");
            }
        } catch (Exception e) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", e.getMessage());
        }
        
        out.print(gson.toJson(jsonResponse));
    }
    
    /**
     * Sắp xếp danh sách sản phẩm
     */
    private void sortProducts(List<Product> products, String sort) {
        switch (sort) {
            case "price-asc":
                products.sort((a, b) -> a.getDisplayPrice().compareTo(b.getDisplayPrice()));
                break;
            case "price-desc":
                products.sort((a, b) -> b.getDisplayPrice().compareTo(a.getDisplayPrice()));
                break;
            case "name-asc":
                products.sort((a, b) -> a.getName().compareToIgnoreCase(b.getName()));
                break;
            case "name-desc":
                products.sort((a, b) -> b.getName().compareToIgnoreCase(a.getName()));
                break;
            case "newest":
                products.sort((a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));
                break;
            case "bestselling":
                products.sort((a, b) -> Integer.compare(b.getSoldCount(), a.getSoldCount()));
                break;
        }
    }
    
    private int getIntParam(HttpServletRequest request, String name, int defaultValue) {
        try {
            String value = request.getParameter(name);
            if (value != null) {
                return Integer.parseInt(value);
            }
        } catch (NumberFormatException e) {
            // Ignore
        }
        return defaultValue;
    }
}
