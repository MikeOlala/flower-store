<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cài đặt tài khoản - Tiệm Hoa nhà tớ</title>
    <link rel="shortcut icon" href="//cdn.hstatic.net/themes/200000846175/1001403720/14/favicon.png?v=245" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;0,700;1,400&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- CSS for header/footer from main site -->
    <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/plugin-style.css?v=245" rel="stylesheet" type="text/css">
    <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/styles-new.scss.css?v=245" rel="stylesheet" type="text/css">
    
    <style>
        :root {
            /* Header/Footer variables */
            --bgfooter: #ffffff;
            --colorfooter: #000000;
            --height-head: 72px;
            --bgshop: #000000;
            --colorshop: #000000;
            --colorshophover: #212020;
            --colorbgmenumb: #ffffff;
            --colortextmenumb: #000000;
            
            /* Page variables */
            --primary: #c99366;
            --primary-dark: #aa6a3f;
            --primary-light: #e8d5c4;
            --brown-main: #3c2922;
            --brown-soft: #6c5845;
            --bg-light: #faf5ef;
            --bg-cream: #fff9f5;
            --white: #ffffff;
            --border-color: #e8ddd4;
            --text-muted: #8b7d72;
            --success: #27ae60;
            --error: #e74c3c;
            --warning: #f39c12;
            --info: #3498db;
            --shadow-sm: 0 2px 8px rgba(60,41,34,0.06);
            --shadow-md: 0 8px 24px rgba(60,41,34,0.1);
            --shadow-lg: 0 16px 48px rgba(60,41,34,0.15);
            --radius-sm: 8px;
            --radius-md: 16px;
            --radius-lg: 24px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        /* Fix: Prevent site-overlay from blocking clicks */
        #site-overlay {
            pointer-events: none !important;
            display: none !important;
        }
        
        /* Force Font Awesome icons to display correctly */
        .main-container i.fas,
        .main-container i.far,
        .main-container i.fab,
        .modal-overlay i.fas,
        .modal-overlay i.far,
        .toast-container i.fas {
            font-family: "Font Awesome 6 Free" !important;
            font-weight: 900 !important;
            font-style: normal !important;
            display: inline-block !important;
        }
        
        .main-container i.far {
            font-weight: 400 !important;
        }
        
        body {
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, var(--bg-light) 0%, var(--bg-cream) 100%);
            color: var(--brown-main);
            line-height: 1.6;
            min-height: 100vh;
        }
        
        /* Breadcrumb */
        .breadcrumb {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
        
        .breadcrumb a {
            color: rgba(255,255,255,0.7);
            text-decoration: none;
            transition: var(--transition);
        }
        
        .breadcrumb a:hover {
            color: white;
        }
        
        .breadcrumb span {
            color: white;
        }
        
        .breadcrumb i {
            font-size: 0.7rem;
            color: rgba(255,255,255,0.5);
        }
        
        /* Main Container */
        .main-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
            margin-top: -2rem;
            position: relative;
            z-index: 10;
            pointer-events: auto;
        }
        
        /* Profile Layout */
        .profile-grid {
            display: grid;
            grid-template-columns: 300px 1fr;
            gap: 2rem;
            pointer-events: auto;
        }
        
        /* Content Card - ensure clickable */
        .content-card,
        .info-card,
        .bio-section,
        .password-card {
            pointer-events: auto !important;
        }
        
        /* Sidebar */
        .sidebar {
            background: var(--white);
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            box-shadow: var(--shadow-md);
            height: fit-content;
            position: sticky;
            top: 100px;
        }
        
        .sidebar-user {
            text-align: center;
            padding-bottom: 1.5rem;
            margin-bottom: 1.5rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        .sidebar-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--primary-light);
            margin-bottom: 1rem;
        }
        
        .sidebar-name {
            font-family: 'Crimson Text', serif;
            font-size: 1.2rem;
            color: var(--brown-main);
            font-weight: 600;
        }
        
        .sidebar-email {
            font-size: 0.85rem;
            color: var(--text-muted);
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .sidebar-menu li {
            margin-bottom: 0.25rem;
        }
        
        .sidebar-menu a {
            display: flex;
            align-items: center;
            gap: 0.875rem;
            padding: 1rem 1.25rem;
            color: var(--brown-soft);
            text-decoration: none;
            border-radius: var(--radius-md);
            transition: var(--transition);
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }
        
        .sidebar-menu a::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 0;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: var(--radius-md);
            transition: var(--transition);
            z-index: -1;
        }
        
        .sidebar-menu a:hover {
            color: var(--primary-dark);
            background: var(--primary-light);
        }
        
        .sidebar-menu a.active {
            color: white;
            background: transparent;
        }
        
        .sidebar-menu a.active::before {
            width: 100%;
        }
        
        .sidebar-menu i {
            width: 22px;
            text-align: center;
            font-size: 1.1rem;
        }
        
        .menu-badge {
            margin-left: auto;
            background: var(--primary);
            color: white;
            font-size: 0.7rem;
            padding: 0.2rem 0.5rem;
            border-radius: 10px;
            font-weight: 600;
        }
        
        /* Content Card */
        .content-card {
            background: var(--white);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            overflow: hidden;
        }
        
        /* Profile Header */
        .profile-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            padding: 2.5rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .profile-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            border-radius: 50%;
        }
        
        .avatar-container {
            position: relative;
            display: inline-block;
            z-index: 1;
        }
        
        .avatar {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            border: 5px solid white;
            object-fit: cover;
            background: var(--bg-light);
            box-shadow: var(--shadow-md);
        }
        
        .avatar-edit {
            position: absolute;
            bottom: 8px;
            right: 8px;
            width: 38px;
            height: 38px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: var(--shadow-md);
            border: none;
            color: var(--primary);
            transition: var(--transition);
            font-size: 1rem;
        }
        
        .avatar-edit:hover {
            transform: scale(1.1);
            color: var(--primary-dark);
            background: var(--primary-light);
        }
        
        .profile-name {
            color: white;
            font-family: 'Crimson Text', serif;
            font-size: 1.75rem;
            margin-top: 1.25rem;
            position: relative;
            z-index: 1;
        }
        
        .profile-email {
            color: rgba(255,255,255,0.9);
            font-size: 0.95rem;
            margin-top: 0.25rem;
            position: relative;
            z-index: 1;
        }
        
        /* Profile Body */
        .profile-body {
            padding: 2rem;
        }
        
        .section-title {
            font-family: 'Crimson Text', serif;
            font-size: 1.4rem;
            color: var(--brown-main);
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--primary-light);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .section-title i {
            color: var(--primary);
            font-size: 1.2rem;
        }
        
        /* Info Grid */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.25rem;
        }
        
        .info-card {
            background: var(--bg-cream);
            border-radius: var(--radius-md);
            padding: 1.25rem;
            transition: var(--transition);
            border: 1px solid transparent;
        }
        
        .info-card:hover {
            border-color: var(--primary-light);
            box-shadow: var(--shadow-sm);
        }
        
        .info-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 0.75rem;
        }
        
        .info-card-label {
            font-size: 0.85rem;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .info-card-label i {
            color: var(--primary);
        }
        
        .info-card-value {
            font-size: 1.05rem;
            color: var(--brown-main);
            font-weight: 500;
        }
        
        .info-card-value.placeholder {
            color: var(--text-muted);
            font-style: italic;
            font-weight: 400;
        }
        
        .btn-edit-sm {
            background: transparent !important;
            border: none !important;
            color: var(--primary) !important;
            cursor: pointer !important;
            padding: 0.4rem !important;
            border-radius: 50% !important;
            transition: var(--transition) !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            pointer-events: auto !important;
            position: relative !important;
            z-index: 10 !important;
        }
        
        .btn-edit-sm:hover {
            background: var(--primary-light) !important;
            color: var(--primary-dark) !important;
        }
        
        /* Avatar edit button */
        .avatar-edit {
            pointer-events: auto !important;
            cursor: pointer !important;
            z-index: 10 !important;
        }
        
        /* Bio Section */
        .bio-section {
            margin-top: 1.5rem;
            padding: 1.5rem;
            background: linear-gradient(135deg, var(--bg-cream) 0%, var(--primary-light) 100%);
            border-radius: var(--radius-md);
            border: 1px solid var(--primary-light);
        }
        
        .bio-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }
        
        .bio-title {
            font-weight: 600;
            color: var(--brown-soft);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .bio-title i {
            color: var(--primary);
        }
        
        .bio-content {
            color: var(--brown-main);
            font-style: italic;
            line-height: 1.7;
        }
        
        .bio-content.placeholder {
            color: var(--text-muted);
        }
        
        /* Info Row (for email locked) */
        .info-row-locked {
            grid-column: span 2;
            background: var(--bg-light);
            border-radius: var(--radius-md);
            padding: 1rem 1.25rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .locked-badge {
            background: var(--text-muted);
            color: white;
            font-size: 0.75rem;
            padding: 0.3rem 0.75rem;
            border-radius: 20px;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }
        
        /* Modal - High z-index to avoid conflicts with external CSS */
        #modalOverlay {
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;
            bottom: 0 !important;
            background: rgba(60,41,34,0.6) !important;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            display: none !important;
            align-items: center !important;
            justify-content: center !important;
            z-index: 99999 !important;
        }
        
        #modalOverlay.active {
            display: flex !important;
            opacity: 1 !important;
            visibility: visible !important;
        }
        
        #editModal {
            background: white !important;
            border-radius: var(--radius-lg) !important;
            width: 90% !important;
            max-width: 480px !important;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25) !important;
            position: relative !important;
            z-index: 100000 !important;
            display: block !important;
            visibility: visible !important;
            opacity: 1 !important;
            overflow: visible !important;
        }
        
        #modalOverlay.active #editModal {
            transform: translateY(0) scale(1) !important;
            display: block !important;
        }
        
        #editModal .modal-header {
            padding: 1.5rem 1.75rem !important;
            border-bottom: 1px solid var(--border-color) !important;
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
            background: var(--bg-cream) !important;
            border-radius: var(--radius-lg) var(--radius-lg) 0 0 !important;
            visibility: visible !important;
            opacity: 1 !important;
        }
        
        #editModal .modal-title,
        #modalTitle {
            font-family: 'Crimson Text', serif !important;
            font-size: 1.35rem !important;
            color: var(--brown-main) !important;
            display: flex !important;
            align-items: center !important;
            gap: 0.5rem !important;
            visibility: visible !important;
            opacity: 1 !important;
            margin: 0 !important;
        }
        
        #editModal .modal-title i {
            color: var(--primary) !important;
        }
        
        #editModal .modal-close {
            background: none !important;
            border: none !important;
            font-size: 1.25rem !important;
            color: var(--text-muted) !important;
            cursor: pointer !important;
            transition: var(--transition) !important;
            width: 36px !important;
            height: 36px !important;
            border-radius: 50% !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            visibility: visible !important;
            opacity: 1 !important;
        }
        
        #editModal .modal-close:hover {
            background: var(--error) !important;
            color: white !important;
        }
        
        #editModal .modal-body,
        #modalBody {
            padding: 1.75rem !important;
            display: block !important;
            visibility: visible !important;
            opacity: 1 !important;
            min-height: 100px !important;
            overflow: visible !important;
            background: white !important;
        }
        
        #editModal .modal-body .form-group,
        #modalBody .form-group {
            display: block !important;
            visibility: visible !important;
            opacity: 1 !important;
            margin-bottom: 1.25rem !important;
        }
        
        #editModal .modal-body .form-label,
        #modalBody .form-label {
            display: block !important;
            visibility: visible !important;
            opacity: 1 !important;
            font-weight: 500 !important;
            color: var(--brown-soft) !important;
            margin-bottom: 0.6rem !important;
            font-size: 0.9rem !important;
        }
        
        .form-group {
            margin-bottom: 1.25rem;
        }
        
        .form-label {
            display: block;
            font-weight: 500;
            color: var(--brown-soft);
            margin-bottom: 0.6rem;
            font-size: 0.9rem;
        }
        
        #modalBody .form-control,
        #modalBody input[type="text"],
        #modalBody input[type="tel"],
        #modalBody input[type="date"],
        #modalBody input[type="url"],
        #modalBody textarea,
        #modalBody select,
        .password-card .form-control {
            width: 100% !important;
            padding: 0.875rem 1.25rem !important;
            border: 2px solid var(--border-color) !important;
            border-radius: var(--radius-md) !important;
            font-family: inherit !important;
            font-size: 1rem !important;
            color: var(--brown-main) !important;
            transition: var(--transition) !important;
            background: var(--bg-cream) !important;
            display: block !important;
            visibility: visible !important;
            opacity: 1 !important;
            box-sizing: border-box !important;
        }
        
        #modalBody .form-control:focus,
        #modalBody input:focus,
        #modalBody textarea:focus,
        #modalBody select:focus,
        .password-card .form-control:focus {
            outline: none !important;
            border-color: var(--primary) !important;
            background: white !important;
            box-shadow: 0 0 0 4px rgba(201,147,102,0.15) !important;
        }
        
        #modalBody textarea.form-control,
        #modalBody textarea {
            resize: vertical !important;
            min-height: 120px !important;
        }
        
        #modalBody .form-select,
        #modalBody select,
        .form-select {
            width: 100% !important;
            padding: 0.875rem 1.25rem !important;
            border: 2px solid var(--border-color) !important;
            border-radius: var(--radius-md) !important;
            font-family: inherit !important;
            font-size: 1rem !important;
            color: var(--brown-main) !important;
            background: var(--bg-cream) !important;
            cursor: pointer !important;
            transition: var(--transition) !important;
            display: block !important;
            visibility: visible !important;
            opacity: 1 !important;
            -webkit-appearance: menulist !important;
            appearance: menulist !important;
        }
        
        #modalBody .form-select:focus,
        #modalBody select:focus,
        .form-select:focus {
            outline: none !important;
            border-color: var(--primary) !important;
            background: white !important;
        }
        
        #editModal .modal-footer {
            padding: 1.25rem 1.75rem !important;
            border-top: 1px solid var(--border-color) !important;
            display: flex !important;
            justify-content: flex-end !important;
            gap: 0.75rem !important;
            background: var(--bg-light) !important;
            border-radius: 0 0 var(--radius-lg) var(--radius-lg) !important;
            visibility: visible !important;
            opacity: 1 !important;
        }
        
        #editModal .btn,
        .password-card .btn {
            padding: 0.875rem 1.75rem !important;
            border-radius: 50px !important;
            font-family: inherit !important;
            font-size: 0.95rem !important;
            font-weight: 500 !important;
            cursor: pointer !important;
            transition: var(--transition) !important;
            display: inline-flex !important;
            align-items: center !important;
            gap: 0.5rem !important;
            visibility: visible !important;
            opacity: 1 !important;
        }
        
        #editModal .btn-secondary,
        .password-card .btn-secondary {
            background: white !important;
            border: 2px solid var(--border-color) !important;
            color: var(--brown-soft) !important;
        }
        
        #editModal .btn-secondary:hover,
        .password-card .btn-secondary:hover {
            background: var(--bg-light) !important;
            border-color: var(--brown-soft) !important;
        }
        
        #editModal .btn-primary,
        .password-card .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%) !important;
            border: none !important;
            color: white !important;
            box-shadow: 0 4px 15px rgba(201,147,102,0.3) !important;
        }
        
        #editModal .btn-primary:hover,
        .password-card .btn-primary:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 6px 20px rgba(201,147,102,0.4) !important;
        }

        /* Toast - Highest z-index for notifications */
        .toast-container {
            position: fixed !important;
            top: 1.5rem !important;
            right: 1.5rem !important;
            z-index: 999999 !important;
        }
        
        .toast {
            background: white;
            padding: 1.25rem 1.75rem;
            border-radius: var(--radius-md);
            box-shadow: var(--shadow-lg);
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 0.75rem;
            transform: translateX(120%);
            transition: var(--transition);
            min-width: 300px;
        }
        
        .toast.show {
            transform: translateX(0);
        }
        
        .toast.success {
            border-left: 4px solid var(--success);
        }
        
        .toast.success i {
            color: var(--success);
            font-size: 1.25rem;
        }
        
        .toast.error {
            border-left: 4px solid var(--error);
        }
        
        .toast.error i {
            color: var(--error);
            font-size: 1.25rem;
        }
        
        /* Content Sections */
        .content-section {
            display: none;
            animation: fadeIn 0.3s ease;
        }
        
        .content-section.active {
            display: block;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Order History Styles */
        .orders-filter {
            display: flex;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
        }
        
        .filter-btn {
            padding: 0.6rem 1.25rem;
            border: 2px solid var(--border-color);
            background: white;
            border-radius: 50px;
            color: var(--brown-soft);
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            font-size: 0.9rem;
        }
        
        .filter-btn:hover, .filter-btn.active {
            background: var(--primary);
            border-color: var(--primary);
            color: white;
        }
        
        .order-card {
            background: var(--white);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-sm);
            margin-bottom: 1.25rem;
            overflow: hidden;
            border: 1px solid var(--border-color);
            transition: var(--transition);
        }
        
        .order-card:hover {
            box-shadow: var(--shadow-md);
            border-color: var(--primary-light);
        }
        
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.25rem 1.5rem;
            background: linear-gradient(135deg, var(--bg-cream) 0%, var(--bg-light) 100%);
            border-bottom: 1px solid var(--border-color);
        }
        
        .order-info {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }
        
        .order-id {
            font-weight: 600;
            color: var(--brown-main);
            font-size: 1.05rem;
        }
        
        .order-date {
            color: var(--text-muted);
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }
        
        .order-status {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }
        
        .order-status.pending {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeeba 100%);
            color: #856404;
        }
        
        .order-status.processing {
            background: linear-gradient(135deg, #cce5ff 0%, #b8daff 100%);
            color: #004085;
        }
        
        .order-status.shipped {
            background: linear-gradient(135deg, #d1ecf1 0%, #bee5eb 100%);
            color: #0c5460;
        }
        
        .order-status.delivered {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            color: #155724;
        }
        
        .order-status.cancelled {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            color: #721c24;
        }
        
        .order-body {
            padding: 1.25rem 1.5rem;
        }
        
        .order-item {
            display: flex;
            align-items: center;
            gap: 1.25rem;
            padding: 1rem 0;
            border-bottom: 1px solid var(--border-color);
        }
        
        .order-item:last-child {
            border-bottom: none;
        }
        
        .order-item-img {
            width: 70px;
            height: 70px;
            border-radius: var(--radius-md);
            object-fit: cover;
            box-shadow: var(--shadow-sm);
        }
        
        .order-item-info {
            flex: 1;
        }
        
        .order-item-name {
            font-weight: 600;
            color: var(--brown-main);
            margin-bottom: 0.25rem;
        }
        
        .order-item-qty {
            color: var(--text-muted);
            font-size: 0.9rem;
        }
        
        .order-item-price {
            font-weight: 700;
            color: var(--primary-dark);
            font-size: 1.05rem;
        }
        
        .order-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.25rem 1.5rem;
            background: var(--bg-light);
            border-top: 1px solid var(--border-color);
        }
        
        .order-total {
            font-size: 1.1rem;
            color: var(--brown-main);
        }
        
        .order-total span {
            font-weight: 700;
            color: var(--primary-dark);
            font-size: 1.2rem;
        }
        
        /* Address Book Styles */
        .address-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.25rem;
        }
        
        .address-card {
            background: var(--white);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-sm);
            padding: 1.5rem;
            position: relative;
            border: 2px solid transparent;
            transition: var(--transition);
        }
        
        .address-card:hover {
            box-shadow: var(--shadow-md);
        }
        
        .address-card.default {
            border-color: var(--primary);
            background: linear-gradient(135deg, var(--bg-cream) 0%, white 100%);
        }
        
        .address-default-badge {
            position: absolute;
            top: -8px;
            right: 1rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 0.35rem 1rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.3rem;
            box-shadow: var(--shadow-sm);
        }
        
        .address-icon {
            width: 48px;
            height: 48px;
            background: var(--primary-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-dark);
            margin-bottom: 1rem;
            font-size: 1.2rem;
        }
        
        .address-name {
            font-weight: 600;
            color: var(--brown-main);
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
        }
        
        .address-phone {
            color: var(--text-muted);
            font-size: 0.9rem;
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .address-detail {
            color: var(--brown-soft);
            line-height: 1.6;
            font-size: 0.95rem;
        }
        
        .address-actions {
            margin-top: 1.25rem;
            padding-top: 1rem;
            border-top: 1px solid var(--border-color);
            display: flex;
            gap: 0.5rem;
        }
        
        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
            border-radius: 50px;
        }
        
        .btn-outline {
            background: transparent;
            border: 2px solid var(--border-color);
            color: var(--brown-soft);
        }
        
        .btn-outline:hover {
            background: var(--primary-light);
            border-color: var(--primary);
            color: var(--primary-dark);
        }
        
        .btn-danger {
            background: transparent;
            border: 2px solid var(--error);
            color: var(--error);
        }
        
        .btn-danger:hover {
            background: var(--error);
            color: white;
        }
        
        .add-address-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 1rem;
            padding: 2.5rem;
            background: linear-gradient(135deg, var(--bg-cream) 0%, var(--bg-light) 100%);
            border: 2px dashed var(--border-color);
            border-radius: var(--radius-lg);
            color: var(--text-muted);
            cursor: pointer;
            transition: var(--transition);
            min-height: 200px;
        }
        
        .add-address-btn:hover {
            border-color: var(--primary);
            color: var(--primary);
            background: var(--primary-light);
        }
        
        .add-address-btn i {
            font-size: 2.5rem;
            opacity: 0.7;
        }
        
        .add-address-btn span {
            font-weight: 500;
        }
        
        /* Change Password Styles */
        .password-card {
            background: var(--white);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            overflow: hidden;
        }
        
        .password-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            padding: 2rem;
            text-align: center;
            position: relative;
        }
        
        .password-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 200px;
            height: 200px;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            border-radius: 50%;
        }
        
        .password-header i {
            font-size: 3rem;
            color: white;
            margin-bottom: 1rem;
            position: relative;
            z-index: 1;
        }
        
        .password-header h3 {
            color: white;
            font-family: 'Crimson Text', serif;
            font-size: 1.5rem;
            position: relative;
            z-index: 1;
        }
        
        .password-header p {
            color: rgba(255,255,255,0.85);
            font-size: 0.95rem;
            margin-top: 0.5rem;
            position: relative;
            z-index: 1;
        }
        
        .password-body {
            padding: 2rem;
        }
        
        .password-form .form-group {
            margin-bottom: 1.5rem;
        }
        
        .password-requirements {
            margin-top: 1.5rem;
            padding: 1.25rem;
            background: linear-gradient(135deg, var(--bg-cream) 0%, var(--primary-light) 100%);
            border-radius: var(--radius-md);
            border: 1px solid var(--primary-light);
        }
        
        .password-requirements h5 {
            font-size: 0.95rem;
            color: var(--brown-main);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .password-requirements h5 i {
            color: var(--primary);
        }
        
        .password-requirements ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 0.75rem;
        }
        
        .password-requirements li {
            font-size: 0.85rem;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 0.75rem;
            background: white;
            border-radius: var(--radius-sm);
            transition: var(--transition);
        }
        
        .password-requirements li i {
            width: 18px;
        }
        
        .password-requirements li.valid {
            color: var(--success);
            background: rgba(39, 174, 96, 0.1);
        }
        
        .password-requirements li.valid i {
            color: var(--success);
        }
        
        .password-requirements li.invalid {
            color: var(--text-muted);
        }
        
        .password-input-wrapper {
            position: relative;
        }
        
        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--text-muted);
            cursor: pointer;
            padding: 0.5rem;
            transition: var(--transition);
        }
        
        .password-toggle:hover {
            color: var(--primary);
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: var(--text-muted);
        }
        
        .empty-state-icon {
            width: 100px;
            height: 100px;
            background: var(--primary-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
        }
        
        .empty-state-icon i {
            font-size: 2.5rem;
            color: var(--primary);
        }
        
        .empty-state h4 {
            color: var(--brown-main);
            font-family: 'Crimson Text', serif;
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }
        
        .empty-state p {
            color: var(--text-muted);
            margin-bottom: 1.5rem;
        }
        
        /* Responsive */
        @media (max-width: 992px) {
            .profile-grid {
                grid-template-columns: 1fr;
            }
            
            .sidebar {
                position: static;
                order: -1;
            }
            
            .sidebar-menu {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
            }
            
            .sidebar-menu li {
                margin-bottom: 0;
            }
            
            .sidebar-menu a {
                padding: 0.75rem 1rem;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .address-grid {
                grid-template-columns: 1fr;
            }
            
            .password-requirements ul {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 768px) {
            .page-hero {
                padding: 2rem 1.5rem;
            }
            
            .page-hero h1 {
                font-size: 1.75rem;
            }
            
            .main-container {
                padding: 1rem;
                margin-top: -1rem;
            }
            
            .order-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.75rem;
            }
            
            .order-footer {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
            
            .order-footer .btn {
                width: 100%;
                justify-content: center;
            }
            
            .sidebar-user {
                display: none;
            }
        }
    </style>
</head>
<body>
    <%@ include file="partials/header.jsp" %>
    <!-- Main Content -->
    <div class="main-container">
        <div class="profile-grid">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="sidebar-user">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user.avatar}">
                            <img src="${sessionScope.user.avatar}" alt="Avatar" class="sidebar-avatar">
                        </c:when>
                        <c:otherwise>
                            <img src="https://ui-avatars.com/api/?name=${sessionScope.user.fullname}&background=c99366&color=fff&size=80" alt="Avatar" class="sidebar-avatar">
                        </c:otherwise>
                    </c:choose>
                    <div class="sidebar-name">${sessionScope.user.fullname}</div>
                    <div class="sidebar-email">${sessionScope.user.email}</div>
                </div>
                <ul class="sidebar-menu">
                    <li>
                        <a href="#" onclick="showSection('profile'); return false;" class="active" data-section="profile">
                            <i class="fas fa-user"></i> Thông tin cá nhân
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="showSection('orders'); return false;" data-section="orders">
                            <i class="fas fa-shopping-bag"></i> Lịch sử đơn hàng
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="showSection('address'); return false;" data-section="address">
                            <i class="fas fa-map-marker-alt"></i> Sổ địa chỉ
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="showSection('password'); return false;" data-section="password">
                            <i class="fas fa-lock"></i> Đổi mật khẩu
                        </a>
                    </li>
                </ul>
            </aside>
            
            <!-- Profile Card (Section 1: Thông tin cá nhân) -->
            <div class="content-section active" id="section-profile">
                <div class="content-card">
                    <div class="profile-header">
                        <div class="avatar-container">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user.avatar}">
                                    <img src="${sessionScope.user.avatar}" alt="Avatar" class="avatar" id="avatarImg">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://ui-avatars.com/api/?name=${sessionScope.user.fullname}&background=c99366&color=fff&size=130" alt="Avatar" class="avatar" id="avatarImg">
                                </c:otherwise>
                            </c:choose>
                            <button class="avatar-edit" onclick="openModal('avatar')">
                                <i class="fas fa-camera"></i>
                            </button>
                        </div>
                        <h2 class="profile-name" id="displayName">${sessionScope.user.fullname}</h2>
                        <p class="profile-email">${sessionScope.user.email}</p>
                    </div>
                    
                    <div class="profile-body">
                        <h3 class="section-title"><i class="fas fa-id-card"></i> Thông tin cá nhân</h3>
                        
                        <div class="info-grid">
                            <!-- Họ tên -->
                            <div class="info-card">
                                <div class="info-card-header">
                                    <span class="info-card-label"><i class="fas fa-user"></i> Họ và tên</span>
                                    <button class="btn-edit-sm" onclick="openModal('fullname')">
                                        <i class="fas fa-pen"></i>
                                    </button>
                                </div>
                                <div class="info-card-value" id="fullnameValue">${sessionScope.user.fullname}</div>
                            </div>
                            
                            <!-- Số điện thoại -->
                            <div class="info-card">
                                <div class="info-card-header">
                                    <span class="info-card-label"><i class="fas fa-phone"></i> Điện thoại</span>
                                    <button class="btn-edit-sm" onclick="openModal('phone')">
                                        <i class="fas fa-pen"></i>
                                    </button>
                                </div>
                                <div class="info-card-value ${empty sessionScope.user.phone ? 'placeholder' : ''}" id="phoneValue">
                                    ${not empty sessionScope.user.phone ? sessionScope.user.phone : 'Chưa cập nhật'}
                                </div>
                            </div>
                            
                            <!-- Giới tính -->
                            <div class="info-card">
                                <div class="info-card-header">
                                    <span class="info-card-label"><i class="fas fa-venus-mars"></i> Giới tính</span>
                                    <button class="btn-edit-sm" onclick="openModal('gender')">
                                        <i class="fas fa-pen"></i>
                                    </button>
                                </div>
                                <div class="info-card-value ${empty sessionScope.user.gender ? 'placeholder' : ''}" id="genderValue">
                                    <c:choose>
                                        <c:when test="${sessionScope.user.gender == 'male'}">Nam</c:when>
                                        <c:when test="${sessionScope.user.gender == 'female'}">Nữ</c:when>
                                        <c:when test="${sessionScope.user.gender == 'other'}">Khác</c:when>
                                        <c:otherwise>Chưa cập nhật</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            
                            <!-- Ngày sinh -->
                            <div class="info-card">
                                <div class="info-card-header">
                                    <span class="info-card-label"><i class="fas fa-birthday-cake"></i> Ngày sinh</span>
                                    <button class="btn-edit-sm" onclick="openModal('birthday')">
                                        <i class="fas fa-pen"></i>
                                    </button>
                                </div>
                                <div class="info-card-value ${empty sessionScope.user.birthday ? 'placeholder' : ''}" id="birthdayValue">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.user.birthday}">
                                            <fmt:formatDate value="${sessionScope.user.birthday}" pattern="dd/MM/yyyy"/>
                                        </c:when>
                                        <c:otherwise>Chưa cập nhật</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            
                            <!-- Email (locked) -->
                            <div class="info-row-locked">
                                <div>
                                    <span class="info-card-label"><i class="fas fa-envelope"></i> Email</span>
                                    <div class="info-card-value">${sessionScope.user.email}</div>
                                </div>
                                <span class="locked-badge"><i class="fas fa-lock"></i> Không thể thay đổi</span>
                            </div>
                        </div>
                        
                        <!-- Bio Section -->
                        <div class="bio-section">
                            <div class="bio-header">
                                <div class="bio-title">
                                    <i class="fas fa-quote-left"></i> Giới thiệu bản thân
                                </div>
                                <button class="btn-edit-sm" onclick="openModal('bio')">
                                    <i class="fas fa-pen"></i>
                                </button>
                            </div>
                            <p class="bio-content ${empty sessionScope.user.bio ? 'placeholder' : ''}" id="bioValue">
                                ${not empty sessionScope.user.bio ? sessionScope.user.bio : 'Hãy viết vài dòng giới thiệu về bạn...'}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Section 2: Lịch sử đơn hàng -->
            <div class="content-section" id="section-orders">
                <div class="content-card">
                    <div class="profile-body">
                        <h3 class="section-title"><i class="fas fa-shopping-bag"></i> Lịch sử đơn hàng</h3>
                        <div class="orders-filter">
                            <button class="filter-btn active" onclick="filterOrders('all')">Tất cả</button>
                            <button class="filter-btn" onclick="filterOrders('pending')">Chờ xác nhận</button>
                            <button class="filter-btn" onclick="filterOrders('processing')">Đang xử lý</button>
                            <button class="filter-btn" onclick="filterOrders('shipped')">Đang giao</button>
                            <button class="filter-btn" onclick="filterOrders('delivered')">Đã giao</button>
                        </div>
                        <div id="orderHistoryContent">
                            <!-- Loading state -->
                            <div class="empty-state" id="ordersLoading">
                                <div class="empty-state-icon">
                                    <i class="fas fa-spinner fa-spin"></i>
                                </div>
                                <p>Đang tải...</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Section 3: Sổ địa chỉ -->
            <div class="content-section" id="section-address">
                <div class="content-card">
                    <div class="profile-body">
                        <h3 class="section-title"><i class="fas fa-map-marker-alt"></i> Sổ địa chỉ</h3>
                        <div class="address-grid" id="addressBookContent">
                            <!-- Address cards will be loaded here -->
                        </div>
                        <div class="add-address-btn" onclick="openModal('newAddress')" style="margin-top: 1.25rem;">
                            <i class="fas fa-plus-circle"></i>
                            <span>Thêm địa chỉ mới</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Section 4: Đổi mật khẩu -->
            <div class="content-section" id="section-password">
                <div class="password-card">
                    <div class="password-header">
                        <i class="fas fa-shield-alt"></i>
                        <h3>Bảo mật tài khoản</h3>
                        <p>Cập nhật mật khẩu để bảo vệ tài khoản của bạn</p>
                    </div>
                    <div class="password-body">
                        <form class="password-form" onsubmit="changePassword(event)">
                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-key"></i> Mật khẩu hiện tại</label>
                                <div class="password-input-wrapper">
                                    <input type="password" class="form-control" id="currentPassword" placeholder="Nhập mật khẩu hiện tại" required>
                                    <button type="button" class="password-toggle" onclick="togglePassword('currentPassword')">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-lock"></i> Mật khẩu mới</label>
                                <div class="password-input-wrapper">
                                    <input type="password" class="form-control" id="newPassword" placeholder="Nhập mật khẩu mới" required oninput="checkPasswordStrength()">
                                    <button type="button" class="password-toggle" onclick="togglePassword('newPassword')">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-check-circle"></i> Xác nhận mật khẩu mới</label>
                                <div class="password-input-wrapper">
                                    <input type="password" class="form-control" id="confirmPassword" placeholder="Nhập lại mật khẩu mới" required>
                                    <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword')">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="password-requirements">
                                <h5><i class="fas fa-info-circle"></i> Yêu cầu mật khẩu:</h5>
                                <ul>
                                    <li id="req-length"><i class="fas fa-circle"></i> Ít nhất 8 ký tự</li>
                                    <li id="req-upper"><i class="fas fa-circle"></i> Ít nhất 1 chữ hoa</li>
                                    <li id="req-lower"><i class="fas fa-circle"></i> Ít nhất 1 chữ thường</li>
                                    <li id="req-number"><i class="fas fa-circle"></i> Ít nhất 1 số</li>
                                </ul>
                            </div>
                            <div style="margin-top: 2rem;">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Đổi mật khẩu
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
                            <!-- Address cards will be loaded here -->
                        </div>
                        <div class="add-address-btn" onclick="openModal('newAddress')">
                            <i class="fas fa-plus"></i>
                            <span>Thêm địa chỉ mới</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Section 4: Đổi mật khẩu -->
            <div class="content-section" id="section-password">
                <div class="password-card">
                    <h3 class="section-title"><i class="fas fa-lock"></i> Đổi mật khẩu</h3>
                    <form class="password-form" onsubmit="changePassword(event)">
                        <div class="form-group">
                            <label class="form-label">Mật khẩu hiện tại</label>
                            <div class="password-input-wrapper">
                                <input type="password" class="form-control" id="currentPassword" placeholder="Nhập mật khẩu hiện tại" required>
                                <button type="button" class="password-toggle" onclick="togglePassword('currentPassword')">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Mật khẩu mới</label>
                            <div class="password-input-wrapper">
                                <input type="password" class="form-control" id="newPassword" placeholder="Nhập mật khẩu mới" required oninput="checkPasswordStrength()">
                                <button type="button" class="password-toggle" onclick="togglePassword('newPassword')">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Xác nhận mật khẩu mới</label>
                            <div class="password-input-wrapper">
                                <input type="password" class="form-control" id="confirmPassword" placeholder="Nhập lại mật khẩu mới" required>
                                <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword')">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>
                        <div class="password-requirements">
                            <h5>Yêu cầu mật khẩu:</h5>
                            <ul>
                                <li id="req-length"><i class="fas fa-circle"></i> Ít nhất 8 ký tự</li>
                                <li id="req-upper"><i class="fas fa-circle"></i> Ít nhất 1 chữ hoa</li>
                                <li id="req-lower"><i class="fas fa-circle"></i> Ít nhất 1 chữ thường</li>
                                <li id="req-number"><i class="fas fa-circle"></i> Ít nhất 1 số</li>
                            </ul>
                        </div>
                        <div style="margin-top: 1.5rem;">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Đổi mật khẩu
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal Overlay -->
    <div class="modal-overlay" id="modalOverlay">
        <div class="modal" id="editModal">
            <div class="modal-header">
                <h4 class="modal-title" id="modalTitle">Chỉnh sửa</h4>
                <button class="modal-close" onclick="closeModal()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body" id="modalBody">
                <!-- Dynamic content -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal()">Hủy</button>
                <button class="btn btn-primary" onclick="saveChanges()">
                    <i class="fas fa-save"></i> Lưu thay đổi
                </button>
            </div>
        </div>
    </div>
    
    <!-- Toast Container -->
    <div class="toast-container" id="toastContainer"></div>
    
    <script>
        let currentField = '';
        const contextPath = '${pageContext.request.contextPath}';
        
        // ==================== Section Navigation ====================
        function showSection(sectionName) {
            // Hide all sections
            document.querySelectorAll('.content-section').forEach(section => {
                section.classList.remove('active');
            });
            
            // Show selected section
            document.getElementById('section-' + sectionName).classList.add('active');
            
            // Update menu active state
            document.querySelectorAll('.sidebar-menu a').forEach(link => {
                link.classList.remove('active');
            });
            document.querySelector('.sidebar-menu a[data-section="' + sectionName + '"]').classList.add('active');
            
            // Load content for specific sections
            if (sectionName === 'orders') {
                loadOrderHistory();
            } else if (sectionName === 'address') {
                loadAddressBook();
            }
        }
        
        // ==================== Order History ====================
        function loadOrderHistory() {
            const container = document.getElementById('orderHistoryContent');
            
            // Show loading
            container.innerHTML = '<div class="empty-state"><i class="fas fa-spinner fa-spin"></i><p>Đang tải...</p></div>';
            
            fetch(contextPath + '/orders/history')
                .then(response => response.json())
                .then(data => {
                    if (data.success && data.orders && data.orders.length > 0) {
                        let html = '';
                        data.orders.forEach(order => {
                            html += renderOrderCard(order);
                        });
                        container.innerHTML = html;
                    } else {
                        container.innerHTML = renderEmptyOrders();
                    }
                })
                .catch(error => {
                    console.error('Error loading orders:', error);
                    // Show demo data for now
                    container.innerHTML = renderEmptyOrders();
                });
        }
        
        function renderOrderCard(order) {
            const statusMap = {
                'pending': { text: 'Chờ xác nhận', class: 'pending' },
                'processing': { text: 'Đang xử lý', class: 'processing' },
                'shipped': { text: 'Đang giao', class: 'shipped' },
                'delivered': { text: 'Đã giao', class: 'delivered' },
                'cancelled': { text: 'Đã hủy', class: 'cancelled' }
            };
            const status = statusMap[order.status] || { text: order.status, class: 'pending' };
            
            let itemsHtml = '';
            order.items.forEach(item => {
                itemsHtml += `
                    <div class="order-item">
                        <img src="\${item.image}" alt="\${item.name}" class="order-item-img">
                        <div class="order-item-info">
                            <div class="order-item-name">\${item.name}</div>
                            <div class="order-item-qty">x\${item.quantity}</div>
                        </div>
                        <div class="order-item-price">\${formatCurrency(item.price)}</div>
                    </div>
                `;
            });
            
            return `
                <div class="order-card">
                    <div class="order-header">
                        <div>
                            <span class="order-id">Đơn hàng #\${order.id}</span>
                            <span class="order-date">\${order.date}</span>
                        </div>
                        <span class="order-status \${status.class}">\${status.text}</span>
                    </div>
                    <div class="order-body">
                        \${itemsHtml}
                    </div>
                    <div class="order-footer">
                        <div class="order-total">Tổng cộng: <span>\${formatCurrency(order.total)}</span></div>
                        <button class="btn btn-outline btn-sm" onclick="viewOrderDetail(\${order.id})">
                            <i class="fas fa-eye"></i> Xem chi tiết
                        </button>
                    </div>
                </div>
            `;
        }
        
        function renderEmptyOrders() {
            return `
                <div class="empty-state">
                    <i class="fas fa-shopping-bag"></i>
                    <h4>Chưa có đơn hàng nào</h4>
                    <p>Hãy mua sắm để có đơn hàng đầu tiên!</p>
                    <a href="\${contextPath}/view/product.jsp" class="btn btn-primary" style="margin-top: 1rem;">
                        <i class="fas fa-shopping-cart"></i> Mua sắm ngay
                    </a>
                </div>
            `;
        }
        
        function viewOrderDetail(orderId) {
            // TODO: Implement order detail view
            showToast('Xem chi tiết đơn hàng #' + orderId, 'success');
        }
        
        // ==================== Address Book ====================
        let addresses = [];
        
        function loadAddressBook() {
            const container = document.getElementById('addressBookContent');
            
            // Show loading
            container.innerHTML = '<div class="empty-state"><i class="fas fa-spinner fa-spin"></i><p>Đang tải...</p></div>';
            
            fetch(contextPath + '/address/list')
                .then(response => response.json())
                .then(data => {
                    if (data.success && data.addresses && data.addresses.length > 0) {
                        addresses = data.addresses;
                        renderAddressBook();
                    } else {
                        container.innerHTML = renderEmptyAddresses();
                    }
                })
                .catch(error => {
                    console.error('Error loading addresses:', error);
                    container.innerHTML = renderEmptyAddresses();
                });
        }
        
        function renderAddressBook() {
            const container = document.getElementById('addressBookContent');
            let html = '';
            
            addresses.forEach((address, index) => {
                html += `
                    <div class="address-card \${address.isDefault ? 'default' : ''}">
                        \${address.isDefault ? '<span class="address-default-badge">Mặc định</span>' : ''}
                        <div class="address-name">\${address.name}</div>
                        <div class="address-phone"><i class="fas fa-phone"></i> \${address.phone}</div>
                        <div class="address-detail">\${address.detail}, \${address.ward}, \${address.district}, \${address.city}</div>
                        <div class="address-actions">
                            <button class="btn btn-outline btn-sm" onclick="editAddress(\${index})">
                                <i class="fas fa-edit"></i> Sửa
                            </button>
                            \${!address.isDefault ? '<button class="btn btn-outline btn-sm" onclick="setDefaultAddress(' + index + ')"><i class="fas fa-check"></i> Đặt mặc định</button>' : ''}
                            <button class="btn btn-danger btn-sm" onclick="deleteAddress(\${index})">
                                <i class="fas fa-trash"></i> Xóa
                            </button>
                        </div>
                    </div>
                `;
            });
            
            container.innerHTML = html;
        }
        
        function renderEmptyAddresses() {
            return `
                <div class="empty-state">
                    <i class="fas fa-map-marker-alt"></i>
                    <h4>Chưa có địa chỉ nào</h4>
                    <p>Thêm địa chỉ để dễ dàng đặt hàng</p>
                </div>
            `;
        }
        
        function editAddress(index) {
            const address = addresses[index];
            openModal('editAddress', address);
        }
        
        function setDefaultAddress(index) {
            const address = addresses[index];
            
            fetch(contextPath + '/address/setDefault', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'addressId=' + address.id
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showToast('Đã đặt làm địa chỉ mặc định', 'success');
                    loadAddressBook();
                } else {
                    showToast(data.message || 'Có lỗi xảy ra', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra', 'error');
            });
        }
        
        function deleteAddress(index) {
            const address = addresses[index];
            
            if (!confirm('Bạn có chắc muốn xóa địa chỉ này?')) {
                return;
            }
            
            fetch(contextPath + '/address/delete', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'addressId=' + address.id
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showToast('Đã xóa địa chỉ', 'success');
                    loadAddressBook();
                } else {
                    showToast(data.message || 'Có lỗi xảy ra', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra', 'error');
            });
        }
        
        function saveNewAddress() {
            const formData = new URLSearchParams();
            formData.append('name', document.getElementById('inputAddressName').value);
            formData.append('phone', document.getElementById('inputAddressPhone').value);
            formData.append('city', document.getElementById('inputCity').value);
            formData.append('district', document.getElementById('inputDistrict').value);
            formData.append('ward', document.getElementById('inputWard').value);
            formData.append('detail', document.getElementById('inputAddressDetail').value);
            formData.append('isDefault', document.getElementById('inputSetDefault').checked);
            
            fetch(contextPath + '/address/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData.toString()
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showToast('Đã thêm địa chỉ mới', 'success');
                    closeModal();
                    loadAddressBook();
                } else {
                    showToast(data.message || 'Có lỗi xảy ra', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra', 'error');
            });
        }
        
        // ==================== Change Password ====================
        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const icon = input.nextElementSibling.querySelector('i');
            
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
        
        function checkPasswordStrength() {
            const password = document.getElementById('newPassword').value;
            
            // Check length
            const lengthValid = password.length >= 8;
            updateRequirement('req-length', lengthValid);
            
            // Check uppercase
            const upperValid = /[A-Z]/.test(password);
            updateRequirement('req-upper', upperValid);
            
            // Check lowercase
            const lowerValid = /[a-z]/.test(password);
            updateRequirement('req-lower', lowerValid);
            
            // Check number
            const numberValid = /[0-9]/.test(password);
            updateRequirement('req-number', numberValid);
        }
        
        function updateRequirement(id, isValid) {
            const element = document.getElementById(id);
            const icon = element.querySelector('i');
            
            if (isValid) {
                element.classList.add('valid');
                element.classList.remove('invalid');
                icon.classList.remove('fa-circle');
                icon.classList.add('fa-check-circle');
            } else {
                element.classList.remove('valid');
                element.classList.add('invalid');
                icon.classList.remove('fa-check-circle');
                icon.classList.add('fa-circle');
            }
        }
        
        function changePassword(event) {
            event.preventDefault();
            
            const currentPassword = document.getElementById('currentPassword').value;
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            // Validation
            if (newPassword.length < 8) {
                showToast('Mật khẩu phải có ít nhất 8 ký tự', 'error');
                return;
            }
            
            if (!/[A-Z]/.test(newPassword)) {
                showToast('Mật khẩu phải có ít nhất 1 chữ hoa', 'error');
                return;
            }
            
            if (!/[a-z]/.test(newPassword)) {
                showToast('Mật khẩu phải có ít nhất 1 chữ thường', 'error');
                return;
            }
            
            if (!/[0-9]/.test(newPassword)) {
                showToast('Mật khẩu phải có ít nhất 1 số', 'error');
                return;
            }
            
            if (newPassword !== confirmPassword) {
                showToast('Mật khẩu xác nhận không khớp', 'error');
                return;
            }
            
            // Send request
            const formData = new URLSearchParams();
            formData.append('currentPassword', currentPassword);
            formData.append('newPassword', newPassword);
            
            fetch(contextPath + '/profile/changePassword', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData.toString()
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showToast('Đổi mật khẩu thành công!', 'success');
                    // Clear form
                    document.getElementById('currentPassword').value = '';
                    document.getElementById('newPassword').value = '';
                    document.getElementById('confirmPassword').value = '';
                    checkPasswordStrength();
                } else {
                    showToast(data.message || 'Đổi mật khẩu thất bại', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra, vui lòng thử lại', 'error');
            });
        }
        
        // ==================== Utility Functions ====================
        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
        }
        
        // Modal templates
        const modalTemplates = {
            fullname: {
                title: 'Chỉnh sửa họ tên',
                content: `
                    <div class="form-group">
                        <label class="form-label">Họ và tên</label>
                        <input type="text" class="form-control" id="inputFullname" 
                               value="${sessionScope.user.fullname}" 
                               placeholder="Nhập họ và tên">
                    </div>
                `
            },
            phone: {
                title: 'Chỉnh sửa số điện thoại',
                content: `
                    <div class="form-group">
                        <label class="form-label">Số điện thoại</label>
                        <input type="tel" class="form-control" id="inputPhone" 
                               value="${sessionScope.user.phone != null ? sessionScope.user.phone : ''}" 
                               placeholder="Nhập số điện thoại">
                    </div>
                `
            },
            gender: {
                title: 'Chỉnh sửa giới tính',
                content: `
                    <div class="form-group">
                        <label class="form-label">Giới tính</label>
                        <select class="form-select" id="inputGender">
                            <option value="">-- Chọn giới tính --</option>
                            <option value="male" ${sessionScope.user.gender == 'male' ? 'selected' : ''}>Nam</option>
                            <option value="female" ${sessionScope.user.gender == 'female' ? 'selected' : ''}>Nữ</option>
                            <option value="other" ${sessionScope.user.gender == 'other' ? 'selected' : ''}>Khác</option>
                        </select>
                    </div>
                `
            },
            birthday: {
                title: 'Chỉnh sửa ngày sinh',
                content: `
                    <div class="form-group">
                        <label class="form-label">Ngày sinh</label>
                        <input type="date" class="form-control" id="inputBirthday" 
                               value="${sessionScope.user.birthday != null ? sessionScope.user.birthday : ''}">
                    </div>
                `
            },
            bio: {
                title: 'Chỉnh sửa giới thiệu',
                content: `
                    <div class="form-group">
                        <label class="form-label">Giới thiệu bản thân</label>
                        <textarea class="form-control" id="inputBio" rows="4" 
                                  placeholder="Viết vài dòng về bạn...">${sessionScope.user.bio != null ? sessionScope.user.bio : ''}</textarea>
                    </div>
                `
            },
            avatar: {
                title: 'Thay đổi ảnh đại diện',
                content: `
                    <div class="form-group">
                        <label class="form-label">URL ảnh đại diện</label>
                        <input type="url" class="form-control" id="inputAvatar" 
                               value="${sessionScope.user.avatar != null ? sessionScope.user.avatar : ''}" 
                               placeholder="Nhập URL ảnh">
                        <small style="color: var(--text-muted); margin-top: 0.5rem; display: block;">
                            Bạn có thể sử dụng URL ảnh từ các dịch vụ như Imgur, Cloudinary,...
                        </small>
                    </div>
                `
            },
            newAddress: {
                title: 'Thêm địa chỉ mới',
                content: `
                    <div class="form-group">
                        <label class="form-label">Họ tên người nhận</label>
                        <input type="text" class="form-control" id="inputAddressName" placeholder="Nhập họ tên">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Số điện thoại</label>
                        <input type="tel" class="form-control" id="inputAddressPhone" placeholder="Nhập số điện thoại">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Tỉnh/Thành phố</label>
                        <input type="text" class="form-control" id="inputCity" placeholder="Nhập tỉnh/thành phố">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Quận/Huyện</label>
                        <input type="text" class="form-control" id="inputDistrict" placeholder="Nhập quận/huyện">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Phường/Xã</label>
                        <input type="text" class="form-control" id="inputWard" placeholder="Nhập phường/xã">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Địa chỉ chi tiết</label>
                        <input type="text" class="form-control" id="inputAddressDetail" placeholder="Số nhà, tên đường...">
                    </div>
                    <div class="form-group">
                        <label style="display: flex; align-items: center; gap: 0.5rem; cursor: pointer;">
                            <input type="checkbox" id="inputSetDefault">
                            <span>Đặt làm địa chỉ mặc định</span>
                        </label>
                    </div>
                `,
                saveAction: 'saveNewAddress'
            }
        };
        
        function openModal(field, data) {
            currentField = field;
            const template = modalTemplates[field];
            if (template) {
                document.getElementById('modalTitle').textContent = template.title;
                document.getElementById('modalBody').innerHTML = template.content;
                
                // Update modal footer based on template
                const saveBtn = document.querySelector('.modal-footer .btn-primary');
                if (template.saveAction) {
                    saveBtn.setAttribute('onclick', template.saveAction + '()');
                } else {
                    saveBtn.setAttribute('onclick', 'saveChanges()');
                }
                
                document.getElementById('modalOverlay').classList.add('active');
                
                // If editing address, populate data
                if (field === 'editAddress' && data) {
                    document.getElementById('inputAddressName').value = data.name || '';
                    document.getElementById('inputAddressPhone').value = data.phone || '';
                    document.getElementById('inputCity').value = data.city || '';
                    document.getElementById('inputDistrict').value = data.district || '';
                    document.getElementById('inputWard').value = data.ward || '';
                    document.getElementById('inputAddressDetail').value = data.detail || '';
                    document.getElementById('inputSetDefault').checked = data.isDefault || false;
                }
            }
        }
        
        function closeModal() {
            document.getElementById('modalOverlay').classList.remove('active');
            currentField = '';
        }
        
        function saveChanges() {
            let value = '';
            
            switch (currentField) {
                case 'fullname':
                    value = document.getElementById('inputFullname').value.trim();
                    if (!value) {
                        showToast('Vui lòng nhập họ tên', 'error');
                        return;
                    }
                    break;
                case 'phone':
                    value = document.getElementById('inputPhone').value.trim();
                    break;
                case 'gender':
                    value = document.getElementById('inputGender').value;
                    break;
                case 'birthday':
                    value = document.getElementById('inputBirthday').value;
                    break;
                case 'bio':
                    value = document.getElementById('inputBio').value.trim();
                    break;
                case 'avatar':
                    value = document.getElementById('inputAvatar').value.trim();
                    break;
            }
            
            // Gửi request lưu vào database
            const formData = new URLSearchParams();
            formData.append('field', currentField);
            formData.append('value', value);
            
            fetch(contextPath + '/profile', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData.toString()
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Cập nhật UI
                    updateUI(currentField, value);
                    showToast('Cập nhật thành công!', 'success');
                    closeModal();
                } else {
                    showToast(data.message || 'Cập nhật thất bại', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra, vui lòng thử lại', 'error');
            });
        }
        
        function updateUI(field, value) {
            switch (field) {
                case 'fullname':
                    document.getElementById('fullnameValue').textContent = value;
                    document.getElementById('fullnameValue').classList.remove('placeholder');
                    document.getElementById('displayName').textContent = value;
                    // Update avatar if using default
                    const avatarImg = document.getElementById('avatarImg');
                    if (avatarImg.src.includes('ui-avatars.com')) {
                        avatarImg.src = 'https://ui-avatars.com/api/?name=' + encodeURIComponent(value) + '&background=c99366&color=fff&size=120';
                    }
                    break;
                case 'phone':
                    const phoneEl = document.getElementById('phoneValue');
                    phoneEl.textContent = value || 'Chưa cập nhật';
                    phoneEl.classList.toggle('placeholder', !value);
                    break;
                case 'gender':
                    const genderEl = document.getElementById('genderValue');
                    const genderMap = { 'male': 'Nam', 'female': 'Nữ', 'other': 'Khác' };
                    genderEl.textContent = genderMap[value] || 'Chưa cập nhật';
                    genderEl.classList.toggle('placeholder', !value);
                    break;
                case 'birthday':
                    const birthdayEl = document.getElementById('birthdayValue');
                    if (value) {
                        const date = new Date(value);
                        birthdayEl.textContent = date.toLocaleDateString('vi-VN');
                        birthdayEl.classList.remove('placeholder');
                    } else {
                        birthdayEl.textContent = 'Chưa cập nhật';
                        birthdayEl.classList.add('placeholder');
                    }
                    break;
                case 'bio':
                    const bioEl = document.getElementById('bioValue');
                    bioEl.textContent = value || 'Hãy viết vài dòng giới thiệu về bạn...';
                    bioEl.classList.toggle('placeholder', !value);
                    break;
                case 'avatar':
                    const avatar = document.getElementById('avatarImg');
                    if (value) {
                        avatar.src = value;
                    } else {
                        const name = document.getElementById('displayName').textContent;
                        avatar.src = 'https://ui-avatars.com/api/?name=' + encodeURIComponent(name) + '&background=c99366&color=fff&size=120';
                    }
                    break;
            }
        }
        
        function showToast(message, type) {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            toast.className = 'toast ' + type;
            const iconClass = type === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle';
            toast.innerHTML = '<i class="fas ' + iconClass + '"></i><span>' + message + '</span>';
            container.appendChild(toast);
            
            // Show toast
            setTimeout(() => toast.classList.add('show'), 10);
            
            // Remove toast
            setTimeout(() => {
                toast.classList.remove('show');
                setTimeout(() => toast.remove(), 300);
            }, 3000);
        }
        
        // Close modal on overlay click
        document.getElementById('modalOverlay').addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });
        
        // Close modal on ESC key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeModal();
            }
        });
        
        // Check URL hash on page load
        document.addEventListener('DOMContentLoaded', function() {
            const hash = window.location.hash.replace('#', '');
            if (hash && ['profile', 'orders', 'address', 'password'].includes(hash)) {
                showSection(hash);
            }
        });
    </script>
    <%@ include file="partials/footer.jsp" %>
</body>
</html>

