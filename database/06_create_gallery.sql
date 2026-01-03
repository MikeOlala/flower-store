-- Tạo bảng gallery để lưu các hình ảnh "Khoảnh Khắc Đáng Nhớ"
CREATE TABLE IF NOT EXISTS gallery (
    id INT PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(500) NOT NULL,
    caption VARCHAR(255) NOT NULL,
    description TEXT,
    display_order INT DEFAULT 0,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm dữ liệu mẫu từ intro.jsp hiện tại
INSERT INTO gallery (image_url, caption, description, display_order, is_active) VALUES
('https://cdn.hstatic.net/files/200000846175/file/caf51f824f9dc2c39b8c.jpg', 'Bó hoa pastel dịu dàng', 'Bó hoa pastel với tông màu nhẹ nhàng, phù hợp cho mọi dịp', 1, 1),
('https://product.hstatic.net/200000846175/product/w6_57fe7e7ee65f4097aef741ba053a4609.jpg', 'Kệ hoa khai trương', 'Kệ hoa chúc mừng khai trương với thiết kế sang trọng', 2, 1),
('https://images.unsplash.com/photo-1563241527-3004b7be0ffd?w=400', 'Bó hoa cưới Lãng mạn', 'Bó hoa cưới đẹp cho ngày trọng đại của bạn', 3, 1),
('https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400', 'Bó hoa sinh nhật', 'Bó hoa tươi tắn để chúc mừng sinh nhật', 4, 1),
('https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400', 'Tulip tươi sắc', 'Hoa tulip với màu sắc rực rỡ', 5, 1),
('https://images.unsplash.com/photo-1455659817273-f96807779a8a?w=400', 'Hồng đỏ cổ điển', 'Hoa hồng đỏ - biểu tượng của tình yêu', 6, 1);
