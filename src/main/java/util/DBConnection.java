package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Lớp quản lý kết nối Database
 * Sử dụng Singleton Pattern để đảm bảo chỉ có 1 connection pool
 */
public class DBConnection {
    
    // Cấu hình database - thay đổi theo môi trường của bạn
    private static final String DB_URL = "jdbc:mysql://localhost:3306/flowerstore?useSSL=false&serverTimezone=Asia/Ho_Chi_Minh&allowPublicKeyRetrieval=true&characterEncoding=UTF-8";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = ""; // Để trống nếu không có password
    
    // Singleton instance
    private static DBConnection instance;
    
    // Constructor private để ngăn tạo instance từ bên ngoài
    private DBConnection() {
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC Driver đã được load thành công!");
        } catch (ClassNotFoundException e) {
            System.err.println("Lỗi: Không tìm thấy MySQL JDBC Driver!");
            e.printStackTrace();
        }
    }
    
    /**
     * Lấy instance của DBConnection (Singleton)
     */
    public static synchronized DBConnection getInstance() {
        if (instance == null) {
            instance = new DBConnection();
        }
        return instance;
    }
    
    /**
     * Lấy connection đến database
     * @return Connection object hoặc null nếu lỗi
     */
    public Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (SQLException e) {
            System.err.println("Lỗi kết nối database: " + e.getMessage());
            e.printStackTrace();
        }
        return conn;
    }
    
    /**
     * Đóng connection
     * @param conn Connection cần đóng
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Lỗi đóng connection: " + e.getMessage());
            }
        }
    }
    
    /**
     * Kiểm tra kết nối database
     * @return true nếu kết nối thành công
     */
    public boolean testConnection() {
        try (Connection conn = getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("✓ Kết nối database thành công!");
                return true;
            }
        } catch (SQLException e) {
            System.err.println("✗ Kết nối database thất bại: " + e.getMessage());
        }
        return false;
    }
    
    // Main method để test connection
    public static void main(String[] args) {
        DBConnection db = DBConnection.getInstance();
        db.testConnection();
    }
}
