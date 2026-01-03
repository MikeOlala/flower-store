-- Tạo bảng đánh giá sản phẩm
CREATE TABLE IF NOT EXISTS product_reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'approved' CHECK (status IN ('pending', 'approved', 'rejected')),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_product_id (product_id),
    INDEX idx_user_id (user_id),
    INDEX idx_status (status),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm dữ liệu mẫu
INSERT INTO product_reviews (product_id, user_id, rating, comment, status) VALUES
(1, 2, 5, 'Hoa rất đẹp và tươi, giao hàng nhanh. Rất hài lòng!', 'approved'),
(1, 5, 4, 'Chất lượng tốt, giá hợp lý. Sẽ ủng hộ shop lần sau.', 'approved'),
(2, 2, 5, 'Bó hoa sinh nhật đẹp quá! Người nhận rất thích.', 'approved'),
(3, 5, 3, 'Hoa đẹp nhưng giao hơi lâu so với dự kiến.', 'approved'),
(4, 2, 5, 'Hoa cưới tuyệt vời, đúng như mô tả!', 'approved');

-- Thêm cột average_rating vào bảng products để cache điểm trung bình
ALTER TABLE products 
ADD COLUMN average_rating DECIMAL(3,2) DEFAULT 0.00,
ADD COLUMN review_count INT DEFAULT 0;

-- Cập nhật điểm trung bình cho sản phẩm
UPDATE products p
SET 
    average_rating = (
        SELECT COALESCE(AVG(rating), 0)
        FROM product_reviews
        WHERE product_id = p.id AND status = 'approved'
    ),
    review_count = (
        SELECT COUNT(*)
        FROM product_reviews
        WHERE product_id = p.id AND status = 'approved'
    );
