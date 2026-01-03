-- Tạo bảng news để lưu tin tức/bài viết blog
CREATE TABLE IF NOT EXISTS news (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    excerpt TEXT,
    content TEXT NOT NULL,
    image_url VARCHAR(500),
    category VARCHAR(50) DEFAULT 'tips',
    author VARCHAR(100),
    views INT DEFAULT 0,
    is_published TINYINT(1) DEFAULT 1,
    published_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category (category),
    INDEX idx_published (is_published, published_date),
    INDEX idx_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Thêm dữ liệu mẫu từ tintuc.jsp hiện tại
INSERT INTO news (title, slug, excerpt, content, image_url, category, author, is_published, published_date) VALUES
('Gợi ý chọn bó hoa pastel cho những ngày cần sự dịu dàng', 'goi-y-chon-bo-hoa-pastel', 
 'Tone pastel luôn mang lại cảm giác nhẹ nhàng, trong trẻo – rất hợp để tặng những người mình thương vào dịp sinh nhật, kỷ niệm hoặc đơn giản là "vì nhớ bạn".', 
 '<p>Tone màu pastel với những gam màu nhẹ nhàng như hồng phấn, tím lavender, xanh mint luôn mang đến cảm giác dịu dàng và thanh thoát. Đây là lựa chọn hoàn hảo khi bạn muốn gửi gắm những tình cảm chân thành nhất đến người thân yêu.</p><p>Bó hoa pastel không chỉ đẹp mắt mà còn có ý nghĩa sâu sắc, thể hiện sự tinh tế và quan tâm của người tặng. Hãy để Tiệm Hoa nhà tớ giúp bạn lựa chọn bó hoa pastel phù hợp nhất!</p>', 
 'https://cdn.hstatic.net/files/200000846175/file/caf51f824f9dc2c39b8c.jpg', 
 'tips', 'Admin', 1, '2025-11-10 10:00:00'),

('Chọn kệ hoa khai trương sao cho tinh tế mà vẫn sang trọng?', 'chon-ke-hoa-khai-truong-sang-trong', 
 'Lễ khai trương là dịp quan trọng đánh dấu bước khởi đầu mới. Vậy nên chọn kệ hoa như thế nào để vừa thể hiện sự chúc mừng, vừa tôn lên không gian sang trọng?', 
 '<p>Kệ hoa khai trương không chỉ là món quà chúc mừng mà còn là biểu tượng của sự thành công và thịnh vượng. Việc lựa chọn kệ hoa phù hợp sẽ tạo ấn tượng tốt đẹp và mang lại may mắn cho chủ nhân.</p><p>Các loại hoa thường dùng trong kệ khai trương bao gồm: lan hồ điệp (sang trọng), hoa hồng (thành công), hướng dương (tươi sáng). Màu sắc nên chọn tông vàng, đỏ, hồng để tượng trưng cho sự phát đạt.</p>', 
 'https://product.hstatic.net/200000846175/product/w6_57fe7e7ee65f4097aef741ba053a4609.jpg', 
 'opening', 'Admin', 1, '2025-11-02 09:00:00'),

('Câu chuyện về bó hoa cưới lãng mạn nhất mùa Đông này', 'cau-chuyen-bo-hoa-cuoi-lang-man', 
 'Mỗi bó hoa cưới đều mang một câu chuyện riêng. Hãy cùng nghe về bó hoa cưới đặc biệt mà chúng tôi vừa thực hiện cho một đôi uyên ương vào mùa đông năm nay.', 
 '<p>Mùa đông năm nay, chúng tôi có vinh dự được thiết kế bó hoa cưới cho cặp đôi Anna và David. Họ yêu cầu một bó hoa kết hợp giữa sự lãng mạn cổ điển và nét hiện đại.</p><p>Sau nhiều lần trao đổi, chúng tôi quyết định sử dụng hoa hồng trắng Ecuador làm chủ đạo, điểm xuyết hoa baby breath và lá bạc. Kết quả là một bó hoa vừa thanh lịch, vừa lãng mạn, hoàn hảo cho đám cưới mùa đông.</p>', 
 'https://images.unsplash.com/photo-1563241527-3004b7be0ffd?w=400', 
 'story', 'Admin', 1, '2025-10-25 14:00:00'),

('10 Tips bảo quản hoa tươi lâu cho người bận rộn', '10-tips-bao-quan-hoa-tuoi-lau', 
 'Bạn yêu hoa nhưng không có nhiều thời gian chăm sóc? Đừng lo! Dưới đây là 10 mẹo siêu đơn giản giúp hoa tươi của bạn có thể "sống" lâu hơn.', 
 '<h3>10 mẹo bảo quản hoa tươi:</h3><ol><li><strong>Cắt thân hoa xiên</strong>: Cắt xiên góc 45 độ để tăng diện tích hấp thụ nước</li><li><strong>Thay nước thường xuyên</strong>: 2-3 ngày/lần để tránh vi khuẩn phát triển</li><li><strong>Loại bỏ lá dưới nước</strong>: Lá ngâm trong nước sẽ thối và tạo mùi hôi</li><li><strong>Đặt hoa ở nơi thoáng mát</strong>: Tránh ánh nắng trực tiếp và gió mạnh</li><li><strong>Thêm đường hoặc aspirin</strong>: Giúp hoa tươi lâu hơn</li><li><strong>Tránh đặt gần trái cây</strong>: Khí ethylene từ trái cây làm hoa héo nhanh</li><li><strong>Phun sương nhẹ</strong>: Giữ độ ẩm cho cánh hoa</li><li><strong>Cắt bớt lá thừa</strong>: Giảm lượng nước bị bay hơi</li><li><strong>Sử dụng bình sạch</strong>: Rửa bình kỹ trước khi cắm hoa</li><li><strong>Thêm chất bảo quản</strong>: Sử dụng gói bột bảo quản hoa chuyên dụng</li></ol>', 
 'https://file.hstatic.net/200000846175/article/6_d6bdb32719444cc5ad4a6193f4c065f1_master.png', 
 'tips', 'Admin', 1, '2025-10-18 11:00:00'),

('Cách trang trí góc cầu hôn lãng mạn với hoa tươi', 'trang-tri-goc-cau-hon-lang-man', 
 'Bạn đang chuẩn bị cho màn cầu hôn đặc biệt? Hoa tươi chính là yếu tố không thể thiếu để tạo nên không gian lãng mạn và đáng nhớ.', 
 '<p>Cầu hôn là khoảnh khắc quan trọng nhất trong cuộc đời. Để tạo nên một màn cầu hôn hoàn hảo, không gian xung quanh cần được trang trí cẩn thận và tinh tế.</p><h3>Ý tưởng trang trí:</h3><ul><li><strong>Vòng hoa tròn</strong>: Tạo điểm nhấn trung tâm, nơi bạn quỳ gối</li><li><strong>Lối đi hoa</strong>: Dẫn đường đến vị trí cầu hôn bằng cánh hoa rải</li><li><strong>Backdrop hoa</strong>: Tạo nền chụp ảnh đẹp mắt</li><li><strong>Nến và hoa</strong>: Kết hợp ánh nến lung linh với hoa tươi</li></ul><p>Hãy liên hệ với chúng tôi để được tư vấn chi tiết và đặt hoa cho màn cầu hôn của bạn!</p>', 
 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400', 
 'proposal', 'Admin', 1, '2025-10-10 16:00:00'),

('Ý nghĩa của từng loại hoa và khi nào nên tặng', 'y-nghia-cua-tung-loai-hoa', 
 'Mỗi loại hoa mang một thông điệp riêng. Hiểu rõ ý nghĩa của hoa sẽ giúp bạn chọn đúng loại hoa để tặng vào từng dịp.', 
 '<h3>Ý nghĩa các loại hoa phổ biến:</h3><ul><li><strong>Hoa hồng đỏ</strong>: Tình yêu nồng nàn - Tặng người yêu, ngày Valentine</li><li><strong>Hoa hồng vàng</strong>: Tình bạn, niềm vui - Tặng bạn bè, đồng nghiệp</li><li><strong>Hoa tulip</strong>: Tình yêu hoàn hảo - Tặng vào mùa xuân, lễ tình nhân</li><li><strong>Hoa hướng dương</strong>: Sự lạc quan, thành công - Tặng khai trương, tốt nghiệp</li><li><strong>Hoa lily</strong>: Thanh khiết, cao quý - Tặng người lớn tuổi, thầy cô</li><li><strong>Hoa cẩm tú cầu</strong>: Lòng biết ơn - Tặng mẹ, người có ơn</li><li><strong>Hoa lan hồ điệp</strong>: Sang trọng, may mắn - Tặng khai trương, chúc mừng</li></ul>', 
 'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400', 
 'tips', 'Admin', 1, '2025-09-28 13:00:00');
