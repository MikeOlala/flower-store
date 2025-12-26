<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="en">

<head>

  <meta charset="UTF-8">



  <title>Tiệm Hoa nhÃ  tớ</title>



  <!-- Font Awesome 6 (há»— trá»£ toÃ n bá»™ icon má»›i) -->

  <!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">-->



  <!-- Custom CSS -->



  <style>

    :root {

      /*--bg-soldout: url(//cdn.hstatic.net/themes/200000846175/1001403720/14/hethang.png?v=245);*/

      --bgshop: #000000;

      --colorshop: #000000;

      --colorshophover: #212020;

      --bgfooter: #ffffff;

      --colorfooter: #000000;

      --colorbgmenumb: #ffffff;

      --colortextmenumb: #000000;

      --height-head: 72px;

    }

  </style>



  <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/plugin-style.css?v=245" rel="preload stylesheet"

     as="style" type="text/css">

  <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/styles-new.scss.css?v=245" rel="preload stylesheet"

     as="style" type="text/css">

  <!--  <link rel="preload" as="image" href="//cdn.hstatic.net/themes/200000846175/1001403720/14/logo.png?v=245">-->

  <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/styles-index.scss.css?v=245"

     rel="preload stylesheet" as="style" type="text/css">

  <link rel="preload" as="image"

     href="//cdn.hstatic.net/themes/200000846175/1001403720/14/slideshow_1_mob_large.jpg?v=245"

     media="(max-width: 480px)">

  <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/jquery-script.js?v=245" rel="preload" as="script"

     type="text/javascript">

  <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/main-scripts.js?v=245" rel="preload" as="script"

     type="text/javascript">

  <script src="https://cdn.tailwindcss.com"></script>

  <script type="text/javascript"

      src="//cdn.hstatic.net/themes/200000846175/1001403720/14/jquery-script.js?v=245"></script>

  <!-- Tất cả biáº¿n khá»Ÿi táº¡o, check sá»­ dá»¥ng-->

  <script>

    localStorage.setItem('shop_id', 'themes/200000846175/1001403720');

    const tbag_varible = {

      template: 'index',

      navLeftText: '<button class="slick-prev slick-arrow custom-style" aria-label="Previous"><span class="arrow-custom arrow-left"><div class="arrow-top"></div><div class="arrow-bottom"></div></span></button>',

      navRightText: '<button class="slick-next slick-arrow custom-style" aria-label="Next"><span class="arrow-custom arrow-right"><div class="arrow-top"></div><div class="arrow-bottom"></div></span></button>',

      checklocation: "false",

      checkproducthot: "true",

      checkproductrelated: "true",

      checkproductseen: "false",

      heartactive: "//cdn.hstatic.net/themes/200000846175/1001403720/14/heart-fill.svg?v=245",

      addtocart: "//cdn.hstatic.net/themes/200000846175/1001403720/14/add-to-cart.svg?v=245",

      heart: "//cdn.hstatic.net/themes/200000846175/1001403720/14/heart.svg?v=245",

      sgnotify: "false",

      recaptchajs: "https://www.google.com/recaptcha/api.js?render=6LdD18MUAAAAAHqKl3Avv8W-tREL6LangePxQLM-",

      jsonmap: "https://file.hstatic.net/200000397757/file/hethongcuahang_f1ee212eddc04706b09d43518b50a964.json",

      typepaginate: "default",

      typeimage: false,

      trash: "//cdn.hstatic.net/themes/200000846175/1001403720/14/trash.svg?v=245",

      cancel: "//cdn.hstatic.net/themes/200000846175/1001403720/14/cancel.svg?v=245",

      productjson: { "error": "json not allowed for this object" },

      producthandle: "",

      typerelated: "type",

      vendorurl: "/collections/vendors?q=&view=related-product",

      typeurl: "/collections/types?q=&view=related-product",

      sortbydefault: ""

    }

    const formatMoney = '{{amount}} VND', _0x2c0xa = ["\x43\x68\x72\x6F\x6D\x65\x2D\x4C\x69\x67\x68\x74\x68\x6F\x75\x73\x65", "\x69\x6E\x64\x65\x78\x4F\x66", "\x75\x73\x65\x72\x41\x67\x65\x6E\x74", "\x6C\x6F\x61\x64"];

    function getScriptCcd(url, callback) { $.ajax({ type: "GET", url: url, success: callback, dataType: "script", cache: true }); }

    function getdatasite(url, callback, slider) { $.ajax({ type: "GET", url: url, success: function (data) { callback.html(data) } }).done(() => { slider == 'true' ? Wanda.slidercallback() : '' }); }

    if (navigator[_0x2c0xa[2]][_0x2c0xa[1]](_0x2c0xa[0]) == -1) {

      $(function () {

        const resultcss = `<link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/render-after.scss.css?v=245" rel="preload stylesheet" as="style" type="text/css"><link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/owl-carousel_modal.css?v=245" rel="preload stylesheet" as="style" type="text/css">`;

        $('head').append(resultcss);

      });

      $(window).load(() => { getScriptCcd(tbag_varible.recaptchajs); })

    }

    if ((typeof Haravan) === 'undefined') { Haravan = {}; }

  </script>



  <script defer src='https://stats.hstatic.net/beacon.min.js' hrv-beacon-t='200000846175'></script>

  <style>

    .grecaptcha-badge {

      visibility: hidden;

    }

  </style>



  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

  <script defer src="components.js"></script>

  <link rel="stylesheet" href="../assets/profileCustomer.css">



</head>

<body>

<site-header></site-header>

<div class="page-wrap">



  <!-- TAB RADIO -->

  <input type="radio" name="tab" id="tab-profile" checked>

  <input type="radio" name="tab" id="tab-orders">

  <input type="radio" name="tab" id="tab-address">

  <input type="radio" name="tab" id="tab-linked">

<!--  <input type="radio" name="tab" id="tab-settings">-->



  <div class="container">



    <!-- SIDEBAR -->

    <aside class="sidebar">

      <div class="author-card">

        <div class="author-avatar">

          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGg7EJlJgT04LtZYl6BCefIUOeQSX6waPQmA&s" alt="avatar">

        </div>

        <strong>MikeOlala</strong>

      </div>



      <nav class="menu">

        <label for="tab-profile" class="menu-item">ThÃ´ng tin ngÆ°á»i dÃ¹ng</label>

        <label for="tab-orders" class="menu-item">Lá»‹ch sá»­ mua hÃ ng</label>

        <label for="tab-address" class="menu-item">Äá»‹a chá»‰</label>

        <label for="tab-linked" class="menu-item">TÃ i khoáº£n LiÃªn káº¿t</label>

<!--        <label for="tab-settings" class="menu-item">CÃ i Ä‘áº·t</label>-->

      </nav>

    </aside>



    <!-- MAIN CONTENT -->

    <main class="main">



      <!-- ========== TAB PROFILE ========== -->

      <section class="content-section profile-section">





        <div class="card profile-card">

          <h2 class="section-title">ThÃ´ng tin khách hÃ ng</h2>



          <div class="avatar-row">

            <img class="avatar-lg"

               src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGg7EJlJgT04LtZYl6BCefIUOeQSX6waPQmA&s"

               alt="avatar">



            <label class="btn upload-btn">

              Chá»n áº£nh

              <input type="file" accept="image/*" hidden>

            </label>



            <button class="btn btn-primary btn-update-avatar">

              Cáº­p nháº­t avatar

            </button>

          </div>



          <form class="profile-form" onsubmit="return false;">



            <label class="field-label">Há» tÃªn</label>

            <input class="field-input" type="text" value="MikeOlala">



            <label class="field-label">Email</label>

            <input class="field-input" type="email" value="mike@gmail.com">



            <label class="field-label">Sá»‘ Ä‘iá»‡n thoáº¡i</label>

            <input class="field-input" type="tel" value="0123 456 789">



            <label class="field-label">Äá»‹a chá»‰ máº·c Ä‘á»‹nh</label>

            <input class="field-input" type="text" value="ThÃ nh phá»‘ Há»“ ChÃ­ Minh">



            <div style="margin-top:10px;">

              <button class="btn btn-primary">LÆ°u thÃ´ng tin</button>

            </div>

          </form>



        </div>

      </section>



      <!-- ========== TAB ORDERS ========== -->

      <section class="content-section orders-section">



        <div class="card">

          <h2 class="section-title">Lá»‹ch sá»­ mua hÃ ng</h2>

          <h3>Lá»‹ch sá»­ mua hÃ ng</h3>



          <!-- Bá»™ lá»c -->

          <div class="filter-bar">

            <label for="statusFilter">Lá»c theo tráº¡ng thÃ¡i:</label>

            <select id="statusFilter">

              <option selected>Tất cả</option>

              <option>ÄÃ£ giao</option>

              <option>Äang giao</option>

              <option>ÄÃ£ há»§y</option>

            </select>

          </div>



          <!-- Danh sÃ¡ch Ä‘Æ¡n hÃ ng -->

          <div class="order-card">

            <div class="order-left">

              <img src="img\hoa 1.jpg" alt="Bó hoa Whimsy well" class="order-img">

              <div class="order-info">

                <div class="order-name">Bó hoa Whimsy well</div>

                <div class="order-price">910.000 VND</div>

                <div class="order-status shipping">Tráº¡ng thÃ¡i: Äang giao</div>

              </div>

            </div>

            <div class="order-date">

              <small>NgÃ y Ä‘áº·t: 30/10/2025</small>

            </div>

          </div>



          <div class="order-card">

            <div class="order-left">

              <img src="img\giờ hoa.jpg" alt="Giá» hoa Bliss charm" class="order-img">

              <div class="order-info">

                <div class="order-name">Giá» hoa Bliss charm</div>

                <div class="order-price">1.450.000 VND</div>

                <div class="order-status delivered">Tráº¡ng thÃ¡i: ÄÃ£ giao</div>

              </div>

            </div>

            <div class="order-date">

              <small>NgÃ y Ä‘áº·t: 20/10/2025</small>

            </div>

          </div>



          <div class="order-card">

            <div class="order-left">

              <img src="img\hoa 2.jpg"alt="Hoa Tulip Everelle" class="order-img">

              <div class="order-info">

                <div class="order-name">Hoa Tulip Everelle</div>

                <div class="order-price">1.880.500 VND</div>

                <div class="order-status delivered">Tráº¡ng thÃ¡i: ÄÃ£ giao</div>

              </div>

            </div>

            <div class="order-date">

              <small>NgÃ y Ä‘áº·t: 31/10/2025</small>

            </div>

          </div>

        </div>

        <style>

          /* Content */

          .content {

            flex: 1;

            background: linear-gradient(180deg, #fff7f0 0%, #fffdfb 100%);

            border-radius: 16px;

            padding: 25px 28px;

            box-shadow: 0 4px 20px rgba(0,0,0,0.05);

            color: #4b2e05;

          }



          .content h3 {

            margin-bottom: 15px;

            color: #5a2e0c;

          }



          /* Filter bar */

          .filter-bar {

            margin-bottom: 25px;

            display: flex;

            align-items: center;

            gap: 8px;

            font-weight: 500;

            color: #5a2e0c;

          }

          .filter-bar select {

            padding: 6px 12px;

            border-radius: 10px;

            border: 1px solid #e3c7a6;

            background-color: #fff7f0;

            cursor: pointer;

            color: #4b2e05;

            font-weight: 500;

            transition: 0.3s;

          }

          .filter-bar select:hover {

            background-color: #fff2e7;

          }



          /* Order Card */

          .order-card {

            background-color: #fffdfb;

            border-radius: 14px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-bottom: 18px;

            box-shadow: 0 4px 12px rgba(0,0,0,0.06);

            transition: 0.25s;

            padding: 14px 20px;

            border: 1px solid #f3e1d2;

          }

          .order-card:hover {

            transform: translateY(-3px);

            background: #fff7f0;

            box-shadow: 0 6px 16px rgba(0,0,0,0.1);

          }

          .order-left {

            display: flex;

            align-items: center;

            gap: 15px;

          }

          .order-img {

            width: 90px;

            height: 90px;

            border-radius: 10px;

            object-fit: cover;

            border: 2px solid #f1d2b5;

          }

          .order-info {

            display: flex;

            flex-direction: column;

            line-height: 1.6;

          }

          .order-name {

            font-weight: 600;

            color: #4b2e05;

          }

          .order-price {

            font-size: 16px;

            font-weight: 500;

            color: #6a3f1e;

          }

          .order-status {

            font-weight: 600;

            font-size: 14px;

          }

          .order-status.delivered { color: #1b7d2a; }

          .order-status.shipping { color: #e58b0b; }

          .order-status.cancelled { color: #c44c2b; }



          /* NgÃ y Ä‘áº·t */

          .order-date small {

            color: #7c5b42;

            font-weight: 500;

          }



          /* ---------- Responsive ---------- */

          @media (max-width: 992px) {

            .main-container {

              flex-direction: column;

              max-width: 95%;

            }



            .sidebar {

              width: 100%;

              order: 2;

              margin-top: 20px;

            }



            .content {

              width: 100%;

              order: 1;

            }



            .order-card {

              flex-direction: column;

              align-items: flex-start;

              gap: 10px;

            }



            .order-left {

              flex-direction: row;

              width: 100%;

            }



            .order-date {

              align-self: flex-end;

            }



            .filter-bar {

              flex-wrap: wrap;

              gap: 10px;

            }



            .sidebar-avatar {

              width: 85px;

              height: 85px;

            }

          }



        </style>

      </section>



      <!-- ========== TAB ADDRESS ========== -->

      <section class="content-section address-section">



        <div class="card">

          <h2 class="section-title">Äá»‹a chá»‰ giao hÃ ng</h2>

          <!-- Content -->

            <!-- Form nháº­p Ä‘á»‹a chá»‰ -->

            <form class="address-form">

              <div class="form-row">

                <div class="form-group">

                  <input type="text" id="fullname" required>

                  <label for="fullname">Há» vÃ  tÃªn</label>

                </div>

                <div class="form-group">

                  <input type="tel" id="phone" required>

                  <label for="phone">Sá»‘ Ä‘iá»‡n thoáº¡i</label>

                </div>

              </div>



              <div class="form-group">

                <input type="text" id="address" required>

                <label for="address">Äá»‹a chá»‰ cá»¥ thể</label>

              </div>



              <div class="form-row">

                <div class="form-group">

                  <input type="text" id="city" required>

                  <label for="city">ThÃ nh phá»‘ / Tá»‰nh</label>

                </div>

                <div class="form-group">

                  <input type="text" id="district" required>

                  <label for="district">Quáº­n / Huyá»‡n</label>

                </div>

              </div>



              <div class="form-group">

                <textarea id="note" rows="3"></textarea>

                <label for="note">Ghi chÃº</label>

              </div>



              <div class="text-end">

                <button type="button" class="btn btn-brown" disabled>LÆ°u Ä‘á»‹a chá»‰</button>

              </div>

            </form>







            <!-- Danh sÃ¡ch Ä‘á»‹a chá»‰ Ä‘Ã£ lÆ°u (tÄ©nh) -->

            <div id="savedAddresses" class="mt-4">

              <h5 class="text-brown mb-3">Äá»‹a chá»‰ Ä‘Ã£ lÆ°u</h5>



              <div class="order-card">

                <div>

                  <strong class="order-name">Nguyá»…n VÄƒn A</strong><br>

                  <span class="order-price">ðŸ“ž 0987654321</span><br>

                  <span>123 LÃª Lá»£i, P. Báº¿n NghÃ©, Q.1, TP. Há»“ ChÃ­ Minh</span><br>

                  <small class="text-muted">Nháº­n hÃ ng buá»•i sÃ¡ng</small>

                </div>

                <button class="btn btn-sm btn-outline-danger" disabled>

                  <i class="bi bi-trash"></i>

                </button>

              </div>



              <div class="order-card">

                <div>

                  <strong class="order-name">Tráº§n Thá»‹ B</strong><br>

                  <span class="order-price">ðŸ“ž 0901122334</span><br>

                  <span>45 Tráº§n HÆ°ng Äáº¡o, P.2, TP. VÅ©ng TÃ u</span><br>

                  <small class="text-muted">Giao ngoÃ i giờ hÃ nh chÃ­nh</small>

                </div>

                <button class="btn btn-sm btn-outline-danger" disabled>

                  <i class="bi bi-trash"></i>

                </button>

              </div>

            </div>

        </div>

        <style>

          /* ======= Ná»™i dung chÃ­nh ======= */

          .content {

            flex: 1;

            background: linear-gradient(180deg, #fff4eb 0%, #fff4eb 100%);

            border-radius: 16px;

            padding: 25px 28px;

            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);

          }



          .content h3 {

            margin-bottom: 20px;

            color: #5a2e0c;

            font-weight: 700;

          }



          /* ======= FORM FLEXBOX ======= */

          /* ======= FORM FLEXBOX CÃ‚N Äá»I HÆ N ======= */

          /* ======= FORM FLEXBOX (LABEL Gáº¦N CHá»® HÆ N) ======= */

          .form-group {

            flex: 1;

            position: relative;

            display: flex;

            flex-direction: column-reverse;

            margin-bottom: 16px;

          }



          /* Ã” nháº­p liá»‡u */

          .form-group input,

          .form-group textarea {

            font-size: 15px;

            color: #4b2e05;

            background: #fff7f0;

            border: 1px solid #e3c7a6;

            border-radius: 10px;

            padding: 10px 10px 8px 10px; /* giáº£m khoáº£ng cách trÃªn dÆ°á»›i Ä‘á»ƒ label gáº§n hÆ¡n */

            transition: all 0.25s ease;

            width: 100%;

            z-index: 1;

            line-height: 1.4;

          }



          /* Hover vÃ  Focus */

          .form-group input:hover,

          .form-group textarea:hover {

            background-color: #fffdfb;

            box-shadow: 0 0 6px rgba(219, 167, 123, 0.2);

            border-color: #dba77b;

          }



          .form-group input:focus,

          .form-group textarea:focus {

            outline: none;

            border-color: #dba77b;

            background-color: #fffdfb;

            box-shadow: 0 0 0 0.2rem rgba(219, 167, 123, 0.25);

          }



          /* Label */

          .form-group label {

            color: #7a5b3a;

            font-size: 15px;

            margin-bottom: 1px;    /* label gáº§n sÃ¡t chá»¯ nháº­p */

            transform: translateY(0);

            transition: all 0.2s ease;

            pointer-events: none;

            background-color: transparent;

            padding-left: 3px;

          }



          /* Khi ngÆ°á»i dÃ¹ng focus hhoặc cÃ³ ná»™i dung */

          .form-group input:focus + label,

          .form-group input:not(:placeholder-shown) + label,

          .form-group textarea:focus + label,

          .form-group textarea:not(:placeholder-shown) + label {

            transform: translateY(-11px); /* háº¡ tháº¥p label khi ná»•i lÃªn Ä‘á»ƒ cÃ¢n Ä‘á»‘i hÆ¡n */

            font-size: 13px;

            color: #a05d2f;

            background: #fffdfb;

            padding: 0 5px;

            align-self: flex-start;

            margin-left: 8px;

            letter-spacing: 0.1px;

          }



          /* Textarea cao hÆ¡n một chÃºt */

          textarea {

            resize: none;

            min-height: 90px;

          }



          /* ======= NÃºt ======= */

          .btn-brown {

            background-color: #a05d2f;

            color: #fff;

            border-radius: 10px;

            padding: 8px 22px;

            font-weight: 500;

            transition: all 0.3s ease;

            border: none;

          }



          .btn-brown:hover {

            background-color: #8b4f28;

            box-shadow: 0 0 10px rgba(160, 93, 47, 0.4);

            transform: translateY(-2px);

          }



          .btn-outline-brown {

            border: 1px solid #a05d2f;

            color: #a05d2f;

            border-radius: 10px;

            padding: 6px 18px;

            font-weight: 500;

            transition: all 0.3s ease;

            background-color: transparent;

          }



          .btn-outline-brown:hover {

            background-color: #a05d2f;

            color: #fffdfb;

            box-shadow: 0 0 8px rgba(160, 93, 47, 0.3);

            transform: translateY(-1px);

          }



          .btn-outline-danger {

            border: 1px solid #d98963;

            color: #a05d2f;

            border-radius: 8px;

            transition: 0.3s;

          }



          .btn-outline-danger:hover {

            background-color: #f9e0ca;

            color: #7a3a18;

            border-color: #c06c37;

          }



          /* ======= Danh sÃ¡ch Ä‘á»‹a chá»‰ ======= */

          #savedAddresses {

            background: linear-gradient(180deg, #fff7f0 0%, #fffdfb 100%);

            border-radius: 16px;

            padding: 20px 25px;

            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);

            transition: 0.3s;

          }



          #savedAddresses:hover {

            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.07);

          }



          #savedAddresses h5 {

            color: #5a2e0c;

            margin-bottom: 15px;

            font-weight: 600;

          }



          /* Card Ä‘á»‹a chá»‰ */

          .order-card {

            background-color: #fffdfb;

            border-radius: 14px;

            display: flex;

            justify-content: space-between;

            align-items: flex-start;

            padding: 14px 18px;

            margin-bottom: 16px;

            border: 1px solid #f3e1d2;

            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);

            transition: all 0.3s ease;

          }



          .order-card:hover {

            transform: translateY(-3px);

            background-color: #fff7f0;

            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);

          }



          /* Fix chá»¯ bá»‹ chÃ¬m */

          .order-card,

          .order-card * {

            color: #4b2e05 !important;

          }



          .order-name {

            color: #4b2e05;

            font-weight: 600;

            font-size: 16px;

          }



          .order-price {

            color: #6a3f1e;

            font-size: 15px;

          }

        </style>

      </section>



      <!-- ========== TAB LINKED ========== -->

      <section class="content-section linked-section">



        <div class="card">

<!--          <h2 class="section-title">LiÃªn káº¿t tÃ i khoáº£n</h2>-->

          <!-- Main content -->

<!--            <div class="main-card">-->

              <h3 class="title">TÃ i khoáº£n liÃªn káº¿t</h3>

              <p class="desc">Quáº£n lÃ½ vÃ  káº¿t ná»‘i các vÃ­ Ä‘iá»‡n tá»­, ngÃ¢n hÃ ng Ä‘á»ƒ thanh toÃ¡n dá»… dÃ ng hÆ¡n</p>



              <div class="account-list">

                <!-- NgÃ¢n hÃ ng -->

                <div class="linked-item">

                  <div class="left">

                    <i class="bi bi-bank icon-bank"></i>

                    <div class="link-name">LiÃªn káº¿t NgÃ¢n hÃ ng</div>

                  </div>

                  <div class="status linked">ÄÃ£ liÃªn káº¿t</div>

                </div>



                <!-- MoMo -->

                <div class="linked-item">

                  <div class="left">

                    <img src="img/MOMO-Logo-App.png" alt="MoMo" class="icon">

                    <div class="link-name">VÃ­ MoMo</div>

                  </div>

                  <div class="status not-linked">ChÆ°a liÃªn káº¿t</div>

                </div>



                <!-- ZaloPay -->

                <div class="linked-item">

                  <div class="left">

                    <img src="img/Logo FA-13.png" alt="ZaloPay" class="icon">

                    <div class="link-name">ZaloPay</div>

                  </div>

                  <div class="status linked">ÄÃ£ liÃªn káº¿t</div>

                </div>



                <!-- ViettelPay -->

                <div class="linked-item">

                  <div class="left">

                    <img src="img/Logo-Viettelpay.jpg" alt="ViettelPay" class="icon">

                    <div class="link-name">ViettelPay</div>

                  </div>

                  <div class="status not-linked">ChÆ°a liÃªn káº¿t</div>

                </div>

              </div>

<!--            </div>-->



        </div>

        <style>

          /* ==== Main content ==== */

          .main-content {

            flex: 2;

            min-width: 400px;

          }

          .main-card {

            background: #fffefc;

            border-radius: 20px;

            padding: 28px;

            box-shadow: 0 6px 18px rgba(0,0,0,0.05);

          }

          .title {

            color: #a05d2f;

            margin-bottom: 4px;

          }

          .desc {

            color: #7a5a3a;

            margin-bottom: 24px;

          }



          /* ==== Account list ==== */

          .account-list {

            display: flex;

            flex-direction: column;

            gap: 16px;

          }

          .linked-item {

            background: #fff;

            border-radius: 14px;

            padding: 16px 20px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);

            transition: all 0.25s ease;

            cursor: default;

          }

          .linked-item:hover {

            background-color: #fff1e6;

            transform: translateY(-2px);

          }

          .left {

            display: flex;

            align-items: center;

            gap: 14px;

          }

          .icon {

            width: 48px;

            height: 48px;

            border-radius: 12px;

            object-fit: contain;

            background: #fff;

          }

          .icon-bank {

            font-size: 32px;

            color: #a05d2f;

          }

          .link-name {

            font-weight: 600;

            font-size: 1.05rem;

          }

          .status {

            font-weight: 600;

            font-size: 0.95rem;

          }

          .status.linked {

            color: #1b7d2a;

          }

          .status.not-linked {

            color: #a05d2f;

          }



          /* ==== Responsive ==== */

          @media (max-width: 768px) {

            .link-wrapper {

              flex-direction: column;

              align-items: center;

            }

            .sidebar {

              max-width: 100%;

              width: 100%;

            }

            .main-content {

              width: 100%;

            }

            .linked-item {

              flex-direction: column;

              align-items: flex-start;

              gap: 8px;

            }

            .status {

              align-self: flex-end;

            }

          }

        </style>

      </section>



<!--      &lt;!&ndash; ========== TAB SETTINGS ========== &ndash;&gt;-->

<!--      <section class="content-section settings-section">-->

<!--        <h2 class="section-title">CÃ i Ä‘áº·t chung</h2>-->

<!--        <div class="card">ChÆ°a cÃ³ ná»™i dung.</div>-->

<!--      </section>-->



    </main>

  </div>

</div>



<site-footer></site-footer>



<script>

document.addEventListener('DOMContentLoaded', function () {

  var orderCards = document.querySelectorAll('.orders-section .order-card');

  var totalOrders = orderCards.length;

  var totalSpending = 0;



  orderCards.forEach(function(card){

    var priceEl = card.querySelector('.order-price');

    if (!priceEl) return;

    var text = priceEl.textContent || '';

    // Láº¥y toÃ n bá»™ chá»¯ sá»‘ trong chuá»—i (bá» dáº¥u cháº¥m, chá»¯ VND, ...).

    var digits = text.replace(/[^0-9]/g, '');

    if (digits) {

      totalSpending += parseInt(digits, 10);

    }

  });



  var totalOrdersEl = document.getElementById('totalOrders');

  var totalSpendingEl = document.getElementById('totalSpending');



  if (totalOrdersEl) {

    totalOrdersEl.textContent = totalOrders;

  }

  if (totalSpendingEl) {

    totalSpendingEl.textContent = totalSpending.toLocaleString('vi-VN') + ' VND';

  }

});

</script>



</body>

</html>



