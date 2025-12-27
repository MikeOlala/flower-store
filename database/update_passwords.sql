-- Cập nhật password cho user mẫu
-- Password: 123456 (đã hash bằng BCrypt)

-- Admin: admin@gmail.com / admin123
UPDATE users SET password = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZRGdjGj/n3.1wL5oKsJLBwQbGj1G2' 
WHERE email = 'admin@gmail.com';

-- User: user@gmail.com / 123456  
UPDATE users SET password = '$2a$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW' 
WHERE email = 'user@gmail.com';

SELECT email, fullname, role FROM users;
