<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    // Check admin access
    model.User user = (model.User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/view/login_1.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Panel - Flower Store</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    
    <style>
        :root {
            --primary: #8b5cf6;
            --primary-dark: #7c3aed;
            --primary-light: #a78bfa;
            --secondary: #ec4899;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --info: #3b82f6;
            --dark: #1e293b;
            --light: #f8fafc;
            --gray-50: #f9fafb;
            --gray-100: #f3f4f6;
            --gray-200: #e5e7eb;
            --gray-300: #d1d5db;
            --gray-400: #9ca3af;
            --gray-500: #6b7280;
            --gray-600: #4b5563;
            --gray-700: #374151;
            --gray-800: #1f2937;
            --gray-900: #111827;
            --sidebar-width: 280px;
            --header-height: 70px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        /* SIDEBAR */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: var(--sidebar-width);
            height: 100vh;
            background: linear-gradient(180deg, #1e293b 0%, #0f172a 100%);
            color: white;
            padding: 2rem 0;
            box-shadow: 4px 0 24px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            overflow-y: auto;
            transition: all 0.3s ease;
        }

        .sidebar::-webkit-scrollbar {
            width: 6px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }

        .sidebar-brand {
            padding: 0 1.5rem 2rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 2rem;
        }

        .sidebar-brand h1 {
            font-size: 1.5rem;
            font-weight: 700;
            background: linear-gradient(135deg, #8b5cf6, #ec4899);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 0.25rem;
        }

        .sidebar-brand p {
            color: var(--gray-400);
            font-size: 0.875rem;
        }

        .sidebar-menu {
            list-style: none;
        }

        .menu-item {
            padding: 0.75rem 1.5rem;
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            gap: 1rem;
            color: rgba(255, 255, 255, 0.7);
            font-weight: 500;
            margin: 0.25rem 0.75rem;
            border-radius: 0.5rem;
        }

        .menu-item:hover {
            background: rgba(139, 92, 246, 0.2);
            color: white;
        }

        .menu-item.active {
            background: linear-gradient(135deg, #8b5cf6, #7c3aed);
            color: white;
            box-shadow: 0 4px 12px rgba(139, 92, 246, 0.4);
        }

        .menu-item i {
            width: 20px;
            text-align: center;
            font-size: 1.125rem;
        }

        /* MAIN CONTENT */
        .main-content {
            margin-left: var(--sidebar-width);
            min-height: 100vh;
            background: var(--gray-50);
        }

        .header {
            background: white;
            height: var(--header-height);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2rem;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-title h2 {
            font-size: 1.5rem;
            color: var(--dark);
            font-weight: 700;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-menu {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.5rem 1rem;
            background: var(--gray-100);
            border-radius: 0.5rem;
            cursor: pointer;
            transition: all 0.2s;
        }

        .user-menu:hover {
            background: var(--gray-200);
        }

        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: linear-gradient(135deg, #8b5cf6, #ec4899);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
        }

        .content-wrapper {
            padding: 2rem;
        }

        .content-section {
            display: none;
        }

        .content-section.active {
            display: block;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* CARDS */
        .card {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s;
        }

        .card:hover {
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
        }

        .card-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--gray-200);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-header h3 {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--dark);
        }

        .card-body {
            padding: 1.5rem;
        }

        /* STATS CARDS */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            border-radius: 1rem;
            padding: 1.5rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
            border-left: 4px solid var(--primary);
        }

        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
        }

        .stat-card.success {
            border-left-color: var(--success);
        }

        .stat-card.warning {
            border-left-color: var(--warning);
        }

        .stat-card.danger {
            border-left-color: var(--danger);
        }

        .stat-card.info {
            border-left-color: var(--info);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .stat-icon.primary {
            background: linear-gradient(135deg, #8b5cf6, #a78bfa);
            color: white;
        }

        .stat-icon.success {
            background: linear-gradient(135deg, #10b981, #34d399);
            color: white;
        }

        .stat-icon.warning {
            background: linear-gradient(135deg, #f59e0b, #fbbf24);
            color: white;
        }

        .stat-icon.danger {
            background: linear-gradient(135deg, #ef4444, #f87171);
            color: white;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 0.25rem;
        }

        .stat-label {
            color: var(--gray-600);
            font-size: 0.875rem;
            font-weight: 500;
        }

        /* BUTTONS */
        .btn {
            padding: 0.625rem 1.25rem;
            border: none;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #8b5cf6, #7c3aed);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(139, 92, 246, 0.3);
        }

        .btn-success {
            background: var(--success);
            color: white;
        }

        .btn-warning {
            background: var(--warning);
            color: white;
        }

        .btn-danger {
            background: var(--danger);
            color: white;
        }

        .btn-secondary {
            background: var(--gray-200);
            color: var(--gray-700);
        }

        .btn-sm {
            padding: 0.375rem 0.75rem;
            font-size: 0.8125rem;
        }

        /* TABLE */
        .table-container {
            overflow-x: auto;
            margin-top: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: var(--gray-50);
        }

        th {
            padding: 1rem;
            text-align: left;
            font-weight: 600;
            color: var(--gray-700);
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        td {
            padding: 1rem;
            border-bottom: 1px solid var(--gray-200);
            color: var(--gray-900);
        }

        tbody tr {
            transition: all 0.2s;
        }

        tbody tr:hover {
            background: var(--gray-50);
        }

        /* FORM */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--gray-700);
            font-size: 0.875rem;
        }

        .form-input, .form-select, .form-textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--gray-300);
            border-radius: 0.5rem;
            font-size: 0.875rem;
            transition: all 0.2s;
        }

        .form-input:focus, .form-select:focus, .form-textarea:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.1);
        }

        .form-textarea {
            resize: vertical;
            min-height: 100px;
        }

        /* MODAL */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 2000;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(4px);
        }

        .modal.active {
            display: flex;
            animation: modalFadeIn 0.3s ease;
        }

        @keyframes modalFadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .modal-content {
            background: white;
            border-radius: 1rem;
            max-width: 600px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            animation: modalSlideUp 0.3s ease;
        }

        @keyframes modalSlideUp {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .modal-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--gray-200);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--dark);
        }

        .modal-close {
            width: 32px;
            height: 32px;
            border-radius: 0.375rem;
            border: none;
            background: var(--gray-100);
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
        }

        .modal-close:hover {
            background: var(--gray-200);
        }

        .modal-body {
            padding: 1.5rem;
        }

        .modal-footer {
            padding: 1.5rem;
            border-top: 1px solid var(--gray-200);
            display: flex;
            justify-content: flex-end;
            gap: 0.75rem;
        }

        /* BADGES */
        .badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
            display: inline-block;
        }

        .badge-success {
            background: #d1fae5;
            color: #065f46;
        }

        .badge-warning {
            background: #fef3c7;
            color: #92400e;
        }

        .badge-danger {
            background: #fee2e2;
            color: #991b1b;
        }

        .badge-info {
            background: #dbeafe;
            color: #1e40af;
        }

        .badge-secondary {
            background: var(--gray-200);
            color: var(--gray-700);
        }

        /* FILTERS */
        .filters {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        /* PAGINATION */
        .pagination {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 2rem;
        }

        .pagination button {
            padding: 0.5rem 1rem;
            border: 1px solid var(--gray-300);
            background: white;
            border-radius: 0.375rem;
            cursor: pointer;
            transition: all 0.2s;
        }

        .pagination button:hover:not(:disabled) {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        .pagination button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .pagination button.active {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        /* ALERTS */
        .alert {
            padding: 1rem 1.5rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .alert-success {
            background: #d1fae5;
            color: #065f46;
            border-left: 4px solid #10b981;
        }

        .alert-warning {
            background: #fef3c7;
            color: #92400e;
            border-left: 4px solid #f59e0b;
        }

        .alert-danger {
            background: #fee2e2;
            color: #991b1b;
            border-left: 4px solid #ef4444;
        }

        .alert-info {
            background: #dbeafe;
            color: #1e40af;
            border-left: 4px solid #3b82f6;
        }

        /* IMAGE PREVIEW */
        .image-preview {
            width: 100%;
            height: 200px;
            border: 2px dashed var(--gray-300);
            border-radius: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 0.5rem;
            overflow: hidden;
            background: var(--gray-50);
        }

        .image-preview img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .image-preview.empty {
            color: var(--gray-400);
        }

        /* LOADING */
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: white;
            animation: spin 0.8s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* TOAST NOTIFICATION */
        .toast {
            position: fixed;
            top: 100px;
            right: 2rem;
            background: white;
            padding: 1rem 1.5rem;
            border-radius: 0.5rem;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            z-index: 3000;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            min-width: 300px;
            animation: slideInRight 0.3s ease;
        }

        @keyframes slideInRight {
            from {
                transform: translateX(400px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.mobile-open {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .filters {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="sidebar-brand">
        <h1><i class="fas fa-flower"></i> Flower Store</h1>
        <p>Admin Panel</p>
    </div>

    <ul class="sidebar-menu">
        <li class="menu-item active" data-target="dashboard">
            <i class="fas fa-chart-line"></i>
            <span>Dashboard</span>
        </li>
        <li class="menu-item" data-target="orders">
            <i class="fas fa-shopping-cart"></i>
            <span>Đơn Hàng</span>
        </li>
        <li class="menu-item" data-target="products">
            <i class="fas fa-box"></i>
            <span>Sản Phẩm</span>
        </li>
        <li class="menu-item" data-target="categories">
            <i class="fas fa-th-large"></i>
            <span>Danh Mục</span>
        </li>
        <li class="menu-item" data-target="customers">
            <i class="fas fa-users"></i>
            <span>Khách Hàng</span>
        </li>
        <li class="menu-item" data-target="coupons">
            <i class="fas fa-ticket-alt"></i>
            <span>Mã Giảm Giá</span>
        </li>
        <li class="menu-item" data-target="contacts">
            <i class="fas fa-envelope"></i>
            <span>Liên Hệ</span>
        </li>
        <li class="menu-item" data-target="settings">
            <i class="fas fa-cog"></i>
            <span>Cài Đặt</span>
        </li>
    </ul>
</div>

<!-- MAIN CONTENT -->
<div class="main-content">
    <!-- HEADER -->
    <div class="header">
        <div class="header-title">
            <h2 id="pageTitle">Dashboard</h2>
        </div>
        <div class="header-actions">
            <div class="user-menu">
                <div class="user-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div>
                    <div style="font-weight: 600; font-size: 0.875rem;">Admin</div>
                    <div style="font-size: 0.75rem; color: var(--gray-500);"><%=user.getEmail()%></div>
                </div>
            </div>
            <a href="<%= request.getContextPath() %>/logout" class="btn btn-secondary btn-sm">
                <i class="fas fa-sign-out-alt"></i> Đăng Xuất
            </a>
        </div>
    </div>

    <!-- CONTENT WRAPPER -->
    <div class="content-wrapper">
        
        <!-- DASHBOARD SECTION -->
        <div id="dashboard" class="content-section active">
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-header">
                        <div>
                            <div class="stat-value" id="statTotalOrders">0</div>
                            <div class="stat-label">Tổng Đơn Hàng</div>
                        </div>
                        <div class="stat-icon primary">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                    </div>
                </div>

                <div class="stat-card success">
                    <div class="stat-header">
                        <div>
                            <div class="stat-value" id="statTotalRevenue">0đ</div>
                            <div class="stat-label">Tổng Doanh Thu</div>
                        </div>
                        <div class="stat-icon success">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                    </div>
                </div>

                <div class="stat-card warning">
                    <div class="stat-header">
                        <div>
                            <div class="stat-value" id="statTotalUsers">0</div>
                            <div class="stat-label">Khách Hàng</div>
                        </div>
                        <div class="stat-icon warning">
                            <i class="fas fa-users"></i>
                        </div>
                    </div>
                </div>

                <div class="stat-card danger">
                    <div class="stat-header">
                        <div>
                            <div class="stat-value" id="statTotalProducts">0</div>
                            <div class="stat-label">Sản Phẩm</div>
                        </div>
                        <div class="stat-icon danger">
                            <i class="fas fa-box"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 1.5rem; margin-top: 2rem;">
                <div class="card">
                    <div class="card-header">
                        <h3>Biểu Đồ Doanh Thu</h3>
                    </div>
                    <div class="card-body">
                        <canvas id="revenueChart" height="100"></canvas>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3>Đơn Hàng Gần Đây</h3>
                    </div>
                    <div class="card-body">
                        <div id="recentOrdersList"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ORDERS SECTION -->
        <div id="orders" class="content-section">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                <div>
                    <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem;">Quản Lý Đơn Hàng</h3>
                    <p style="color: var(--gray-600);">Xem và quản lý tất cả đơn hàng</p>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="filters">
                        <div class="form-group" style="margin-bottom: 0;">
                            <input type="text" id="orderSearch" class="form-input" placeholder="Tìm kiếm đơn hàng...">
                        </div>
                        <div class="form-group" style="margin-bottom: 0;">
                            <select id="orderStatusFilter" class="form-select">
                                <option value="">Tất cả trạng thái</option>
                                <option value="pending">Chờ xác nhận</option>
                                <option value="confirmed">Đã xác nhận</option>
                                <option value="shipping">Đang giao</option>
                                <option value="delivered">Đã giao</option>
                                <option value="cancelled">Đã hủy</option>
                            </select>
                        </div>
                    </div>

                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã Đơn</th>
                                    <th>Khách Hàng</th>
                                    <th>Tổng Tiền</th>
                                    <th>Trạng Thái</th>
                                    <th>Thanh Toán</th>
                                    <th>Ngày Đặt</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody id="ordersTableBody">
                                <tr>
                                    <td colspan="7" style="text-align: center; padding: 3rem;">
                                        <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: var(--primary);"></i>
                                        <p style="margin-top: 1rem; color: var(--gray-500);">Đang tải dữ liệu...</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- PRODUCTS SECTION -->
        <div id="products" class="content-section">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                <div>
                    <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem;">Quản Lý Sản Phẩm</h3>
                    <p style="color: var(--gray-600);">Thêm, sửa, xóa sản phẩm</p>
                </div>
                <button class="btn btn-primary" onclick="openProductModal()">
                    <i class="fas fa-plus"></i> Thêm Sản Phẩm
                </button>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="filters">
                        <div class="form-group" style="margin-bottom: 0;">
                            <input type="text" id="productSearch" class="form-input" placeholder="Tìm kiếm sản phẩm...">
                        </div>
                        <div class="form-group" style="margin-bottom: 0;">
                            <select id="productCategoryFilter" class="form-select">
                                <option value="">Tất cả danh mục</option>
                            </select>
                        </div>
                    </div>

                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Hình Ảnh</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Danh Mục</th>
                                    <th>Giá</th>
                                    <th>Tồn Kho</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody id="productsTableBody">
                                <tr>
                                    <td colspan="7" style="text-align: center; padding: 3rem;">
                                        <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: var(--primary);"></i>
                                        <p style="margin-top: 1rem; color: var(--gray-500);">Đang tải dữ liệu...</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- CATEGORIES SECTION -->
        <div id="categories" class="content-section">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                <div>
                    <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem;">Quản Lý Danh Mục</h3>
                    <p style="color: var(--gray-600);">Quản lý danh mục sản phẩm</p>
                </div>
                <button class="btn btn-primary" onclick="openCategoryModal()">
                    <i class="fas fa-plus"></i> Thêm Danh Mục
                </button>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên Danh Mục</th>
                                    <th>Slug</th>
                                    <th>Danh Mục Cha</th>
                                    <th>Thứ Tự</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody id="categoriesTableBody">
                                <tr>
                                    <td colspan="7" style="text-align: center; padding: 3rem;">
                                        <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: var(--primary);"></i>
                                        <p style="margin-top: 1rem; color: var(--gray-500);">Đang tải dữ liệu...</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- CUSTOMERS SECTION -->
        <div id="customers" class="content-section">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                <div>
                    <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem;">Quản Lý Khách Hàng</h3>
                    <p style="color: var(--gray-600);">Xem danh sách khách hàng</p>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Email</th>
                                    <th>Họ Tên</th>
                                    <th>Số Điện Thoại</th>
                                    <th>Trạng Thái</th>
                                    <th>Ngày Đăng Ký</th>
                                </tr>
                            </thead>
                            <tbody id="customersTableBody">
                                <tr>
                                    <td colspan="6" style="text-align: center; padding: 3rem;">
                                        <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: var(--primary);"></i>
                                        <p style="margin-top: 1rem; color: var(--gray-500);">Đang tải dữ liệu...</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- COUPONS SECTION -->
        <div id="coupons" class="content-section">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                <div>
                    <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem;">Quản Lý Mã Giảm Giá</h3>
                    <p style="color: var(--gray-600);">Tạo và quản lý mã giảm giá</p>
                </div>
                <button class="btn btn-primary" onclick="openCouponModal()">
                    <i class="fas fa-plus"></i> Thêm Mã Giảm Giá
                </button>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã</th>
                                    <th>Giảm Giá</th>
                                    <th>Ngày Bắt Đầu</th>
                                    <th>Ngày Kết Thúc</th>
                                    <th>Số Lượng</th>
                                    <th>Đã Sử Dụng</th>
                                    <th>Trạng Thái</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody id="couponsTableBody">
                                <tr>
                                    <td colspan="8" style="text-align: center; padding: 3rem;">
                                        <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: var(--primary);"></i>
                                        <p style="margin-top: 1rem; color: var(--gray-500);">Đang tải dữ liệu...</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- CONTACTS SECTION -->
        <div id="contacts" class="content-section">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                <div>
                    <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem;">Quản Lý Liên Hệ</h3>
                    <p style="color: var(--gray-600);">Xem tin nhắn từ khách hàng</p>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Tiêu Đề</th>
                                    <th>Trạng Thái</th>
                                    <th>Ngày Gửi</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody id="contactsTableBody">
                                <tr>
                                    <td colspan="7" style="text-align: center; padding: 3rem;">
                                        <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: var(--primary);"></i>
                                        <p style="margin-top: 1rem; color: var(--gray-500);">Đang tải dữ liệu...</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- SETTINGS SECTION -->
        <div id="settings" class="content-section">
            <div style="margin-bottom: 2rem;">
                <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem;">Cài Đặt Hệ Thống</h3>
                <p style="color: var(--gray-600);">Cấu hình hệ thống</p>
            </div>

            <div class="card">
                <div class="card-header">
                    <h3>Thông Tin Website</h3>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label class="form-label">Tên Website</label>
                        <input type="text" class="form-input" value="Flower Store" placeholder="Nhập tên website">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Email Liên Hệ</label>
                        <input type="email" class="form-input" value="contact@flowerstore.com" placeholder="Nhập email">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Số Điện Thoại</label>
                        <input type="text" class="form-input" value="0123456789" placeholder="Nhập số điện thoại">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Địa Chỉ</label>
                        <input type="text" class="form-input" value="123 Street, Ho Chi Minh City" placeholder="Nhập địa chỉ">
                    </div>
                    <button class="btn btn-primary">
                        <i class="fas fa-save"></i> Lưu Thay Đổi
                    </button>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- PRODUCT MODAL -->
<div id="productModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 id="productModalTitle">Thêm Sản Phẩm Mới</h3>
            <button class="modal-close" onclick="closeModal('productModal')">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body">
            <form id="productForm">
                <input type="hidden" id="productId">
                
                <div class="form-group">
                    <label class="form-label">Tên Sản Phẩm *</label>
                    <input type="text" id="productName" class="form-input" required placeholder="Nhập tên sản phẩm">
                </div>

                <div class="form-group">
                    <label class="form-label">Danh Mục *</label>
                    <select id="productCategory" class="form-select" required>
                        <option value="">Chọn danh mục</option>
                    </select>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                    <div class="form-group">
                        <label class="form-label">Giá *</label>
                        <input type="number" id="productPrice" class="form-input" required placeholder="0">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Số Lượng *</label>
                        <input type="number" id="productStock" class="form-input" required placeholder="0">
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Mô Tả</label>
                    <textarea id="productDescription" class="form-textarea" placeholder="Nhập mô tả sản phẩm"></textarea>
                </div>

                <div class="form-group">
                    <label class="form-label">URL Hình Ảnh</label>
                    <input type="text" id="productImage" class="form-input" placeholder="https://...">
                </div>

                <div class="form-group">
                    <label class="form-label">Trạng Thái</label>
                    <select id="productActive" class="form-select">
                        <option value="true">Hoạt động</option>
                        <option value="false">Ẩn</option>
                    </select>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="closeModal('productModal')">Hủy</button>
            <button type="button" class="btn btn-primary" onclick="saveProduct()">
                <i class="fas fa-save"></i> Lưu
            </button>
        </div>
    </div>
</div>

<!-- CATEGORY MODAL -->
<div id="categoryModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 id="categoryModalTitle">Thêm Danh Mục Mới</h3>
            <button class="modal-close" onclick="closeModal('categoryModal')">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body">
            <form id="categoryForm">
                <input type="hidden" id="categoryId">
                
                <div class="form-group">
                    <label class="form-label">Tên Danh Mục *</label>
                    <input type="text" id="categoryName" class="form-input" required placeholder="Nhập tên danh mục">
                </div>

                <div class="form-group">
                    <label class="form-label">Danh Mục Cha</label>
                    <select id="categoryParent" class="form-select">
                        <option value="">Không có</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">Thứ Tự Hiển Thị</label>
                    <input type="number" id="categoryOrder" class="form-input" value="0" placeholder="0">
                </div>

                <div class="form-group">
                    <label class="form-label">Mô Tả</label>
                    <textarea id="categoryDescription" class="form-textarea" placeholder="Nhập mô tả"></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="closeModal('categoryModal')">Hủy</button>
            <button type="button" class="btn btn-primary" onclick="saveCategory()">
                <i class="fas fa-save"></i> Lưu
            </button>
        </div>
    </div>
</div>

<!-- COUPON MODAL -->
<div id="couponModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 id="couponModalTitle">Thêm Mã Giảm Giá</h3>
            <button class="modal-close" onclick="closeModal('couponModal')">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body">
            <form id="couponForm">
                <input type="hidden" id="couponId">
                
                <div class="form-group">
                    <label class="form-label">Mã Giảm Giá *</label>
                    <input type="text" id="couponCode" class="form-input" required placeholder="VD: SUMMER2024">
                </div>

                <div class="form-group">
                    <label class="form-label">Loại Giảm Giá *</label>
                    <select id="couponType" class="form-select" required>
                        <option value="percentage">Phần Trăm (%)</option>
                        <option value="fixed">Số Tiền Cố Định (VNĐ)</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">Giá Trị Giảm *</label>
                    <input type="number" id="couponValue" class="form-input" required placeholder="0">
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                    <div class="form-group">
                        <label class="form-label">Ngày Bắt Đầu *</label>
                        <input type="date" id="couponStartDate" class="form-input" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Ngày Kết Thúc *</label>
                        <input type="date" id="couponEndDate" class="form-input" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Số Lượng *</label>
                    <input type="number" id="couponQuantity" class="form-input" required placeholder="0">
                </div>

                <div class="form-group">
                    <label class="form-label">Giá Trị Đơn Hàng Tối Thiểu</label>
                    <input type="number" id="couponMinOrder" class="form-input" placeholder="0">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="closeModal('couponModal')">Hủy</button>
            <button type="button" class="btn btn-primary" onclick="saveCoupon()">
                <i class="fas fa-save"></i> Lưu
            </button>
        </div>
    </div>
</div>

<!-- ORDER DETAIL MODAL -->
<div id="orderDetailModal" class="modal">
    <div class="modal-content" style="max-width: 800px;">
        <div class="modal-header">
            <h3>Chi Tiết Đơn Hàng</h3>
            <button class="modal-close" onclick="closeModal('orderDetailModal')">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body" id="orderDetailContent">
            <!-- Content will be loaded dynamically -->
        </div>
    </div>
</div>

<script>
const contextPath = "${pageContext.request.contextPath}";

// Global data
let allProducts = [];
let allCategories = [];
let allOrders = [];
let allCoupons = [];

// Initialize
document.addEventListener("DOMContentLoaded", function() {
    initMenuItems();
    loadDashboard();
});

// Menu Navigation
function initMenuItems() {
    document.querySelectorAll(".menu-item[data-target]").forEach(item => {
        item.addEventListener("click", function() {
            const target = this.getAttribute("data-target");
            showSection(target);
            
            // Update active menu
            document.querySelectorAll(".menu-item").forEach(m => m.classList.remove("active"));
            this.classList.add("active");
            
            // Update page title
            const titles = {
                dashboard: "Dashboard",
                orders: "Quản Lý Đơn Hàng",
                products: "Quản Lý Sản Phẩm",
                categories: "Quản Lý Danh Mục",
                customers: "Quản Lý Khách Hàng",
                coupons: "Quản Lý Mã Giảm Giá",
                contacts: "Quản Lý Liên Hệ",
                settings: "Cài Đặt Hệ Thống"
            };
            document.getElementById("pageTitle").textContent = titles[target] || "";
        });
    });
}

function showSection(sectionId) {
    // Hide all sections
    document.querySelectorAll(".content-section").forEach(section => {
        section.classList.remove("active");
    });
    
    // Show target section
    const section = document.getElementById(sectionId);
    if (section) {
        section.classList.add("active");
        
        // Load data for specific sections
        if (sectionId === "orders") loadOrders();
        else if (sectionId === "products") loadProducts();
        else if (sectionId === "categories") loadCategories();
        else if (sectionId === "customers") loadCustomers();
        else if (sectionId === "coupons") loadCoupons();
        else if (sectionId === "contacts") loadContacts();
    }
}

// Format helpers
function formatCurrency(amount) {
    return new Intl.NumberFormat("vi-VN", {
        style: "currency",
        currency: "VND"
    }).format(amount);
}

function formatNumber(num) {
    return new Intl.NumberFormat("vi-VN").format(num);
}

function formatDate(dateString) {
    return new Date(dateString).toLocaleDateString("vi-VN");
}

function formatDateTime(dateString) {
    return new Date(dateString).toLocaleString("vi-VN");
}

// Modal helpers
function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.classList.add("active");
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.classList.remove("active");
}

// Toast notification
function showToast(message, type = 'success') {
    const toast = document.createElement('div');
    toast.className = 'toast';
    toast.innerHTML = `
        <i class="fas fa-${type === 'success' ? 'check-circle' : 'exclamation-circle'}" 
           style="color: var(--${type === 'success' ? 'success' : 'danger'}); font-size: 1.5rem;"></i>
        <div>
            <div style="font-weight: 600;">${type === 'success' ? 'Thành công' : 'Lỗi'}</div>
            <div style="font-size: 0.875rem; color: var(--gray-600);">${message}</div>
        </div>
    `;
    document.body.appendChild(toast);
    
    setTimeout(() => {
        toast.remove();
    }, 3000);
}

// Format helpers
function formatCurrency(value) {
    if (!value) return '0 ₫';
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(value).replace('₫', '₫');
}

function formatNumber(value) {
    if (!value) return '0';
    return new Intl.NumberFormat('vi-VN').format(value);
}

function formatDate(dateString) {
    if (!dateString) return 'N/A';
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN');
}

function formatDateTime(dateString) {
    if (!dateString) return 'N/A';
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN') + ' ' + date.toLocaleTimeString('vi-VN');
}
</script>

<!-- Admin Functions -->
<script src="${pageContext.request.contextPath}/fileJS/admin-functions.js" data-context="${pageContext.request.contextPath}"></script>

</body>
</html>
