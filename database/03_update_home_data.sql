-- =====================================================
-- CẬP NHẬT DỮ LIỆU CHO TRANG CHỦ
-- Chạy file này để thêm dữ liệu hiển thị trang home
-- =====================================================

USE flowerstore;

-- =====================================================
-- 1. CẬP NHẬT HÌNH ẢNH CHO CATEGORIES
-- =====================================================
UPDATE categories SET image = 'https://file.hstatic.net/200000846175/file/z5900937479779_23a78c66588e62ae16962ab99bf0d410.jpg' WHERE slug = 'bo-hoa';
UPDATE categories SET image = 'https://file.hstatic.net/200000846175/file/z5899444875229_e1c7d0304e0a53ca2be88b52766f04e6.jpg' WHERE slug = 'binh-hoa';
UPDATE categories SET image = 'https://file.hstatic.net/200000846175/file/d7a376e45096e9c8b087-min.jpg' WHERE slug = 'hoa-tulip';
UPDATE categories SET image = 'https://file.hstatic.net/200000846175/file/z5900937515947_82c85e8a4d5c70527c21e29fce363cef.jpg' WHERE slug = 'gio-hoa';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1487530811176-3780de880c2d?w=600' WHERE slug = 'hop-hoa';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1522057384400-681b421cfebc?w=600' WHERE slug = 'hoa-cuoi';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1566873535350-a3f5d4a804b7?w=600' WHERE slug = 'lan-ho-diep';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=600' WHERE slug = 'hoa-mau-don';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1455659817273-f96807779a8a?w=600' WHERE slug = 'ke-hoa-chuc-mung';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1561181286-d3fee7d55364?w=600' WHERE slug = 'hoa-tot-nghiep';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1508610048659-a06b669e3321?w=600' WHERE slug = 'hoa-lua';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1563241527-3004b7be0ffd?w=600' WHERE slug = 'hoa-nhua';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?w=600' WHERE slug = 'hoa-giay';
UPDATE categories SET image = 'https://images.unsplash.com/photo-1494972308805-463bc619d34e?w=600' WHERE slug = 'hoa-vai';

-- =====================================================
-- 2. CẬP NHẬT SOLD_COUNT CHO SẢN PHẨM (Best Seller)
-- =====================================================
UPDATE products SET sold_count = 150 WHERE slug = 'bo-hoa-hong-do-tinh-yeu';
UPDATE products SET sold_count = 120 WHERE slug = 'bo-hoa-huong-duong-rang-ro';
UPDATE products SET sold_count = 95 WHERE slug = 'hop-hoa-hong-cao-cap';
UPDATE products SET sold_count = 88 WHERE slug = 'gio-hoa-sinh-nhat-am-ap';
UPDATE products SET sold_count = 75 WHERE slug = 'hoa-tulip-hong-ngot-ngao';
UPDATE products SET sold_count = 68 WHERE slug = 'chau-lan-ho-diep-trang-5-canh';
UPDATE products SET sold_count = 55 WHERE slug = 'bo-hoa-mix-pastel';
UPDATE products SET sold_count = 42 WHERE slug = 'hop-hoa-mix-hong-baby';
UPDATE products SET sold_count = 38 WHERE slug = 'hoa-tulip-do-ruc-ro';
UPDATE products SET sold_count = 30 WHERE slug = 'bo-hoa-lua-hong-vintage';

-- =====================================================
-- 3. THÊM SẢN PHẨM MỚI ĐỂ CÓ ĐỦ DATA
-- =====================================================
INSERT INTO products (category_id, name, slug, description, short_description, price, sale_price, quantity, image, is_featured, is_active, sold_count) VALUES
-- Bó hoa (category_id = 3)
(3, 'Bó hoa cẩm tú cầu xanh', 'bo-hoa-cam-tu-cau-xanh', 'Bó hoa cẩm tú cầu xanh pastel thanh lịch', 'Cẩm tú cầu xanh', 550000, 499000, 25, 'https://images.unsplash.com/photo-1468327768560-75b778cbb551?w=400', TRUE, TRUE, 85),
(3, 'Bó hoa cúc họa mi trắng', 'bo-hoa-cuc-hoa-mi-trang', 'Bó hoa cúc họa mi trắng trong sáng', 'Cúc họa mi trắng', 320000, NULL, 40, 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400', FALSE, TRUE, 62),
(3, 'Bó hoa ly trắng sang trọng', 'bo-hoa-ly-trang-sang-trong', 'Bó hoa ly trắng 10 cành thanh lịch', 'Hoa ly trắng 10 cành', 780000, 720000, 15, 'https://images.unsplash.com/photo-1518882605630-8809df6a2b9a?w=400', TRUE, TRUE, 45),

-- Bình hoa (category_id = 5)  
(5, 'Bình hoa hồng đỏ Ecuador', 'binh-hoa-hong-do-ecuador', 'Bình hoa hồng đỏ Ecuador 30 bông sang trọng', 'Hồng Ecuador 30 bông', 1800000, 1650000, 10, 'https://images.unsplash.com/photo-1455659817273-f96807779a8a?w=400', TRUE, TRUE, 72),
(5, 'Bình hoa mix sắc màu', 'binh-hoa-mix-sac-mau', 'Bình hoa mix nhiều loại đầy màu sắc', 'Bình hoa mix màu', 680000, NULL, 20, 'https://images.unsplash.com/photo-1487530811176-3780de880c2d?w=400', FALSE, TRUE, 55),

-- Hoa Tulip (category_id = 4)
(4, 'Hoa Tulip vàng rực rỡ', 'hoa-tulip-vang-ruc-ro', 'Bó hoa tulip vàng 15 bông tươi sáng', 'Tulip vàng 15 bông', 750000, 690000, 18, 'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?w=400', TRUE, TRUE, 48),
(4, 'Hoa Tulip tím quý phái', 'hoa-tulip-tim-quy-phai', 'Bó hoa tulip tím 12 bông sang trọng', 'Tulip tím 12 bông', 820000, NULL, 12, 'https://images.unsplash.com/photo-1520219306100-ec2f5c359546?w=400', FALSE, TRUE, 35),

-- Giỏ hoa (category_id = 6)
(6, 'Giỏ hoa hồng mix baby', 'gio-hoa-hong-mix-baby', 'Giỏ hoa hồng mix baby trắng xinh xắn', 'Giỏ hồng baby', 950000, 880000, 15, 'https://images.unsplash.com/photo-1522057384400-681b421cfebc?w=400', TRUE, TRUE, 58),
(6, 'Giỏ hoa cúc đại đóa', 'gio-hoa-cuc-dai-doa', 'Giỏ hoa cúc đại đóa tươi tắn', 'Giỏ cúc đại đóa', 450000, NULL, 25, 'https://images.unsplash.com/photo-1508610048659-a06b669e3321?w=400', FALSE, TRUE, 40),

-- Hộp hoa (category_id = 7)
(7, 'Hộp hoa hướng dương', 'hop-hoa-huong-duong', 'Hộp hoa hướng dương 12 bông rạng rỡ', 'Hộp hướng dương', 750000, 680000, 20, 'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?w=400', TRUE, TRUE, 65),
(7, 'Hộp hoa cẩm chướng', 'hop-hoa-cam-chuong', 'Hộp hoa cẩm chướng đủ màu sắc', 'Hộp cẩm chướng', 520000, NULL, 28, 'https://images.unsplash.com/photo-1468327768560-75b778cbb551?w=400', FALSE, TRUE, 38),

-- Hoa cưới (category_id = 8)
(8, 'Hoa cầm tay cô dâu trắng', 'hoa-cam-tay-co-dau-trang', 'Hoa cầm tay cô dâu hồng trắng thanh lịch', 'Hoa cầm tay cô dâu', 650000, 599000, 15, 'https://images.unsplash.com/photo-1519225421980-715cb0215aed?w=400', TRUE, TRUE, 92),
(8, 'Hoa cưới cascade sang trọng', 'hoa-cuoi-cascade-sang-trong', 'Hoa cưới kiểu cascade rũ xuống sang trọng', 'Hoa cưới cascade', 1200000, 1080000, 8, 'https://images.unsplash.com/photo-1522057384400-681b421cfebc?w=400', TRUE, TRUE, 28),

-- Lan Hồ Điệp (category_id = 9)
(9, 'Chậu lan hồ điệp vàng 7 cành', 'chau-lan-ho-diep-vang-7-canh', 'Chậu lan hồ điệp vàng 7 cành may mắn', 'Lan vàng 7 cành', 3200000, 2900000, 6, 'https://images.unsplash.com/photo-1566873535350-a3f5d4a804b7?w=400', TRUE, TRUE, 22),

-- Hoa Mẫu Đơn (category_id = 10)
(10, 'Bó hoa mẫu đơn hồng', 'bo-hoa-mau-don-hong', 'Bó hoa mẫu đơn hồng phấn 8 bông', 'Mẫu đơn hồng 8 bông', 1100000, 980000, 12, 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400', TRUE, TRUE, 52),
(10, 'Bó hoa mẫu đơn trắng', 'bo-hoa-mau-don-trang', 'Bó hoa mẫu đơn trắng tinh khôi', 'Mẫu đơn trắng', 1250000, NULL, 10, 'https://images.unsplash.com/photo-1563241527-3004b7be0ffd?w=400', FALSE, TRUE, 35)

ON DUPLICATE KEY UPDATE 
    sold_count = VALUES(sold_count),
    image = VALUES(image);

-- =====================================================
-- 4. KIỂM TRA KẾT QUẢ
-- =====================================================
-- Kiểm tra categories có image
SELECT id, name, slug, image, display_order FROM categories WHERE image IS NOT NULL AND image != '';

-- Kiểm tra sản phẩm best seller
SELECT id, name, price, sale_price, sold_count, is_featured FROM products WHERE is_active = TRUE ORDER BY sold_count DESC LIMIT 10;

-- Kiểm tra query cho trang chủ
SELECT c.id, c.name, c.slug, c.image, COUNT(p.id) as product_count 
FROM categories c 
LEFT JOIN products p ON c.id = p.category_id AND p.is_active = TRUE 
WHERE c.is_active = TRUE AND c.image IS NOT NULL AND c.image != '' 
GROUP BY c.id 
HAVING product_count > 0 
ORDER BY c.display_order, product_count DESC 
LIMIT 8;
