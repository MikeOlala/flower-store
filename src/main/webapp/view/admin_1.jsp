<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Trị - Tiệm Hoa Nhà Tớ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --bg-page: #faf5ef;
            --brown-main: #3c2922;
            --brown-soft: #6c5845;
            --accent: #c99366;
            --accent-dark: #aa6a3f;
            --light-beige: #f8f3eb;
            --sidebar-width: 260px;
            --header-height: 70px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-page);
            color: var(--brown-main);
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: var(--sidebar-width);
            background: linear-gradient(180deg, var(--accent) 0%, var(--accent-dark) 100%);
            color: white;
            height: 100vh;
            position: fixed;
            transition: all 0.3s;
            z-index: 1000;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            padding: 25px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar-header h2 {
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            font-weight: 700;
        }

        .sidebar-header h2 i {
            color: #fff8e7;
        }

        .sidebar-menu {
            padding: 20px 0;
        }

        .menu-item {
            padding: 14px 25px;
            display: flex;
            align-items: center;
            gap: 15px;
            cursor: pointer;
            transition: all 0.3s;
            border-left: 4px solid transparent;
            font-size: 1.05rem;
        }

        .menu-item:hover {
            background-color: rgba(255, 255, 255, 0.15);
            border-left: 4px solid #fff8e7;
        }

        .menu-item.active {
            background-color: rgba(255, 255, 255, 0.2);
            border-left: 4px solid #fff8e7;
        }

        .menu-item i {
            width: 22px;
            text-align: center;
            font-size: 1.1rem;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            transition: all 0.3s;
        }

        /* Header */
        .header {
            height: var(--header-height);
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-left h1 {
            font-size: 1.6rem;
            color: var(--brown-main);
            font-weight: 700;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .user-avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background-color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            border: 2px solid var(--accent-dark);
        }

        /* Content Area */
        .content {
            padding: 30px;
        }

        .content-section {
            display: none;
        }

        .content-section.active {
            display: block;
        }

        /* Dashboard Stats */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 25px;
            margin-bottom: 35px;
        }

        .stat-card {
            background-color: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 6px 20px rgba(160, 130, 100, 0.15);
            display: flex;
            align-items: center;
            gap: 18px;
            transition: transform 0.3s, box-shadow 0.3s;
            border: 1px solid rgba(210, 180, 160, 0.3);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(150, 120, 90, 0.2);
        }

        .stat-icon {
            width: 65px;
            height: 65px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.7rem;
            color: white;
            background: linear-gradient(135deg, var(--accent), var(--accent-dark));
        }

        .stat-info h3 {
            font-size: 1.9rem;
            margin-bottom: 5px;
            font-weight: 700;
            color: var(--brown-main);
        }

        .stat-info p {
            color: var(--brown-soft);
            font-size: 0.95rem;
        }

        /* Cards */
        .card {
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(160, 130, 100, 0.15);
            margin-bottom: 30px;
            overflow: hidden;
            border: 1px solid rgba(210, 180, 160, 0.3);
        }

        .card-header {
            padding: 22px 25px;
            border-bottom: 1px solid rgba(210, 180, 160, 0.3);
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: var(--light-beige);
        }

        .card-header h3 {
            font-size: 1.4rem;
            color: var(--brown-main);
            font-weight: 700;
        }

        .card-body {
            padding: 25px;
        }

        /* Tables */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid rgba(210, 180, 160, 0.3);
        }

        th {
            background-color: var(--light-beige);
            font-weight: 700;
            color: var(--brown-main);
        }

        tr:hover {
            background-color: rgba(249, 241, 231, 0.5);
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        .status-active {
            background-color: rgba(201, 147, 102, 0.15);
            color: var(--accent-dark);
        }

        .status-pending {
            background-color: rgba(255, 193, 7, 0.15);
            color: #b58a2b;
        }

        .status-inactive {
            background-color: rgba(220, 53, 69, 0.15);
            color: #a04545;
        }

        .status-completed {
            background-color: rgba(40, 167, 69, 0.15);
            color: #2e7d32;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn {
            padding: 10px 18px;
            border: none;
            border-radius: 999px;
            cursor: pointer;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s;
        }

        .btn-sm {
            padding: 7px 14px;
            font-size: 0.9rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--accent), var(--accent-dark));
            color: white;
            box-shadow: 0 4px 12px rgba(170, 106, 63, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #b57d4c, #945331);
            box-shadow: 0 6px 16px rgba(170, 106, 63, 0.4);
        }

        .btn-success {
            background: linear-gradient(135deg, #6a994e, #386641);
            color: white;
        }

        .btn-warning {
            background: linear-gradient(135deg, #e9c46a, #d4a017);
            color: white;
        }

        .btn-danger {
            background: linear-gradient(135deg, #e76f51, #d1493d);
            color: white;
        }

        .btn-light {
            background-color: #f4e1d1;
            color: var(--brown-soft);
            border: 1px solid rgba(210, 180, 160, 0.5);
        }

        .btn-light:hover {
            background-color: #e9d2bd;
        }

        /* Forms */
        .form-group {
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: var(--brown-main);
        }

        .form-control {
            width: 100%;
            padding: 12px 18px;
            border: 1px solid rgba(210, 180, 160, 0.5);
            border-radius: 10px;
            font-size: 1rem;
            transition: border 0.3s, box-shadow 0.3s;
            background-color: white;
        }

        .form-control:focus {
            border-color: var(--accent);
            outline: none;
            box-shadow: 0 0 0 3px rgba(201, 147, 102, 0.2);
        }

        .form-row {
            display: flex;
            gap: 25px;
        }

        .form-row .form-group {
            flex: 1;
        }

        /* Tabs */
        .tabs {
            display: flex;
            border-bottom: 1px solid rgba(210, 180, 160, 0.3);
            margin-bottom: 25px;
            background-color: var(--light-beige);
            border-radius: 10px 10px 0 0;
            padding: 0 10px;
        }

        .tab {
            padding: 14px 24px;
            cursor: pointer;
            border-bottom: 3px solid transparent;
            transition: all 0.3s;
            font-weight: 600;
            color: var(--brown-soft);
        }

        .tab.active {
            border-bottom: 3px solid var(--accent);
            color: var(--accent-dark);
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        /* Charts */
        .chart-container {
            height: 320px;
            margin-bottom: 30px;
            background: white;
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        /* Progress Bars */
        .progress-container {
            margin-bottom: 20px;
        }

        .progress-label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--brown-main);
        }

        .progress-bar {
            height: 12px;
            background-color: #f4e1d1;
            border-radius: 10px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            border-radius: 10px;
        }

        /* Modal */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 2000;
        }

        .modal {
            background-color: white;
            border-radius: 16px;
            width: 90%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        .modal-header {
            padding: 20px 25px;
            border-bottom: 1px solid rgba(210, 180, 160, 0.3);
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: var(--light-beige);
        }

        .modal-header h3 {
            font-size: 1.4rem;
            color: var(--brown-main);
            font-weight: 700;
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: var(--brown-soft);
        }

        .modal-body {
            padding: 25px;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                width: 70px;
                overflow: hidden;
            }
            
            .sidebar-header h2 span, .menu-item span {
                display: none;
            }
            
            .main-content {
                margin-left: 70px;
            }
            
            .menu-item {
                justify-content: center;
                padding: 16px;
            }

            .menu-item i {
                font-size: 1.3rem;
            }
        }

        @media (max-width: 768px) {
            .header {
                padding: 0 20px;
            }
            
            .content {
                padding: 20px;
            }
            
            .stats-container {
                grid-template-columns: 1fr;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .tabs {
                flex-wrap: wrap;
            }
        }

        /* Notification */
        .notification {
            position: fixed;
            top: 90px;
            right: 30px;
            padding: 15px 25px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
            display: flex;
            align-items: center;
            gap: 12px;
            z-index: 1500;
            transform: translateX(150%);
            transition: transform 0.4s;
            border-left: 4px solid var(--accent);
        }

        .notification.show {
            transform: translateX(0);
        }

        .notification i {
            color: var(--accent);
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2><i class="fas fa-flower"></i> <span>Tiệm Hoa nhà tớ</span></h2>
        </div>
        <div class="sidebar-menu">
            <div class="menu-item active" data-target="dashboard">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </div>
            <div class="menu-item" data-target="orders">
                <i class="fas fa-shopping-cart"></i>
                <span>Đơn Hàng</span>
            </div>
            <div class="menu-item" data-target="products">
                <i class="fas fa-box"></i>
                <span>Sản Phẩm</span>
            </div>
            <div class="menu-item" data-target="customers">
                <i class="fas fa-users"></i>
                <span>Khách Hàng</span>
            </div>
            <div class="menu-item" data-target="analytics">
                <i class="fas fa-chart-bar"></i>
                <span>Thống Kê</span>
            </div>
            <div class="menu-item" data-target="promotions">
                <i class="fas fa-tags"></i>
                <span>Khuyến Mãi</span>
            </div>
            <div class="menu-item" data-target="settings">
                <i class="fas fa-cog"></i>
                <span>Cài Đặt</span>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="header-left">
                <h1>Dashboard</h1>
            </div>
            <div class="header-right">
                <div class="user-info">
                    <div class="user-avatar">QT</div>
                    <div>
                        <div class="user-name">Quản Trị Viên</div>
                        <div class="user-role" style="font-size: 0.85rem; color: var(--brown-soft);">Administrator</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Content -->
        <div class="content">
            <!-- Dashboard Content -->
            <div id="dashboard" class="content-section active">
                <!-- Stats -->
                <div class="stats-container">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="stat-info">
                            <h3>152</h3>
                            <p>Đơn Hàng Mới</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <div class="stat-info">
                            <h3>28.450.000đ</h3>
                            <p>Doanh Thu Hôm Nay</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-info">
                            <h3>3.248</h3>
                            <p>Khách Hàng</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-box"></i>
                        </div>
                        <div class="stat-info">
                            <h3>64</h3>
                            <p>Sản Phẩm</p>
                        </div>
                    </div>
                </div>

                <!-- Charts and Orders -->
                <div class="form-row">
                    <div class="card" style="flex: 2;">
                        <div class="card-header">
                            <h3>Thống Kê Doanh Thu</h3>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <div style="background: linear-gradient(to right, var(--accent), var(--accent-dark)); height: 100%; display: flex; align-items: center; justify-content: center; color: white; border-radius: 10px;">
                                    <div style="text-align: center;">
                                        <i class="fas fa-chart-line" style="font-size: 3rem; margin-bottom: 10px;"></i>
                                        <p>Biểu đồ doanh thu 7 ngày qua</p>
                                        <div style="margin-top: 20px; display: flex; justify-content: space-around; width: 100%;">
                                            <div>Thứ 2: 5.2tr</div>
                                            <div>Thứ 3: 6.8tr</div>
                                            <div>Thứ 4: 4.5tr</div>
                                            <div>Thứ 5: 7.1tr</div>
                                            <div>Thứ 6: 8.3tr</div>
                                            <div>Thứ 7: 9.7tr</div>
                                            <div>CN: 10.2tr</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card" style="flex: 1;">
                        <div class="card-header">
                            <h3>Trạng Thái Đơn Hàng</h3>
                        </div>
                        <div class="card-body">
                            <div class="progress-container">
                                <div class="progress-label">
                                    <span>Đang chờ xử lý</span>
                                    <span>45</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: 45%; background-color: var(--accent);"></div>
                                </div>
                            </div>
                            <div class="progress-container">
                                <div class="progress-label">
                                    <span>Đang giao hàng</span>
                                    <span>32</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: 32%; background-color: #6a994e;"></div>
                                </div>
                            </div>
                            <div class="progress-container">
                                <div class="progress-label">
                                    <span>Đã hoàn thành</span>
                                    <span>75</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: 75%; background-color: #386641;"></div>
                                </div>
                            </div>
                            <div class="progress-container">
                                <div class="progress-label">
                                    <span>Đã hủy</span>
                                    <span>8</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: 8%; background-color: #e76f51;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Orders and Products -->
                <div class="form-row">
                    <div class="card" style="flex: 1;">
                        <div class="card-header">
                            <h3>Đơn Hàng Gần Đây</h3>
                            <button class="btn btn-primary btn-sm" id="viewAllOrders">Xem Tất Cả</button>
                        </div>
                        <div class="card-body">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Mã ĐH</th>
                                        <th>Khách Hàng</th>
                                        <th>Ngày Đặt</th>
                                        <th>Tổng Tiền</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#DH-00125</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>15/06/2023</td>
                                        <td>850.000đ</td>
                                        <td><span class="status status-active">Đang giao</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#DH-00124</td>
                                        <td>Trần Thị B</td>
                                        <td>15/06/2023</td>
                                        <td>1.250.000đ</td>
                                        <td><span class="status status-pending">Chờ xử lý</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#DH-00123</td>
                                        <td>Lê Văn C</td>
                                        <td>14/06/2023</td>
                                        <td>650.000đ</td>
                                        <td><span class="status status-completed">Đã hoàn thành</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#DH-00122</td>
                                        <td>Phạm Thị D</td>
                                        <td>14/06/2023</td>
                                        <td>2.150.000đ</td>
                                        <td><span class="status status-inactive">Đã hủy</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Products Management -->
                <div class="card">
                    <div class="card-header">
                        <h3>Quản Lý Sản Phẩm</h3>
                        <button class="btn btn-primary" id="addProductBtn"><i class="fas fa-plus"></i> Thêm Sản Phẩm</button>
                    </div>
                    <div class="card-body">
                        <div class="tabs" id="productTabs">
                            <div class="tab active" data-tab="all">Tất Cả Sản Phẩm</div>
                            <div class="tab" data-tab="featured">Sản Phẩm Nổi Bật</div>
                            <div class="tab" data-tab="low-stock">Đang Hết Hàng</div>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Hình Ảnh</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Giá</th>
                                    <th>Tồn Kho</th>
                                    <th>Danh Mục</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #f4e1d1, #e9d2bd); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                            <i class="fas fa-image" style="color: var(--brown-soft);"></i>
                                        </div>
                                    </td>
                                    <td>Bó Hoa Pastel Morning</td>
                                    <td>650.000đ</td>
                                    <td>15</td>
                                    <td>Pastel</td>
                                    <td><span class="status status-active">Đang bán</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-product"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-product"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-product"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #f4e1d1, #e9d2bd); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                            <i class="fas fa-image" style="color: var(--brown-soft);"></i>
                                        </div>
                                    </td>
                                    <td>Bó Hoa Secret Love</td>
                                    <td>890.000đ</td>
                                    <td>8</td>
                                    <td>Lãng mạn</td>
                                    <td><span class="status status-active">Đang bán</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-product"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-product"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-product"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #f4e1d1, #e9d2bd); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                            <i class="fas fa-image" style="color: var(--brown-soft);"></i>
                                        </div>
                                    </td>
                                    <td>Bó Hoa Rustic Garden</td>
                                    <td>720.000đ</td>
                                    <td>0</td>
                                    <td>Rustic</td>
                                    <td><span class="status status-inactive">Hết hàng</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-product"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-product"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-product"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Orders Content -->
            <div id="orders" class="content-section">
                <div class="card">
                    <div class="card-header">
                        <h3>Quản Lý Đơn Hàng</h3>
                        <div>
                            <button class="btn btn-light" id="filterOrders"><i class="fas fa-filter"></i> Lọc</button>
                            <button class="btn btn-primary" id="exportOrders"><i class="fas fa-download"></i> Xuất Excel</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="tabs" id="orderTabs">
                            <div class="tab active" data-status="all">Tất Cả Đơn Hàng</div>
                            <div class="tab" data-status="pending">Chờ Xử Lý</div>
                            <div class="tab" data-status="shipping">Đang Giao Hàng</div>
                            <div class="tab" data-status="completed">Đã Hoàn Thành</div>
                            <div class="tab" data-status="cancelled">Đã Hủy</div>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã ĐH</th>
                                    <th>Khách Hàng</th>
                                    <th>Ngày Đặt</th>
                                    <th>Sản Phẩm</th>
                                    <th>Tổng Tiền</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#DH-00130</td>
                                    <td>Nguyễn Thị E</td>
                                    <td>16/06/2023</td>
                                    <td>Bó Hoa Pastel Morning</td>
                                    <td>650.000đ</td>
                                    <td><span class="status status-pending">Chờ xử lý</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm cancel-order"><i class="fas fa-times"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#DH-00129</td>
                                    <td>Trần Văn F</td>
                                    <td>16/06/2023</td>
                                    <td>Bó Hoa Secret Love</td>
                                    <td>890.000đ</td>
                                    <td><span class="status status-active">Đang giao</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-warning btn-sm complete-order"><i class="fas fa-check"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Products Content -->
            <div id="products" class="content-section">
                <div class="card">
                    <div class="card-header">
                        <h3>Quản Lý Sản Phẩm</h3>
                        <button class="btn btn-primary" id="addNewProductBtn"><i class="fas fa-plus"></i> Thêm Sản Phẩm Mới</button>
                    </div>
                    <div class="card-body">
                        <div class="tabs" id="productManagementTabs">
                            <div class="tab active" data-category="all">Tất Cả Sản Phẩm</div>
                            <div class="tab" data-category="category">Theo Danh Mục</div>
                            <div class="tab" data-category="new">Sản Phẩm Mới</div>
                        </div>
                        <div class="form-row">
                            <div class="form-group" style="flex: 2;">
                                <input type="text" class="form-control" id="productSearch" placeholder="Tìm kiếm sản phẩm...">
                            </div>
                            <div class="form-group" style="flex: 1;">
                                <select class="form-control" id="categoryFilter">
                                    <option value="all">Tất cả danh mục</option>
                                    <option value="pastel">Pastel</option>
                                    <option value="rustic">Rustic</option>
                                    <option value="romantic">Lãng mạn</option>
                                    <option value="celebration">Chúc mừng</option>
                                </select>
                            </div>
                            <div class="form-group" style="flex: 1;">
                                <select class="form-control" id="statusFilter">
                                    <option value="all">Tất cả trạng thái</option>
                                    <option value="active">Đang bán</option>
                                    <option value="out-of-stock">Hết hàng</option>
                                    <option value="hidden">Ẩn</option>
                                </select>
                            </div>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Hình Ảnh</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Giá</th>
                                    <th>Tồn Kho</th>
                                    <th>Danh Mục</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>SP-001</td>
                                    <td>
                                        <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #f4e1d1, #e9d2bd); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                            <i class="fas fa-image" style="color: var(--brown-soft);"></i>
                                        </div>
                                    </td>
                                    <td>Bó Hoa Pastel Morning</td>
                                    <td>650.000đ</td>
                                    <td>15</td>
                                    <td>Pastel</td>
                                    <td><span class="status status-active">Đang bán</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-product"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-product"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-product"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>SP-002</td>
                                    <td>
                                        <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #f4e1d1, #e9d2bd); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                            <i class="fas fa-image" style="color: var(--brown-soft);"></i>
                                        </div>
                                    </td>
                                    <td>Bó Hoa Secret Love</td>
                                    <td>890.000đ</td>
                                    <td>8</td>
                                    <td>Lãng mạn</td>
                                    <td><span class="status status-active">Đang bán</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-product"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-product"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-product"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>SP-003</td>
                                    <td>
                                        <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #f4e1d1, #e9d2bd); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                            <i class="fas fa-image" style="color: var(--brown-soft);"></i>
                                        </div>
                                    </td>
                                    <td>Bó Hoa Rustic Garden</td>
                                    <td>720.000đ</td>
                                    <td>0</td>
                                    <td>Rustic</td>
                                    <td><span class="status status-inactive">Hết hàng</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-product"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-product"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-product"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>SP-004</td>
                                    <td>
                                        <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #f4e1d1, #e9d2bd); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                                            <i class="fas fa-image" style="color: var(--brown-soft);"></i>
                                        </div>
                                    </td>
                                    <td>Bó Hoa Sunset Vibes</td>
                                    <td>780.000đ</td>
                                    <td>12</td>
                                    <td>Chúc mừng</td>
                                    <td><span class="status status-active">Đang bán</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-product"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-product"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-product"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Customers Content -->
            <div id="customers" class="content-section">
                <div class="card">
                    <div class="card-header">
                        <h3>Quản Lý Khách Hàng</h3>
                        <button class="btn btn-primary" id="addCustomerBtn"><i class="fas fa-plus"></i> Thêm Khách Hàng</button>
                    </div>
                    <div class="card-body">
                        <div class="tabs" id="customerTabs">
                            <div class="tab active" data-type="all">Tất Cả Khách Hàng</div>
                            <div class="tab" data-type="vip">Khách Hàng Thân Thiết</div>
                            <div class="tab" data-type="new">Khách Hàng Mới</div>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Họ Tên</th>
                                    <th>Email</th>
                                    <th>Số Điện Thoại</th>
                                    <th>Đơn Hàng</th>
                                    <th>Tổng Chi Tiêu</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>KH-001</td>
                                    <td>Nguyễn Văn A</td>
                                    <td>nguyenvana@email.com</td>
                                    <td>0912345678</td>
                                    <td>15</td>
                                    <td>12.450.000đ</td>
                                    <td><span class="status status-active">Hoạt động</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-customer"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-customer"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-customer"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>KH-002</td>
                                    <td>Trần Thị B</td>
                                    <td>tranthib@email.com</td>
                                    <td>0987654321</td>
                                    <td>8</td>
                                    <td>7.820.000đ</td>
                                    <td><span class="status status-active">Hoạt động</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-customer"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-customer"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-customer"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Analytics Content -->
            <div id="analytics" class="content-section">
                <div class="card">
                    <div class="card-header">
                        <h3>Phân Tích & Báo Cáo</h3>
                        <div>
                            <select class="form-control" id="reportPeriod" style="width: 200px; display: inline-block;">
                                <option value="7">7 ngày qua</option>
                                <option value="30">30 ngày qua</option>
                                <option value="90">3 tháng qua</option>
                                <option value="365">Năm nay</option>
                            </select>
                            <button class="btn btn-primary" id="exportReport"><i class="fas fa-download"></i> Xuất Báo Cáo</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="card" style="flex: 1;">
                                <div class="card-header">
                                    <h4>Doanh Thu Theo Danh Mục</h4>
                                </div>
                                <div class="card-body">
                                    <div class="progress-container">
                                        <div class="progress-label">
                                            <span>Pastel</span>
                                            <span>42%</span>
                                        </div>
                                        <div class="progress-bar">
                                            <div class="progress-fill" style="width: 42%; background-color: var(--accent);"></div>
                                        </div>
                                    </div>
                                    <div class="progress-container">
                                        <div class="progress-label">
                                            <span>Lãng mạn</span>
                                            <span>28%</span>
                                        </div>
                                        <div class="progress-bar">
                                            <div class="progress-fill" style="width: 28%; background-color: #e9c46a;"></div>
                                        </div>
                                    </div>
                                    <div class="progress-container">
                                        <div class="progress-label">
                                            <span>Rustic</span>
                                            <span>18%</span>
                                        </div>
                                        <div class="progress-bar">
                                            <div class="progress-fill" style="width: 18%; background-color: #6a994e;"></div>
                                        </div>
                                    </div>
                                    <div class="progress-container">
                                        <div class="progress-label">
                                            <span>Chúc mừng</span>
                                            <span>12%</span>
                                        </div>
                                        <div class="progress-bar">
                                            <div class="progress-fill" style="width: 12%; background-color: #4cc9f0;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card" style="flex: 1;">
                                <div class="card-header">
                                    <h4>Sản Phẩm Bán Chạy</h4>
                                </div>
                                <div class="card-body">
                                    <div style="margin-bottom: 15px;">
                                        <div style="display: flex; justify-content: space-between;">
                                            <span>Bó Hoa Pastel Morning</span>
                                            <span>45 lượt</span>
                                        </div>
                                    </div>
                                    <div style="margin-bottom: 15px;">
                                        <div style="display: flex; justify-content: space-between;">
                                            <span>Bó Hoa Secret Love</span>
                                            <span>38 lượt</span>
                                        </div>
                                    </div>
                                    <div style="margin-bottom: 15px;">
                                        <div style="display: flex; justify-content: space-between;">
                                            <span>Bó Hoa Rustic Garden</span>
                                            <span>32 lượt</span>
                                        </div>
                                    </div>
                                    <div style="margin-bottom: 15px;">
                                        <div style="display: flex; justify-content: space-between;">
                                            <span>Bó Hoa Sunset Vibes</span>
                                            <span>28 lượt</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Promotions Content -->
            <div id="promotions" class="content-section">
                <div class="card">
                    <div class="card-header">
                        <h3>Quản Lý Khuyến Mãi</h3>
                        <button class="btn btn-primary" id="addPromotionBtn"><i class="fas fa-plus"></i> Thêm Khuyến Mãi</button>
                    </div>
                    <div class="card-body">
                        <div class="tabs" id="promotionTabs">
                            <div class="tab active" data-status="all">Tất Cả Khuyến Mãi</div>
                            <div class="tab" data-status="active">Đang Diễn Ra</div>
                            <div class="tab" data-status="upcoming">Sắp Diễn Ra</div>
                            <div class="tab" data-status="ended">Đã Kết Thúc</div>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã KM</th>
                                    <th>Tên Khuyến Mãi</th>
                                    <th>Loại</th>
                                    <th>Giá Trị</th>
                                    <th>Ngày Bắt Đầu</th>
                                    <th>Ngày Kết Thúc</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>KM-001</td>
                                    <td>Giảm 20% cho đơn đầu tiên</td>
                                    <td>Phần trăm</td>
                                    <td>20%</td>
                                    <td>01/06/2023</td>
                                    <td>30/06/2023</td>
                                    <td><span class="status status-active">Đang chạy</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-promotion"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-promotion"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-promotion"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>KM-002</td>
                                    <td>Miễn phí vận chuyển</td>
                                    <td>Vận chuyển</td>
                                    <td>0đ</td>
                                    <td>15/06/2023</td>
                                    <td>30/06/2023</td>
                                    <td><span class="status status-active">Đang chạy</span></td>
                                    <td class="action-buttons">
                                        <button class="btn btn-primary btn-sm view-promotion"><i class="fas fa-eye"></i></button>
                                        <button class="btn btn-success btn-sm edit-promotion"><i class="fas fa-edit"></i></button>
                                        <button class="btn btn-danger btn-sm delete-promotion"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Settings Content -->
            <div id="settings" class="content-section">
                <div class="card">
                    <div class="card-header">
                        <h3>Cài Đặt Hệ Thống</h3>
                    </div>
                    <div class="card-body">
                        <div class="tabs" id="settingsTabs">
                            <div class="tab active" data-setting="store">Thông Tin Cửa Hàng</div>
                            <div class="tab" data-setting="shipping">Vận Chuyển</div>
                            <div class="tab" data-setting="payment">Thanh Toán</div>
                            <div class="tab" data-setting="notification">Thông Báo</div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Tên Cửa Hàng</label>
                                <input type="text" class="form-control" value="Tiệm Hoa Nhà Tớ">
                            </div>
                            <div class="form-group">
                                <label>Số Điện Thoại</label>
                                <input type="text" class="form-control" value="0909 123 456">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" value="contact@tienghoanhato.com">
                            </div>
                            <div class="form-group">
                                <label>Địa Chỉ</label>
                                <input type="text" class="form-control" value="123 Đường Hoa, Quận 1, TP.HCM">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Mô Tả Cửa Hàng</label>
                            <textarea class="form-control" rows="4">Tiệm Hoa Nhà Tớ chuyên cung cấp các loại hoa tươi, bó hoa đẹp với giá cả hợp lý. Chúng tôi cam kết mang đến cho khách hàng những sản phẩm chất lượng nhất.</textarea>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary" id="saveSettings">Lưu Thay Đổi</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Product Modal -->
    <div class="modal-overlay" id="addProductModal">
        <div class="modal">
            <div class="modal-header">
                <h3>Thêm Sản Phẩm Mới</h3>
                <button class="modal-close" id="closeProductModal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Tên Sản Phẩm</label>
                    <input type="text" class="form-control" placeholder="Nhập tên sản phẩm">
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Giá</label>
                        <input type="number" class="form-control" placeholder="Nhập giá">
                    </div>
                    <div class="form-group">
                        <label>Số Lượng</label>
                        <input type="number" class="form-control" placeholder="Nhập số lượng">
                    </div>
                </div>
                <div class="form-group">
                    <label>Danh Mục</label>
                    <select class="form-control">
                        <option>Pastel</option>
                        <option>Rustic</option>
                        <option>Lãng mạn</option>
                        <option>Chúc mừng</option>
                        <option>Khai trương</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Mô Tả</label>
                    <textarea class="form-control" rows="4" placeholder="Nhập mô tả sản phẩm"></textarea>
                </div>
                <div class="form-group">
                    <label>Hình Ảnh</label>
                    <input type="file" class="form-control">
                </div>
                <div class="form-group">
                    <button class="btn btn-primary" style="width: 100%;" id="submitProduct">Thêm Sản Phẩm</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Notification -->
    <div class="notification" id="notification">
        <i class="fas fa-check-circle"></i>
        <div>
            <div style="font-weight: 600;" id="notificationTitle">Thành công!</div>
            <div style="font-size: 0.9rem; color: var(--brown-soft);" id="notificationMessage">Thao tác đã được thực hiện</div>
        </div>
    </div>

    <script>
        // Dữ liệu mẫu
        const sampleData = {
            orders: [
                { id: 'DH-00125', customer: 'Nguyễn Văn A', date: '15/06/2023', total: '850.000đ', status: 'active' },
                { id: 'DH-00124', customer: 'Trần Thị B', date: '15/06/2023', total: '1.250.000đ', status: 'pending' },
                { id: 'DH-00123', customer: 'Lê Văn C', date: '14/06/2023', total: '650.000đ', status: 'completed' },
                { id: 'DH-00122', customer: 'Phạm Thị D', date: '14/06/2023', total: '2.150.000đ', status: 'inactive' }
            ],
            products: [
                { id: 'SP-001', name: 'Bó Hoa Pastel Morning', price: '650.000đ', stock: 15, category: 'Pastel', status: 'active' },
                { id: 'SP-002', name: 'Bó Hoa Secret Love', price: '890.000đ', stock: 8, category: 'Lãng mạn', status: 'active' },
                { id: 'SP-003', name: 'Bó Hoa Rustic Garden', price: '720.000đ', stock: 0, category: 'Rustic', status: 'inactive' },
                { id: 'SP-004', name: 'Bó Hoa Sunset Vibes', price: '780.000đ', stock: 12, category: 'Chúc mừng', status: 'active' }
            ]
        };

        // Khởi tạo ứng dụng
        document.addEventListener('DOMContentLoaded', function() {
            initializeApp();
        });

        function initializeApp() {
            // Xử lý menu navigation
            document.querySelectorAll('.menu-item').forEach(item => {
                item.addEventListener('click', function() {
                    // Xóa active class từ tất cả các menu item
                    document.querySelectorAll('.menu-item').forEach(i => {
                        i.classList.remove('active');
                    });
                    
                    // Thêm active class cho menu item được click
                    this.classList.add('active');
                    
                    // Ẩn tất cả các content section
                    document.querySelectorAll('.content-section').forEach(section => {
                        section.classList.remove('active');
                    });
                    
                    // Hiển thị content section tương ứng
                    const target = this.getAttribute('data-target');
                    document.getElementById(target).classList.add('active');
                    
                    // Cập nhật tiêu đề header
                    document.querySelector('.header-left h1').textContent = this.querySelector('span').textContent;
                });
            });

            // Xử lý tab switching
            document.querySelectorAll('.tabs').forEach(tabGroup => {
                tabGroup.querySelectorAll('.tab').forEach(tab => {
                    tab.addEventListener('click', function() {
                        // Xóa active class từ tất cả các tab trong cùng nhóm
                        const parent = this.closest('.tabs');
                        parent.querySelectorAll('.tab').forEach(t => {
                            t.classList.remove('active');
                        });
                        
                        // Thêm active class cho tab được click
                        this.classList.add('active');
                        
                        // Thực hiện các hành động dựa trên tab được chọn
                        handleTabChange(this);
                    });
                });
            });

            // Xử lý modal thêm sản phẩm
            document.getElementById('addProductBtn').addEventListener('click', function() {
                document.getElementById('addProductModal').style.display = 'flex';
            });

            document.getElementById('addNewProductBtn').addEventListener('click', function() {
                document.getElementById('addProductModal').style.display = 'flex';
            });

            document.getElementById('closeProductModal').addEventListener('click', function() {
                document.getElementById('addProductModal').style.display = 'none';
            });

            // Đóng modal khi click bên ngoài
            document.getElementById('addProductModal').addEventListener('click', function(e) {
                if (e.target === this) {
                    this.style.display = 'none';
                }
            });

            // Xử lý thêm sản phẩm
            document.getElementById('submitProduct').addEventListener('click', function() {
                document.getElementById('addProductModal').style.display = 'none';
                showNotification('Thành công!', 'Sản phẩm đã được thêm thành công');
            });

            // Xử lý các nút thao tác
            document.querySelectorAll('.view-order, .edit-order, .delete-product, .view-product, .edit-product, .complete-order, .cancel-order').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    const action = this.classList[2]; // Lấy class thứ 3 để xác định hành động
                    handleAction(action, this);
                });
            });

            // Xử lý nút xem tất cả đơn hàng
            document.getElementById('viewAllOrders').addEventListener('click', function() {
                // Chuyển đến trang đơn hàng
                document.querySelectorAll('.menu-item').forEach(i => i.classList.remove('active'));
                document.querySelector('.menu-item[data-target="orders"]').classList.add('active');
                
                document.querySelectorAll('.content-section').forEach(section => {
                    section.classList.remove('active');
                });
                document.getElementById('orders').classList.add('active');
                
                document.querySelector('.header-left h1').textContent = 'Đơn Hàng';
            });

            // Xử lý tìm kiếm sản phẩm
            document.getElementById('productSearch').addEventListener('input', function() {
                filterProducts();
            });

            // Xử lý lọc danh mục
            document.getElementById('categoryFilter').addEventListener('change', function() {
                filterProducts();
            });

            // Xử lý lọc trạng thái
            document.getElementById('statusFilter').addEventListener('change', function() {
                filterProducts();
            });

            // Xử lý xuất báo cáo
            document.getElementById('exportReport').addEventListener('click', function() {
                showNotification('Thành công!', 'Báo cáo đã được xuất thành công');
            });

            // Xử lý lưu cài đặt
            document.getElementById('saveSettings').addEventListener('click', function() {
                showNotification('Thành công!', 'Cài đặt đã được lưu thành công');
            });
        }

        function handleTabChange(tab) {
            const tabGroup = tab.closest('.tabs');
            const tabGroupId = tabGroup.id;
            
            switch(tabGroupId) {
                case 'productTabs':
                    filterProductsByTab(tab.getAttribute('data-tab'));
                    break;
                case 'orderTabs':
                    filterOrdersByStatus(tab.getAttribute('data-status'));
                    break;
                case 'productManagementTabs':
                    filterProductsByCategory(tab.getAttribute('data-category'));
                    break;
                case 'customerTabs':
                    filterCustomersByType(tab.getAttribute('data-type'));
                    break;
                case 'promotionTabs':
                    filterPromotionsByStatus(tab.getAttribute('data-status'));
                    break;
                case 'settingsTabs':
                    showSettingsTab(tab.getAttribute('data-setting'));
                    break;
            }
        }

        function filterProductsByTab(tabType) {
            // Logic lọc sản phẩm theo tab
            console.log('Lọc sản phẩm theo:', tabType);
        }

        function filterOrdersByStatus(status) {
            // Logic lọc đơn hàng theo trạng thái
            console.log('Lọc đơn hàng theo trạng thái:', status);
        }

        function filterProductsByCategory(category) {
            // Logic lọc sản phẩm theo danh mục
            console.log('Lọc sản phẩm theo danh mục:', category);
        }

        function filterCustomersByType(type) {
            // Logic lọc khách hàng theo loại
            console.log('Lọc khách hàng theo loại:', type);
        }

        function filterPromotionsByStatus(status) {
            // Logic lọc khuyến mãi theo trạng thái
            console.log('Lọc khuyến mãi theo trạng thái:', status);
        }

        function showSettingsTab(setting) {
            // Logic hiển thị tab cài đặt
            console.log('Hiển thị cài đặt:', setting);
        }

        function filterProducts() {
            const searchTerm = document.getElementById('productSearch').value.toLowerCase();
            const category = document.getElementById('categoryFilter').value;
            const status = document.getElementById('statusFilter').value;
            
            // Logic lọc sản phẩm dựa trên các điều kiện
            console.log('Tìm kiếm:', searchTerm, 'Danh mục:', category, 'Trạng thái:', status);
        }

        function handleAction(action, element) {
            switch(action) {
                case 'view-order':
                    showNotification('Xem đơn hàng', 'Đang mở chi tiết đơn hàng');
                    break;
                case 'edit-order':
                    showNotification('Sửa đơn hàng', 'Đang mở form chỉnh sửa đơn hàng');
                    break;
                case 'delete-product':
                    if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
                        showNotification('Thành công!', 'Sản phẩm đã được xóa');
                    }
                    break;
                case 'view-product':
                    showNotification('Xem sản phẩm', 'Đang mở chi tiết sản phẩm');
                    break;
                case 'edit-product':
                    showNotification('Sửa sản phẩm', 'Đang mở form chỉnh sửa sản phẩm');
                    break;
                case 'complete-order':
                    showNotification('Thành công!', 'Đơn hàng đã được đánh dấu hoàn thành');
                    break;
                case 'cancel-order':
                    if (confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')) {
                        showNotification('Thành công!', 'Đơn hàng đã được hủy');
                    }
                    break;
            }
        }

        function showNotification(title, message) {
            const notification = document.getElementById('notification');
            const notificationTitle = document.getElementById('notificationTitle');
            const notificationMessage = document.getElementById('notificationMessage');
            
            notificationTitle.textContent = title;
            notificationMessage.textContent = message;
            
            notification.classList.add('show');
            
            setTimeout(() => {
                notification.classList.remove('show');
            }, 3000);
        }

        // Xử lý responsive sidebar
        window.addEventListener('resize', function() {
            if (window.innerWidth < 992) {
                document.querySelector('.sidebar').style.width = '70px';
                document.querySelector('.main-content').style.marginLeft = '70px';
            } else {
                document.querySelector('.sidebar').style.width = '260px';
                document.querySelector('.main-content').style.marginLeft = '260px';
            }
        });
    </script>
</body>
</html>