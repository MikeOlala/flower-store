<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="vi">



<head>

  <meta charset="UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Tiệm Hoa nhÃ  tớ</title>



  <!-- Biá»ƒu tÆ°á»£ng Bootstrap -->

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">



  <!-- CSS riêng -->

  <link rel="stylesheet" href="../assets/purchaseHisrory_1.css">

  <!-ÄÃ¢y lÃ  code dÃ¹ng cho header vÃ  footer-->

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

    <style>

      .breadcrumb {

        font-size: 13px;

        color: var(--text-muted);

        margin-left: 180px;

        margin-top: 20px;

      }



      .breadcrumb a {

        color: var(--text-muted);

      }



      .breadcrumb span {

        margin: 0 4px;

      }

    </style>



    <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/plugin-style.css?v=245" rel="preload stylesheet"

      as="style" type="text/css">

    <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/styles-new.scss.css?v=245"

      rel="preload stylesheet" as="style" type="text/css">

    <!--  <link rel="preload" as="image" href="//cdn.hstatic.net/themes/200000846175/1001403720/14/logo.png?v=245">-->

    <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/styles-index.scss.css?v=245"

      rel="preload stylesheet" as="style" type="text/css">

    <link rel="preload" as="image"

      href="//cdn.hstatic.net/themes/200000846175/1001403720/14/slideshow_1_mob_large.jpg?v=245"

      media="(max-width: 480px)">

    <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/jquery-script.js?v=245" rel="preload"

      as="script" type="text/javascript">

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



</head>



<body>

<site-header></site-header>

<div class="main-container">



  <!-- Sidebar -->

  <aside class="sidebar">

    <!-- NÃºt quay vá» trang chá»§ -->

    <a href="profileCustomer.html" class="home-button">

      <i class="bi bi-house-door-fill"></i>

    </a>



    <div class="sidebar-header">

      <img src="img\avatar_1.jpg"alt="Avatar" class="sidebar-avatar">

      <div class="sidebar-info">

        <h4>Customer</h4>

        <p>ThÃ nh viÃªn tá»« 10/2025</p>

        <span class="points">ðŸŒ¸ 290 POINTS</span>

      </div>

    </div>



    <div class="order-summary">

      <h5>Tá»•ng quan Ä‘Æ¡n hÃ ng</h5>

      <div class="summary-item"><span>Tá»•ng sá»‘ Ä‘Æ¡n:</span><strong>3</strong></div>

      <div class="summary-item"><span>ÄÃ£ giao:</span><strong>2</strong></div>

      <div class="summary-item"><span>Äang giao:</span><strong>1</strong></div>

      <div class="summary-item"><span>ÄÃ£ há»§y:</span><strong>0</strong></div>

    </div>



    <div class="spending-box">

      <h5>Tá»•ng chi tiÃªu</h5>

      <p>4.240.500 VND</p>

    </div>



    <div class="tips">

      ðŸ’¡ <strong>Máº¹o:</strong> Mua thêm 5 Ä‘Æ¡n ná»¯a Ä‘á»ƒ nháº­n <b>voucher 10%</b>!

    </div>

  </aside>



  <!-- Ná»™i dung -->

  <main class="content">

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



      <div class="order-summary">

        <h5>Tá»•ng quan Ä‘Æ¡n hÃ ng</h5>

        <div class="summary-item"><span>Tá»•ng sá»‘ Ä‘Æ¡n:</span><strong>3</strong></div>

        <div class="summary-item"><span>ÄÃ£ giao:</span><strong>2</strong></div>

        <div class="summary-item"><span>Äang giao:</span><strong>1</strong></div>

        <div class="summary-item"><span>ÄÃ£ há»§y:</span><strong>0</strong></div>

      </div>



      <div class="spending-box">

        <h5>Tá»•ng chi tiÃªu</h5>

        <p>4.240.500 VND</p>

      </div>



      <div class="tips">

        ðŸ’¡ <strong>Máº¹o:</strong> Mua thêm 5 Ä‘Æ¡n ná»¯a Ä‘á»ƒ nháº­n <b>voucher 10%</b>!

      </div>

    </aside>



    <!-- Ná»™i dung -->

    <main class="content">

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

          <img src="img\hoa 2.jpg" alt="Hoa Tulip Everelle" class="order-img">

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

    </main>

  </div>

  <site-footer></site-footer>

</body>



</html>

