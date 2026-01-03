<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yêu Thích - Tiệm Hoa nhà tớ</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            line-height: 1.6;
            color: #333;
            background: #f8f9fa;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Header */
        .header {
            background: white;
            padding: 20px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 40px;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-family: 'Playfair Display', serif;
            font-size: 24px;
            font-weight: 700;
            color: #c99366;
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            gap: 20px;
        }
        
        .nav-links a {
            color: #333;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 8px;
            transition: all 0.3s;
        }
        
        .nav-links a:hover {
            background: #f0f0f0;
        }
        
        /* Page Title */
        .page-title {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .page-title h1 {
            font-family: 'Playfair Display', serif;
            font-size: 36px;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        
        .page-title p {
            color: #666;
            font-size: 16px;
        }
        
        /* Wishlist Container */
        .wishlist-container {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 20px rgba(0,0,0,0.08);
        }
        
        .wishlist-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .wishlist-count {
            font-size: 18px;
            color: #666;
        }
        
        .clear-all-btn {
            padding: 10px 20px;
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
        }
        
        .clear-all-btn:hover {
            background: #c0392b;
        }
        
        /* Loading */
        .loading {
            text-align: center;
            padding: 60px 20px;
        }
        
        .loading i {
            font-size: 48px;
            color: #c99366;
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 80px 20px;
        }
        
        .empty-state i {
            font-size: 64px;
            color: #ddd;
            margin-bottom: 20px;
        }
        
        .empty-state h3 {
            font-size: 24px;
            color: #666;
            margin-bottom: 10px;
        }
        
        .empty-state p {
            color: #999;
            margin-bottom: 30px;
        }
        
        .empty-state a {
            display: inline-block;
            padding: 12px 30px;
            background: #c99366;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s;
        }
        
        .empty-state a:hover {
            background: #aa6a3f;
        }
        
        /* Wishlist Grid */
        .wishlist-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
        }
        
        .wishlist-item {
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s;
            position: relative;
        }
        
        .wishlist-item:hover {
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
            transform: translateY(-5px);
        }
        
        .item-image {
            position: relative;
            padding-top: 100%;
            overflow: hidden;
            background: #f8f9fa;
        }
        
        .item-image img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .remove-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 36px;
            height: 36px;
            background: white;
            border: none;
            border-radius: 50%;
            color: #e74c3c;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.15);
            transition: all 0.3s;
            z-index: 10;
        }
        
        .remove-btn:hover {
            background: #e74c3c;
            color: white;
            transform: scale(1.1);
        }
        
        .item-content {
            padding: 20px;
        }
        
        .item-name {
            font-size: 16px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 10px;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .item-name a {
            color: inherit;
            text-decoration: none;
        }
        
        .item-name a:hover {
            color: #c99366;
        }
        
        .item-rating {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 12px;
        }
        
        .stars {
            color: #ffa500;
        }
        
        .rating-text {
            font-size: 14px;
            color: #666;
        }
        
        .item-price {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .current-price {
            font-size: 20px;
            font-weight: 700;
            color: #c99366;
        }
        
        .original-price {
            font-size: 16px;
            color: #999;
            text-decoration: line-through;
        }
        
        .item-stock {
            font-size: 14px;
            margin-bottom: 15px;
        }
        
        .in-stock {
            color: #27ae60;
        }
        
        .out-of-stock {
            color: #e74c3c;
        }
        
        .item-actions {
            display: flex;
            gap: 10px;
        }
        
        .add-to-cart-btn {
            flex: 1;
            padding: 10px;
            background: #c99366;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .add-to-cart-btn:hover {
            background: #aa6a3f;
        }
        
        .add-to-cart-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
        }
        
        .view-detail-btn {
            padding: 10px 20px;
            background: white;
            color: #c99366;
            border: 2px solid #c99366;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .view-detail-btn:hover {
            background: #c99366;
            color: white;
        }
        
        /* Toast Notification */
        .toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #27ae60;
            color: white;
            padding: 16px 24px;
            border-radius: 8px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.2);
            display: none;
            align-items: center;
            gap: 12px;
            z-index: 1000;
            animation: slideIn 0.3s ease;
        }
        
        .toast.show {
            display: flex;
        }
        
        .toast.error {
            background: #e74c3c;
        }
        
        .toast.info {
            background: #3498db;
        }
        
        @keyframes slideIn {
            from {
                transform: translateX(400px);
            }
            to {
                transform: translateX(0);
            }
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .page-title h1 {
                font-size: 28px;
            }
            
            .wishlist-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 20px;
            }
            
            .wishlist-container {
                padding: 20px;
            }
            
            .wishlist-header {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <a href="${pageContext.request.contextPath}/" class="logo">Tiệm Hoa nhà tớ</a>
                <div class="nav-links">
                    <a href="${pageContext.request.contextPath}/products"><i class="fas fa-shopping-bag"></i> Sản phẩm</a>
                    <a href="${pageContext.request.contextPath}/cart"><i class="fas fa-shopping-cart"></i> Giỏ hàng</a>
                </div>
            </div>
        </div>
    </header>
    
    <!-- Main Content -->
    <div class="container">
        <div class="page-title">
            <h1><i class="fas fa-heart" style="color: #e74c3c;"></i> Danh Sách Yêu Thích</h1>
            <p>Những sản phẩm bạn đã lưu để mua sau</p>
        </div>
        
        <div class="wishlist-container">
            <div class="wishlist-header" id="wishlistHeader" style="display: none;">
                <div class="wishlist-count">
                    <strong id="itemCount">0</strong> sản phẩm
                </div>
                <button class="clear-all-btn" onclick="clearAllWishlist()">
                    <i class="fas fa-trash"></i> Xóa tất cả
                </button>
            </div>
            
            <div class="loading" id="loading">
                <i class="fas fa-spinner"></i>
                <p style="margin-top: 15px; color: #666;">Đang tải...</p>
            </div>
            
            <div class="empty-state" id="emptyState" style="display: none;">
                <i class="far fa-heart"></i>
                <h3>Danh sách yêu thích trống</h3>
                <p>Bạn chưa có sản phẩm nào trong danh sách yêu thích</p>
                <a href="${pageContext.request.contextPath}/products">
                    <i class="fas fa-shopping-bag"></i> Khám phá sản phẩm
                </a>
            </div>
            
            <div class="wishlist-grid" id="wishlistGrid"></div>
        </div>
    </div>
    
    <!-- Toast Notification -->
    <div class="toast" id="toast">
        <i class="fas fa-check-circle"></i>
        <span id="toastMessage"></span>
    </div>
    
    <script>
        const contextPath = '${pageContext.request.contextPath}';
        
        // Load wishlist on page load
        window.addEventListener('DOMContentLoaded', function() {
            loadWishlist();
        });
        
        // Load wishlist
        async function loadWishlist() {
            const loading = document.getElementById('loading');
            const emptyState = document.getElementById('emptyState');
            const wishlistHeader = document.getElementById('wishlistHeader');
            const wishlistGrid = document.getElementById('wishlistGrid');
            
            try {
                const response = await fetch(contextPath + '/api/wishlist');
                const result = await response.json();
                
                loading.style.display = 'none';
                
                if (!result.success) {
                    emptyState.style.display = 'block';
                    emptyState.innerHTML = '<i class="fas fa-exclamation-circle"></i>' +
                        '<h3>Vui lòng đăng nhập</h3>' +
                        '<p>' + result.message + '</p>' +
                        '<a href="' + contextPath + '/view/login_1.jsp">' +
                        '<i class="fas fa-sign-in-alt"></i> Đăng nhập' +
                        '</a>';
                    return;
                }
                
                if (result.data && result.data.length > 0) {
                    wishlistHeader.style.display = 'flex';
                    document.getElementById('itemCount').textContent = result.data.length;
                    
                    wishlistGrid.innerHTML = result.data.map(item => {
                        const product = item.product;
                        const price = product.salePrice && product.salePrice < product.price 
                            ? product.salePrice 
                            : product.price;
                        
                        const hasDiscount = product.salePrice && product.salePrice < product.price;
                        const inStock = product.quantity > 0;
                        
                        const stars = renderStars(product.averageRating || 0);
                        
                        return '<div class="wishlist-item">' +
                            '<div class="item-image">' +
                                '<img src="' + product.image + '" alt="' + product.name + '" onerror="this.src=\'https://via.placeholder.com/300?text=No+Image\'" />' +
                                '<button class="remove-btn" onclick="removeFromWishlist(' + product.id + ')">' +
                                    '<i class="fas fa-times"></i>' +
                                '</button>' +
                            '</div>' +
                            '<div class="item-content">' +
                                '<h3 class="item-name">' +
                                    '<a href="' + contextPath + '/product/' + product.slug + '">' + product.name + '</a>' +
                                '</h3>' +
                                '<div class="item-rating">' +
                                    '<div class="stars">' + stars + '</div>' +
                                    '<span class="rating-text">(' + (product.reviewCount || 0) + ')</span>' +
                                '</div>' +
                                '<div class="item-price">' +
                                    '<span class="current-price">' + formatPrice(price) + '</span>' +
                                    (hasDiscount ? '<span class="original-price">' + formatPrice(product.price) + '</span>' : '') +
                                '</div>' +
                                '<div class="item-stock ' + (inStock ? 'in-stock' : 'out-of-stock') + '">' +
                                    (inStock ? '<i class="fas fa-check-circle"></i> Còn hàng' : '<i class="fas fa-times-circle"></i> Hết hàng') +
                                '</div>' +
                                '<div class="item-actions">' +
                                    '<button class="add-to-cart-btn" onclick="addToCart(' + product.id + ')" ' + (!inStock ? 'disabled' : '') + '>' +
                                        '<i class="fas fa-shopping-cart"></i> Thêm vào giỏ' +
                                    '</button>' +
                                    '<a href="' + contextPath + '/product/' + product.slug + '" class="view-detail-btn">' +
                                        '<i class="fas fa-eye"></i>' +
                                    '</a>' +
                                '</div>' +
                            '</div>' +
                        '</div>';
                    }).join('');
                } else {
                    emptyState.style.display = 'block';
                }
            } catch (error) {
                console.error('Error loading wishlist:', error);
                loading.style.display = 'none';
                emptyState.style.display = 'block';
                emptyState.innerHTML = '<i class="fas fa-exclamation-circle"></i>' +
                    '<h3>Có lỗi xảy ra</h3>' +
                    '<p>Không thể tải danh sách yêu thích</p>';
            }
        }
        
        // Remove from wishlist
        async function removeFromWishlist(productId) {
            try {
                const response = await fetch(contextPath + '/api/wishlist', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        action: 'remove',
                        productId: productId
                    })
                });
                
                const result = await response.json();
                
                if (result.success) {
                    showToast('Đã xóa khỏi yêu thích', 'success');
                    loadWishlist();
                } else {
                    showToast(result.message, 'error');
                }
            } catch (error) {
                console.error('Error removing from wishlist:', error);
                showToast('Có lỗi xảy ra', 'error');
            }
        }
        
        // Clear all wishlist
        async function clearAllWishlist() {
            if (!confirm('Bạn có chắc chắn muốn xóa tất cả sản phẩm khỏi danh sách yêu thích?')) {
                return;
            }
            
            try {
                const response = await fetch(contextPath + '/api/wishlist', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        action: 'clear'
                    })
                });
                
                const result = await response.json();
                
                if (result.success) {
                    showToast('Đã xóa tất cả yêu thích', 'success');
                    loadWishlist();
                } else {
                    showToast(result.message, 'error');
                }
            } catch (error) {
                console.error('Error clearing wishlist:', error);
                showToast('Có lỗi xảy ra', 'error');
            }
        }
        
        // Add to cart
        async function addToCart(productId) {
            try {
                const response = await fetch(contextPath + '/api/cart/add', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        productId: productId,
                        quantity: 1
                    })
                });
                
                const result = await response.json();
                
                if (result.success) {
                    showToast('Đã thêm vào giỏ hàng', 'success');
                } else {
                    showToast(result.message || 'Không thể thêm vào giỏ hàng', 'error');
                }
            } catch (error) {
                console.error('Error adding to cart:', error);
                showToast('Có lỗi xảy ra', 'error');
            }
        }
        
        // Format price
        function formatPrice(price) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(price);
        }
        
        // Render stars
        function renderStars(rating) {
            const fullStars = Math.floor(rating);
            const hasHalfStar = rating % 1 >= 0.5;
            const emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
            
            let html = '';
            for (let i = 0; i < fullStars; i++) {
                html += '<i class="fas fa-star"></i>';
            }
            if (hasHalfStar) {
                html += '<i class="fas fa-star-half-alt"></i>';
            }
            for (let i = 0; i < emptyStars; i++) {
                html += '<i class="far fa-star"></i>';
            }
            
            return html;
        }
        
        // Show toast
        function showToast(message, type = 'success') {
            const toast = document.getElementById('toast');
            const toastMessage = document.getElementById('toastMessage');
            
            toast.className = 'toast show';
            if (type === 'error') {
                toast.classList.add('error');
            } else if (type === 'info') {
                toast.classList.add('info');
            }
            
            toastMessage.textContent = message;
            
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }
    </script>
</body>
</html>
