package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu đã đăng nhập rồi thì chuyển về home
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/view/home.jsp");
            return;
        }
        request.getRequestDispatcher("/view/registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String phone = request.getParameter("phone");
        String agree = request.getParameter("agree");

        // Validate input
        if (fullname == null || fullname.trim().isEmpty()) {
            sendError(request, response, "Vui lòng nhập họ tên!", fullname, email);
            return;
        }
        
        if (email == null || email.trim().isEmpty()) {
            sendError(request, response, "Vui lòng nhập email!", fullname, email);
            return;
        }
        
        // Validate email format
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            sendError(request, response, "Email không hợp lệ!", fullname, email);
            return;
        }
        
        if (password == null || password.length() < 6) {
            sendError(request, response, "Mật khẩu phải có ít nhất 6 ký tự!", fullname, email);
            return;
        }
        
        if (!password.equals(repassword)) {
            sendError(request, response, "Mật khẩu nhập lại không khớp!", fullname, email);
            return;
        }
        
        if (!"on".equals(agree)) {
            sendError(request, response, "Vui lòng đồng ý với chính sách dịch vụ!", fullname, email);
            return;
        }

        // Kiểm tra email đã tồn tại chưa
        if (userDAO.emailExists(email.trim())) {
            sendError(request, response, "Email này đã được đăng ký!", fullname, email);
            return;
        }

        // Tạo user mới
        User newUser = new User();
        newUser.setFullname(fullname.trim());
        newUser.setEmail(email.trim());
        newUser.setPassword(password);
        newUser.setPhone(phone != null ? phone.trim() : null);
        newUser.setRole("customer");
        newUser.setStatus("active");

        // Lưu vào database
        boolean success = userDAO.register(newUser);
        
        if (success) {
            // Đăng ký thành công
            request.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("/view/login_1.jsp").forward(request, response);
        } else {
            sendError(request, response, "Đăng ký thất bại! Vui lòng thử lại.", fullname, email);
        }
    }
    
    private void sendError(HttpServletRequest request, HttpServletResponse response, 
                          String error, String fullname, String email) 
            throws ServletException, IOException {
        request.setAttribute("error", error);
        request.setAttribute("fullname", fullname);
        request.setAttribute("email", email);
        request.getRequestDispatcher("/view/registration.jsp").forward(request, response);
    }
}
