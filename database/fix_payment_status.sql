-- =====================================================
-- CẬP NHẬT TRẠNG THÁI THANH TOÁN
-- =====================================================
-- Script này cập nhật payment_status = 'paid' cho các đơn hàng:
-- - Đã giao (order_status = 'delivered')
-- - Thanh toán COD (payment_method = 'cod')
-- - Còn ở trạng thái pending
-- =====================================================

USE flowerstore;

-- Kiểm tra trước khi update
SELECT 
    '=== TRUOC KHI UPDATE ===' as info;

SELECT 
    order_code,
    order_status,
    payment_status,
    payment_method,
    FORMAT(total, 0) as total_amount,
    created_at
FROM orders
WHERE order_status = 'delivered' 
  AND payment_method = 'cod' 
  AND payment_status = 'pending';

-- Cập nhật
UPDATE orders
SET payment_status = 'paid',
    updated_at = CURRENT_TIMESTAMP
WHERE order_status = 'delivered' 
  AND payment_method = 'cod' 
  AND payment_status = 'pending';

-- Kiểm tra sau khi update
SELECT 
    '=== SAU KHI UPDATE ===' as info;

SELECT 
    order_code,
    order_status,
    payment_status,
    payment_method,
    FORMAT(total, 0) as total_amount,
    updated_at
FROM orders
WHERE order_status = 'delivered' 
  AND payment_method = 'cod';

-- Hiển thị tổng doanh thu mới
SELECT 
    '=== TONG DOANH THU MOI ===' as info;

SELECT 
    COUNT(*) as 'So Don Hop Le',
    FORMAT(SUM(total), 0) as 'Tong Doanh Thu (VND)'
FROM orders
WHERE order_status = 'delivered' 
  AND payment_status = 'paid';
