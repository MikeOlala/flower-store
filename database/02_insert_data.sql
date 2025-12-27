-- =====================================================
-- BƯỚC 3: THÊM DỮ LIỆU MẪU
-- Chạy file này SAU KHI đã chạy 01_create_tables.sql
-- =====================================================

USE flowerstore;

-- =====================================================
-- 1. THÊM USERS
-- =====================================================
-- Admin: admin@gmail.com / admin123
-- User: user@gmail.com / 123456

INSERT INTO users (email, password, fullname, phone, role, status) VALUES
('admin@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZRGdjGj/n3.1wL5oKsJLBwQbGj1G2', 'Admin', '0921450620', 'admin', 'active'),
('user@gmail.com', '$2a$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'Nguyen Van A', '0987654321', 'customer', 'active');

-- =====================================================
-- 2. THÊM DANH MỤC
-- =====================================================
INSERT INTO categories (id, name, slug, description, parent_id, display_order, is_active) VALUES
(1, 'Hoa Tuoi', 'hoa-tuoi', 'Cac loai hoa tuoi dep', NULL, 1, TRUE),
(2, 'Hoa Gia', 'hoa-gia', 'Hoa gia trang tri', NULL, 2, TRUE),
(3, 'Bo Hoa', 'bo-hoa', 'Bo hoa tuoi', 1, 1, TRUE),
(4, 'Hoa Tulip', 'hoa-tulip', 'Hoa tulip cac mau', 1, 2, TRUE),
(5, 'Binh Hoa', 'binh-hoa', 'Binh hoa trang tri', 1, 3, TRUE),
(6, 'Gio Hoa', 'gio-hoa', 'Gio hoa qua tang', 1, 4, TRUE),
(7, 'Hop Hoa', 'hop-hoa', 'Hop hoa cao cap', 1, 5, TRUE),
(8, 'Hoa Cuoi', 'hoa-cuoi', 'Hoa cuoi, hoa cam tay co dau', 1, 6, TRUE),
(9, 'Lan Ho Diep', 'lan-ho-diep', 'Lan ho diep cac loai', 1, 7, TRUE),
(10, 'Hoa Mau Don', 'hoa-mau-don', 'Hoa mau don', 1, 8, TRUE),
(11, 'Ke Hoa Chuc Mung', 'ke-hoa-chuc-mung', 'Ke hoa khai truong, chuc mung', 1, 9, TRUE),
(12, 'Hoa Tot Nghiep', 'hoa-tot-nghiep', 'Hoa tot nghiep', 1, 10, TRUE),
(13, 'Hoa Lua', 'hoa-lua', 'Hoa lua cao cap', 2, 1, TRUE),
(14, 'Hoa Nhua', 'hoa-nhua', 'Hoa nhua trang tri', 2, 2, TRUE),
(15, 'Hoa Giay', 'hoa-giay', 'Hoa giay handmade', 2, 3, TRUE),
(16, 'Hoa Vai', 'hoa-vai', 'Hoa vai trang tri', 2, 4, TRUE);

-- =====================================================
-- 3. THÊM SẢN PHẨM
-- =====================================================
INSERT INTO products (category_id, name, slug, description, short_description, price, sale_price, quantity, image, is_featured, is_active) VALUES
(3, 'Bo hoa hong do tinh yeu', 'bo-hoa-hong-do-tinh-yeu', 'Bo hoa hong do 20 bong tuong trung cho tinh yeu nong chay', 'Bo hoa hong do 20 bong', 450000, 399000, 50, 'https://images.unsplash.com/photo-1494972308805-463bc619d34e?w=400', TRUE, TRUE),
(3, 'Bo hoa huong duong rang ro', 'bo-hoa-huong-duong-rang-ro', 'Bo hoa huong duong 15 bong mang den su tuoi sang va may man', 'Bo hoa huong duong 15 bong', 380000, NULL, 30, 'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?w=400', TRUE, TRUE),
(3, 'Bo hoa mix pastel', 'bo-hoa-mix-pastel', 'Bo hoa mix cac loai hoa mau pastel nhe nhang', 'Bo hoa mix pastel', 520000, 480000, 25, 'https://images.unsplash.com/photo-1487530811176-3780de880c2d?w=400', FALSE, TRUE),
(4, 'Hoa Tulip hong ngot ngao', 'hoa-tulip-hong-ngot-ngao', 'Bo hoa tulip hong 10 bong the hien su diu dang', 'Bo tulip hong 10 bong', 650000, NULL, 20, 'https://images.unsplash.com/photo-1520763185298-1b434c919102?w=400', TRUE, TRUE),
(4, 'Hoa Tulip do ruc ro', 'hoa-tulip-do-ruc-ro', 'Bo hoa tulip do 12 bong tuong trung cho tinh yeu hoan hao', 'Bo tulip do 12 bong', 720000, 680000, 15, 'https://images.unsplash.com/photo-1518701005037-d53b1f67bb1c?w=400', FALSE, TRUE),
(6, 'Gio hoa sinh nhat am ap', 'gio-hoa-sinh-nhat-am-ap', 'Gio hoa tuoi thich hop lam qua sinh nhat', 'Gio hoa sinh nhat', 850000, 799000, 18, 'https://images.unsplash.com/photo-1561181286-d3fee7d55364?w=400', TRUE, TRUE),
(6, 'Gio hoa chuc mung khai truong', 'gio-hoa-chuc-mung-khai-truong', 'Gio hoa lon phu hop cho dip khai truong', 'Gio hoa khai truong', 1200000, NULL, 10, 'https://images.unsplash.com/photo-1522057384400-681b421cfebc?w=400', FALSE, TRUE),
(7, 'Hop hoa hong cao cap', 'hop-hoa-hong-cao-cap', 'Hop hoa hong sang trong voi 25 bong hong Ecuador', 'Hop hoa hong Ecuador', 1500000, 1350000, 12, 'https://images.unsplash.com/photo-1455659817273-f96807779a8a?w=400', TRUE, TRUE),
(7, 'Hop hoa mix hong baby', 'hop-hoa-mix-hong-baby', 'Hop hoa mix hong va baby trang tinh khoi', 'Hop hoa mix', 680000, NULL, 22, 'https://images.unsplash.com/photo-1563241527-3004b7be0ffd?w=400', FALSE, TRUE),
(9, 'Chau lan ho diep trang 5 canh', 'chau-lan-ho-diep-trang-5-canh', 'Chau lan ho diep trang 5 canh sang trong, may man', 'Lan ho diep trang 5 canh', 2500000, 2300000, 8, 'https://images.unsplash.com/photo-1566873535350-a3f5d4a804b7?w=400', TRUE, TRUE),
(9, 'Chau lan ho diep tim 3 canh', 'chau-lan-ho-diep-tim-3-canh', 'Chau lan ho diep tim 3 canh quy phai', 'Lan ho diep tim 3 canh', 1800000, NULL, 10, 'https://images.unsplash.com/photo-1612363148951-15f16817648f?w=400', FALSE, TRUE),
(13, 'Binh hoa lua trang tri phong khach', 'binh-hoa-lua-trang-tri-phong-khach', 'Binh hoa lua cao cap trang tri noi that', 'Binh hoa lua phong khach', 350000, 299000, 40, 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400', FALSE, TRUE),
(13, 'Bo hoa lua hong vintage', 'bo-hoa-lua-hong-vintage', 'Bo hoa lua phong cach vintage lang man', 'Bo hoa lua vintage', 280000, NULL, 35, 'https://images.unsplash.com/photo-1508610048659-a06b669e3321?w=400', TRUE, TRUE);

-- =====================================================
-- 4. THÊM MÃ GIẢM GIÁ
-- =====================================================
INSERT INTO coupons (code, description, discount_type, discount_value, min_order_value, max_discount, usage_limit, start_date, end_date, is_active) VALUES
('WELCOME10', 'Giam 10% cho khach hang moi', 'percent', 10, 200000, 100000, 100, '2025-01-01 00:00:00', '2025-12-31 23:59:59', TRUE),
('FREESHIP', 'Mien phi van chuyen', 'fixed', 30000, 300000, NULL, 50, '2025-01-01 00:00:00', '2025-06-30 23:59:59', TRUE),
('SALE50K', 'Giam 50.000d cho don tu 500K', 'fixed', 50000, 500000, NULL, 30, '2025-01-01 00:00:00', '2025-03-31 23:59:59', TRUE);

-- =====================================================
-- KIỂM TRA DỮ LIỆU
-- =====================================================
SELECT 'Users:' AS '', COUNT(*) AS 'So luong' FROM users
UNION ALL
SELECT 'Categories:', COUNT(*) FROM categories
UNION ALL
SELECT 'Products:', COUNT(*) FROM products
UNION ALL
SELECT 'Coupons:', COUNT(*) FROM coupons;
