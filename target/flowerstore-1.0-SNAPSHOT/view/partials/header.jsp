<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" class="site-header" style="position: sticky; top: 0; z-index: 9999; background: white;">
    <div id="site-header-center" class="box-shadow-none2">
        <div class="container">
            <div class="row-left-list d-flex d-flex-center">
                <div class=" hidden-lg hidden-md col-xs-3 col-sm-4 d-flex pd-right-0">
                    <button class="btn-menu-mb">
                        Menu <i class="fa-bars-menu" aria-hidden="true"></i><i class="fa-bars-menu"
                            aria-hidden="true"></i><i class="fa-bars-menu" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="logo col-md-2 col-xs-2 col-sm-4 pd-right-0 pd-left-0">
                    <a href="${pageContext.request.contextPath}/home">
                        <img class="dt-width-auto" height="30" width="185"
                            src="${pageContext.request.contextPath}/view/Logo%20Ti%E1%BB%87m%20Hoa.png"
                            alt="Tiệm Hoa Nhà Tớ">
                    </a>
                </div>
                <nav class="col-md-7 hidden-xs hidden-sm pd-right-0">
                    <ul id="menu-desktop" class="menu-desk">
                        <li class="active ">
                            <a href="${pageContext.request.contextPath}/home"> TRANG CHỦ</a>
                        </li>
                        <li class=" ">
                            <a href="${pageContext.request.contextPath}/view/intro.jsp"> GIỚI THIỆU</a>

                        </li>
                          <li class=" ">
                            <a href="${pageContext.request.contextPath}/san-pham"> BỘ SƯU TẬP</a>
                        </li>
                        <li class=" mega-menu">
                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-gia"> HOA GIẢ<i class="fa-chevron-down" aria-hidden="true"></i></a>
                            <div class="mega-menu-wrap">
                                <div class="menu-mega-inner">

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-lua">Hoa Lụa</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-nhua">Hoa Nhựa</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-giay">Hoa Giấy</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-vai">Hoa Vải</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hop-hoa">Hộp Hoa</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </li>
                        <li class=" mega-menu">
                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-tuoi"> HOA TƯƠI<i class="fa-chevron-down"
                                    aria-hidden="true"></i></a>
                            <div class="mega-menu-wrap">
                                <div class="menu-mega-inner">

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=bo-hoa">Bó Hoa</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-tulip">Hoa Tulip</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=binh-hoa">Bình Hoa</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=gio-hoa">Giỏ Hoa</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hop-hoa-tuoi">Hộp Hoa</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-cuoi">Hoa Cưới</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=lan-ho-diep">Lan Hồ Điệp</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-mau-don">Hoa Mẫu Đơn</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=ke-hoa-chuc-mung">Kệ Hoa Chúc Mừng</a>
                                        </div>
                                    </div>

                                    <div class="item-mega-menu">
                                        <div class="hd-title-menu">
                                            <a href="${pageContext.request.contextPath}/san-pham?category=hoa-tot-nghiep">Hoa Tốt Nghiệp</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        </li>
                         <li class=" ">
                            <a href="${pageContext.request.contextPath}/view/tintuc.jsp"> TIN TỨC</a>
                        </li>
                        <li class=" ">
                            <a href="${pageContext.request.contextPath}/contact"> LIÊN HỆ</a>
                        </li>
                    </ul>
                </nav>
                <div class="col-md-3 group-icon-header col-xs-6 col-sm-4 pd-right-0 pd-0-mb">
                    <div class="cart-login-search align-items-center">
                        <ul class="list-inline list-unstyled mb-0">
                            <li class="list-inline-item mr-0">
                                <a href="${pageContext.request.contextPath}/search" class="search js-search-desktop" data-original-title="Tìm kiếm"
                                    data-tooltip="tooltip">
                                    <svg aria-hidden="true" focusable="false" role="presentation"
                                        class="icon icon-search" viewBox="0 0 64 64">
                                        <path
                                            d="M47.16 28.58A18.58 18.58 0 1 1 28.58 10a18.58 18.58 0 0 1 18.58 18.58zM54 54L41.94 42">
                                        </path>
                                    </svg>
                                </a>
                                <div class="header-action_dropdown">
                                    <span class="box-arrow">
                                        <svg viewBox="0 0 20 9" role="presentation">
                                            <path
                                                d="M.47108938 9c.2694725-.26871321.57077721-.56867841.90388257-.89986354C3.12384116 6.36134886 5.74788116 3.76338565 9.2467995.30653888c.4145057-.4095171 1.0844277-.40860098 1.4977971.00205122L19.4935156 9H.47108938z"
                                                fill="#ffffff"></path>
                                        </svg>
                                    </span>
                                    <div class="header-dropdown_content">
                                        <p class="title-search">Tìm kiếm</p>
                                        <div class="site_search">
                                            <form action="${pageContext.request.contextPath}/search" class="wanda-mxm-search" method="get">
                                                <div class="search-inner">
                                                    <input name="q" autocomplete="off"
                                                        class="searchinput input-search search-input" type="text"
                                                        id="header-search-input"
                                                        size="20" placeholder="Tìm kiếm sản phẩm..."
                                                        aria-label="Search">
                                                </div>
                                                <button type="submit" class="btn-search" id="search-header-btn"
                                                    aria-label="Tìm kiếm">
                                                    <img width="24" height="24"
                                                        src="//cdn.hstatic.net/themes/200000846175/1001403720/14/searcg-icon.svg?v=245"
                                                        alt="Tìm kiếm">
                                                </button>
                                            </form>
                                            <div id="wanda-smart-search" class="smart-search-wrapper ajaxSearchResults">
                                                <div class="results-seach" id="live-search-results">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-inline-item mr-0 account-header-mobile">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        <!-- Đã đăng nhập - Hiển thị tên người dùng -->
                                        <a href="${pageContext.request.contextPath}/view/settingProfile.jsp" class="login" 
                                           style="display: flex; align-items: center; text-decoration: none;">
                                            <svg aria-hidden="true" focusable="false" role="presentation" class="icon icon-user"
                                                viewBox="0 0 64 64">
                                                <path
                                                    d="M35 39.84v-2.53c3.3-1.91 6-6.66 6-11.41 0-7.63 0-13.82-9-13.82s-9 6.19-9 13.82c0 4.75 2.7 9.51 6 11.41v2.53c-10.18.85-18 6-18 12.16h42c0-6.19-7.82-11.31-18-12.16z">
                                                </path>
                                            </svg>
                                            <span style="font-size: 13px; margin-left: 5px; color: #333; max-width: 100px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                ${sessionScope.user.fullname}
                                            </span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Chưa đăng nhập -->
                                        <a href="${pageContext.request.contextPath}/view/login_1.jsp" data-original-title="Đăng nhập" class="login"
                                            data-tooltip="tooltip">
                                            <svg aria-hidden="true" focusable="false" role="presentation" class="icon icon-user"
                                                viewBox="0 0 64 64">
                                                <path
                                                    d="M35 39.84v-2.53c3.3-1.91 6-6.66 6-11.41 0-7.63 0-13.82-9-13.82s-9 6.19-9 13.82c0 4.75 2.7 9.51 6 11.41v2.53c-10.18.85-18 6-18 12.16h42c0-6.19-7.82-11.31-18-12.16z">
                                                </path>
                                            </svg>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li class="list-inline-item mr-0">
                                <a href="${pageContext.request.contextPath}/view/cart.jsp" class="cart js-call-minicart" data-original-title="Giỏ hàng"
                                    data-tooltip="tooltip">
                                    <svg aria-hidden="true" focusable="false" role="presentation"
                                        class="icon icon-bag-minimal" viewBox="0 0 64 64">
                                        <path stroke="null" id="svg_4" fill-opacity="null" stroke-opacity="null"
                                            fill="null" d="M11.375 17.863h41.25v36.75h-41.25z"></path>
                                        <path stroke="null" id="svg_2"
                                            d="M22.25 18c0-7.105 4.35-9 9.75-9s9.75 1.895 9.75 9"></path>
                                    </svg>
                                    <span class="js-number-cart number-cart"></span>
                                </a>
                            </li>
                            <li class="list-inline-item mr-0 hidden-xs hidden-sm" style="width: auto;">
                                <div class="header-action_lang">
                                    <div class="header-action_text">
                                        <ul class="list-lang">

                                        </ul>
                                    </div>
                                </div>

                                <style>
                                    #goog-gt-tt {
                                        display: none !important;
                                    }

                                    .goog-te-banner-frame {
                                        display: none !important;
                                    }

                                    .goog-te-menu-value:hover {
                                        text-decoration: none !important;
                                    }

                                    #google_translate_element,
                                    .skiptranslate {
                                        display: none !important;
                                    }

                                    a.gflag {
                                        vertical-align: middle;
                                        font-size: 0px;
                                        display: inline-block;
                                        padding: 0;
                                        transform: translateY(2px);
                                        background-repeat: no-repeat;
                                        background-image: url(//gtranslate.net/flags/24.png);
                                    }

                                    @media(max-width: 480px) {
                                        a.gflag {
                                            transform: translateY(2px);
                                            margin-right: 0;
                                            width: 24px;
                                        }
                                    }

                                    a.gflag img {
                                        border: 0;
                                    }

                                    a.gflag:hover {
                                        background-image: url(//gtranslate.net/flags/24a.png);
                                    }

                                    #goog-gt-tt {
                                        display: none !important;
                                    }

                                    .goog-te-banner-frame {
                                        display: none !important;
                                    }

                                    .goog-te-menu-value:hover {
                                        text-decoration: none !important;
                                    }

                                    body {
                                        top: 0 !important;
                                    }
                                </style>
                                
                                <script type="text/javascript">
                                    function googleTranslateElementInit() {
                                        new google.translate.TranslateElement({ pageLanguage: 'vi', autoDisplay: false }, 'google_translate_element');
                                        if ($('circle[stroke-width="6"][stroke-linecap="round"]').length > 0) {
                                            $('circle[stroke-width="6"][stroke-linecap="round"]').parent().parent().parent().hide();
                                        }
                                    }
                                </script>
                                <script type="text/javascript"
                                    src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                                <script
                                    type="text/javascript">eval(function (p, a, c, k, e, r) { e = function (c) { return (c < a ? '' : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36)) }; if (!''.replace(/^/, String)) { while (c--) r[e(c)] = k[c] || e(c); k = [function (e) { return r[e] }]; e = function () { return '\\w+' }; c = 1 }; while (c--) if (k[c]) p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]); return p }('6 7(a,b){n{4(2.9){3 c=2.9("o");c.p(b,f,f);a.q(c)}g{3 c=2.r();a.s(\'t\'+b,c)}}u(e){}}6 h(a){4(a.8)a=a.8;4(a==\'\')v;3 b=a.w(\'|\')[1];3 c;3 d=2.x(\'y\');z(3 i=0;i<d.5;i++)4(d[i].A==\'B-C-D\')c=d[i];4(2.j(\'k\')==E||2.j(\'k\').l.5==0||c.5==0||c.l.5==0){F(6(){h(a)},G)}g{c.8=b;7(c,\'m\');7(c,\'m\')}}', 43, 43, '||document|var|if|length|function|GTranslateFireEvent|value|createEvent||||||true|else|doGTranslate||getElementById|google_translate_element|innerHTML|change|try|HTMLEvents|initEvent|dispatchEvent|createEventObject|fireEvent|on|catch|return|split|getElementsByTagName|select|for|className|goog|te|combo|null|setTimeout|500'.split('|'), 0, {}))</script>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Live Search Script -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('header-search-input');
        const resultsContainer = document.getElementById('live-search-results');
        let searchTimeout;
        
        if (searchInput && resultsContainer) {
            searchInput.addEventListener('input', function() {
                const query = this.value.trim();
                
                clearTimeout(searchTimeout);
                
                if (query.length < 2) {
                    resultsContainer.innerHTML = '';
                    return;
                }
                
                searchTimeout = setTimeout(function() {
                    fetch('${pageContext.request.contextPath}/api/search?q=' + encodeURIComponent(query))
                        .then(response => response.json())
                        .then(data => {
                            if (data.success && data.products && data.products.length > 0) {
                                let html = '<div class="live-search-results-inner">';
                                data.products.forEach(function(product) {
                                    const price = product.discountPrice && product.discountPrice > 0 
                                        ? product.discountPrice 
                                        : product.price;
                                    const formattedPrice = new Intl.NumberFormat('vi-VN').format(price) + 'đ';
                                    
                                    html += '<a href="${pageContext.request.contextPath}/products/' + product.slug + '" class="search-result-item">';
                                    html += '<div class="search-result-image">';
                                    html += '<img src="' + (product.image || 'https://via.placeholder.com/60x60') + '" alt="' + product.name + '">';
                                    html += '</div>';
                                    html += '<div class="search-result-info">';
                                    html += '<div class="search-result-name">' + product.name + '</div>';
                                    html += '<div class="search-result-price">' + formattedPrice + '</div>';
                                    html += '</div>';
                                    html += '</a>';
                                });
                                html += '<a href="${pageContext.request.contextPath}/search?q=' + encodeURIComponent(query) + '" class="search-view-all">';
                                html += 'Xem tất cả kết quả <i class="fas fa-arrow-right"></i>';
                                html += '</a>';
                                html += '</div>';
                                resultsContainer.innerHTML = html;
                            } else {
                                resultsContainer.innerHTML = '<div class="search-no-results">Không tìm thấy sản phẩm nào</div>';
                            }
                        })
                        .catch(error => {
                            console.error('Search error:', error);
                            resultsContainer.innerHTML = '';
                        });
                }, 300);
            });
            
            // Hide results when clicking outside
            document.addEventListener('click', function(e) {
                if (!e.target.closest('.site_search')) {
                    resultsContainer.innerHTML = '';
                }
            });
        }
    });
    </script>
    
    <style>
    /* Live Search Styles */
    .live-search-results-inner {
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.15);
        max-height: 400px;
        overflow-y: auto;
    }
    
    .search-result-item {
        display: flex;
        align-items: center;
        padding: 10px 15px;
        text-decoration: none;
        border-bottom: 1px solid #f0f0f0;
        transition: background 0.2s;
    }
    
    .search-result-item:hover {
        background: #faf5ef;
    }
    
    .search-result-image {
        width: 50px;
        height: 50px;
        flex-shrink: 0;
        margin-right: 12px;
        border-radius: 8px;
        overflow: hidden;
    }
    
    .search-result-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    
    .search-result-info {
        flex: 1;
        min-width: 0;
    }
    
    .search-result-name {
        color: #3c2922;
        font-size: 14px;
        font-weight: 600;
        line-height: 1.3;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    
    .search-result-price {
        color: #c99366;
        font-size: 13px;
        font-weight: 700;
        margin-top: 2px;
    }
    
    .search-view-all {
        display: block;
        text-align: center;
        padding: 12px;
        color: #c99366;
        font-weight: 600;
        text-decoration: none;
        border-top: 1px solid #f0f0f0;
        transition: background 0.2s;
    }
    
    .search-view-all:hover {
        background: #faf5ef;
        color: #aa6a3f;
    }
    
    .search-no-results {
        padding: 20px;
        text-align: center;
        color: #6c5845;
        font-style: italic;
    }
    
    /* Smooth scroll effect */
    html {
        scroll-behavior: smooth;
    }
    </style>
    
    <script>
    // Sticky header with shadow on scroll
    document.addEventListener('DOMContentLoaded', function() {
        const header = document.querySelector('header');
        let lastScroll = 0;
        
        window.addEventListener('scroll', function() {
            const currentScroll = window.pageYOffset;
            
            if (currentScroll > 100) {
                header.style.boxShadow = '0 4px 20px rgba(0,0,0,0.15)';
            } else {
                header.style.boxShadow = 'none';
            }
            
            lastScroll = currentScroll;
        });
    });
    </script>
</header>