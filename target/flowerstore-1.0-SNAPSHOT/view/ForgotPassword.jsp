<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="vi">
  <head>
    <meta charset="UTF-8" />

    <title>Quên mật khẩu</title>

    <!-- Bootstrap Icons (cho icon email) -->

    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />

    <!-- CSS riêng -->

    <link rel="stylesheet" href="ForgotPassword.css" />
  </head>

  <body>
    <div class="forgot-container">
      <a href="login_1.jsp" class="home-button">
        <i class="bi bi-arrow-left"></i>
      </a>

      <h2 class="title">Quên mật khẩu</h2>

      <p class="subtitle">
        Nhập email của bạn để nhận liên kết đặt lại mật khẩu.
      </p>

      <div class="form-group">
        <label for="email">Email của bạn</label>

        <input type="email" id="email" placeholder="Nhập email" />
      </div>

      <button class="btn-submit">Gửi yêu cầu</button>

      <div class="login-link">
        Đã nhớ mật khẩu? <a href="login_1.jsp">Đăng nhập ngay</a>
      </div>
    </div>
  </body>
</html>
