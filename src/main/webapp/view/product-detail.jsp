<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} - Tiệm Hoa nhà tớ</title>
    
    <link rel="shortcut icon" href="//cdn.hstatic.net/themes/200000846175/1001403720/14/favicon.png?v=245" type="image/x-icon" />
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;0,700;1,400&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <!-- CSS theme -->
    <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/plugin-style.css?v=245" rel="stylesheet" />
    <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/styles-new.scss.css?v=245" rel="stylesheet" />
    
    <style>
        /* Fix Font Awesome icons */
        .fas, .far, .fab, .fa-solid, .fa-regular, .fa-brands {
            font-family: "Font Awesome 6 Free" !important;
            font-weight: 900;
        }
        .far, .fa-regular {
            font-weight: 400;
        }
        
        :root {
            --bg-main: #f7eee5;
            --card-bg: #ffffff;
            --accent: #c99366;
            --accent-dark: #aa6a3f;
            --accent-soft: #f3d6c4;
            --text-main: #3c2922;
            --text-muted: #6c5845;
            --border-soft: #ead9cc;
            --success: #27ae60;
            --error: #e74c3c;
            --header-height: 72px;
        }
        
        /* Reset and base */
        *, *::before, *::after {
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-main);
            color: var(--text-main);
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        
        /* Fix for fixed header */
        main {
            padding-top: var(--header-height);
            min-height: calc(100vh - var(--header-height));
        }
        
        /* Ensure header is fixed */
        #header, .site-header {
            position: fixed !important;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: #fff;
        }
        
        .page-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 24px 16px 48px;
        }
        
        /* Breadcrumb */
        .breadcrumb {
            font-size: 13px;
            color: var(--text-muted);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .breadcrumb a {
            color: var(--text-muted);
            text-decoration: none;
            transition: color 0.2s;
        }
        
        .breadcrumb a:hover {
            color: var(--accent-dark);
        }
        
        .breadcrumb span {
            color: var(--text-main);
        }
        
        /* Card chi tiết sản phẩm */
        .product-card {
            background-color: var(--card-bg);
            border-radius: 20px;
            padding: 30px;
            display: grid;
            grid-template-columns: 1.1fr 1fr;
            gap: 40px;
            box-shadow: 0 16px 50px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }
        
        @media (max-width: 900px) {
            .product-card {
                grid-template-columns: 1fr;
                padding: 20px;
                gap: 24px;
            }
        }
        
        /* Ảnh sản phẩm */
        .product-gallery {
            position: relative;
        }
        
        .main-image-container {
            position: relative;
            border-radius: 16px;
            overflow: hidden;
            background: linear-gradient(145deg, #f7e0cf, #fdf5ef);
            margin-bottom: 15px;
        }
        
        .main-image {
            width: 100%;
            height: 450px;
            object-fit: cover;
            display: block;
        }
        
        .image-badge {
            position: absolute;
            top: 14px;
            left: 14px;
            background: rgba(255,255,255,0.95);
            color: var(--accent);
            padding: 6px 14px;
            font-size: 12px;
            letter-spacing: 0.05em;
            border-radius: 999px;
            text-transform: uppercase;
            font-weight: 600;
        }
        
        .image-badge.sale {
            background: #e74c3c;
            color: #fff;
        }
        
        .delivery-badge {
            position: absolute;
            bottom: 14px;
            left: 14px;
            background: rgba(0,0,0,0.7);
            color: #fff;
            padding: 6px 14px;
            font-size: 12px;
            border-radius: 999px;
        }
        
        .thumbnail-list {
            display: flex;
            gap: 10px;
            overflow-x: auto;
            padding: 5px 0;
        }
        
        .thumbnail {
            width: 70px;
            height: 70px;
            border-radius: 10px;
            object-fit: cover;
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.2s;
        }
        
        .thumbnail:hover,
        .thumbnail.active {
            border-color: var(--accent);
        }
        
        /* Thông tin sản phẩm */
        .product-info {
            display: flex;
            flex-direction: column;
        }
        
        .product-category {
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--accent);
            font-weight: 600;
            margin-bottom: 8px;
        }
        
        .product-title {
            font-family: 'Crimson Text', serif;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
            line-height: 1.2;
        }
        
        .product-subtitle {
            font-size: 15px;
            color: var(--text-muted);
            margin-bottom: 16px;
        }
        
        .product-rating {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 16px;
            font-size: 14px;
        }
        
        .stars {
            color: #f5a623;
            font-size: 16px;
        }
        
        .rating-text {
            color: var(--text-muted);
        }
        
        /* Price */
        .product-price-section {
            margin-bottom: 20px;
        }
        
        .current-price {
            font-size: 30px;
            font-weight: 700;
            color: var(--accent-dark);
        }
        
        .original-price {
            font-size: 18px;
            color: var(--text-muted);
            text-decoration: line-through;
            margin-left: 12px;
        }
        
        .discount-badge {
            display: inline-block;
            background: #e74c3c;
            color: #fff;
            padding: 4px 10px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 12px;
        }
        
        .product-description {
            font-size: 15px;
            color: var(--text-main);
            margin-bottom: 16px;
            line-height: 1.7;
        }
        
        /* Meta info */
        .product-meta {
            font-size: 14px;
            color: var(--text-muted);
            margin-bottom: 16px;
        }
        
        .product-meta div {
            margin-bottom: 6px;
        }
        
        .product-meta strong {
            color: var(--text-main);
        }
        
        .in-stock {
            color: var(--success);
            font-weight: 600;
        }
        
        .out-of-stock {
            color: var(--error);
            font-weight: 600;
        }
        
        /* Tags */
        .product-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 20px;
        }
        
        .tag {
            font-size: 12px;
            padding: 5px 12px;
            border-radius: 999px;
            border: 1px solid var(--border-soft);
            background-color: #fff8f4;
            color: var(--text-muted);
        }
        
        /* Actions */
        .product-actions {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 16px;
            flex-wrap: wrap;
        }
        
        .quantity-group {
            display: flex;
            align-items: center;
            border-radius: 999px;
            background-color: #f9f2ec;
            padding: 4px 8px;
            border: 1px solid var(--border-soft);
        }
        
        .quantity-group button {
            border: none;
            background: transparent;
            padding: 8px 12px;
            font-size: 18px;
            cursor: pointer;
            color: var(--text-main);
            transition: color 0.2s;
        }
        
        .quantity-group button:hover {
            color: var(--accent-dark);
        }
        
        .quantity-group input {
            width: 50px;
            border: none;
            background: transparent;
            text-align: center;
            font-size: 16px;
            font-weight: 600;
            color: var(--text-main);
        }
        
        .quantity-group input:focus {
            outline: none;
        }
        
        .btn-primary {
            border: none;
            border-radius: 999px;
            padding: 12px 28px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            background: linear-gradient(135deg, var(--accent), var(--accent-dark));
            color: white;
            box-shadow: 0 8px 20px rgba(201,147,102,0.35);
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 25px rgba(201,147,102,0.45);
        }
        
        .btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }
        
        .btn-secondary {
            border-radius: 999px;
            padding: 11px 22px;
            font-size: 14px;
            border: 1px solid var(--border-soft);
            background-color: #fff;
            cursor: pointer;
            color: var(--text-main);
            transition: all 0.2s;
        }
        
        .btn-secondary:hover {
            background-color: #faf3ea;
            border-color: var(--accent);
        }
        
        .btn-wishlist {
            width: 46px;
            height: 46px;
            border-radius: 50%;
            border: 1px solid var(--border-soft);
            background: #fff;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: var(--text-muted);
            transition: all 0.2s;
        }
        
        .btn-wishlist:hover {
            background: #faf3ea;
            color: #e74c3c;
            border-color: #e74c3c;
        }
        
        .product-note {
            font-size: 13px;
            color: var(--text-muted);
            font-style: italic;
            margin-top: 10px;
        }
        
        /* Section Cards */
        .section-card {
            background-color: var(--card-bg);
            border-radius: 20px;
            padding: 25px 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            margin-bottom: 24px;
        }
        
        .section-title {
            font-family: 'Crimson Text', serif;
            font-size: 22px;
            margin-bottom: 15px;
            color: var(--text-main);
        }
        
        .section-content {
            font-size: 15px;
            color: var(--text-main);
            line-height: 1.8;
        }
        
        .section-content p {
            margin-bottom: 12px;
        }
        
        /* Details List */
        .details-list {
            list-style: none;
            font-size: 14px;
        }
        
        .details-list li {
            padding: 10px 0;
            border-bottom: 1px dashed #f0e1d6;
            display: flex;
        }
        
        .details-list li:last-child {
            border-bottom: none;
        }
        
        .details-list .label {
            font-weight: 600;
            min-width: 150px;
            color: var(--text-main);
        }
        
        .details-list .value {
            color: var(--text-muted);
        }
        
        /* Related Products */
        .related-products {
            margin-top: 40px;
        }
        
        .related-title {
            font-family: 'Crimson Text', serif;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .related-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
        }
        
        .related-card {
            background: #fff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            transition: all 0.2s;
            text-decoration: none;
            color: inherit;
        }
        
        .related-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
        }
        
        .related-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .related-body {
            padding: 14px;
        }
        
        .related-name {
            font-weight: 600;
            font-size: 15px;
            margin-bottom: 6px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .related-price {
            color: var(--accent-dark);
            font-weight: 700;
        }
        
        /* Toast */
        .toast {
            display: none;
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: var(--success);
            color: #fff;
            padding: 15px 25px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            z-index: 9999;
            font-weight: 600;
            animation: slideIn 0.3s ease;
        }
        
        .toast.error {
            background: var(--error);
        }
        
        .toast.show {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        
        @media (max-width: 640px) {
            .product-title {
                font-size: 24px;
            }
            .current-price {
                font-size: 22px;
            }
            .main-image {
                height: 320px;
            }
            .product-actions {
                flex-direction: column;
                align-items: stretch;
            }
            .quantity-group {
                justify-content: center;
            }
            .btn-primary, .btn-secondary {
                justify-content: center;
            }
            .product-card {
                margin: 0 -8px;
                border-radius: 16px;
            }
            .section-card {
                margin: 0 -8px 24px;
                border-radius: 16px;
            }
            .page-wrapper {
                padding: 16px 8px 40px;
            }
            .breadcrumb {
                font-size: 12px;
                flex-wrap: wrap;
            }
            .related-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 12px;
            }
            .related-image {
                height: 150px;
            }
        }
    </style>
</head>

<body id="wandave-theme" class="index">
    <!-- HEADER -->
    <%@ include file="partials/header.jsp" %>
    
    <main>
        <div class="page-wrapper">
            <!-- Breadcrumb -->
            <nav class="breadcrumb">
                <a href="${pageContext.request.contextPath}/view/home.jsp">
                    <i class="fas fa-home"></i> Trang chủ
                </a>
                <span>/</span>
                <a href="${pageContext.request.contextPath}/products">Sản phẩm</a>
                <c:if test="${category != null}">
                    <span>/</span>
                    <a href="${pageContext.request.contextPath}/products/category/${category.slug}">${category.name}</a>
                </c:if>
                <span>/</span>
                <span>${product.name}</span>
            </nav>
            
            <!-- Card chi tiết sản phẩm -->
            <section class="product-card">
                <!-- Ảnh sản phẩm -->
                <div class="product-gallery">
                    <div class="main-image-container">
                        <img id="mainImage" class="main-image" 
                             src="${product.image != null ? product.image : 'https://via.placeholder.com/500x450?text=No+Image'}" 
                             alt="${product.name}"
                             onerror="this.src='https://via.placeholder.com/500x450?text=No+Image'" />
                        
                        <c:if test="${product.featured}">
                            <span class="image-badge">Best Seller</span>
                        </c:if>
                        <c:if test="${product.onSale}">
                            <span class="image-badge sale">-${product.discountPercent}%</span>
                        </c:if>
                        
                        <span class="delivery-badge">
                            <i class="fas fa-truck"></i> Giao trong 2h tại TP.HCM
                        </span>
                    </div>
                    
                    <!-- Thumbnail images -->
                    <c:if test="${product.images != null && not empty product.images}">
                        <div class="thumbnail-list">
                            <img class="thumbnail active" src="${product.image}" alt="Main" onclick="changeImage(this, '${product.image}')" />
                            <!-- More thumbnails would be loaded from product.images JSON -->
                        </div>
                    </c:if>
                </div>
                
                <!-- Thông tin sản phẩm -->
                <div class="product-info">
                    <c:if test="${category != null}">
                        <div class="product-category">${category.name}</div>
                    </c:if>
                    
                    <h1 class="product-title">${product.name}</h1>
                    
                    <p class="product-subtitle">
                        ${product.shortDescription != null ? product.shortDescription : 'Hoa tươi mỗi ngày – Gửi trọn yêu thương tới người bạn thương.'}
                    </p>
                    
                    <div class="product-rating">
                        <div class="stars">★★★★☆</div>
                        <span class="rating-text">4.8/5 · ${product.viewCount} lượt xem</span>
                    </div>
                    
                    <div class="product-price-section">
                        <span class="current-price">
                            <fmt:formatNumber value="${product.displayPrice}" pattern="#,###"/> ₫
                        </span>
                        <c:if test="${product.onSale}">
                            <span class="original-price">
                                <fmt:formatNumber value="${product.price}" pattern="#,###"/> ₫
                            </span>
                            <span class="discount-badge">-${product.discountPercent}%</span>
                        </c:if>
                    </div>
                    
                    <c:if test="${product.description != null}">
                        <p class="product-description">${product.description}</p>
                    </c:if>
                    
                    <div class="product-meta">
                        <div>
                            <strong>Tình trạng:</strong> 
                            <c:choose>
                                <c:when test="${product.inStock}">
                                    <span class="in-stock">
                                        <i class="fas fa-check-circle"></i> Còn hàng (${product.quantity} sản phẩm)
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="out-of-stock">
                                        <i class="fas fa-times-circle"></i> Hết hàng
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div><strong>Mã sản phẩm:</strong> SP${product.id}</div>
                        <div><strong>Đã bán:</strong> ${product.soldCount} sản phẩm</div>
                    </div>
                    
                    <div class="product-tags">
                        <span class="tag">#${product.name}</span>
                        <c:if test="${category != null}">
                            <span class="tag">#${category.name}</span>
                        </c:if>
                        <span class="tag">#Hoa tươi</span>
                        <span class="tag">#Tiệm Hoa nhà tớ</span>
                    </div>
                    
                    <div class="product-actions">
                        <div class="quantity-group">
                            <button type="button" onclick="decreaseQuantity()">−</button>
                            <input type="number" id="quantity" value="1" min="1" max="${product.quantity}" />
                            <button type="button" onclick="increaseQuantity()">+</button>
                        </div>
                        
                        <button class="btn-primary" id="btnAddCart" data-product-id="${product.id}" <c:if test="${!product.inStock}">disabled</c:if>>
                            <i class="fas fa-shopping-cart"></i> Thêm vào giỏ
                        </button>
                        
                        <button class="btn-secondary" id="btnBuyNow" data-product-id="${product.id}" <c:if test="${!product.inStock}">disabled</c:if>>
                            <i class="fas fa-bolt"></i> Mua ngay
                        </button>
                        
                        <button class="btn-wishlist" id="btnWishlist" data-product-id="${product.id}">
                            <i class="far fa-heart"></i>
                        </button>
                    </div>
                    
                    <p class="product-note">
                        <i class="fas fa-info-circle"></i> 
                        Ghi chú mong muốn (màu giấy gói, thiệp kèm lời chúc, thời gian giao...) sẽ được nhập ở bước thanh toán.
                    </p>
                </div>
            </section>
            
            <!-- Mô tả chi tiết -->
            <section class="section-card">
                <h2 class="section-title">
                    <i class="fas fa-file-alt"></i> Mô tả chi tiết
                </h2>
                <div class="section-content">
                    <c:choose>
                        <c:when test="${product.description != null}">
                            <p>${product.description}</p>
                        </c:when>
                        <c:otherwise>
                            <p>Tiệm hoa nhà tớ chọn hoa vào sáng sớm tại chợ, xử lý và bảo quản kỹ để hoa tươi lâu hơn trên tay người nhận.</p>
                            <p>Bó hoa được thiết kế tỉ mỉ với những bông hoa tươi nhất, kết hợp hài hòa với lá phụ và giấy gói cao cấp.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </section>
            
            <!-- Thông tin chi tiết -->
            <section class="section-card">
                <h2 class="section-title">
                    <i class="fas fa-list"></i> Thông tin sản phẩm
                </h2>
                <ul class="details-list">
                    <li>
                        <span class="label">Tên sản phẩm:</span>
                        <span class="value">${product.name}</span>
                    </li>
                    <c:if test="${category != null}">
                        <li>
                            <span class="label">Danh mục:</span>
                            <span class="value">${category.name}</span>
                        </li>
                    </c:if>
                    <li>
                        <span class="label">Giá:</span>
                        <span class="value"><fmt:formatNumber value="${product.displayPrice}" pattern="#,###"/> ₫</span>
                    </li>
                    <li>
                        <span class="label">Tình trạng:</span>
                        <span class="value">${product.inStock ? 'Còn hàng' : 'Hết hàng'}</span>
                    </li>
                    <li>
                        <span class="label">Phù hợp cho:</span>
                        <span class="value">Sinh nhật, kỷ niệm, tỏ tình, tốt nghiệp, chúc mừng</span>
                    </li>
                    <li>
                        <span class="label">Thời gian bảo quản:</span>
                        <span class="value">3-5 ngày (tùy điều kiện nhiệt độ & chăm sóc)</span>
                    </li>
                    <li>
                        <span class="label">Giao hàng:</span>
                        <span class="value">Giao trong 2h tại TP.HCM, các tỉnh khác 1-2 ngày</span>
                    </li>
                </ul>
            </section>
            
            <!-- Sản phẩm liên quan -->
            <c:if test="${relatedProducts != null && not empty relatedProducts}">
                <section class="related-products">
                    <h2 class="related-title">Sản phẩm liên quan</h2>
                    <div class="related-grid">
                        <c:forEach var="related" items="${relatedProducts}">
                            <a href="${pageContext.request.contextPath}/products/${related.slug}" class="related-card">
                                <img class="related-image" 
                                     src="${related.image != null ? related.image : 'https://via.placeholder.com/300x200?text=No+Image'}" 
                                     alt="${related.name}"
                                     onerror="this.src='https://via.placeholder.com/300x200?text=No+Image'" />
                                <div class="related-body">
                                    <h3 class="related-name">${related.name}</h3>
                                    <div class="related-price">
                                        <fmt:formatNumber value="${related.displayPrice}" pattern="#,###"/> ₫
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </section>
            </c:if>
        </div>
    </main>
    
    <!-- FOOTER -->
    <%@ include file="partials/footer.jsp" %>
    
    <!-- Toast Notification -->
    <div id="toast" class="toast">
        <i class="fas fa-check-circle"></i>
        <span id="toastMessage"></span>
    </div>
    
    <script>
        const maxQuantity = <c:out value="${product.quantity > 0 ? product.quantity : 99}"/>;
        
        // Change main image
        function changeImage(thumbnail, imageSrc) {
            document.getElementById('mainImage').src = imageSrc;
            document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
            thumbnail.classList.add('active');
        }
        
        // Quantity controls
        function decreaseQuantity() {
            const input = document.getElementById('quantity');
            if (parseInt(input.value) > 1) {
                input.value = parseInt(input.value) - 1;
            }
        }
        
        function increaseQuantity() {
            const input = document.getElementById('quantity');
            if (parseInt(input.value) < maxQuantity) {
                input.value = parseInt(input.value) + 1;
            }
        }
        
        // Add to cart
        function addToCart(productId) {
            const quantity = parseInt(document.getElementById('quantity').value);
            
            fetch('${pageContext.request.contextPath}/api/cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'productId=' + productId + '&quantity=' + quantity
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showToast('Đã thêm ' + quantity + ' sản phẩm vào giỏ hàng!', 'success');
                    // Update cart count
                    const cartCount = document.querySelector('.cart-count');
                    if (cartCount && data.cartCount) {
                        cartCount.textContent = data.cartCount;
                    }
                } else {
                    if (data.message.includes('đăng nhập')) {
                        if (confirm('Vui lòng đăng nhập để thêm vào giỏ hàng. Đăng nhập ngay?')) {
                            window.location.href = '${pageContext.request.contextPath}/login?redirect=' + encodeURIComponent(window.location.pathname);
                        }
                    } else {
                        showToast(data.message, 'error');
                    }
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra, vui lòng thử lại!', 'error');
            });
        }
        
        // Buy now
        function buyNow(productId) {
            const quantity = parseInt(document.getElementById('quantity').value);
            
            fetch('${pageContext.request.contextPath}/api/cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'productId=' + productId + '&quantity=' + quantity
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    window.location.href = '${pageContext.request.contextPath}/checkout';
                } else {
                    if (data.message.includes('đăng nhập')) {
                        window.location.href = '${pageContext.request.contextPath}/login?redirect=checkout';
                    } else {
                        showToast(data.message, 'error');
                    }
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra!', 'error');
            });
        }
        
        // Toggle wishlist
        function toggleWishlist(productId) {
            showToast('Tính năng yêu thích sẽ sớm ra mắt!', 'info');
        }
        
        // Show toast
        function showToast(message, type = 'success') {
            const toast = document.getElementById('toast');
            const toastMessage = document.getElementById('toastMessage');
            
            toast.className = 'toast show';
            if (type === 'error') {
                toast.classList.add('error');
                toast.querySelector('i').className = 'fas fa-exclamation-circle';
            } else if (type === 'info') {
                toast.style.background = '#3498db';
                toast.querySelector('i').className = 'fas fa-info-circle';
            } else {
                toast.querySelector('i').className = 'fas fa-check-circle';
            }
            
            toastMessage.textContent = message;
            
            setTimeout(() => {
                toast.classList.remove('show');
                toast.classList.remove('error');
                toast.style.background = '';
            }, 3000);
        }
        
        // Validate quantity input
        document.getElementById('quantity').addEventListener('change', function() {
            let val = parseInt(this.value);
            if (isNaN(val) || val < 1) val = 1;
            if (val > maxQuantity) val = maxQuantity;
            this.value = val;
        });
        
        // Button event listeners
        document.getElementById('btnAddCart').addEventListener('click', function() {
            addToCart(this.dataset.productId);
        });
        
        document.getElementById('btnBuyNow').addEventListener('click', function() {
            buyNow(this.dataset.productId);
        });
        
        document.getElementById('btnWishlist').addEventListener('click', function() {
            toggleWishlist(this.dataset.productId);
        });
    </script>
</body>
</html>
