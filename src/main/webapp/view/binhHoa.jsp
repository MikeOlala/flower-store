<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="vi">



<head>

  <meta charset="utf-8" />

  <title>Sản phẩm - Tiệm Hoa nhà tớ</title>

  <meta name="viewport" content="width=device-width, initial-scale=1" />



  <!-- Font -->

  <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:wght@400;600;700&display=swap" rel="stylesheet">



  <!-- CSS theme Ä‘á»ƒ giữ form header/footer giờ‘ng các trang khác -->

  <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/plugin-style.css?v=245" rel="stylesheet" />

  <link href="//cdn.hstatic.net/themes/200000846175/1001403720/14/styles-new.scss.css?v=245" rel="stylesheet" />



  <!-- Custom CSS -->

  <style>

    :root {

      --bg-page: #faf5ef;

      --brown-main: #3c2922;

      --brown-soft: #6c5845;

      --accent: #c99366;

      --accent-dark: #aa6a3f;

    }



    body {

      background: var(--bg-page);

      font-family: 'Crimson Text', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;

    }



    /* HERO */

    .product-hero {

      background: linear-gradient(135deg, var(--accent) 0%, var(--accent-dark) 100%);

      color: #fff;

      padding: 4rem 1.5rem 3rem;

      text-align: center;

      position: relative;

      overflow: hidden;

    }



    .product-hero::before {

      content: '';

      position: absolute;

      top: -50%;

      right: -8%;

      width: 420px;

      height: 420px;

      background: radial-gradient(circle, rgba(255, 255, 255, 0.15) 0%, transparent 70%);

      border-radius: 50%;

    }



    .product-hero::after {

      content: '';

      position: absolute;

      bottom: -35%;

      left: -10%;

      width: 360px;

      height: 360px;

      background: radial-gradient(circle, rgba(255, 255, 255, 0.08) 0%, transparent 70%);

      border-radius: 50%;

    }



    .product-hero-inner {

      position: relative;

      z-index: 1;

      max-width: 780px;

      margin: 0 auto;

    }



    .product-eyebrow {

      font-size: 0.85rem;

      letter-spacing: 0.18em;

      text-transform: uppercase;

      opacity: 0.9;

    }



    .product-title {

      font-size: 2.7rem;

      font-weight: 700;

      letter-spacing: -0.02em;

      margin: 0.5rem 0 0.75rem;

      text-shadow: 0 2px 12px rgba(0, 0, 0, 0.18);

    }



    .product-subtitle {

      font-size: 1.1rem;

      opacity: 0.96;

      font-style: italic;

    }



    @media (max-width: 640px) {

      .product-title {

        font-size: 2.1rem;

      }



      .product-subtitle {

        font-size: 0.98rem;

      }

    }



    /* WRAPPER */

    .product-wrapper {

      max-width: 1400px;

      margin: -2.5rem auto 3.5rem;

      padding: 1.8rem 1.5rem 2.5rem;

      background: #ffffff;

      border-radius: 22px;

      box-shadow: 0 14px 40px rgba(0, 0, 0, 0.08);

      position: relative;

      z-index: 5;

    }



    @media (max-width: 768px) {

      .product-wrapper {

        margin: -2rem 1rem 3rem;

        padding: 1.5rem 1.1rem 2rem;

      }

    }



    .collection-head {

      display: flex;

      align-items: flex-start;

      justify-content: space-between;

      gap: 1.5rem;

      margin-bottom: 1.2rem;

      flex-wrap: wrap;

    }



    .collection-head-left h2 {

      font-size: 1.4rem;

      font-weight: 700;

      color: var(--brown-main);

      margin-bottom: 0.25rem;

    }



    .collection-head-left p {

      font-size: 0.95rem;

      color: var(--brown-soft);

    }



    .collection-tabs {

      display: flex;

      flex-wrap: nowrap;

      gap: 0.5rem;

      padding: 0.3rem;

      background: #faf3ea;

      border-radius: 999px;

      border: 1px solid rgba(210, 180, 160, 0.7);

      overflow-x: auto;

      max-width: 100%;

    }



    .collection-tabs::-webkit-scrollbar {

      height: 4px;

    }



    .collection-tabs::-webkit-scrollbar-thumb {

      background: rgba(170, 106, 63, 0.4);

      border-radius: 999px;

    }



    .tab-btn {

      border-radius: 999px;

      border: none;

      padding: 7px 16px;

      font-size: 0.86rem;

      white-space: nowrap;

      cursor: pointer;

      background: transparent;

      color: #7a5a44;

      font-weight: 600;

      transition: 0.18s ease;

    }



    .tab-btn span {

      font-size: 0.78rem;

      opacity: 0.9;

    }



    .tab-btn.active {

      background: linear-gradient(135deg, var(--accent), var(--accent-dark));

      color: #fff;

      box-shadow: 0 8px 20px rgba(170, 106, 63, 0.3);

    }



    .tab-btn:not(.active):hover {

      background: rgba(255, 255, 255, 0.9);

    }



    /* FILTER BAR â€“ ngáº¯n gá»n, hiá»‡n Ä‘áº¡i */

    .filter-bar {

      display: flex;

      flex-wrap: wrap;

      align-items: center;

      justify-content: space-between;

      gap: 10px;

      margin-bottom: 18px;

      padding: 10px 16px;

      background: #fbf1e4;

      border-radius: 999px;

      box-shadow: 0 4px 14px rgba(160, 130, 100, 0.12);

      border: 1px solid rgba(210, 180, 160, 0.5);

    }



    .filter-label-main {

      font-size: 0.8rem;

      text-transform: uppercase;

      letter-spacing: 0.1em;

      color: var(--brown-soft);

      font-weight: 600;

      white-space: nowrap;

    }



    .filter-controls {

      display: flex;

      flex-wrap: wrap;

      gap: 8px;

    }



    .filter-select {

      min-width: 150px;

      border-radius: 999px;

      border: 1px solid rgba(198, 149, 112, 0.7);

      padding: 6px 12px;

      font-size: 0.85rem;

      color: #634638;

      background: #fff;

      outline: none;

    }



    .filter-select:focus {

      border-color: var(--accent-dark);

      box-shadow: 0 0 0 1px rgba(201, 147, 102, 0.4);

    }



    @media (max-width: 640px) {

      .filter-bar {

        border-radius: 18px;

        padding: 10px 12px;

      }



      .filter-label-main {

        width: 100%;

      }

    }



    /* GRID CARD Äá»’NG Äá»€U */

    .products-grid {

      display: grid;

      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));

      gap: 18px;

      margin-top: 8px;

    }



    .product-card {

      display: flex;

      flex-direction: column;

      background: #ffffff;

      border-radius: 18px;

      overflow: hidden;

      box-shadow: 0 6px 20px rgba(160, 130, 100, 0.18);

      border: 1px solid rgba(210, 180, 160, 0.4);

      cursor: pointer;

      transform-origin: center;

      transition: transform 0.18s ease, box-shadow 0.18s ease, border-color 0.18s ease;

    }



    .product-card:hover {

      transform: translateY(-3px);

      box-shadow: 0 12px 28px rgba(150, 120, 90, 0.26);

      border-color: rgba(201, 147, 102, 0.9);

    }



    .product-image {

      width: 100%;

      aspect-ratio: 3 / 4;

      object-fit: cover;

      display: block;

    }



    .product-body {

      padding: 10px 14px 12px;

      display: flex;

      flex-direction: column;

      gap: 6px;

      flex: 1;

    }



    .product-name {

      font-size: 1rem;

      font-weight: 700;

      color: var(--brown-main);

      line-height: 1.3;

    }



    .product-price {

      font-size: 0.95rem;

      color: var(--accent-dark);

      font-weight: 600;

    }



    .product-tags {

      display: flex;

      flex-wrap: wrap;

      gap: 4px;

      font-size: 0.78rem;

      margin-top: 2px;

      max-height: 36px;

      overflow: hidden;

    }



    .tag {

      padding: 2px 8px;

      border-radius: 999px;

      background: #f4e1d1;

      color: #7b5641;

    }



    .tag-highlight {

      background: linear-gradient(135deg, var(--accent), var(--accent-dark));

      color: #fff;

    }



    /* MODAL CHI TIáº¾T Sáº¢N PHáº¨M */

    .product-modal-overlay {

      position: fixed;

      inset: 0;

      background: rgba(0, 0, 0, 0.45);

      display: none;

      align-items: center;

      justify-content: center;

      padding: 20px;

      z-index: 9999;

    }



    .product-modal-overlay.open {

      display: flex;

    }



    .product-modal {

      background: #fff;

      border-radius: 20px;

      max-width: 900px;

      width: 100%;

      max-height: 90vh;

      overflow: hidden;

      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);

      display: grid;

      grid-template-columns: minmax(0, 1.1fr) minmax(0, 1fr);

    }



    @media (max-width: 800px) {

      .product-modal {

        grid-template-columns: 1fr;

      }

    }



    .modal-image-wrap {

      background: #f7e6d5;

      display: flex;

      align-items: center;

      justify-content: center;

      padding: 16px;

    }



    .modal-image-wrap img {

      max-width: 100%;

      max-height: 70vh;

      object-fit: cover;

      border-radius: 14px;

    }



    .modal-body {

      padding: 18px 20px 18px;

      position: relative;

    }



    .modal-close {

      position: absolute;

      top: 10px;

      right: 14px;

      background: transparent;

      border: none;

      font-size: 22px;

      cursor: pointer;

      color: #7b5641;

    }



    .modal-title {

      font-size: 1.35rem;

      font-weight: 700;

      color: var(--brown-main);

      margin-bottom: 6px;

    }



    .modal-price {

      font-size: 1.1rem;

      color: var(--accent-dark);

      font-weight: 600;

      margin-bottom: 10px;

    }



    .modal-desc {

      font-size: 0.95rem;

      color: var(--brown-soft);

      margin-bottom: 14px;

    }



    .modal-meta {

      font-size: 0.9rem;

      color: #8a6a55;

      margin-bottom: 12px;

    }



    .modal-tags {

      display: flex;

      flex-wrap: wrap;

      gap: 6px;

      margin-bottom: 16px;

    }



    .modal-actions {

      display: flex;

      flex-wrap: wrap;

      gap: 10px;

      margin-top: 6px;

    }



    .btn-main {

      border-radius: 999px;

      padding: 9px 18px;

      border: none;

      cursor: pointer;

      background: linear-gradient(135deg, var(--accent), var(--accent-dark));

      color: #fff;

      font-size: 0.95rem;

      font-weight: 600;

      box-shadow: 0 10px 24px rgba(180, 130, 95, 0.3);

    }



    .btn-main:hover {

      background: linear-gradient(135deg, #b57d4c, #945331);

    }



    .btn-ghost {

      border-radius: 999px;

      padding: 8px 16px;

      border: 1px solid rgba(180, 130, 95, 0.6);

      background: #fff;

      cursor: pointer;

      font-size: 0.92rem;

      color: #7b5641;

    }



    .btn-ghost:hover {

      background: #f7e6d5;

    }



    /* PAGINATION (visual) */

    .pagination-container {

      display: flex;

      justify-content: center;

      align-items: center;

      gap: 6px;

      margin-top: 30px;

      margin-bottom: 40px;

    }



    .page-btn {

      background: #f4e1d1;

      border: 1px solid #d8c1b0;

      padding: 8px 12px;

      border-radius: 10px;

      cursor: pointer;

      color: #6c5845;

      font-weight: 600;

      transition: 0.2s;

    }



    .page-btn:hover {

      background: #e9d2bd;

    }



    .page-number {

      padding: 8px 12px;

      background: #fff;

      border: 1px solid #d8c1b0;

      border-radius: 10px;

      cursor: pointer;

      color: #6c5845;

      transition: 0.2s;

      font-size: 0.9rem;

    }



    .page-number.active {

      background: var(--accent-dark);

      color: #fff;

      border-color: var(--accent-dark);

    }



    .page-dots {

      padding: 0 4px;

      color: #8a6a55;

    }

  </style>



  <script defer src="components.js"></script>

</head>



<body id="wandave-theme" class="index" data-theme="tbag-fashion">



<!-- HEADER -->

<site-header></site-header>



<main>

  <!-- HERO -->

  <section class="product-hero">

    <div class="product-hero-inner">

      <h1 class="product-title">BÃ¬nh Hoa</h1>

      <p class="product-subtitle">

        Nhá»¯ng bÃ³ hoa â€œtrendâ€ nháº¥t cá»§a nhà tớ

      </p>

    </div>

  </section>



  <div class="product-wrapper">



    <!-- FILTER NGáº®N Gá»ŒN -->

    <div class="filter-bar">

      <div class="filter-label-main">Bá»™ lá»c</div>

      <div class="filter-controls">

        <select id="topicFilter" class="filter-select">

          <option value="all">Chá»§ Ä‘á»: Tất cả</option>

          <option value="pastel">Pastel</option>

          <option value="chúc má»«ng">ChÃºc má»«ng</option>

          <option value="tá» tÃ¬nh">Tá» tÃ¬nh</option>

          <option value="khai trÆ°Æ¡ng">Khai trÆ°Æ¡ng</option>

          <option value="rustic">Rustic</option>

          <option value="size nhá»">Size nhá»</option>

        </select>



        <select id="colorFilter" class="filter-select">

          <option value="all">MÃ u: Tất cả</option>

          <option value="pastel">Pastel</option>

          <option value="neutral">Tráº¯ng / Be</option>

          <option value="warm">Cam / VÃ ng / Äá»</option>

          <option value="rustic">Rustic / Nâu</option>

          <option value="bright">Rá»±c rá»¡</option>

        </select>



        <select id="priceFilter" class="filter-select">

          <option value="all">GiÃ¡: Tất cả</option>

          <option value="0-600">DÆ°á»›i 600.000Ä‘</option>

          <option value="600-800">600.000Ä‘ - 800.000Ä‘</option>

          <option value="800-1000">800.000Ä‘ - 1.000.000Ä‘</option>

          <option value="1000plus">TrÃªn 1.000.000Ä‘</option>

        </select>

      </div>

    </div>



    <!-- GRID PRODUCTS -->

    <div class="products-grid">



      <!-- CARD 1 -->

      <article class="product-card" data-title="Aurora" data-price="650.000Ä‘"

           data-price-value="650000" data-color="pastel"

           data-desc="Bó hoa tone pastel nháº¹ nhÃ ng vá»›i há»“ng kem, baby tráº¯ng vÃ  chÃºt xanh bạc hÃ . PhÃ¹ hợp Ä‘á»ƒ tặng sinh nhật, ká»· niá»‡m hhoặc Ä‘Æ¡n giáº£n lÃ  gá»­i lá»i há»i thÄƒm."

           data-img="https://cdn.hstatic.net/products/200000846175/fdafa92a745dfc03a54c_26c2fef97af84d2c8c9f0ce270784e13.jpg"

           data-tags="Pastel, Dá»‹u dÃ ng, Sinh nháº­t, Ká»· niá»‡m">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/fdafa92a745dfc03a54c_26c2fef97af84d2c8c9f0ce270784e13.jpg"

           alt="Pastel Morning">

        <div class="product-body">

          <div class="product-name">Aurora</div>

          <div class="product-price">650.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Pastel</span>

            <span class="tag">BÃ¬nh hoa</span>

            <span class="tag">Dá»‹u dÃ ng</span>

          </div>

        </div>

      </article>



      <!-- CARD 2 -->

      <article class="product-card" data-title="Sunset Vibes" data-price="780.000Ä‘" data-price-value="780000"

           data-color="warm"

           data-desc="Bó hoa tone cam - vÃ ng rá»±c rá»¡ như hoa ng hÃ´n, dÃ nh cho nhá»¯ng dá»‹p cáº§n nhiá»u nÄƒng lÆ°á»£ng tÃ­ch cá»±c: chúc má»«ng, tá»‘t nghiá»‡p, khai trÆ°Æ¡ng nhá»."

           data-img="https://cdn.hstatic.net/products/200000846175/z7125670258551_014b6ac263a92a1923a4f0ea481c81c0-min_84f76b4525a045078a1b46670d0d81ae.jpg"

           data-tags="Cam vÃ ng, NÄƒng lÆ°á»£ng, ChÃºc má»«ng, Tá»‘t nghiá»‡p">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7125670258551_014b6ac263a92a1923a4f0ea481c81c0-min_84f76b4525a045078a1b46670d0d81ae.jpg"

           alt="Sunset Vibes">

        <div class="product-body">

          <div class="product-name">Sunset Vibes</div>

          <div class="product-price">780.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">ChÃºc má»«ng</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Tá»‘t nghiá»‡p</span>

          </div>

        </div>

      </article>



      <!-- CARD 3 -->

      <article class="product-card" data-title="Secret Love" data-price="890.000Ä‘" data-price-value="890000"

           data-color="warm"

           data-desc="Má»™t bÃ³ hoa tÃ´ng Ä‘á» - há»“ng Ä‘áº­m dÃ nh cho nhá»¯ng lá»i tá» tÃ¬nh hhoặc ká»· niá»‡m Ä‘áº·c biá»‡t. Có thể thêm thiệp tay viết riêng theo yêu cầu."

           data-img="https://cdn.hstatic.net/products/200000846175/z7125821940268_11f49a61c8130af1bef29fe16078a1c6-min_cc92a1328d3746d6857fa807c859a73c.jpg"

           data-tags="Tá» tÃ¬nh, Ká»· niá»‡m, Lãng mạn">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7125821940268_11f49a61c8130af1bef29fe16078a1c6-min_cc92a1328d3746d6857fa807c859a73c.jpg"

           alt="Secret Love">

        <div class="product-body">

          <div class="product-name">Secret Love</div>

          <div class="product-price">890.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Tá» tÃ¬nh</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Lãng mạn</span>

          </div>

        </div>

      </article>



      <!-- CARD 4 -->

      <article class="product-card" data-title="Rustic Garden" data-price="720.000Ä‘" data-price-value="720000"

           data-color="rustic"

           data-desc="Thiáº¿t káº¿ mang hÆ¡i hÆ°á»›ng Rustic vá»›i hoa dáº¡i, lÃ¡ xanh vÃ  giáº¥y gÃ³i kraft. Ráº¥t hợp Ä‘á»ƒ tặng nhá»¯ng ngÆ°á»i yêu sá»± má»™c máº¡c, gáº§n gÅ©i."

           data-img="https://cdn.hstatic.net/products/200000846175/img_1009_87bf802aa355423ca42a1b0cf28117ea.jpg"

           data-tags="Rustic, Má»™c máº¡c, Tá»± nhiÃªn">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/img_1009_87bf802aa355423ca42a1b0cf28117ea.jpg"

           alt="Rustic Garden">

        <div class="product-body">

          <div class="product-name">Rustic Garden</div>

          <div class="product-price">720.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Rustic</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Má»™c máº¡c</span>

          </div>

        </div>

      </article>



      <!-- CARD 5 -->

      <article class="product-card" data-title="Gentle Day" data-price="590.000Ä‘" data-price-value="590000"

           data-color="neutral"

           data-desc="Bó hoa nhá» xinh cho nhá»¯ng láº§n ghÃ© thÄƒm báº¥t ngá»: thÄƒm báº¡n, thÄƒm ngÆ°á»i thÃ¢n, ghÃ© nhÃ  chÆ¡i cuá»‘i tuáº§n."

           data-img="https://product.hstatic.net/200000846175/product/z5930290652722_bbb5be37fa727be59a770db4f1ad3b18_d472ba9a3c164d099ee157dd285de503.jpg"

           data-tags="Nhá» xinh, ThÄƒm ngÆ°á»i thÃ¢n, Cuá»‘i tuáº§n">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/z5930290652722_bbb5be37fa727be59a770db4f1ad3b18_d472ba9a3c164d099ee157dd285de503.jpg"

           alt="Gentle Day">

        <div class="product-body">

          <div class="product-name">Gentle Day</div>

          <div class="product-price">590.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Rustic</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Nhá» xinh</span>

          </div>

        </div>

      </article>



      <!-- CARD 6 -->

      <article class="product-card" data-title="New Chapter" data-price="980.000Ä‘" data-price-value="980000"

           data-color="warm"

           data-desc="Ká»‡ hoa mini cho khai trÆ°Æ¡ng hhoặc má»«ng báº¯t Ä‘áº§u một hÃ nh trình má»›i: má»Ÿ tiá»‡m, Ä‘á»•i viá»‡c, chuyá»ƒn nhÃ ."

           data-img="https://product.hstatic.net/200000846175/product/z5930289355549_8cfae03a4554330c8bf406f5da27cfb8_c1fb215026ec4ed0a80cf3612c181e8b.jpg"

           data-tags="Khai trÆ°Æ¡ng, ChÃºc má»«ng, HÃ nh trình má»›i">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/z5930289355549_8cfae03a4554330c8bf406f5da27cfb8_c1fb215026ec4ed0a80cf3612c181e8b.jpg" alt="New Chapter">

        <div class="product-body">

          <div class="product-name">New Chapter</div>

          <div class="product-price">980.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Khai trÆ°Æ¡ng</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">ChÃºc má»«ng</span>

          </div>

        </div>

      </article>



      <!-- CARD 7 -->

      <article class="product-card" data-title="Soft Cloud" data-price="630.000Ä‘" data-price-value="630000"

           data-color="neutral"

           data-desc="Tone tráº¯ng - kem nháº¹ nhÃ ng như một Ä‘Ã¡m mÃ¢y. PhÃ¹ hợp tặng sáº¿p ná»¯, Ä‘á»“ng nghiá»‡p hhoặc ngÆ°á»i yêu phong cách tá»‘i giáº£n."

           data-img="https://cdn.hstatic.net/products/200000846175/727a6391a39a29c4708b_200776dbc9624191bd10408ed39dd5e3.jpg"

           data-tags="Tráº¯ng kem, Tá»‘i giáº£n, Thanh lá»‹ch">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/727a6391a39a29c4708b_200776dbc9624191bd10408ed39dd5e3.jpg" alt="Soft Cloud">

        <div class="product-body">

          <div class="product-name">Soft Cloud</div>

          <div class="product-price">630.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Pastel</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Thanh lá»‹ch</span>

          </div>

        </div>

      </article>



      <!-- CARD 8 -->

      <article class="product-card" data-title="Blush Story" data-price="710.000Ä‘" data-price-value="710000"

           data-color="pastel"

           data-desc="Bó hoa há»“ng blush mix cÃ¹ng các loáº¡i hoa nháº­p, cho cảm giác ngá»t ngÃ o vÃ  trÆ°á»Ÿng thÃ nh."

           data-img="https://cdn.hstatic.net/products/200000846175/z6974792785678_86d4e12184c77a9fd4ffa15c4c1981a4-min__1__3ee7ffb134da43c2b66e65f7c05f44f5.jpg"

           data-tags="Blush, Ngá»t ngÃ o, TrÆ°á»Ÿng thÃ nh">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z6974792785678_86d4e12184c77a9fd4ffa15c4c1981a4-min__1__3ee7ffb134da43c2b66e65f7c05f44f5.jpg" alt="Blush Story">

        <div class="product-body">

          <div class="product-name">Blush Story</div>

          <div class="product-price">710.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Pastel</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Ngá»t ngÃ o</span>

          </div>

        </div>

      </article>



      <!-- CARD 9 -->

      <article class="product-card" data-title="Tiny Joy" data-price="490.000Ä‘" data-price-value="490000"

           data-color="bright"

           data-desc="Má»™t bÃ³ hoa size nhá» nhưng Ä‘á»§ tinh táº¿ Ä‘á»ƒ mang láº¡i niá»m vui báº¥t ngá» cho ngÆ°á»i nháº­n."

           data-img="https://cdn.hstatic.net/products/200000846175/img_1011_927fb3672e584b06a0f9c77748291c9f.jpg"

           data-tags="Size nhá», Báº¥t ngá», Dá»… thÆ°Æ¡ng">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/img_1011_927fb3672e584b06a0f9c77748291c9f.jpg"

           alt="Tiny Joy">

        <div class="product-body">

          <div class="product-name">Tiny Joy</div>

          <div class="product-price">490.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Size nhá»</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Háº¹n hÃ²</span>

          </div>

        </div>

      </article>



      <!-- CARD 10 -->

      <article class="product-card" data-title="Midnight Bloom" data-price="1.050.000Ä‘"

           data-price-value="1050000" data-color="bright"

           data-desc="Má»™t bÃ³ hoa Ä‘áº­m mÃ u, sÃ¢u vÃ  áº¥n tÆ°á»£ng, dÃ nh cho nhá»¯ng dá»‹p Ä‘áº·c biá»‡t hhoặc các buá»•i tiệc tá»‘i."

           data-img="https://product.hstatic.net/200000846175/product/z5930289277515_ec844e7f86c45b647818583c110401d5_9f58056144b7424daac0cd79fe9949f6.jpg"

           data-tags="Tá»‘i, áº¤n tÆ°á»£ng, Äáº·c biá»‡t">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/z5930289277515_ec844e7f86c45b647818583c110401d5_9f58056144b7424daac0cd79fe9949f6.jpg"

           alt="Midnight Bloom">

        <div class="product-body">

          <div class="product-name">Midnight Bloom</div>

          <div class="product-price">1.050.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Tá» tÃ¬nh</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">áº¤n tÆ°á»£ng</span>

          </div>

        </div>

      </article>



      <!-- CARD 11 -->

      <article class="product-card" data-title="Peach Garden" data-price="740.000Ä‘" data-price-value="740000"

           data-color="pastel"

           data-desc="Sự káº¿t hợp giữa cam Ä‘Ã o vÃ  há»“ng nude táº¡o cảm giác dá»‹u ngá»t, phÃ¹ hợp tặng ngÆ°á»i yêu hhoặc báº¡n thÃ¢n."

           data-img="https://cdn.hstatic.net/products/200000846175/1fa66a5baa50200e7941_75c249ce264a490cb0bdc2f0c8111ac2.jpg"

           data-tags="Pastel, Ngá»t ngÃ o, Sinh nháº­t">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/1fa66a5baa50200e7941_75c249ce264a490cb0bdc2f0c8111ac2.jpg"

           alt="Peach Garden">

        <div class="product-body">

          <div class="product-name">Peach Garden</div>

          <div class="product-price">740.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Pastel</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Ngá»t ngÃ o</span>

          </div>

        </div>

      </article>



      <!-- CARD 12 -->

      <article class="product-card" data-title="Happy Launch" data-price="1.200.000Ä‘"

           data-price-value="1200000" data-color="warm"

           data-desc="Ká»‡ hoa Ä‘á»©ng kÃ­ch thÆ°á»›c vá»«a cho khai trÆ°Æ¡ng, sá»­ dá»¥ng tÃ´ng cam - Ä‘á» - vÃ ng ná»•i báº­t nhưng váº«n tinh táº¿."

           data-img="https://cdn.hstatic.net/products/200000846175/z7039619542969_e994448ebc7d39e28ce0f7128cbffa77_45e881835d4349d4b24d842dfdb66d38.jpg"

           data-tags="Khai trÆ°Æ¡ng, ChÃºc má»«ng, NÄƒng lÆ°á»£ng">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7039619542969_e994448ebc7d39e28ce0f7128cbffa77_45e881835d4349d4b24d842dfdb66d38.jpg"

           alt="Happy Launch">

        <div class="product-body">

          <div class="product-name">Happy Launch</div>

          <div class="product-price">1.200.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Khai trÆ°Æ¡ng</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">ChÃºc má»«ng</span>

          </div>

        </div>

      </article>



      <!-- CARD 13 -->

      <article class="product-card" data-title="First Confession" data-price="820.000Ä‘"

           data-price-value="820000" data-color="warm"

           data-desc="Bó hoa dÃ nh riêng cho láº§n tá» tÃ¬nh Ä‘áº§u tiÃªn â€“ nháº¹ nhÃ ng nhưng Ä‘á»§ Ä‘á»ƒ Ä‘á»‘i phÆ°Æ¡ng cảm nháº­n Ä‘Æ°á»£c táº¥m lÃ²ng."

           data-img="https://cdn.hstatic.net/products/200000846175/z7039619601915_67cb124f4e74d5993c00754a68e3ac8c_21fbbc064ace42b9ab511d4fbdee951a.jpg"

           data-tags="Tá» tÃ¬nh, Lãng mạn, Dá»‹u dÃ ng">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7039619601915_67cb124f4e74d5993c00754a68e3ac8c_21fbbc064ace42b9ab511d4fbdee951a.jpg"

           alt="First Confession">

        <div class="product-body">

          <div class="product-name">First Confession</div>

          <div class="product-price">820.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Tá» tÃ¬nh</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Lãng mạn</span>

          </div>

        </div>

      </article>



      <!-- CARD 14 -->

      <article class="product-card" data-title="Rustic Field" data-price="760.000Ä‘" data-price-value="760000"

           data-color="rustic"

           data-desc="Hoa dáº¡i mix cÃºc há»a mi vÃ  lÃ¡ xanh, mang vibe Ä‘á»“ng quÃª Rustic, cá»±c hợp chá»¥p áº£nh hhoặc trang trÃ­ bÃ n tiệc nhá»."

           data-img="https://cdn.hstatic.net/products/200000846175/z7039619269872_ce2cdcc941d06a1ec22634157f9d996d_5bf30593ef6e4533a43993941a414dfc.jpg"

           data-tags="Rustic, Tá»± nhiÃªn, Trang trÃ­">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7039619269872_ce2cdcc941d06a1ec22634157f9d996d_5bf30593ef6e4533a43993941a414dfc.jpg"

           alt="Rustic Field">

        <div class="product-body">

          <div class="product-name">Rustic Field</div>

          <div class="product-price">760.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Rustic</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Tá»± nhiÃªn</span>

          </div>

        </div>

      </article>



      <!-- CARD 15 -->

      <article class="product-card" data-title="Mini Cheer" data-price="450.000Ä‘" data-price-value="450000"

           data-color="bright"

           data-desc="Size nhá» nhưng rá»±c rá»¡, phÃ¹ hợp gá»­i tặng Ä‘á»“ng nghiá»‡p hhoặc báº¡n há»c Ä‘á»ƒ chúc má»«ng một cá»™t má»‘c nhá»."

           data-img="https://cdn.hstatic.net/products/200000846175/z7039619411783_825b70a7de61ad5a567e7c7bb97d32aa_a865c3be0352472d8b299bd770d0b435.jpg"

           data-tags="Size nhá», ChÃºc má»«ng, Dá»… thÆ°Æ¡ng">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7039619411783_825b70a7de61ad5a567e7c7bb97d32aa_a865c3be0352472d8b299bd770d0b435.jpg" alt="Mini Cheer">

        <div class="product-body">

          <div class="product-name">Mini Cheer</div>

          <div class="product-price">450.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Size nhá»</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">ChÃºc má»«ng</span>

          </div>

        </div>

      </article>



      <!-- CARD 16 -->

      <article class="product-card" data-title="Pastel Cloud" data-price="700.000Ä‘" data-price-value="700000"

           data-color="pastel"

           data-desc="Má»™t phiÃªn báº£n pastel tone láº¡nh, hÆ¡i xanh â€“ phÃ¹ hợp cho nhá»¯ng ai yêu sá»± thanh thoa¡t, nháº¹ nhÃ ng."

           data-img="https://cdn.hstatic.net/products/200000846175/z7112111629054_ce6f4d73bdbd993aff4d37cd67432bcc-min__1__6012386de08a4c2c97e678b8e903ae96.jpg"

           data-tags="Pastel, Thanh lá»‹ch, Tráº¯ng kem">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7112111629054_ce6f4d73bdbd993aff4d37cd67432bcc-min__1__6012386de08a4c2c97e678b8e903ae96.jpg"

           alt="Pastel Cloud">

        <div class="product-body">

          <div class="product-name">Pastel Cloud</div>

          <div class="product-price">700.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Pastel</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Thanh lá»‹ch</span>

          </div>

        </div>

      </article>



      <!-- CARD 17 -->

      <article class="product-card" data-title="Warm Congrats" data-price="900.000Ä‘" data-price-value="900000"

           data-color="warm"

           data-desc="Bó hoa chúc má»«ng vá»›i mÃ u sáº¯c áº¥m Ã¡p, thÃ­ch hợp cho lá»… tá»‘t nghiá»‡p, thÄƒng chá»©c hhoặc ká»· niá»‡m quan trá»ng."

           data-img="https://cdn.hstatic.net/products/200000846175/z7039619468541_a22768e1ec6c2434707e1de9ddc6097c_77fcb07d246b495fb7cf7e7bbc29729c.jpg"

           data-tags="ChÃºc má»«ng, Tá»‘t nghiá»‡p, áº¤m Ã¡p">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7039619468541_a22768e1ec6c2434707e1de9ddc6097c_77fcb07d246b495fb7cf7e7bbc29729c.jpg"

           alt="Warm Congrats">

        <div class="product-body">

          <div class="product-name">Warm Congrats</div>

          <div class="product-price">900.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">ChÃºc má»«ng</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">áº¤m Ã¡p</span>

          </div>

        </div>

      </article>



      <!-- CARD 18 -->

      <article class="product-card" data-title="Little Secret" data-price="520.000Ä‘" data-price-value="520000"

           data-color="pastel"

           data-desc="Má»™t bÃ³ hoa size nhá» nhưng Ä‘á»§ â€œhintâ€ cho ngÆ°á»i nháº­n hiá»ƒu ráº±ng báº¡n Ä‘ang Ä‘á»ƒ Ã½ há» Ä‘Ã³."

           data-img="https://cdn.hstatic.net/products/200000846175/z7039619349040_e738ca5407d4eebcee15797510831127_f0e0fee303c041c7b2c9d9573a2ad9a7.jpg"

           data-tags="Size nhá», Tá» tÃ¬nh, Dá»… thÆ°Æ¡ng">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z7039619349040_e738ca5407d4eebcee15797510831127_f0e0fee303c041c7b2c9d9573a2ad9a7.jpg"

           alt="Little Secret">

        <div class="product-body">

          <div class="product-name">Little Secret</div>

          <div class="product-price">520.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Size nhá»</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Tá» tÃ¬nh</span>

          </div>

        </div>

      </article>



      <!-- CARD 19 -->

      <article class="product-card" data-title="Rustic Corner" data-price="780.000Ä‘" data-price-value="780000"

           data-color="rustic"

           data-desc="Bó hoa Rustic vá»›i giáº¥y kraft nÃ¢u, phÃ¹ hợp trang trÃ­ gÃ³c phÃ²ng hhoặc tặng ngÆ°á»i yêu phong cách vintage."

           data-img="https://cdn.hstatic.net/products/200000846175/_6445d4139fa7afd0a8ab6c8766bd4989-min_84a41b1960fb444680c267e069d88da9_891f0eac283e4fbc8e75060766cce394.jpg"

           data-tags="Rustic, Vintage, Trang trÃ­">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/_6445d4139fa7afd0a8ab6c8766bd4989-min_84a41b1960fb444680c267e069d88da9_891f0eac283e4fbc8e75060766cce394.jpg"

           alt="Rustic Corner">

        <div class="product-body">

          <div class="product-name">Rustic Corner</div>

          <div class="product-price">780.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Rustic</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Vintage</span>

          </div>

        </div>

      </article>



      <!-- CARD 20 -->

      <article class="product-card" data-title="Pastel Hug" data-price="830.000Ä‘" data-price-value="830000"

           data-color="pastel"

           data-desc="Bó hoa pastel size vá»«a, cảm giác như một cÃ¡i Ã´m áº¥m Ã¡p báº±ng hoa â€“ ráº¥t hợp Ä‘á»ƒ xin lá»—i hhoặc cảm Æ¡n."

           data-img="https://product.hstatic.net/200000846175/product/z6054612673644_8cebb893eadcb7d33480fb3516038b5f_0e9f443bd29e4dbda36975e7334fdd01.jpg"

           data-tags="Pastel, Dá»‹u dÃ ng, Cáº£m Æ¡n">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/z6054612673644_8cebb893eadcb7d33480fb3516038b5f_0e9f443bd29e4dbda36975e7334fdd01.jpg" alt="Pastel Hug">

        <div class="product-body">

          <div class="product-name">Pastel Hug</div>

          <div class="product-price">830.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Pastel</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Cáº£m Æ¡n</span>

          </div>

        </div>

      </article>



      <!-- CARD 21 -->

      <article class="product-card" data-title="Morning Breeze" data-price="610.000Ä‘"

           data-price-value="610000" data-color="neutral"

           data-desc="Bó hoa vá»›i tÃ´ng tráº¯ng â€“ xanh nháº¡t, cảm giác như lÃ n giÃ³ sá»›m, ráº¥t hợp tặng ngÆ°á»i yêu phong cách nháº¹ nhÃ ng, tá»‘i giáº£n."

           data-img="https://cdn.hstatic.net/products/200000846175/z6974794754482_79804d1702b96e381fe3aa242fafb08a_b232f0a422c34465b38445872fc33f73.jpg"

           data-tags="Tráº¯ng kem, Thanh lá»‹ch, Dá»‹u dÃ ng">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z6974794754482_79804d1702b96e381fe3aa242fafb08a_b232f0a422c34465b38445872fc33f73.jpg"

           alt="Morning Breeze">

        <div class="product-body">

          <div class="product-name">Morning Breeze</div>

          <div class="product-price">610.000Ä‘</div>

          <div class="product-tags">

            <span class="tag">Tráº¯ng kem</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Thanh lá»‹ch</span>

          </div>

        </div>

      </article>



      <!-- CARD 22 -->

      <article class="product-card" data-title="Candy Pastel" data-price="690.000Ä‘" data-price-value="690000"

           data-color="pastel"

           data-desc="Có cảm giác như một túi kẹo pastel: há»“ng, tím, xanh bạc hÃ  â€“ ráº¥t hợp cho sinh nhật, tiệc nhá» hhoặc tặng em bé."

           data-img="https://cdn.hstatic.net/products/200000846175/z6972264069179_846ec51a2f578afbeccdb64f86550d63-min_fa0209ff0c6e45099021f2abdc2c2595.jpg"

           data-tags="Pastel, Sinh nháº­t, Ngá»t ngÃ o">

        <img class="product-image"

           src="https://cdn.hstatic.net/products/200000846175/z6972264069179_846ec51a2f578afbeccdb64f86550d63-min_fa0209ff0c6e45099021f2abdc2c2595.jpg"

           alt="Candy Pastel">

        <div class="product-body">

          <div class="product-name">Candy Pastel</div>

          <div class="product-price">690.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Pastel</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Sinh nháº­t</span>

          </div>

        </div>

      </article>



      <!-- CARD 23 -->

      <article class="product-card" data-title="Golden Day" data-price="870.000Ä‘" data-price-value="870000"

           data-color="warm"

           data-desc="Bó hoa vÃ ng â€“ kem sang trá»ng, hợp tặng sáº¿p, Ä‘á»‘i tÃ¡c hhoặc dá»‹p ká»· niá»‡m công ty."

           data-img="https://product.hstatic.net/200000846175/product/img_0642-min_387bea0e06754888a5e22d67585de7ef.jpg"

           data-tags="ChÃºc má»«ng, áº¤m Ã¡p, Thanh lá»‹ch">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/img_0642-min_387bea0e06754888a5e22d67585de7ef.jpg"

           alt="Golden Day">

        <div class="product-body">

          <div class="product-name">Golden Day</div>

          <div class="product-price">870.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">ChÃºc má»«ng</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">áº¤m Ã¡p</span>

          </div>

        </div>

      </article>



      <!-- CARD 24 -->

      <article class="product-card" data-title="Forest Rustic" data-price="790.000Ä‘" data-price-value="790000"

           data-color="rustic"

           data-desc="Hoa lÃ¡ xanh chá»§ Ä‘áº¡o, káº¿t hợp giáº¥y kraft nÃ¢u táº¡o vibe rá»«ng thÃ´ng, hợp cho ngÆ°á»i yêu thiÃªn nhiÃªn."

           data-img="https://product.hstatic.net/200000846175/product/dscf1205_613a6783ac1648d6809bffe1097f2d41.jpg"

           data-tags="Rustic, Tá»± nhiÃªn, Vintage">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/dscf1205_613a6783ac1648d6809bffe1097f2d41.jpg"

           alt="Forest Rustic">

        <div class="product-body">

          <div class="product-name">Forest Rustic</div>

          <div class="product-price">790.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Rustic</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Tá»± nhiÃªn</span>

          </div>

        </div>

      </article>



      <!-- CARD 25 -->

      <article class="product-card" data-title="Mini Pastel Box" data-price="560.000Ä‘"

           data-price-value="560000" data-color="pastel"

           data-desc="Box hoa size nhá» tone pastel, gá»n gÃ ng nhưng váº«n xinh xáº¯n â€“ Ä‘á»ƒ bÃ n lÃ m viá»‡c hhoặc gá»­i tặng báº¥t ngá»."

           data-img="https://product.hstatic.net/200000846175/product/w6_57fe7e7ee65f4097aef741ba053a4609.jpg"

           data-tags="Size nhá», Pastel, Dá»… thÆ°Æ¡ng">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/w6_57fe7e7ee65f4097aef741ba053a4609.jpg"

           alt="Mini Pastel Box">

        <div class="product-body">

          <div class="product-name">Mini Pastel Box</div>

          <div class="product-price">560.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Size nhá»</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Pastel</span>

          </div>

        </div>

      </article>



      <!-- CARD 26 -->

      <article class="product-card" data-title="Blush Heart" data-price="910.000Ä‘" data-price-value="910000"

           data-color="pastel"

           data-desc="Bó hoa há»“ng blush dÃ¡ng dÃ i, cá»±c hợp cho nhá»¯ng lá»i tá» tÃ¬nh hhoặc ká»· niá»‡m 100 ngÃ y, 1 nÄƒm yêu."

           data-img="https://product.hstatic.net/200000846175/product/z5544257120946_9e0e1b33c675b424388bd134d87c5a50-min_226bc4a0e74441c7b9f16af491552dd4.jpg"

           data-tags="Tá» tÃ¬nh, Lãng mạn, Ngá»t ngÃ o">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/z5544257120946_9e0e1b33c675b424388bd134d87c5a50-min_226bc4a0e74441c7b9f16af491552dd4.jpg"

           alt="Blush Heart">

        <div class="product-body">

          <div class="product-name">Blush Heart</div>

          <div class="product-price">910.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Tá» tÃ¬nh</span>

            <span class="tag">Hoa Tulip</span>

            <span class="tag">Ngá»t ngÃ o</span>

          </div>

        </div>

      </article>



      <!-- CARD 27 -->

      <article class="product-card" data-title="Coffee Rustic" data-price="730.000Ä‘" data-price-value="730000"

           data-color="rustic"

           data-desc="TÃ´ng nÃ¢u â€“ be như một ly latte: dÃ¹ng hoa khÃ´ vÃ  hoa tÆ°Æ¡i mix, hợp tặng ngÆ°á»i yêu phong cách tráº§m áº¥m."

           data-img="https://product.hstatic.net/200000846175/product/z4344034401236_bcef0d35bda443dafcdff70b6e2edffa_75cf540049d44f219ac42c311bddfdfc.jpg"

           data-tags="Rustic, áº¤m Ã¡p, Vintage">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/z4344034401236_bcef0d35bda443dafcdff70b6e2edffa_75cf540049d44f219ac42c311bddfdfc.jpg"

           alt="Coffee Rustic">

        <div class="product-body">

          <div class="product-name">Coffee Rustic</div>

          <div class="product-price">730.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Rustic</span>

            <span class="tag ">Bó hoa</span>

            <span class="tag">áº¤m Ã¡p</span>

          </div>

        </div>

      </article>



      <!-- CARD 28 -->

      <article class="product-card" data-title="Tiny Congrats" data-price="480.000Ä‘" data-price-value="480000"

           data-color="bright"

           data-desc="Bó hoa nhá» nhưng cá»±c ká»³ rá»±c rá»¡, dÃ¹ng Ä‘á»ƒ chúc má»«ng nhá»¯ng cá»™t má»‘c nhá»: qua mÃ´n, nháº­n offer, cÃ³ viá»‡c má»›i."

           data-img="https://product.hstatic.net/200000846175/product/sunshine_love_9e96af195c024f4fbc1cd831fc3813e9.jpg"

           data-tags="Size nhá», ChÃºc má»«ng, NÄƒng lÆ°á»£ng">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/sunshine_love_9e96af195c024f4fbc1cd831fc3813e9.jpg"

           alt="Tiny Congrats">

        <div class="product-body">

          <div class="product-name">Tiny Congrats</div>

          <div class="product-price">480.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Size nhá»</span>

            <span class="tag ">Bó hoa</span>

            <span class="tag">ChÃºc má»«ng</span>

          </div>

        </div>

      </article>



      <!-- CARD 29 -->

      <article class="product-card" data-title="Moonlight Pastel" data-price="880.000Ä‘"

           data-price-value="880000" data-color="pastel"

           data-desc="Tone tím â€“ tráº¯ng nháº¹ nhÃ ng, cảm giác như Ã¡nh trÄƒng, ráº¥t hợp cho các buá»•i háº¹n tá»‘i hhoặc anniversary."

           data-img="https://product.hstatic.net/200000846175/product/4222a_6d61a8eea0984f23a73bc514d452e5d7.jpg"

           data-tags="Pastel, Lãng mạn, Buá»•i tá»‘i">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/4222a_6d61a8eea0984f23a73bc514d452e5d7.jpg"

           alt="Moonlight Pastel">

        <div class="product-body">

          <div class="product-name">Moonlight Pastel</div>

          <div class="product-price">880.000Ä‘</div>

          <div class="product-tags">

            <span class="tag tag-highlight">Pastel</span>

            <span class="tag ">Bó hoa</span>

            <span class="tag">Lãng mạn</span>

          </div>

        </div>

      </article>



      <!-- CARD 30 -->

      <article class="product-card" data-title="Everyday Hug" data-price="600.000Ä‘" data-price-value="600000"

           data-color="neutral"

           data-desc="Má»™t bÃ³ hoa daily size vá»«a, phÃ¹ hợp gá»­i Ä‘i báº¥t ká»³ ngÃ y nÃ o: xin lá»—i, cảm Æ¡n, Ä‘á»™ng viÃªn, hhoặc chá»‰ Ä‘Æ¡n giáº£n lÃ  â€œnhá»› báº¡nâ€."

           data-img="https://product.hstatic.net/200000846175/product/bo4291_9aac987dd9b54df9a356035b6f49f62f_master.jpg"

           data-tags="Dá»‹u dÃ ng, Cáº£m Æ¡n, Háº±ng ngÃ y">

        <img class="product-image"

           src="https://product.hstatic.net/200000846175/product/bo4291_9aac987dd9b54df9a356035b6f49f62f_master.jpg"

           alt="Everyday Hug">

        <div class="product-body">

          <div class="product-name">Everyday Hug</div>

          <div class="product-price">600.000Ä‘</div>

          <div class="product-tags">

            <span class="tag">Dá»‹u dÃ ng</span>

            <span class="tag ">Bó hoa</span>

            <span class="tag">Cáº£m Æ¡n</span>

          </div>

        </div>

      </article>

    </div>

  </div>

</main>



<!-- MODAL CHI TIáº¾T -->

<div class="product-modal-overlay" id="productModal">

  <div class="product-modal">

    <div class="modal-image-wrap">

      <img id="modalImg" src="" alt="">

    </div>

    <div class="modal-body">

      <button class="modal-close" id="modalClose">&times;</button>

      <h2 class="modal-title" id="modalTitle">TÃªn sáº£n pháº©m</h2>

      <div class="modal-price" id="modalPrice">GiÃ¡</div>

      <p class="modal-desc" id="modalDesc">MÃ´ táº£ sáº£n pháº©m...</p>

      <div class="modal-meta" id="modalMeta">

        Thiáº¿t káº¿ bá»Ÿi Tiệm Hoa nhà tớ. Có thể thay Ä‘á»•i một vÃ i loáº¡i hoa theo mÃ¹a mÃ  váº«n giữ Ä‘Ãºng tinh tháº§n bÃ³

        hoa.

      </div>

      <div class="modal-tags" id="modalTags">

        <!-- tags sáº½ Ä‘Æ°á»£c JS fill -->

      </div>

      <div class="modal-actions">

        <button class="btn-main">Äáº·t bÃ³ hoa nÃ y</button>

        <a class="btn-ghost" id="modalDetailLink" href="detail.html">Xem chi tiáº¿t</a>

        <button class="btn-ghost" id="modalClose2">ÄÃ³ng láº¡i</button>

      </div>

    </div>

  </div>

</div>



<!-- PAGINATION -->

<div class="pagination-container">

  <button class="page-btn" id="prevPage">â€¹</button>

  <button class="page-btn" id="prevPage">1</button>

  <button class="page-btn" id="prevPage">2</button>

  <button class="page-btn" id="prevPage">...</button>

  <button class="page-btn" id="prevPage">9</button>

  <button class="page-btn" id="prevPage">10</button>

  <div class="page-numbers" id="paginationNumbers"></div>

  <button class="page-btn" id="nextPage">â€º</button>

</div>



<!-- FOOTER -->

<site-footer></site-footer>



<!-- JS: xá»­ lÃ½ click card â†’ má»Ÿ modal + filter -->

<script>

  const cards = document.querySelectorAll('.product-card');

  const modalOverlay = document.getElementById('productModal');

  const modalImg = document.getElementById('modalImg');

  const modalTitle = document.getElementById('modalTitle');

  const modalPrice = document.getElementById('modalPrice');

  const modalDesc = document.getElementById('modalDesc');

  const modalTags = document.getElementById('modalTags');

  const modalClose = document.getElementById('modalClose');

  const modalClose2 = document.getElementById('modalClose2');



  const topicFilter = document.getElementById('topicFilter');

  const colorFilter = document.getElementById('colorFilter');

  const priceFilter = document.getElementById('priceFilter');



  // Má»Ÿ modal khi click card

  cards.forEach(card => {

    card.addEventListener('click', () => {

      const title = card.getAttribute('data-title') || '';

      const price = card.getAttribute('data-price') || '';

      const desc = card.getAttribute('data-desc') || '';

      const img = card.getAttribute('data-img') || '';

      const tagsStr = card.getAttribute('data-tags') || '';



      modalTitle.textContent = title;

      modalPrice.textContent = price;

      modalDesc.textContent = desc;

      modalImg.src = img;

      modalImg.alt = title;



      // fill tags

      modalTags.innerHTML = '';

      if (tagsStr) {

        tagsStr.split(',').forEach(t => {

          const tag = t.trim();

          if (!tag) return;

          const span = document.createElement('span');

          span.className = 'tag';

          span.textContent = tag;

          modalTags.appendChild(span);

        });

      }



      modalOverlay.classList.add('open');

    });

  });



  function closeModal() {

    modalOverlay.classList.remove('open');

  }



  modalClose.addEventListener('click', closeModal);

  modalClose2.addEventListener('click', closeModal);



  modalOverlay.addEventListener('click', (e) => {

    if (e.target === modalOverlay) {

      closeModal();

    }

  });



  document.addEventListener('keydown', (e) => {

    if (e.key === 'Escape') {

      closeModal();

    }

  });



  // FILTER LOGIC â€“ gá»n

  function applyFilters() {

    const topicVal = (topicFilter.value || 'all').toLowerCase();

    const colorVal = (colorFilter.value || 'all').toLowerCase();

    const priceVal = priceFilter.value || 'all';



    cards.forEach(card => {

      const tagsStr = (card.dataset.tags || '').toLowerCase();

      const cardColor = (card.dataset.color || '').toLowerCase();

      const priceNum = parseInt(card.dataset.priceValue || '0', 10);



      let matchesTopic = true;

      let matchesColor = true;

      let matchesPrice = true;



      // Chá»§ Ä‘á»

      if (topicVal !== 'all') {

        matchesTopic = tagsStr.includes(topicVal);

      }



      // MÃ u

      if (colorVal !== 'all') {

        matchesColor = cardColor === colorVal;

      }



      // GiÃ¡

      if (priceVal !== 'all') {

        if (!priceNum) {

          matchesPrice = false;

        } else if (priceVal === '0-600') {

          matchesPrice = priceNum <= 600000;

        } else if (priceVal === '600-800') {

          matchesPrice = priceNum > 600000 && priceNum <= 800000;

        } else if (priceVal === '800-1000') {

          matchesPrice = priceNum > 800000 && priceNum <= 1000000;

        } else if (priceVal === '1000plus') {

          matchesPrice = priceNum > 1000000;

        }

      }



      if (matchesTopic && matchesColor && matchesPrice) {

        card.style.display = 'flex';

      } else {

        card.style.display = 'none';

      }

    });

  }



  topicFilter.addEventListener('change', applyFilters);

  colorFilter.addEventListener('change', applyFilters);

  priceFilter.addEventListener('change', applyFilters);



  // Initial apply

  applyFilters();

</script>



</body>



</html>

