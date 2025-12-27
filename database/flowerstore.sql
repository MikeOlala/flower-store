-- =====================================================
-- FLOWER STORE DATABASE
-- Tạo database cho website bán hoa
-- =====================================================

-- Tạo database
CREATE DATABASE IF NOT EXISTS flowerstore 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE flowerstore;

-- =====================================================
-- 1. BẢNG USERS - Người dùng
-- =====================================================
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    avatar VARCHAR(500),
    bio TEXT,
    gender ENUM('Nam', 'Nữ', 'Khác'),
    birthday DATE,
    role ENUM('customer', 'admin') DEFAULT 'customer',
    status ENUM('active', 'inactive', 'banned') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_role (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 2. BẢNG CATEGORIES - Danh mục sản phẩm
-- =====================================================
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    image VARCHAR(500),
    parent_id INT DEFAULT NULL,
    display_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE SET NULL,
    INDEX idx_slug (slug),
    INDEX idx_parent (parent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 3. BẢNG PRODUCTS - Sản phẩm
-- =====================================================
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    short_description VARCHAR(500),
    price DECIMAL(15, 0) NOT NULL,
    sale_price DECIMAL(15, 0),
    quantity INT DEFAULT 0,
    image VARCHAR(500),
    images TEXT,  -- JSON array của nhiều hình ảnh
    is_featured BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    view_count INT DEFAULT 0,
    sold_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
    INDEX idx_slug (slug),
    INDEX idx_category (category_id),
    INDEX idx_price (price),
    INDEX idx_featured (is_featured)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 4. BẢNG ADDRESSES - Địa chỉ giao hàng
-- =====================================================
CREATE TABLE IF NOT EXISTS addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    receiver_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    province VARCHAR(100),
    district VARCHAR(100),
    ward VARCHAR(100),
    address_detail VARCHAR(255) NOT NULL,
    note TEXT,
    is_default BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 5. BẢNG ORDERS - Đơn hàng
-- =====================================================
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_code VARCHAR(50) NOT NULL UNIQUE,
    user_id INT,
    receiver_name VARCHAR(100) NOT NULL,
    receiver_phone VARCHAR(20) NOT NULL,
    receiver_email VARCHAR(255),
    shipping_address TEXT NOT NULL,
    note TEXT,
    subtotal DECIMAL(15, 0) NOT NULL,
    shipping_fee DECIMAL(15, 0) DEFAULT 0,
    discount DECIMAL(15, 0) DEFAULT 0,
    total DECIMAL(15, 0) NOT NULL,
    payment_method ENUM('cod', 'bank_transfer', 'vnpay', 'momo') DEFAULT 'cod',
    payment_status ENUM('pending', 'paid', 'failed', 'refunded') DEFAULT 'pending',
    order_status ENUM('pending', 'confirmed', 'processing', 'shipping', 'delivered', 'cancelled') DEFAULT 'pending',
    cancelled_reason TEXT,
    delivered_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_order_code (order_code),
    INDEX idx_user (user_id),
    INDEX idx_status (order_status),
    INDEX idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 6. BẢNG ORDER_ITEMS - Chi tiết đơn hàng
-- =====================================================
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT,
    product_name VARCHAR(255) NOT NULL,
    product_image VARCHAR(500),
    price DECIMAL(15, 0) NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(15, 0) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE SET NULL,
    INDEX idx_order (order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 7. BẢNG CART - Giỏ hàng
-- =====================================================
CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_user_product (user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    INDEX idx_user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 8. BẢNG WISHLIST - Danh sách yêu thích
-- =====================================================
CREATE TABLE IF NOT EXISTS wishlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_user_product (user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    INDEX idx_user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 9. BẢNG REVIEWS - Đánh giá sản phẩm
-- =====================================================
CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    order_id INT,
    rating TINYINT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    is_approved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE SET NULL,
    INDEX idx_product (product_id),
    INDEX idx_user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 10. BẢNG COUPONS - Mã giảm giá
-- =====================================================
CREATE TABLE IF NOT EXISTS coupons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    discount_type ENUM('percent', 'fixed') NOT NULL,
    discount_value DECIMAL(15, 0) NOT NULL,
    min_order_value DECIMAL(15, 0) DEFAULT 0,
    max_discount DECIMAL(15, 0),
    usage_limit INT,
    used_count INT DEFAULT 0,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_code (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 11. BẢNG CONTACTS - Liên hệ
-- =====================================================
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    subject VARCHAR(255),
    message TEXT NOT NULL,
    status ENUM('new', 'read', 'replied') DEFAULT 'new',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- DỮ LIỆU MẪU
-- =====================================================

-- Thêm admin mặc định (password: admin123)
INSERT INTO users (email, password, fullname, phone, role, status) VALUES
('admin@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZRGdjGj/n3.1wL5oKsJLBwQbGj1G2', 'Admin', '0921450620', 'admin', 'active');

-- Thêm user mẫu (password: 123456)
INSERT INTO users (email, password, fullname, phone, role, status) VALUES
('user@gmail.com', '$2a$10$hashedpassword123456', 'Nguyễn Văn A', '0987654321', 'customer', 'active');

-- Thêm danh mục sản phẩm
INSERT INTO categories (name, slug, description, parent_id, display_order) VALUES
('Hoa Tươi', 'hoa-tuoi', 'Các loại hoa tươi đẹp', NULL, 1),
('Hoa Giả', 'hoa-gia', 'Hoa giả trang trí', NULL, 2),
('Bó Hoa', 'bo-hoa', 'Bó hoa tươi', 1, 1),
('Hoa Tulip', 'hoa-tulip', 'Hoa tulip các màu', 1, 2),
('Bình Hoa', 'binh-hoa', 'Bình hoa trang trí', 1, 3),
('Giỏ Hoa', 'gio-hoa', 'Giỏ hoa quà tặng', 1, 4),
('Hộp Hoa', 'hop-hoa', 'Hộp hoa cao cấp', 1, 5),
('Hoa Cưới', 'hoa-cuoi', 'Hoa cưới, hoa cầm tay cô dâu', 1, 6),
('Lan Hồ Điệp', 'lan-ho-diep', 'Lan hồ điệp các loại', 1, 7),
('Hoa Mẫu Đơn', 'hoa-mau-don', 'Hoa mẫu đơn', 1, 8),
('Kệ Hoa Chúc Mừng', 'ke-hoa-chuc-mung', 'Kệ hoa khai trương, chúc mừng', 1, 9),
('Hoa Tốt Nghiệp', 'hoa-tot-nghiep', 'Hoa tốt nghiệp', 1, 10),
('Hoa Lụa', 'hoa-lua', 'Hoa lụa cao cấp', 2, 1),
('Hoa Nhựa', 'hoa-nhua', 'Hoa nhựa trang trí', 2, 2),
('Hoa Giấy', 'hoa-giay', 'Hoa giấy handmade', 2, 3),
('Hoa Vải', 'hoa-vai', 'Hoa vải trang trí', 2, 4);

-- Thêm sản phẩm mẫu
INSERT INTO products (category_id, name, slug, description, short_description, price, sale_price, quantity, image, is_featured, is_active) VALUES
-- Bó Hoa
(3, 'Bó hoa hồng đỏ tình yêu', 'bo-hoa-hong-do-tinh-yeu', 'Bó hoa hồng đỏ 20 bông tượng trưng cho tình yêu nồng cháy', 'Bó hoa hồng đỏ 20 bông', 450000, 399000, 50, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', TRUE, TRUE),
(3, 'Bó hoa hướng dương rạng rỡ', 'bo-hoa-huong-duong-rang-ro', 'Bó hoa hướng dương 15 bông mang đến sự tươi sáng và may mắn', 'Bó hoa hướng dương 15 bông', 380000, NULL, 30, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', TRUE, TRUE),
(3, 'Bó hoa mix pastel', 'bo-hoa-mix-pastel', 'Bó hoa mix các loại hoa màu pastel nhẹ nhàng', 'Bó hoa mix pastel', 520000, 480000, 25, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', FALSE, TRUE),

-- Hoa Tulip
(4, 'Hoa Tulip hồng ngọt ngào', 'hoa-tulip-hong-ngot-ngao', 'Bó hoa tulip hồng 10 bông thể hiện sự dịu dàng', 'Bó tulip hồng 10 bông', 650000, NULL, 20, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', TRUE, TRUE),
(4, 'Hoa Tulip đỏ rực rỡ', 'hoa-tulip-do-ruc-ro', 'Bó hoa tulip đỏ 12 bông tượng trưng cho tình yêu hoàn hảo', 'Bó tulip đỏ 12 bông', 720000, 680000, 15, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', FALSE, TRUE),

-- Giỏ Hoa
(6, 'Giỏ hoa sinh nhật ấm áp', 'gio-hoa-sinh-nhat-am-ap', 'Giỏ hoa tươi thích hợp làm quà sinh nhật', 'Giỏ hoa sinh nhật', 850000, 799000, 18, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', TRUE, TRUE),
(6, 'Giỏ hoa chúc mừng khai trương', 'gio-hoa-chuc-mung-khai-truong', 'Giỏ hoa lớn phù hợp cho dịp khai trương', 'Giỏ hoa khai trương', 1200000, NULL, 10, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', FALSE, TRUE),

-- Hộp Hoa
(7, 'Hộp hoa hồng cao cấp', 'hop-hoa-hong-cao-cap', 'Hộp hoa hồng sang trọng với 25 bông hồng Ecuador', 'Hộp hoa hồng Ecuador', 1500000, 1350000, 12, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', TRUE, TRUE),
(7, 'Hộp hoa mix hồng baby', 'hop-hoa-mix-hong-baby', 'Hộp hoa mix hồng và baby trắng tinh khôi', 'Hộp hoa mix', 680000, NULL, 22, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', FALSE, TRUE),

-- Lan Hồ Điệp
(9, 'Chậu lan hồ điệp trắng 5 cành', 'chau-lan-ho-diep-trang-5-canh', 'Chậu lan hồ điệp trắng 5 cành sang trọng, may mắn', 'Lan hồ điệp trắng 5 cành', 2500000, 2300000, 8, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', TRUE, TRUE),
(9, 'Chậu lan hồ điệp tím 3 cành', 'chau-lan-ho-diep-tim-3-canh', 'Chậu lan hồ điệp tím 3 cành quý phái', 'Lan hồ điệp tím 3 cành', 1800000, NULL, 10, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', FALSE, TRUE),

-- Hoa Lụa
(13, 'Bình hoa lụa trang trí phòng khách', 'binh-hoa-lua-trang-tri-phong-khach', 'Bình hoa lụa cao cấp trang trí nội thất', 'Bình hoa lụa phòng khách', 350000, 299000, 40, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', FALSE, TRUE),
(13, 'Bó hoa lụa hồng vintage', 'bo-hoa-lua-hong-vintage', 'Bó hoa lụa phong cách vintage lãng mạn', 'Bó hoa lụa vintage', 280000, NULL, 35, 'https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg', TRUE, TRUE);

-- Thêm mã giảm giá mẫu
INSERT INTO coupons (code, description, discount_type, discount_value, min_order_value, max_discount, usage_limit, start_date, end_date, is_active) VALUES
('WELCOME10', 'Giảm 10% cho khách hàng mới', 'percent', 10, 200000, 100000, 100, '2025-01-01 00:00:00', '2025-12-31 23:59:59', TRUE),
('FREESHIP', 'Miễn phí vận chuyển', 'fixed', 30000, 300000, NULL, 50, '2025-01-01 00:00:00', '2025-06-30 23:59:59', TRUE),
('SALE50K', 'Giảm 50.000đ cho đơn từ 500K', 'fixed', 50000, 500000, NULL, 30, '2025-01-01 00:00:00', '2025-03-31 23:59:59', TRUE);

-- =====================================================
-- HOÀN TẤT
-- =====================================================
SELECT 'Database flowerstore đã được tạo thành công!' AS message;
