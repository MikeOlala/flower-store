-- =====================================================
-- TẠO TÀI KHOẢN ADMIN
-- =====================================================
-- File này giúp tạo tài khoản admin nếu chưa có
-- Hoặc cập nhật tài khoản hiện tại thành admin
-- =====================================================

USE flowerstore;

-- Cách 1: Tạo tài khoản admin mới (nếu chưa tồn tại)
-- Email: admin@gmail.com
-- Password: admin123
INSERT INTO users (email, password, fullname, phone, role, status) 
VALUES ('admin@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZRGdjGj/n3.1wL5oKsJLBwQbGj1G2', 'Administrator', '0921450620', 'admin', 'active')
ON DUPLICATE KEY UPDATE 
    role = 'admin',
    status = 'active';

-- Cách 2: Nâng cấp tài khoản hiện tại thành admin
-- Thay 'user@gmail.com' bằng email tài khoản bạn muốn nâng cấp
-- UPDATE users SET role = 'admin' WHERE email = 'user@gmail.com';

-- Kiểm tra tài khoản admin
SELECT id, email, fullname, role, status, created_at 
FROM users 
WHERE role = 'admin';

-- =====================================================
-- HƯỚNG DẪN SỬ DỤNG
-- =====================================================
-- 1. Mở MySQL Workbench hoặc phpMyAdmin
-- 2. Chạy file SQL này
-- 3. Đăng nhập với:
--    - Email: admin@gmail.com
--    - Password: admin123
-- 4. Truy cập trang admin: http://localhost:8080/flowerstore/admin
-- =====================================================
