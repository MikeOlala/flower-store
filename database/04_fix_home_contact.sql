-- =====================================================
-- SỬA LỖI DATABASE CHO HOME VÀ CONTACT
-- Chạy file này để fix các lỗi
-- =====================================================

USE flowerstore;

-- =====================================================
-- 1. SỬA BẢNG CONTACTS (QUAN TRỌNG!)
-- =====================================================
-- Thêm các cột còn thiếu cho ContactDAO
ALTER TABLE contacts ADD COLUMN admin_note TEXT AFTER status;
ALTER TABLE contacts ADD COLUMN user_id INT AFTER admin_note;

-- Cho phép email NULL (vì form chỉ yêu cầu phone)
ALTER TABLE contacts MODIFY COLUMN email VARCHAR(255) NULL;

-- Cho phép phone là bắt buộc
ALTER TABLE contacts MODIFY COLUMN phone VARCHAR(20) NOT NULL;

-- =====================================================
-- 2. CẬP NHẬT IMAGE CHO CATEGORIES
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
-- 3. CẬP NHẬT SOLD_COUNT CHO PRODUCTS (Best Seller)
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
-- 4. KIỂM TRA KẾT QUẢ
-- =====================================================
-- Kiểm tra bảng contacts
DESCRIBE contacts;

-- Kiểm tra categories có image
SELECT id, name, slug, LEFT(image, 50) as image_preview FROM categories WHERE image IS NOT NULL AND image != '';

-- Kiểm tra query cho trang chủ
SELECT c.id, c.name, c.slug, COUNT(p.id) as product_count 
FROM categories c 
LEFT JOIN products p ON c.id = p.category_id AND p.is_active = TRUE 
WHERE c.is_active = TRUE AND c.image IS NOT NULL AND c.image != '' 
GROUP BY c.id 
HAVING product_count > 0 
ORDER BY c.display_order, product_count DESC 
LIMIT 8;

-- Kiểm tra sản phẩm best seller
SELECT id, name, price, sale_price, sold_count FROM products WHERE is_active = TRUE ORDER BY sold_count DESC LIMIT 10;
