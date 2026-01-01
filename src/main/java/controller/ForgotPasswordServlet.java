package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.UserDAO;
import model.User;

/**
 * Servlet xử lý quên mật khẩu
 */
@WebServlet(urlPatterns = {"/forgot-password", "/reset-password"})
public class ForgotPasswordServlet extends HttpServlet {
    
    private UserDAO userDAO;
    private Gson gson;
    
    // Lưu token tạm (trong production nên dùng database hoặc Redis)
    private static final Map<String, TokenData> resetTokens = new HashMap<>();
    
    private static class TokenData {
        String email;
        long expireTime;
        
        TokenData(String email, long expireTime) {
            this.email = email;
            this.expireTime = expireTime;
        }
        
        boolean isExpired() {
            return System.currentTimeMillis() > expireTime;
        }
    }
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        gson = new Gson();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String servletPath = request.getServletPath();
        
        if ("/reset-password".equals(servletPath)) {
            // Hiển thị trang reset password
            String token = request.getParameter("token");
            
            if (token == null || token.isEmpty()) {
                request.setAttribute("error", "Token không hợp lệ");
                request.getRequestDispatcher("/view/ForgotPassword.jsp").forward(request, response);
                return;
            }
            
            // Kiểm tra token
            TokenData tokenData = resetTokens.get(token);
            if (tokenData == null || tokenData.isExpired()) {
                request.setAttribute("error", "Token đã hết hạn hoặc không tồn tại");
                request.getRequestDispatcher("/view/ForgotPassword.jsp").forward(request, response);
                return;
            }
            
            // Token hợp lệ, chuyển đến trang reset password
            request.setAttribute("token", token);
            request.setAttribute("email", tokenData.email);
            request.getRequestDispatcher("/view/ResetPassword.jsp").forward(request, response);
        } else {
            // Hiển thị trang forgot password
            request.getRequestDispatcher("/view/ForgotPassword.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        
        String servletPath = request.getServletPath();
        PrintWriter out = response.getWriter();
        
        if ("/forgot-password".equals(servletPath)) {
            handleForgotPassword(request, out);
        } else if ("/reset-password".equals(servletPath)) {
            handleResetPassword(request, out);
        }
    }
    
    /**
     * Xử lý yêu cầu quên mật khẩu
     */
    private void handleForgotPassword(HttpServletRequest request, PrintWriter out) {
        String email = request.getParameter("email");
        
        // Validate email
        if (email == null || email.trim().isEmpty()) {
            out.write("{\"success\": false, \"message\": \"Vui lòng nhập email\"}");
            return;
        }
        
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            out.write("{\"success\": false, \"message\": \"Email không hợp lệ\"}");
            return;
        }
        
        // Kiểm tra email có tồn tại không
        User user = userDAO.findByEmail(email.trim());
        
        if (user == null) {
            // Không tiết lộ email có tồn tại hay không (bảo mật)
            out.write("{\"success\": true, \"message\": \"Nếu email tồn tại, chúng tôi đã gửi hướng dẫn đặt lại mật khẩu\"}");
            return;
        }
        
        // Tạo token
        String token = UUID.randomUUID().toString();
        long expireTime = System.currentTimeMillis() + (30 * 60 * 1000); // 30 phút
        resetTokens.put(token, new TokenData(email.trim(), expireTime));
        
        // Trong production: gửi email với link reset
        // Để demo, trả về link trong response
        String resetLink = request.getScheme() + "://" + 
                          request.getServerName() + ":" + 
                          request.getServerPort() + 
                          request.getContextPath() + 
                          "/reset-password?token=" + token;
        
        System.out.println("=== RESET PASSWORD LINK ===");
        System.out.println("Email: " + email);
        System.out.println("Link: " + resetLink);
        System.out.println("Token expires in 30 minutes");
        System.out.println("===========================");
        
        // Response thành công
        String jsonResponse = String.format(
            "{\"success\": true, \"message\": \"Vui lòng kiểm tra console để lấy link đặt lại mật khẩu (trong production sẽ gửi qua email)\", \"resetLink\": \"%s\"}",
            resetLink
        );
        out.write(jsonResponse);
    }
    
    /**
     * Xử lý đặt lại mật khẩu
     */
    private void handleResetPassword(HttpServletRequest request, PrintWriter out) {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validate
        if (token == null || token.isEmpty()) {
            out.write("{\"success\": false, \"message\": \"Token không hợp lệ\"}");
            return;
        }
        
        if (newPassword == null || newPassword.isEmpty()) {
            out.write("{\"success\": false, \"message\": \"Vui lòng nhập mật khẩu mới\"}");
            return;
        }
        
        if (newPassword.length() < 6) {
            out.write("{\"success\": false, \"message\": \"Mật khẩu phải có ít nhất 6 ký tự\"}");
            return;
        }
        
        if (!newPassword.equals(confirmPassword)) {
            out.write("{\"success\": false, \"message\": \"Mật khẩu xác nhận không khớp\"}");
            return;
        }
        
        // Kiểm tra token
        TokenData tokenData = resetTokens.get(token);
        if (tokenData == null || tokenData.isExpired()) {
            out.write("{\"success\": false, \"message\": \"Token đã hết hạn hoặc không tồn tại\"}");
            return;
        }
        
        // Đặt lại mật khẩu
        boolean success = userDAO.resetPassword(tokenData.email, newPassword);
        
        if (success) {
            // Xóa token đã sử dụng
            resetTokens.remove(token);
            out.write("{\"success\": true, \"message\": \"Đặt lại mật khẩu thành công. Vui lòng đăng nhập.\"}");
        } else {
            out.write("{\"success\": false, \"message\": \"Có lỗi xảy ra. Vui lòng thử lại.\"}");
        }
    }
    
    /**
     * Task để xóa token hết hạn (chạy định kỳ)
     */
    public static void cleanupExpiredTokens() {
        resetTokens.entrySet().removeIf(entry -> entry.getValue().isExpired());
    }
}
