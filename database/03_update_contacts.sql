-- =====================================================
-- CẬP NHẬT BẢNG CONTACTS
-- =====================================================
USE flowerstore;

-- Thêm các cột mới nếu chưa có
ALTER TABLE contacts 
    MODIFY COLUMN email VARCHAR(255) NULL,
    ADD COLUMN IF NOT EXISTS admin_note TEXT AFTER status,
    ADD COLUMN IF NOT EXISTS user_id INT AFTER admin_note;

-- Nếu câu lệnh trên không chạy được (do MySQL version), dùng câu sau:
-- ALTER TABLE contacts MODIFY COLUMN email VARCHAR(255) NULL;
-- ALTER TABLE contacts ADD COLUMN admin_note TEXT AFTER status;
-- ALTER TABLE contacts ADD COLUMN user_id INT AFTER admin_note;
