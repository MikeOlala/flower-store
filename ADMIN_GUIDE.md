# HƯỚNG DẪN TRUY CẬP TRANG ADMIN

## 🔐 Tài khoản Admin mặc định

### Thông tin đăng nhập:

- **Email**: `admin@gmail.com`
- **Password**: `admin123`

## 📋 Các bước để truy cập Admin

### Bước 1: Tạo tài khoản admin trong database

Mở MySQL Workbench hoặc phpMyAdmin và chạy file:

```
database/create_admin.sql
```

Hoặc chạy lệnh SQL sau:

```sql
USE flowerstore;

INSERT INTO users (email, password, fullname, phone, role, status)
VALUES ('admin@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZRGdjGj/n3.1wL5oKsJLBwQbGj1G2', 'Administrator', '0921450620', 'admin', 'active')
ON DUPLICATE KEY UPDATE
    role = 'admin',
    status = 'active';
```

### Bước 2: Khởi động Tomcat

Đảm bảo Tomcat đang chạy tại:

```
D:\xampp\tomcat
```

### Bước 3: Truy cập trang đăng nhập

Mở trình duyệt và truy cập:

```
http://localhost:8080/flowerstore/login
```

### Bước 4: Đăng nhập với tài khoản admin

Nhập thông tin:

- Email: `admin@gmail.com`
- Password: `admin123`

### Bước 5: Truy cập Admin Dashboard

Sau khi đăng nhập thành công, truy cập:

```
http://localhost:8080/flowerstore/admin
```

Hoặc:

```
http://localhost:8080/flowerstore/admin/dashboard
```

## 🎯 Các chức năng Admin đã hoàn thiện

### 1. Dashboard (Trang chủ Admin)

- **URL**: `/admin` hoặc `/admin/dashboard`
- **Chức năng**:
  - Hiển thị thống kê tổng quan:
    - Tổng số người dùng
    - Tổng số sản phẩm
    - Tổng số đơn hàng
    - Tổng doanh thu
  - Danh sách 10 đơn hàng gần nhất
  - Top 5 sản phẩm bán chạy

### 2. Quản lý Users

- **URL**: `/admin/users`
- **API**:
  - `GET /admin/api/users` - Lấy danh sách users
  - `POST /admin/api/user/update-status` - Cập nhật trạng thái user
  - `DELETE /admin/api/user/{id}` - Xóa user

### 3. Quản lý Products

- **URL**: `/admin/products`
- **API**:
  - `GET /admin/api/products` - Lấy danh sách sản phẩm
  - `POST /admin/api/product/toggle-active` - Bật/tắt sản phẩm
  - `DELETE /admin/api/product/{id}` - Xóa sản phẩm

### 4. Quản lý Orders

- **URL**: `/admin/orders`
- **API**:
  - `GET /admin/api/orders` - Lấy danh sách đơn hàng
  - `POST /admin/api/order/update-status` - Cập nhật trạng thái đơn hàng

### 5. Quản lý Categories

- **URL**: `/admin/categories`
- **API**:
  - `GET /admin/api/categories` - Lấy danh sách danh mục

### 6. Thống kê

- **API**: `GET /admin/api/stats`
- Trả về JSON với thống kê đầy đủ

## 🔒 Bảo mật

- Chỉ users có `role = 'admin'` mới được truy cập trang admin
- Tự động redirect về login nếu chưa đăng nhập
- Trả về lỗi 403 Forbidden nếu không có quyền

## 📝 Nâng cấp tài khoản hiện tại thành Admin

Nếu bạn muốn nâng tài khoản user hiện có thành admin:

```sql
UPDATE users SET role = 'admin' WHERE email = 'email_cua_ban@gmail.com';
```

## 🛠️ Tạo thêm tài khoản admin mới

```sql
-- Thay đổi email, password, tên theo ý bạn
INSERT INTO users (email, password, fullname, phone, role, status)
VALUES (
    'admin2@gmail.com',
    '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZRGdjGj/n3.1wL5oKsJLBwQbGj1G2', -- password: admin123
    'Admin 2',
    '0987654321',
    'admin',
    'active'
);
```

## 🔑 Hash Password mới

Nếu muốn tạo password khác, sử dụng BCrypt:

```java
String hashedPassword = BCrypt.hashpw("password_moi", BCrypt.gensalt(10));
```

## 📱 Các trang admin khác

File `admin_1.jsp` đã có sẵn UI đầy đủ cho:

- Dashboard với biểu đồ
- Quản lý sản phẩm (CRUD)
- Quản lý đơn hàng
- Quản lý người dùng
- Quản lý danh mục
- Thống kê doanh thu

## ⚡ Quick Start

```bash
# 1. Tạo admin account
mysql -u root -p flowerstore < database/create_admin.sql

# 2. Build & Deploy
cd D:\LTweb\flowerstore3
$env:JAVA_HOME = "D:\java\jdk-22"
mvn clean package -DskipTests
Copy-Item target\flowerstore-1.0-SNAPSHOT.war D:\xampp\tomcat\webapps\flowerstore.war -Force

# 3. Khởi động Tomcat (nếu chưa chạy)
# Truy cập: http://localhost:8080/flowerstore/admin
```

## 🎉 Hoàn tất!

Bây giờ bạn có thể:

1. Đăng nhập với tài khoản admin
2. Quản lý toàn bộ hệ thống
3. Xem thống kê và báo cáo
4. Quản lý users, products, orders, categories
