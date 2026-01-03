-- =====================================================
-- SCRIPT KIỂM TRA THỐNG KÊ
-- =====================================================

USE flowerstore;

-- =====================================================
-- 1. KIỂM TRA TỔNG QUAN
-- =====================================================

SELECT 
    '=== TỔNG QUAN HỆ THỐNG ===' as info;

SELECT 
    (SELECT COUNT(*) FROM users) as 'Tổng Khách Hàng',
    (SELECT COUNT(*) FROM products) as 'Tổng Sản Phẩm',
    (SELECT COUNT(*) FROM orders) as 'Tổng Đơn Hàng',
    (SELECT COUNT(*) FROM categories) as 'Tổng Danh Mục',
    (SELECT COUNT(*) FROM contacts) as 'Tổng Liên Hệ';

-- =====================================================
-- 2. THỐNG KÊ ĐỜN HÀNG THEO TRẠNG THÁI
-- =====================================================

SELECT 
    '=== ĐƠN HÀNG THEO TRẠNG THÁI ===' as info;

SELECT 
    order_status as 'Trạng Thái',
    COUNT(*) as 'Số Lượng',
    FORMAT(SUM(total), 0) as 'Tổng Tiền (VNĐ)'
FROM orders
GROUP BY order_status
ORDER BY 
    FIELD(order_status, 'pending', 'confirmed', 'processing', 'shipping', 'delivered', 'cancelled');

-- =====================================================
-- 3. THỐNG KÊ THANH TOÁN
-- =====================================================

SELECT 
    '=== THANH TOÁN THEO TRẠNG THÁI ===' as info;

SELECT 
    payment_status as 'Trạng Thái Thanh Toán',
    COUNT(*) as 'Số Lượng',
    FORMAT(SUM(total), 0) as 'Tổng Tiền (VNĐ)'
FROM orders
GROUP BY payment_status
ORDER BY 
    FIELD(payment_status, 'pending', 'paid', 'failed', 'refunded');

-- =====================================================
-- 4. TỔNG DOANH THU (ĐIỀU KIỆN CHÍNH XÁC)
-- =====================================================

SELECT 
    '=== TỔNG DOANH THU ===' as info;

-- Đơn hàng đã giao VÀ đã thanh toán
SELECT 
    COUNT(*) as 'Số Đơn Đã Giao & Đã Thanh Toán',
    FORMAT(SUM(total), 0) as 'Tổng Doanh Thu (VNĐ)',
    FORMAT(AVG(total), 0) as 'Trung Bình/Đơn (VNĐ)',
    FORMAT(MIN(total), 0) as 'Đơn Nhỏ Nhất (VNĐ)',
    FORMAT(MAX(total), 0) as 'Đơn Lớn Nhất (VNĐ)'
FROM orders
WHERE order_status = 'delivered' 
  AND payment_status = 'paid';

-- =====================================================
-- 5. BREAKDOWN CHI TIẾT
-- =====================================================

SELECT 
    '=== BREAKDOWN CHI TIẾT ===' as info;

SELECT 
    order_status as 'Trạng Thái Đơn',
    payment_status as 'Trạng Thái Thanh Toán',
    COUNT(*) as 'Số Lượng',
    FORMAT(SUM(total), 0) as 'Tổng Tiền (VNĐ)',
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2), '%') as 'Tỷ Lệ %'
FROM orders
GROUP BY order_status, payment_status
ORDER BY COUNT(*) DESC;

-- =====================================================
-- 6. ĐƠN HÀNG GẦN ĐÂY (10 ĐƠN)
-- =====================================================

SELECT 
    '=== 10 ĐƠN HÀNG GẦN NHẤT ===' as info;

SELECT 
    order_code as 'Mã Đơn',
    receiver_name as 'Người Nhận',
    FORMAT(total, 0) as 'Tổng Tiền (VNĐ)',
    order_status as 'Trạng Thái',
    payment_status as 'Thanh Toán',
    payment_method as 'Phương Thức',
    DATE_FORMAT(created_at, '%d/%m/%Y %H:%i') as 'Ngày Tạo'
FROM orders
ORDER BY created_at DESC
LIMIT 10;

-- =====================================================
-- 7. KIỂM TRA CÁC ĐƠN HÀNG ĐANG CÓ VẤN ĐỀ
-- =====================================================

SELECT 
    '=== ĐƠN HÀNG CẦN CHÚ Ý ===' as info;

-- Đơn đã giao nhưng chưa thanh toán (COD chưa thu tiền)
SELECT 
    'Đã Giao - Chưa Thanh Toán' as 'Loại Vấn Đề',
    COUNT(*) as 'Số Lượng',
    FORMAT(SUM(total), 0) as 'Tổng Tiền (VNĐ)'
FROM orders
WHERE order_status = 'delivered' 
  AND payment_status = 'pending';

-- Đơn đã thanh toán nhưng chưa giao (Cần xử lý)
SELECT 
    'Đã Thanh Toán - Chưa Giao' as 'Loại Vấn Đề',
    COUNT(*) as 'Số Lượng',
    FORMAT(SUM(total), 0) as 'Tổng Tiền (VNĐ)'
FROM orders
WHERE payment_status = 'paid' 
  AND order_status NOT IN ('delivered', 'cancelled');

-- Đơn bị hủy sau khi đã thanh toán (Cần hoàn tiền)
SELECT 
    'Đã Hủy - Đã Thanh Toán' as 'Loại Vấn Đề',
    COUNT(*) as 'Số Lượng',
    FORMAT(SUM(total), 0) as 'Tổng Tiền (VNĐ)'
FROM orders
WHERE order_status = 'cancelled' 
  AND payment_status = 'paid';

-- =====================================================
-- 8. THỐNG KÊ THEO THỜI GIAN
-- =====================================================

SELECT 
    '=== DOANH THU 7 NGÀY GẦN NHẤT ===' as info;

SELECT 
    DATE(created_at) as 'Ngày',
    COUNT(*) as 'Số Đơn',
    FORMAT(SUM(CASE WHEN order_status = 'delivered' AND payment_status = 'paid' 
                    THEN total ELSE 0 END), 0) as 'Doanh Thu (VNĐ)'
FROM orders
WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
GROUP BY DATE(created_at)
ORDER BY DATE(created_at) DESC;

-- =====================================================
-- 9. SẢN PHẨM BÁN CHẠY
-- =====================================================

SELECT 
    '=== TOP 10 SẢN PHẨM BÁN CHẠY ===' as info;

SELECT 
    p.name as 'Tên Sản Phẩm',
    SUM(oi.quantity) as 'Số Lượng Bán',
    FORMAT(SUM(oi.quantity * oi.price), 0) as 'Doanh Thu (VNĐ)',
    COUNT(DISTINCT oi.order_id) as 'Số Đơn Hàng'
FROM products p
JOIN order_items oi ON p.id = oi.product_id
JOIN orders o ON oi.order_id = o.id
WHERE o.order_status != 'cancelled'
GROUP BY p.id, p.name
ORDER BY SUM(oi.quantity) DESC
LIMIT 10;

-- =====================================================
-- 10. KIỂM TRA DỮ LIỆU MẪU
-- =====================================================

SELECT 
    '=== KIỂM TRA DỮ LIỆU MẪU ===' as info;

-- Có ít nhất 1 đơn hàng delivered + paid không?
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 'CÓ DỮ LIỆU - Dashboard sẽ hiển thị doanh thu'
        ELSE 'KHÔNG CÓ DỮ LIỆU - Cần tạo đơn hàng mẫu'
    END as 'Trạng Thái',
    COUNT(*) as 'Số Đơn Hợp Lệ',
    FORMAT(COALESCE(SUM(total), 0), 0) as 'Tổng Doanh Thu (VNĐ)'
FROM orders
WHERE order_status = 'delivered' 
  AND payment_status = 'paid';
