package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // DEMO: kiểm tra cứng (sau này thay bằng DB)
        if ("admin@gmail.com".equals(email) && "123456".equals(password)) {

            // Tạo session
            HttpSession session = request.getSession();
            session.setAttribute("user", email);

            response.sendRedirect("view/home.jsp");

        } else {
            request.setAttribute("error", "Email hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("view/login_1.jsp").forward(request, response);
        }
    }
}