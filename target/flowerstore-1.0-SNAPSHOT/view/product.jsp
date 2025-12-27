<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="vi">
  <head>
    <meta charset="utf-8" />

    <title>Sản phẩm - Tiệm Hoa nhà tớ</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Font -->

    <link
      href="https://fonts.googleapis.com/css2?family=Crimson+Text:wght@400;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- CSS theme để giữ form header/footer giờng các trang khác -->

    <link
      href="//cdn.hstatic.net/themes/200000846175/1001403720/14/plugin-style.css?v=245"
      rel="stylesheet"
    />

    <link
      href="//cdn.hstatic.net/themes/200000846175/1001403720/14/styles-new.scss.css?v=245"
      rel="stylesheet"
    />

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

        font-family: "Crimson Text", -apple-system, BlinkMacSystemFont,
          "Segoe UI", sans-serif;
      }

      /* HERO */

      .product-hero {
        background: linear-gradient(
          135deg,
          var(--accent) 0%,
          var(--accent-dark) 100%
        );

        color: #fff;

        padding: 4rem 1.5rem 3rem;

        text-align: center;

        position: relative;

        overflow: hidden;
      }

      .product-hero::before {
        content: "";

        position: absolute;

        top: -50%;

        right: -8%;

        width: 420px;

        height: 420px;

        background: radial-gradient(
          circle,
          rgba(255, 255, 255, 0.15) 0%,
          transparent 70%
        );

        border-radius: 50%;
      }

      .product-hero::after {
        content: "";

        position: absolute;

        bottom: -35%;

        left: -10%;

        width: 360px;

        height: 360px;

        background: radial-gradient(
          circle,
          rgba(255, 255, 255, 0.08) 0%,
          transparent 70%
        );

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

      /* FILTER BAR – ngắn gọn, hiện đại */

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

      /* GRID CARD ĐỒNG ĐỀU */

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

        transition: transform 0.18s ease, box-shadow 0.18s ease,
          border-color 0.18s ease;
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
        font-size: 1rem;

        color: var(--accent-dark);

        font-weight: 600;
      }

      .product-tags {
        display: flex;

        flex-wrap: wrap;

        gap: 6px;

        font-size: 0.78rem;

        margin-top: 2px;

        max-height: 36px;

        overflow: hidden;
      }

      .tag {
        padding: 3px 10px;

        border-radius: 999px;

        background: #f4e1d1;

        color: #7b5641;
      }

      .tag-highlight {
        background: linear-gradient(135deg, var(--accent), var(--accent-dark));

        color: #fff;
      }

      /* FEATURED COLLECTION - Mới */

      .featured-collection {
        margin-bottom: 4rem;

        position: relative;
      }

      .featured-grid {
        display: grid;

        grid-template-columns: repeat(2, 1fr);

        gap: 24px;
      }

      @media (max-width: 768px) {
        .featured-grid {
          grid-template-columns: 1fr;
        }
      }

      .featured-card {
        border-radius: 20px;

        overflow: hidden;

        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);

        position: relative;

        cursor: pointer;
      }

      .featured-card.large {
        grid-column: span 2;
      }

      @media (max-width: 768px) {
        .featured-card.large {
          grid-column: span 1;
        }
      }

      .featured-image {
        width: 100%;

        height: 400px;

        object-fit: cover;
      }

      .featured-card.small .featured-image {
        height: 300px;
      }

      .featured-overlay {
        position: absolute;

        bottom: 0;

        left: 0;

        right: 0;

        background: linear-gradient(to top, rgba(0, 0, 0, 0.7), transparent);

        color: white;

        padding: 30px 20px 20px;
      }

      .featured-title {
        font-size: 1.5rem;

        font-weight: 700;

        margin-bottom: 8px;
      }

      .featured-desc {
        font-size: 0.95rem;

        opacity: 0.9;

        margin-bottom: 15px;
      }

      .featured-btn {
        background: var(--accent);

        color: white;

        border: none;

        padding: 8px 16px;

        border-radius: 999px;

        font-weight: 600;

        cursor: pointer;

        transition: background 0.2s;
      }

      .featured-btn:hover {
        background: var(--accent-dark);
      }

      /* MODAL CHI TIẾT SẢN PHẨM */

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

    
  </head>

  <body id="wandave-theme" class="index" data-theme="tbag-fashion">
    <!-- HEADER -->

    <%@ include file="partials/header.jsp" %>

    <main>
      <!-- HERO -->

      <section class="product-hero">
        <div class="product-hero-inner">
          <h1 class="product-title">Bộ sưu tập</h1>

          <p class="product-subtitle">Những bó hoa "trend" nhất của nhà tớ</p>
        </div>
      </section>

      <div class="product-wrapper">
        <!-- FILTER NGẮN GỌN -->

        <div class="filter-bar">
          <div class="filter-label-main">Bộ lọc</div>

          <div class="filter-controls">
            <select id="topicFilter" class="filter-select">
              <option value="all">Chủ đề: Tất cả</option>

              <option value="pastel">Pastel</option>

              <option value="chúc mừng">Chúc mừng</option>

              <option value="tỏ tình">Tỏ tình</option>

              <option value="khai trương">Khai trương</option>

              <option value="rustic">Rustic</option>

              <option value="size nhỏ">Size nhỏ</option>
            </select>

            <select id="colorFilter" class="filter-select">
              <option value="all">Màu: Tất cả</option>

              <option value="pastel">Pastel</option>

              <option value="neutral">Trắng / Be</option>

              <option value="warm">Cam / Vàng / Đỏ</option>

              <option value="rustic">Rustic / Nâu</option>

              <option value="bright">Rực rỡ</option>
            </select>

            <select id="priceFilter" class="filter-select">
              <option value="all">Giá: Tất cả</option>

              <option value="0-600">Dưới 600.000đ</option>

              <option value="600-800">600.000đ - 800.000đ</option>

              <option value="800-1000">800.000đ - 1.000.000đ</option>

              <option value="1000plus">Trên 1.000.000đ</option>
            </select>
          </div>
        </div>

        <!-- GRID PRODUCTS -->

        <div class="products-grid">
          <!-- CARD 1 -->

          <article
            class="product-card"
            data-title="Pastel Morning"
            data-price="650.000đ"
            data-price-value="650000"
            data-color="pastel"
            data-desc="Bó hoa tone pastel nhẹ nhàng với hồng kem, baby trắng và chút xanh bạc hà. Phù hợp để tặng sinh nhật, kỷ niệm hoặc đơn giản là gửi lời hỏi thăm."
            data-img="https://cdn.hstatic.net/files/200000846175/file/caf51f824f9dc2c39b8c.jpg"
            data-tags="Pastel, Dịu dàng, Sinh nhật, Kỷ niệm"
          >
            <img
              class="product-image"
              src="https://cdn.hstatic.net/files/200000846175/file/caf51f824f9dc2c39b8c.jpg"
              alt="Pastel Morning"
            />

            <div class="product-body">
              <div class="product-name">Pastel Morning</div>

              <div class="product-price">650.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Pastel</span>

                <span class="tag">Sinh nhật</span>

                <span class="tag">Dịu dàng</span>
              </div>
            </div>
          </article>

          <!-- CARD 2 -->

          <article
            class="product-card"
            data-title="Sunset Vibes"
            data-price="780.000đ"
            data-price-value="780000"
            data-color="warm"
            data-desc="Bó hoa tone cam - vàng rực rỡ như hoàng hôn, dành cho những dịp cần nhiều năng lượng tích cực: chúc mừng, tốt nghiệp, khai trương nhỏ."
            data-img="https://i.pinimg.com/736x/4c/e8/31/4ce831be8a5461c45b8e3dc582a4c49d.jpg"
            data-tags="Cam vàng, Năng lượng, Chúc mừng, Tốt nghiệp"
          >
            <img
              class="product-image"
              src="https://i.pinimg.com/736x/4c/e8/31/4ce831be8a5461c45b8e3dc582a4c49d.jpg"
              alt="Sunset Vibes"
            />

            <div class="product-body">
              <div class="product-name">Sunset Vibes</div>

              <div class="product-price">780.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Chúc mừng</span>

                <span class="tag">Tốt nghiệp</span>
              </div>
            </div>
          </article>

          <!-- CARD 3 -->

          <article
            class="product-card"
            data-title="Secret Love"
            data-price="890.000đ"
            data-price-value="890000"
            data-color="warm"
            data-desc="Một bó hoa tông đỏ - hồng đậm dành cho những lời tỏ tình hoặc kỷ niệm đặc biệt. Có thể thêm thiệp tay viết riêng theo yêu cầu."
            data-img="https://file.hstatic.net/200000846175/file/z5899444684804_c4148929b8f6ab395f69a93f4953035e.jpg"
            data-tags="Tỏ tình, Kỷ niệm, Lãng mạn"
          >
            <img
              class="product-image"
              src="https://file.hstatic.net/200000846175/file/z5899444684804_c4148929b8f6ab395f69a93f4953035e.jpg"
              alt="Secret Love"
            />

            <div class="product-body">
              <div class="product-name">Secret Love</div>

              <div class="product-price">890.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Tỏ tình</span>

                <span class="tag">Lãng mạn</span>
              </div>
            </div>
          </article>

          <!-- CARD 4 -->

          <article
            class="product-card"
            data-title="Rustic Garden"
            data-price="720.000đ"
            data-price-value="720000"
            data-color="rustic"
            data-desc="Thiết kế mang hơi hướng Rustic với hoa dại, lá xanh và giấy gói kraft. Rất hợp để tặng những người yêu sự mộc mạc, gần gũi."
            data-img="https://labellefleurdesign.ca/cdn/shop/files/C678B9EC-F26D-4D3C-AEBF-1C51240BB9EC_900x.jpg?v=1755052301"
            data-tags="Rustic, Mộc mạc, Tự nhiên"
          >
            <img
              class="product-image"
              src="https://labellefleurdesign.ca/cdn/shop/files/C678B9EC-F26D-4D3C-AEBF-1C51240BB9EC_900x.jpg?v=1755052301"
              alt="Rustic Garden"
            />

            <div class="product-body">
              <div class="product-name">Rustic Garden</div>

              <div class="product-price">720.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Rustic</span>

                <span class="tag">Mộc mạc</span>
              </div>
            </div>
          </article>

          <!-- CARD 5 -->

          <article
            class="product-card"
            data-title="Gentle Day"
            data-price="590.000đ"
            data-price-value="590000"
            data-color="neutral"
            data-desc="Bó hoa nhỏ xinh cho những lần ghé thăm bất ngờ: thăm bạn, thăm người thân, ghé nhà chơi cuối tuần."
            data-img="https://labellefleurdesign.ca/cdn/shop/files/390A0D4D-2CF4-42DF-A2C6-3F1ACF2B9A84_720x.jpg?v=1762023958"
            data-tags="Nhỏ xinh, Thăm người thân, Cuối tuần"
          >
            <img
              class="product-image"
              src="https://labellefleurdesign.ca/cdn/shop/files/390A0D4D-2CF4-42DF-A2C6-3F1ACF2B9A84_720x.jpg?v=1762023958"
              alt="Gentle Day"
            />

            <div class="product-body">
              <div class="product-name">Gentle Day</div>

              <div class="product-price">590.000đ</div>

              <div class="product-tags">
                <span class="tag">Nhỏ xinh</span>

                <span class="tag">Thăm người thân</span>
              </div>
            </div>
          </article>

          <!-- CARD 6 -->

          <article
            class="product-card"
            data-title="New Chapter"
            data-price="980.000đ"
            data-price-value="980000"
            data-color="warm"
            data-desc="Kệ hoa mini cho khai trương hoặc mừng bắt đầu một hành trình mới: mở tiệm, đổi việc, chuyển nhà."
            data-img="https://flowersight.com/wp-content/uploads/2024/08/bo-hoa-bi-kho-2.jpg"
            data-tags="Khai trương, Chúc mừng, Hành trình mới"
          >
            <img
              class="product-image"
              src="https://flowersight.com/wp-content/uploads/2024/08/bo-hoa-bi-kho-2.jpg"
              alt="New Chapter"
            />

            <div class="product-body">
              <div class="product-name">New Chapter</div>

              <div class="product-price">980.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Khai trương</span>

                <span class="tag">Chúc mừng</span>
              </div>
            </div>
          </article>

          <!-- CARD 7 -->

          <article
            class="product-card"
            data-title="Soft Cloud"
            data-price="630.000đ"
            data-price-value="630000"
            data-color="neutral"
            data-desc="Tone trắng - kem nhẹ nhàng như một đám mây. Phù hợp tặng sếp nữ, đồng nghiệp hoặc người yêu phong cách tối giản."
            data-img="https://flowersight.com/wp-content/uploads/2024/11/bo-hoa-lavender-2.jpg"
            data-tags="Trắng kem, Tối giản, Thanh lịch"
          >
            <img
              class="product-image"
              src="https://flowersight.com/wp-content/uploads/2024/11/bo-hoa-lavender-2.jpg"
              alt="Soft Cloud"
            />

            <div class="product-body">
              <div class="product-name">Soft Cloud</div>

              <div class="product-price">630.000đ</div>

              <div class="product-tags">
                <span class="tag">Trắng kem</span>

                <span class="tag">Thanh lịch</span>
              </div>
            </div>
          </article>

          <!-- CARD 8 -->

          <article
            class="product-card"
            data-title="Blush Story"
            data-price="710.000đ"
            data-price-value="710000"
            data-color="pastel"
            data-desc="Bó hoa hồng blush mix cùng các loại hoa nhập, cho cảm giác ngọt ngào và trưởng thành."
            data-img="https://i.pinimg.com/736x/49/bf/1f/49bf1f6ad5ab8ae0020a49df6eb4b7bf.jpg"
            data-tags="Blush, Ngọt ngào, Trưởng thành"
          >
            <img
              class="product-image"
              src="https://i.pinimg.com/736x/49/bf/1f/49bf1f6ad5ab8ae0020a49df6eb4b7bf.jpg"
              alt="Blush Story"
            />

            <div class="product-body">
              <div class="product-name">Blush Story</div>

              <div class="product-price">710.000đ</div>

              <div class="product-tags">
                <span class="tag">Ngọt ngào</span>

                <span class="tag">Blush</span>
              </div>
            </div>
          </article>

          <!-- CARD 9 -->

          <article
            class="product-card"
            data-title="Tiny Joy"
            data-price="490.000đ"
            data-price-value="490000"
            data-color="bright"
            data-desc="Một bó hoa size nhỏ nhưng đủ tinh tế để mang lại niềm vui bất ngờ cho người nhận."
            data-img="https://assets.oyegifts.com/flowers-n-gifts/vendordata/product/chocolate-bouquet-arrangement1.jpg"
            data-tags="Size nhỏ, Bất ngờ, Dễ thương"
          >
            <img
              class="product-image"
              src="https://assets.oyegifts.com/flowers-n-gifts/vendordata/product/chocolate-bouquet-arrangement1.jpg"
              alt="Tiny Joy"
            />

            <div class="product-body">
              <div class="product-name">Tiny Joy</div>

              <div class="product-price">490.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Size nhỏ</span>

                <span class="tag">Dễ thương</span>
              </div>
            </div>
          </article>

          <!-- CARD 10 -->

          <article
            class="product-card"
            data-title="Midnight Bloom"
            data-price="1.050.000đ"
            data-price-value="1050000"
            data-color="bright"
            data-desc="Một bó hoa đậm màu, sâu và ấn tượng, dành cho những dịp đặc biệt hoặc các buổi tiệc tối."
            data-img="https://cdn.hstatic.net/products/200000846175/z7055841284481_65e1d00537a4a1763b18c8bc1c973ee4_13b956b229424e40aeeed50f9dc9db02.jpg"
            data-tags="Tối, Ấn tượng, Đặc biệt"
          >
            <img
              class="product-image"
              src="https://cdn.hstatic.net/products/200000846175/z7055841284481_65e1d00537a4a1763b18c8bc1c973ee4_13b956b229424e40aeeed50f9dc9db02.jpg"
              alt="Midnight Bloom"
            />

            <div class="product-body">
              <div class="product-name">Midnight Bloom</div>

              <div class="product-price">1.050.000đ</div>

              <div class="product-tags">
                <span class="tag">Ấn tượng</span>

                <span class="tag">Buổi tối</span>
              </div>
            </div>
          </article>

          <!-- CARD 11 -->

          <article
            class="product-card"
            data-title="Peach Garden"
            data-price="740.000đ"
            data-price-value="740000"
            data-color="pastel"
            data-desc="Sự kết hợp giữa cam đào và hồng nude tạo cảm giác dịu ngọt, phù hợp tặng người yêu hoặc bạn thân."
            data-img="https://cdn.hstatic.net/files/200000846175/file/caf51f824f9dc2c39b8c.jpg"
            data-tags="Pastel, Ngọt ngào, Sinh nhật"
          >
            <img
              class="product-image"
              src="https://cdn.hstatic.net/files/200000846175/file/caf51f824f9dc2c39b8c.jpg"
              alt="Peach Garden"
            />

            <div class="product-body">
              <div class="product-name">Peach Garden</div>

              <div class="product-price">740.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Pastel</span>

                <span class="tag">Ngọt ngào</span>
              </div>
            </div>
          </article>

          <!-- CARD 12 -->

          <article
            class="product-card"
            data-title="Happy Launch"
            data-price="1.200.000đ"
            data-price-value="1200000"
            data-color="warm"
            data-desc="Kệ hoa đứng kích thước vừa cho khai trương, sử dụng tông cam - đỏ - vàng nổi bật nhưng vẫn tinh tế."
            data-img="https://cdn.hstatic.net/products/200000846175/cropped-img_3324-min_f06776d71d3747c6a9aa15f1bd952c3e.jpg"
            data-tags="Khai trương, Chúc mừng, Năng lượng"
          >
            <img
              class="product-image"
              src="https://cdn.hstatic.net/products/200000846175/cropped-img_3324-min_f06776d71d3747c6a9aa15f1bd952c3e.jpg"
              alt="Happy Launch"
            />

            <div class="product-body">
              <div class="product-name">Happy Launch</div>

              <div class="product-price">1.200.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Khai trương</span>

                <span class="tag">Chúc mừng</span>
              </div>
            </div>
          </article>

          <!-- CARD 13 -->

          <article
            class="product-card"
            data-title="First Confession"
            data-price="820.000đ"
            data-price-value="820000"
            data-color="warm"
            data-desc="Bó hoa dành riêng cho lần tỏ tình đầu tiên – nhẹ nhàng nhưng đủ để đối phương cảm nhận được tấm lòng."
            data-img="https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg"
            data-tags="Tỏ tình, Lãng mạn, Dịu dàng"
          >
            <img
              class="product-image"
              src="https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg"
              alt="First Confession"
            />

            <div class="product-body">
              <div class="product-name">First Confession</div>

              <div class="product-price">820.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Tỏ tình</span>

                <span class="tag">Lãng mạn</span>
              </div>
            </div>
          </article>

          <!-- CARD 14 -->

          <article
            class="product-card"
            data-title="Rustic Field"
            data-price="760.000đ"
            data-price-value="760000"
            data-color="rustic"
            data-desc="Hoa dại mix cúc họa mi và lá xanh, mang vibe đồng quê Rustic, cực hợp chụp ảnh hoặc trang trí bàn tiệc nhỏ."
            data-img="https://cdn.hstatic.net/products/200000846175/z6972264478686_18fb8035e79bcc2d3a7d76cc11e08cfa-min_acb8bbd4ec7d4e6da72de081429d56f6.jpg"
            data-tags="Rustic, Tự nhiên, Trang trí"
          >
            <img
              class="product-image"
              src="https://cdn.hstatic.net/products/200000846175/z6972264478686_18fb8035e79bcc2d3a7d76cc11e08cfa-min_acb8bbd4ec7d4e6da72de081429d56f6.jpg"
              alt="Rustic Field"
            />

            <div class="product-body">
              <div class="product-name">Rustic Field</div>

              <div class="product-price">760.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Rustic</span>

                <span class="tag">Tự nhiên</span>
              </div>
            </div>
          </article>

          <!-- CARD 15 -->

          <article
            class="product-card"
            data-title="Mini Cheer"
            data-price="450.000đ"
            data-price-value="450000"
            data-color="bright"
            data-desc="Size nhỏ nhưng rực rỡ, phù hợp gửi tặng đồng nghiệp hoặc bạn học để chúc mừng một cột mốc nhỏ."
            data-img="https://i.pinimg.com/1200x/47/cf/c5/47cfc59443bd54c107109254cb9b6c9a.jpg"
            data-tags="Size nhỏ, Chúc mừng, Dễ thương"
          >
            <img
              class="product-image"
              src="https://i.pinimg.com/1200x/47/cf/c5/47cfc59443bd54c107109254cb9b6c9a.jpg"
              alt="Mini Cheer"
            />

            <div class="product-body">
              <div class="product-name">Mini Cheer</div>

              <div class="product-price">450.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Size nhỏ</span>

                <span class="tag">Chúc mừng</span>
              </div>
            </div>
          </article>

          <!-- CARD 16 -->

          <article
            class="product-card"
            data-title="Pastel Cloud"
            data-price="700.000đ"
            data-price-value="700000"
            data-color="pastel"
            data-desc="Một phiên bản pastel tone lạnh, hơi xanh – phù hợp cho những ai yêu sự thanh thoát, nhẹ nhàng."
            data-img="https://i.pinimg.com/736x/eb/16/79/eb1679190e0940e17f5a8f85e3ba6e80.jpg"
            data-tags="Pastel, Thanh lịch, Trắng kem"
          >
            <img
              class="product-image"
              src="https://i.pinimg.com/736x/eb/16/79/eb1679190e0940e17f5a8f85e3ba6e80.jpg"
              alt="Pastel Cloud"
            />

            <div class="product-body">
              <div class="product-name">Pastel Cloud</div>

              <div class="product-price">700.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Pastel</span>

                <span class="tag">Thanh lịch</span>
              </div>
            </div>
          </article>

          <!-- CARD 17 -->

          <article
            class="product-card"
            data-title="Warm Congrats"
            data-price="900.000đ"
            data-price-value="900000"
            data-color="warm"
            data-desc="Bó hoa chúc mừng với màu sắc ấm áp, thích hợp cho lễ tốt nghiệp, thăng chức hoặc kỷ niệm quan trọng."
            data-img="https://i.pinimg.com/736x/72/ff/2d/72ff2d6157cd2c05bc63ade3b4db8804.jpg"
            data-tags="Chúc mừng, Tốt nghiệp, Ấm áp"
          >
            <img
              class="product-image"
              src="https://i.pinimg.com/736x/72/ff/2d/72ff2d6157cd2c05bc63ade3b4db8804.jpg"
              alt="Warm Congrats"
            />

            <div class="product-body">
              <div class="product-name">Warm Congrats</div>

              <div class="product-price">900.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Chúc mừng</span>

                <span class="tag">Ấm áp</span>
              </div>
            </div>
          </article>

          <!-- CARD 18 -->

          <article
            class="product-card"
            data-title="Little Secret"
            data-price="520.000đ"
            data-price-value="520000"
            data-color="pastel"
            data-desc='Một bó hoa size nhỏ nhưng đủ "hint" cho người nhận hiểu rằng bạn đang để ý họ đó.'
            data-img="https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg"
            data-tags="Size nhỏ, Tỏ tình, Dễ thương"
          >
            <img
              class="product-image"
              src="https://file.hstatic.net/200000846175/file/z5318389113228_bf05d1d394f756ddf038d8894726eb4c_cf4c6b6a880841b6b51d904a62b0035c.jpg"
              alt="Little Secret"
            />

            <div class="product-body">
              <div class="product-name">Little Secret</div>

              <div class="product-price">520.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Size nhỏ</span>

                <span class="tag">Tỏ tình</span>
              </div>
            </div>
          </article>

          <!-- CARD 19 -->

          <article
            class="product-card"
            data-title="Rustic Corner"
            data-price="780.000đ"
            data-price-value="780000"
            data-color="rustic"
            data-desc="Bó hoa Rustic với giấy kraft nâu, phù hợp trang trí góc phòng hoặc tặng người yêu phong cách vintage."
            data-img="https://cdn.hstatic.net/products/200000846175/z7055841284481_65e1d00537a4a1763b18c8bc1c973ee4_13b956b229424e40aeeed50f9dc9db02.jpg"
            data-tags="Rustic, Vintage, Trang trí"
          >
            <img
              class="product-image"
              src="https://cdn.hstatic.net/products/200000846175/z7055841284481_65e1d00537a4a1763b18c8bc1c973ee4_13b956b229424e40aeeed50f9dc9db02.jpg"
              alt="Rustic Corner"
            />

            <div class="product-body">
              <div class="product-name">Rustic Corner</div>

              <div class="product-price">780.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Rustic</span>

                <span class="tag">Vintage</span>
              </div>
            </div>
          </article>

          <!-- CARD 20 -->

          <article
            class="product-card"
            data-title="Pastel Hug"
            data-price="830.000đ"
            data-price-value="830000"
            data-color="pastel"
            data-desc="Bó hoa pastel size vừa, cảm giác như một cái ôm ấm áp bằng hoa – rất hợp để xin lỗi hoặc cảm ơn."
            data-img="https://cdn.hstatic.net/files/200000846175/file/caf51f824f9dc2c39b8c.jpg"
            data-tags="Pastel, Dịu dàng, Cảm ơn"
          >
            <img
              class="product-image"
              src="https://cdn.hstatic.net/files/200000846175/file/caf51f824f9dc2c39b8c.jpg"
              alt="Pastel Hug"
            />

            <div class="product-body">
              <div class="product-name">Pastel Hug</div>

              <div class="product-price">830.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Pastel</span>

                <span class="tag">Cảm ơn</span>
              </div>
            </div>
          </article>

          <!-- CARD 21 -->

          <article
            class="product-card"
            data-title="Morning Breeze"
            data-price="610.000đ"
            data-price-value="610000"
            data-color="neutral"
            data-desc="Bó hoa với tông trắng – xanh nhạt, cảm giác như làn gió sớm, rất hợp tặng người yêu phong cách nhẹ nhàng, tối giản."
            data-img="https://product.hstatic.net/200000846175/product/img_4671_2_369a926803a441f8b151b07fda5ebfa9.jpg"
            data-tags="Trắng kem, Thanh lịch, Dịu dàng"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/img_4671_2_369a926803a441f8b151b07fda5ebfa9.jpg"
              alt="Morning Breeze"
            />

            <div class="product-body">
              <div class="product-name">Morning Breeze</div>

              <div class="product-price">610.000đ</div>

              <div class="product-tags">
                <span class="tag">Trắng kem</span>

                <span class="tag">Thanh lịch</span>
              </div>
            </div>
          </article>

          <!-- CARD 22 -->

          <article
            class="product-card"
            data-title="Candy Pastel"
            data-price="690.000đ"
            data-price-value="690000"
            data-color="pastel"
            data-desc="Có cảm giác như một túi kẹo pastel: hồng, tím, xanh bạc hà – rất hợp cho sinh nhật, tiệc nhỏ hoặc tặng em bé."
            data-img="https://product.hstatic.net/200000846175/product/z6454060934882_e2efb036301b855787dd0f781d9141da_9fbb50e1bb2c45a4b03028de62fcfbc0.jpg"
            data-tags="Pastel, Sinh nhật, Ngọt ngào"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/z6454060934882_e2efb036301b855787dd0f781d9141da_9fbb50e1bb2c45a4b03028de62fcfbc0.jpg"
              alt="Candy Pastel"
            />

            <div class="product-body">
              <div class="product-name">Candy Pastel</div>

              <div class="product-price">690.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Pastel</span>

                <span class="tag">Sinh nhật</span>
              </div>
            </div>
          </article>

          <!-- CARD 23 -->

          <article
            class="product-card"
            data-title="Golden Day"
            data-price="870.000đ"
            data-price-value="870000"
            data-color="warm"
            data-desc="Bó hoa vàng – kem sang trọng, hợp tặng sếp, đối tác hoặc dịp kỷ niệm công ty."
            data-img="https://product.hstatic.net/200000846175/product/z6454060934882_e2efb036301b855787dd0f781d9141da_9fbb50e1bb2c45a4b03028de62fcfbc0.jpg"
            data-tags="Chúc mừng, Ấm áp, Thanh lịch"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/z6454060934882_e2efb036301b855787dd0f781d9141da_9fbb50e1bb2c45a4b03028de62fcfbc0.jpg"
              alt="Golden Day"
            />

            <div class="product-body">
              <div class="product-name">Golden Day</div>

              <div class="product-price">870.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Chúc mừng</span>

                <span class="tag">Ấm áp</span>
              </div>
            </div>
          </article>

          <!-- CARD 24 -->

          <article
            class="product-card"
            data-title="Forest Rustic"
            data-price="790.000đ"
            data-price-value="790000"
            data-color="rustic"
            data-desc="Hoa lá xanh chủ đạo, kết hợp giấy kraft nâu tạo vibe rừng thông, hợp cho người yêu thiên nhiên."
            data-img="https://product.hstatic.net/200000846175/product/94920ec8303c8e62d72d_41a28bad275d4ea884ed53e80eaa7b13.jpg"
            data-tags="Rustic, Tự nhiên, Vintage"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/94920ec8303c8e62d72d_41a28bad275d4ea884ed53e80eaa7b13.jpg"
              alt="Forest Rustic"
            />

            <div class="product-body">
              <div class="product-name">Forest Rustic</div>

              <div class="product-price">790.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Rustic</span>

                <span class="tag">Tự nhiên</span>
              </div>
            </div>
          </article>

          <!-- CARD 25 -->

          <article
            class="product-card"
            data-title="Mini Pastel Box"
            data-price="560.000đ"
            data-price-value="560000"
            data-color="pastel"
            data-desc="Box hoa size nhỏ tone pastel, gọn gàng nhưng vẫn xinh xắn – để bàn làm việc hoặc gửi tặng bất ngờ."
            data-img="https://product.hstatic.net/200000846175/product/w6_57fe7e7ee65f4097aef741ba053a4609.jpg"
            data-tags="Size nhỏ, Pastel, Dễ thương"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/w6_57fe7e7ee65f4097aef741ba053a4609.jpg"
              alt="Mini Pastel Box"
            />

            <div class="product-body">
              <div class="product-name">Mini Pastel Box</div>

              <div class="product-price">560.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Size nhỏ</span>

                <span class="tag">Pastel</span>
              </div>
            </div>
          </article>

          <!-- CARD 26 -->

          <article
            class="product-card"
            data-title="Blush Heart"
            data-price="910.000đ"
            data-price-value="910000"
            data-color="pastel"
            data-desc="Bó hoa hồng blush dáng dài, cực hợp cho những lời tỏ tình hoặc kỷ niệm 100 ngày, 1 năm yêu."
            data-img="https://product.hstatic.net/200000846175/product/z5619438426742_221c9401ed237fd2bfac8b971bf0daa7_5e41076729424e2c9796c35d45383b78.jpg"
            data-tags="Tỏ tình, Lãng mạn, Ngọt ngào"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/z5619438426742_221c9401ed237fd2bfac8b971bf0daa7_5e41076729424e2c9796c35d45383b78.jpg"
              alt="Blush Heart"
            />

            <div class="product-body">
              <div class="product-name">Blush Heart</div>

              <div class="product-price">910.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Tỏ tình</span>

                <span class="tag">Ngọt ngào</span>
              </div>
            </div>
          </article>

          <!-- CARD 27 -->

          <article
            class="product-card"
            data-title="Coffee Rustic"
            data-price="730.000đ"
            data-price-value="730000"
            data-color="rustic"
            data-desc="Tông nâu – be như một ly latte: dùng hoa khô và hoa tươi mix, hợp tặng người yêu phong cách trầm ấm."
            data-img="https://product.hstatic.net/200000846175/product/z4344034401236_bcef0d35bda443dafcdff70b6e2edffa_75cf540049d44f219ac42c311bddfdfc.jpg"
            data-tags="Rustic, Ấm áp, Vintage"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/z4344034401236_bcef0d35bda443dafcdff70b6e2edffa_75cf540049d44f219ac42c311bddfdfc.jpg"
              alt="Coffee Rustic"
            />

            <div class="product-body">
              <div class="product-name">Coffee Rustic</div>

              <div class="product-price">730.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Rustic</span>

                <span class="tag">Ấm áp</span>
              </div>
            </div>
          </article>

          <!-- CARD 28 -->

          <article
            class="product-card"
            data-title="Tiny Congrats"
            data-price="480.000đ"
            data-price-value="480000"
            data-color="bright"
            data-desc="Bó hoa nhỏ nhưng cực kỳ rực rỡ, dùng để chúc mừng những cột mốc nhỏ: qua môn, nhận offer, có việc mới."
            data-img="https://product.hstatic.net/200000846175/product/sunshine_love_9e96af195c024f4fbc1cd831fc3813e9.jpg"
            data-tags="Size nhỏ, Chúc mừng, Năng lượng"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/sunshine_love_9e96af195c024f4fbc1cd831fc3813e9.jpg"
              alt="Tiny Congrats"
            />

            <div class="product-body">
              <div class="product-name">Tiny Congrats</div>

              <div class="product-price">480.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Size nhỏ</span>

                <span class="tag">Chúc mừng</span>
              </div>
            </div>
          </article>

          <!-- CARD 29 -->

          <article
            class="product-card"
            data-title="Moonlight Pastel"
            data-price="880.000đ"
            data-price-value="880000"
            data-color="pastel"
            data-desc="Tone tím – trắng nhẹ nhàng, cảm giác như ánh trăng, rất hợp cho các buổi hẹn tối hoặc anniversary."
            data-img="https://product.hstatic.net/200000846175/product/4222a_6d61a8eea0984f23a73bc514d452e5d7.jpg"
            data-tags="Pastel, Lãng mạn, Buổi tối"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/4222a_6d61a8eea0984f23a73bc514d452e5d7.jpg"
              alt="Moonlight Pastel"
            />

            <div class="product-body">
              <div class="product-name">Moonlight Pastel</div>

              <div class="product-price">880.000đ</div>

              <div class="product-tags">
                <span class="tag tag-highlight">Pastel</span>

                <span class="tag">Lãng mạn</span>
              </div>
            </div>
          </article>

          <!-- CARD 30 -->

          <article
            class="product-card"
            data-title="Everyday Hug"
            data-price="600.000đ"
            data-price-value="600000"
            data-color="neutral"
            data-desc='Một bó hoa daily size vừa, phù hợp gửi đi bất kỳ ngày nào: xin lỗi, cảm ơn, động viên, hoặc chỉ đơn giản là "nhớ bạn".'
            data-img="https://product.hstatic.net/200000846175/product/bo4291_9aac987dd9b54df9a356035b6f49f62f_master.jpg"
            data-tags="Dịu dàng, Cảm ơn, Hằng ngày"
          >
            <img
              class="product-image"
              src="https://product.hstatic.net/200000846175/product/bo4291_9aac987dd9b54df9a356035b6f49f62f_master.jpg"
              alt="Everyday Hug"
            />

            <div class="product-body">
              <div class="product-name">Everyday Hug</div>

              <div class="product-price">600.000đ</div>

              <div class="product-tags">
                <span class="tag">Dịu dàng</span>

                <span class="tag">Cảm ơn</span>
              </div>
            </div>
          </article>
        </div>

        <!-- PAGINATION (hiển thị cho đẹp, chưa bắt buộc xử lý JS) -->

        <div class="pagination-container">
          <button class="page-btn" id="prevPage">‹</button>

          <button class="page-number active">1</button>

          <button class="page-number">2</button>

          <span class="page-dots">...</span>

          <button class="page-number">9</button>

          <button class="page-number">10</button>

          <button class="page-btn" id="nextPage">›</button>
        </div>
      </div>
    </main>

    <!-- MODAL CHI TIẾT -->

    <div class="product-modal-overlay" id="productModal">
      <div class="product-modal">
        <div class="modal-image-wrap">
          <img id="modalImg" src="" alt="" />
        </div>

        <div class="modal-body">
          <button class="modal-close" id="modalClose">&times;</button>

          <h2 class="modal-title" id="modalTitle">Tên sản phẩm</h2>

          <div class="modal-price" id="modalPrice">Giá</div>

          <p class="modal-desc" id="modalDesc">Mô tả sản phẩm...</p>

          <div class="modal-meta" id="modalMeta">
            Thiết kế bởi Tiệm Hoa nhà tớ. Có thể thay đổi một vài loại hoa theo
            mùa mà vẫn giữ đúng tinh thần bó hoa.
          </div>

          <div class="modal-tags" id="modalTags">
            <!-- tags sẽ được JS fill -->
          </div>

          <div class="modal-actions">
            <button class="btn-main">Đặt bó hoa này</button>

            <a class="btn-ghost" id="modalDetailLink" href="detail.jsp"
              >Xem chi tiết</a
            >

            <button class="btn-ghost" id="modalClose2">Đóng lại</button>
          </div>
        </div>
      </div>
    </div>

    <!-- FOOTER -->

    <%@ include file="partials/footer.jsp" %>

    <!-- JS: xử lý click card → mở modal + filter + collection tabs -->

    <script>
      const cards = document.querySelectorAll(".product-card");

      const modalOverlay = document.getElementById("productModal");

      const modalImg = document.getElementById("modalImg");

      const modalTitle = document.getElementById("modalTitle");

      const modalPrice = document.getElementById("modalPrice");

      const modalDesc = document.getElementById("modalDesc");

      const modalTags = document.getElementById("modalTags");

      const modalClose = document.getElementById("modalClose");

      const modalClose2 = document.getElementById("modalClose2");

      const topicFilter = document.getElementById("topicFilter");

      const colorFilter = document.getElementById("colorFilter");

      const priceFilter = document.getElementById("priceFilter");

      const tabButtons = document.querySelectorAll(".tab-btn");

      let activeCollection = "all";

      // Mở modal khi click card

      cards.forEach((card) => {
        card.addEventListener("click", () => {
          const title = card.getAttribute("data-title") || "";

          const price = card.getAttribute("data-price") || "";

          const desc = card.getAttribute("data-desc") || "";

          const img = card.getAttribute("data-img") || "";

          const tagsStr = card.getAttribute("data-tags") || "";

          modalTitle.textContent = title;

          modalPrice.textContent = price;

          modalDesc.textContent = desc;

          modalImg.src = img;

          modalImg.alt = title;

          // fill tags

          modalTags.innerHTML = "";

          if (tagsStr) {
            tagsStr.split(",").forEach((t) => {
              const tag = t.trim();

              if (!tag) return;

              const span = document.createElement("span");

              span.className = "tag";

              span.textContent = tag;

              modalTags.appendChild(span);
            });
          }

          modalOverlay.classList.add("open");
        });
      });

      function closeModal() {
        modalOverlay.classList.remove("open");
      }

      modalClose.addEventListener("click", closeModal);

      modalClose2.addEventListener("click", closeModal);

      modalOverlay.addEventListener("click", (e) => {
        if (e.target === modalOverlay) {
          closeModal();
        }
      });

      document.addEventListener("keydown", (e) => {
        if (e.key === "Escape") {
          closeModal();
        }
      });

      // COLLECTION TABS

      tabButtons.forEach((btn) => {
        btn.addEventListener("click", () => {
          tabButtons.forEach((b) => b.classList.remove("active"));

          btn.classList.add("active");

          activeCollection = btn.dataset.collection || "all";

          applyFilters();
        });
      });

      // FILTER LOGIC – gọn, kết hợp collection tab

      function applyFilters() {
        const topicVal = (topicFilter.value || "all").toLowerCase();

        const colorVal = (colorFilter.value || "all").toLowerCase();

        const priceVal = priceFilter.value || "all";

        cards.forEach((card) => {
          const tagsStr = (card.dataset.tags || "").toLowerCase();

          const cardColor = (card.dataset.color || "").toLowerCase();

          const priceNum = parseInt(card.dataset.priceValue || "0", 10);

          let matchesTopic = true;

          let matchesColor = true;

          let matchesPrice = true;

          let matchesCollection = true;

          // Chủ đề

          if (topicVal !== "all") {
            matchesTopic = tagsStr.includes(topicVal);
          }

          // Màu

          if (colorVal !== "all") {
            matchesColor = cardColor === colorVal;
          }

          // Giá

          if (priceVal !== "all") {
            if (!priceNum) {
              matchesPrice = false;
            } else if (priceVal === "0-600") {
              matchesPrice = priceNum <= 600000;
            } else if (priceVal === "600-800") {
              matchesPrice = priceNum > 600000 && priceNum <= 800000;
            } else if (priceVal === "800-1000") {
              matchesPrice = priceNum > 800000 && priceNum <= 1000000;
            } else if (priceVal === "1000plus") {
              matchesPrice = priceNum > 1000000;
            }
          }

          // Nhóm collection (giờng các web xu hướng)

          const tagsHas = (kw) => tagsStr.includes(kw);

          if (activeCollection === "pastel") {
            matchesCollection = cardColor === "pastel";
          } else if (activeCollection === "rustic") {
            matchesCollection = cardColor === "rustic";
          } else if (activeCollection === "mini") {
            matchesCollection = tagsHas("size nhỏ");
          } else if (activeCollection === "celebrate") {
            matchesCollection = tagsHas("chúc mừng") || tagsHas("khai trương");
          } else if (activeCollection === "daily") {
            matchesCollection = cardColor === "neutral";
          } else {
            matchesCollection = true; // all
          }

          if (
            matchesTopic &&
            matchesColor &&
            matchesPrice &&
            matchesCollection
          ) {
            card.style.display = "flex";
          } else {
            card.style.display = "none";
          }
        });
      }

      topicFilter.addEventListener("change", applyFilters);

      colorFilter.addEventListener("change", applyFilters);

      priceFilter.addEventListener("change", applyFilters);

      // Initial apply

      applyFilters();
    </script>
  </body>
</html>

