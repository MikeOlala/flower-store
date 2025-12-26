<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="vi">

<head>

  <meta charset="UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Quáº£n Trá»‹ - Tiệm Hoa nhà tớ</title>

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

      <h2><i class="fas fa-flower"></i> <span>Tiệm Hoa nhÃ  tớ</span></h2>

    </div>

    <div class="sidebar-menu">

      <div class="menu-item active" data-target="dashboard">

        <i class="fas fa-tachometer-alt"></i>

        <span>Dashboard</span>

      </div>

      <div class="menu-item" data-target="orders">

        <i class="fas fa-shopping-cart"></i>

        <span>ÄÆ¡n HÃ ng</span>

      </div>

      <div class="menu-item" data-target="products">

        <i class="fas fa-box"></i>

        <span>Sáº£n Pháº©m</span>

      </div>

      <div class="menu-item" data-target="customers">

        <i class="fas fa-users"></i>

        <span>KhÃ¡ch HÃ ng</span>

      </div>

      <div class="menu-item" data-target="analytics">

        <i class="fas fa-chart-bar"></i>

        <span>Thá»‘ng KÃª</span>

      </div>

      <div class="menu-item" data-target="promotions">

        <i class="fas fa-tags"></i>

        <span>Khuyáº¿n MÃ£i</span>

      </div>

      <div class="menu-item" data-target="settings">

        <i class="fas fa-cog"></i>

        <span>CÃ i Äáº·t</span>

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

            <div class="user-name">Quáº£n Trá»‹ ViÃªn</div>

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

              <p>ÄÆ¡n HÃ ng Má»›i</p>

            </div>

          </div>

          <div class="stat-card">

            <div class="stat-icon">

              <i class="fas fa-dollar-sign"></i>

            </div>

            <div class="stat-info">

              <h3>28.450.000Ä‘</h3>

              <p>Doanh Thu HÃ´m Nay</p>

            </div>

          </div>

          <div class="stat-card">

            <div class="stat-icon">

              <i class="fas fa-users"></i>

            </div>

            <div class="stat-info">

              <h3>3.248</h3>

              <p>KhÃ¡ch HÃ ng</p>

            </div>

          </div>

          <div class="stat-card">

            <div class="stat-icon">

              <i class="fas fa-box"></i>

            </div>

            <div class="stat-info">

              <h3>64</h3>

              <p>Sáº£n Pháº©m</p>

            </div>

          </div>

        </div>



        <!-- Charts and Orders -->

        <div class="form-row">

          <div class="card" style="flex: 2;">

            <div class="card-header">

              <h3>Thá»‘ng KÃª Doanh Thu</h3>

            </div>

            <div class="card-body">

              <div class="chart-container">

                <div style="background: linear-gradient(to right, var(--accent), var(--accent-dark)); height: 100%; display: flex; align-items: center; justify-content: center; color: white; border-radius: 10px;">

                  <div style="text-align: center;">

                    <i class="fas fa-chart-line" style="font-size: 3rem; margin-bottom: 10px;"></i>

                    <p>Biá»ƒu Ä‘á»“ doanh thu 7 ngÃ y qua</p>

                    <div style="margin-top: 20px; display: flex; justify-content: space-around; width: 100%;">

                      <div>Thá»© 2: 5.2tr</div>

                      <div>Thá»© 3: 6.8tr</div>

                      <div>Thá»© 4: 4.5tr</div>

                      <div>Thá»© 5: 7.1tr</div>

                      <div>Thá»© 6: 8.3tr</div>

                      <div>Thá»© 7: 9.7tr</div>

                      <div>CN: 10.2tr</div>

                    </div>

                  </div>

                </div>

              </div>

            </div>

          </div>



          <div class="card" style="flex: 1;">

            <div class="card-header">

              <h3>Tráº¡ng ThÃ¡i ÄÆ¡n HÃ ng</h3>

            </div>

            <div class="card-body">

              <div class="progress-container">

                <div class="progress-label">

                  <span>Äang chá» xá»­ lÃ½</span>

                  <span>45</span>

                </div>

                <div class="progress-bar">

                  <div class="progress-fill" style="width: 45%; background-color: var(--accent);"></div>

                </div>

              </div>

              <div class="progress-container">

                <div class="progress-label">

                  <span>Äang giao hÃ ng</span>

                  <span>32</span>

                </div>

                <div class="progress-bar">

                  <div class="progress-fill" style="width: 32%; background-color: #6a994e;"></div>

                </div>

              </div>

              <div class="progress-container">

                <div class="progress-label">

                  <span>ÄÃ£ hoa n thÃ nh</span>

                  <span>75</span>

                </div>

                <div class="progress-bar">

                  <div class="progress-fill" style="width: 75%; background-color: #386641;"></div>

                </div>

              </div>

              <div class="progress-container">

                <div class="progress-label">

                  <span>ÄÃ£ há»§y</span>

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

              <h3>ÄÆ¡n HÃ ng Gáº§n ÄÃ¢y</h3>

              <button class="btn btn-primary btn-sm" id="viewAllOrders">Xem Táº¥t Cáº£</button>

            </div>

            <div class="card-body">

              <table>

                <thead>

                  <tr>

                    <th>MÃ£ ÄH</th>

                    <th>KhÃ¡ch HÃ ng</th>

                    <th>NgÃ y Äáº·t</th>

                    <th>Tá»•ng Tiá»n</th>

                    <th>Tráº¡ng ThÃ¡i</th>

                    <th>Thao TÃ¡c</th>

                  </tr>

                </thead>

                <tbody>

                  <tr>

                    <td>#DH-00125</td>

                    <td>Nguyá»…n VÄƒn A</td>

                    <td>15/06/2023</td>

                    <td>850.000Ä‘</td>

                    <td><span class="status status-active">Äang giao</span></td>

                    <td class="action-buttons">

                      <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>

                      <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>

                    </td>

                  </tr>

                  <tr>

                    <td>#DH-00124</td>

                    <td>Tráº§n Thá»‹ B</td>

                    <td>15/06/2023</td>

                    <td>1.250.000Ä‘</td>

                    <td><span class="status status-pending">Chá» xá»­ lÃ½</span></td>

                    <td class="action-buttons">

                      <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>

                      <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>

                    </td>

                  </tr>

                  <tr>

                    <td>#DH-00123</td>

                    <td>LÃª VÄƒn C</td>

                    <td>14/06/2023</td>

                    <td>650.000Ä‘</td>

                    <td><span class="status status-completed">ÄÃ£ hoa n thÃ nh</span></td>

                    <td class="action-buttons">

                      <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>

                      <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>

                    </td>

                  </tr>

                  <tr>

                    <td>#DH-00122</td>

                    <td>Pháº¡m Thá»‹ D</td>

                    <td>14/06/2023</td>

                    <td>2.150.000Ä‘</td>

                    <td><span class="status status-inactive">ÄÃ£ há»§y</span></td>

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

            <h3>Quáº£n LÃ½ Sáº£n Pháº©m</h3>

            <button class="btn btn-primary" id="addProductBtn"><i class="fas fa-plus"></i> ThÃªm Sáº£n Pháº©m</button>

          </div>

          <div class="card-body">

            <div class="tabs" id="productTabs">

              <div class="tab active" data-tab="all">Táº¥t Cáº£ Sáº£n Pháº©m</div>

              <div class="tab" data-tab="featured">Sáº£n Pháº©m Ná»•i Báº­t</div>

              <div class="tab" data-tab="low-stock">Äang Háº¿t HÃ ng</div>

            </div>

            <table>

              <thead>

                <tr>

                  <th>HÃ¬nh áº¢nh</th>

                  <th>TÃªn Sáº£n Pháº©m</th>

                  <th>GiÃ¡</th>

                  <th>Tá»“n Kho</th>

                  <th>Danh Má»¥c</th>

                  <th>Tráº¡ng ThÃ¡i</th>

                  <th>Thao TÃ¡c</th>

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

                  <td>650.000Ä‘</td>

                  <td>15</td>

                  <td>Pastel</td>

                  <td><span class="status status-active">Äang bÃ¡n</span></td>

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

                  <td>890.000Ä‘</td>

                  <td>8</td>

                  <td>Lãng mạn</td>

                  <td><span class="status status-active">Äang bÃ¡n</span></td>

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

                  <td>720.000Ä‘</td>

                  <td>0</td>

                  <td>Rustic</td>

                  <td><span class="status status-inactive">Háº¿t hÃ ng</span></td>

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

            <h3>Quáº£n LÃ½ ÄÆ¡n HÃ ng</h3>

            <div>

              <button class="btn btn-light" id="filterOrders"><i class="fas fa-filter"></i> Lá»c</button>

              <button class="btn btn-primary" id="exportOrders"><i class="fas fa-download"></i> Xuáº¥t Excel</button>

            </div>

          </div>

          <div class="card-body">

            <div class="tabs" id="orderTabs">

              <div class="tab active" data-status="all">Táº¥t Cáº£ ÄÆ¡n HÃ ng</div>

              <div class="tab" data-status="pending">Chá» Xá»­ LÃ½</div>

              <div class="tab" data-status="shipping">Äang Giao HÃ ng</div>

              <div class="tab" data-status="completed">ÄÃ£ HoÃ n ThÃ nh</div>

              <div class="tab" data-status="cancelled">ÄÃ£ Há»§y</div>

            </div>

            <table>

              <thead>

                <tr>

                  <th>MÃ£ ÄH</th>

                  <th>KhÃ¡ch HÃ ng</th>

                  <th>NgÃ y Äáº·t</th>

                  <th>Sáº£n Pháº©m</th>

                  <th>Tá»•ng Tiá»n</th>

                  <th>Tráº¡ng ThÃ¡i</th>

                  <th>Thao TÃ¡c</th>

                </tr>

              </thead>

              <tbody>

                <tr>

                  <td>#DH-00130</td>

                  <td>Nguyá»…n Thá»‹ E</td>

                  <td>16/06/2023</td>

                  <td>Bó Hoa Pastel Morning</td>

                  <td>650.000Ä‘</td>

                  <td><span class="status status-pending">Chá» xá»­ lÃ½</span></td>

                  <td class="action-buttons">

                    <button class="btn btn-primary btn-sm view-order"><i class="fas fa-eye"></i></button>

                    <button class="btn btn-success btn-sm edit-order"><i class="fas fa-edit"></i></button>

                    <button class="btn btn-danger btn-sm cancel-order"><i class="fas fa-times"></i></button>

                  </td>

                </tr>

                <tr>

                  <td>#DH-00129</td>

                  <td>Tráº§n VÄƒn F</td>

                  <td>16/06/2023</td>

                  <td>Bó Hoa Secret Love</td>

                  <td>890.000Ä‘</td>

                  <td><span class="status status-active">Äang giao</span></td>

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

            <h3>Quáº£n LÃ½ Sáº£n Pháº©m</h3>

            <button class="btn btn-primary" id="addNewProductBtn"><i class="fas fa-plus"></i> ThÃªm Sáº£n Pháº©m Má»›i</button>

          </div>

          <div class="card-body">

            <div class="tabs" id="productManagementTabs">

              <div class="tab active" data-category="all">Táº¥t Cáº£ Sáº£n Pháº©m</div>

              <div class="tab" data-category="category">Theo Danh Má»¥c</div>

              <div class="tab" data-category="new">Sáº£n Pháº©m Má»›i</div>

            </div>

            <div class="form-row">

              <div class="form-group" style="flex: 2;">

                <input type="text" class="form-control" id="productSearch" placeholder="TÃ¬m kiáº¿m sáº£n pháº©m...">

              </div>

              <div class="form-group" style="flex: 1;">

                <select class="form-control" id="categoryFilter">

                  <option value="all">Tất cả danh má»¥c</option>

                  <option value="pastel">Pastel</option>

                  <option value="rustic">Rustic</option>

                  <option value="romantic">Lãng mạn</option>

                  <option value="celebration">ChÃºc má»«ng</option>

                </select>

              </div>

              <div class="form-group" style="flex: 1;">

                <select class="form-control" id="statusFilter">

                  <option value="all">Tất cả tráº¡ng thÃ¡i</option>

                  <option value="active">Äang bÃ¡n</option>

                  <option value="out-of-stock">Háº¿t hÃ ng</option>

                  <option value="hidden">áº¨n</option>

                </select>

              </div>

            </div>

            <table>

              <thead>

                <tr>

                  <th>ID</th>

                  <th>HÃ¬nh áº¢nh</th>

                  <th>TÃªn Sáº£n Pháº©m</th>

                  <th>GiÃ¡</th>

                  <th>Tá»“n Kho</th>

                  <th>Danh Má»¥c</th>

                  <th>Tráº¡ng ThÃ¡i</th>

                  <th>Thao TÃ¡c</th>

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

                  <td>650.000Ä‘</td>

                  <td>15</td>

                  <td>Pastel</td>

                  <td><span class="status status-active">Äang bÃ¡n</span></td>

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

                  <td>890.000Ä‘</td>

                  <td>8</td>

                  <td>Lãng mạn</td>

                  <td><span class="status status-active">Äang bÃ¡n</span></td>

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

                  <td>720.000Ä‘</td>

                  <td>0</td>

                  <td>Rustic</td>

                  <td><span class="status status-inactive">Háº¿t hÃ ng</span></td>

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

                  <td>780.000Ä‘</td>

                  <td>12</td>

                  <td>ChÃºc má»«ng</td>

                  <td><span class="status status-active">Äang bÃ¡n</span></td>

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

            <h3>Quáº£n LÃ½ KhÃ¡ch HÃ ng</h3>

            <button class="btn btn-primary" id="addCustomerBtn"><i class="fas fa-plus"></i> ThÃªm KhÃ¡ch HÃ ng</button>

          </div>

          <div class="card-body">

            <div class="tabs" id="customerTabs">

              <div class="tab active" data-type="all">Táº¥t Cáº£ KhÃ¡ch HÃ ng</div>

              <div class="tab" data-type="vip">KhÃ¡ch HÃ ng ThÃ¢n Thiáº¿t</div>

              <div class="tab" data-type="new">KhÃ¡ch HÃ ng Má»›i</div>

            </div>

            <table>

              <thead>

                <tr>

                  <th>ID</th>

                  <th>Há» TÃªn</th>

                  <th>Email</th>

                  <th>Sá»‘ Äiá»‡n Thoáº¡i</th>

                  <th>ÄÆ¡n HÃ ng</th>

                  <th>Tá»•ng Chi TiÃªu</th>

                  <th>Tráº¡ng ThÃ¡i</th>

                  <th>Thao TÃ¡c</th>

                </tr>

              </thead>

              <tbody>

                <tr>

                  <td>KH-001</td>

                  <td>Nguyá»…n VÄƒn A</td>

                  <td>nguyenvana@email.com</td>

                  <td>0912345678</td>

                  <td>15</td>

                  <td>12.450.000Ä‘</td>

                  <td><span class="status status-active">Hoáº¡t Ä‘á»™ng</span></td>

                  <td class="action-buttons">

                    <button class="btn btn-primary btn-sm view-customer"><i class="fas fa-eye"></i></button>

                    <button class="btn btn-success btn-sm edit-customer"><i class="fas fa-edit"></i></button>

                    <button class="btn btn-danger btn-sm delete-customer"><i class="fas fa-trash"></i></button>

                  </td>

                </tr>

                <tr>

                  <td>KH-002</td>

                  <td>Tráº§n Thá»‹ B</td>

                  <td>tranthib@email.com</td>

                  <td>0987654321</td>

                  <td>8</td>

                  <td>7.820.000Ä‘</td>

                  <td><span class="status status-active">Hoáº¡t Ä‘á»™ng</span></td>

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

            <h3>PhÃ¢n TÃ­ch & BÃ¡o CÃ¡o</h3>

            <div>

              <select class="form-control" id="reportPeriod" style="width: 200px; display: inline-block;">

                <option value="7">7 ngÃ y qua</option>

                <option value="30">30 ngÃ y qua</option>

                <option value="90">3 thÃ¡ng qua</option>

                <option value="365">NÄƒm nay</option>

              </select>

              <button class="btn btn-primary" id="exportReport"><i class="fas fa-download"></i> Xuáº¥t BÃ¡o CÃ¡o</button>

            </div>

          </div>

          <div class="card-body">

            <div class="form-row">

              <div class="card" style="flex: 1;">

                <div class="card-header">

                  <h4>Doanh Thu Theo Danh Má»¥c</h4>

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

                      <span>ChÃºc má»«ng</span>

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

                  <h4>Sáº£n Pháº©m BÃ¡n Cháº¡y</h4>

                </div>

                <div class="card-body">

                  <div style="margin-bottom: 15px;">

                    <div style="display: flex; justify-content: space-between;">

                      <span>Bó Hoa Pastel Morning</span>

                      <span>45 lÆ°á»£t</span>

                    </div>

                  </div>

                  <div style="margin-bottom: 15px;">

                    <div style="display: flex; justify-content: space-between;">

                      <span>Bó Hoa Secret Love</span>

                      <span>38 lÆ°á»£t</span>

                    </div>

                  </div>

                  <div style="margin-bottom: 15px;">

                    <div style="display: flex; justify-content: space-between;">

                      <span>Bó Hoa Rustic Garden</span>

                      <span>32 lÆ°á»£t</span>

                    </div>

                  </div>

                  <div style="margin-bottom: 15px;">

                    <div style="display: flex; justify-content: space-between;">

                      <span>Bó Hoa Sunset Vibes</span>

                      <span>28 lÆ°á»£t</span>

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

            <h3>Quáº£n LÃ½ Khuyáº¿n MÃ£i</h3>

            <button class="btn btn-primary" id="addPromotionBtn"><i class="fas fa-plus"></i> ThÃªm Khuyáº¿n MÃ£i</button>

          </div>

          <div class="card-body">

            <div class="tabs" id="promotionTabs">

              <div class="tab active" data-status="all">Táº¥t Cáº£ Khuyáº¿n MÃ£i</div>

              <div class="tab" data-status="active">Äang Diá»…n Ra</div>

              <div class="tab" data-status="upcoming">Sáº¯p Diá»…n Ra</div>

              <div class="tab" data-status="ended">ÄÃ£ Káº¿t ThÃºc</div>

            </div>

            <table>

              <thead>

                <tr>

                  <th>MÃ£ KM</th>

                  <th>TÃªn Khuyáº¿n MÃ£i</th>

                  <th>Loáº¡i</th>

                  <th>GiÃ¡ Trá»‹</th>

                  <th>NgÃ y Báº¯t Äáº§u</th>

                  <th>NgÃ y Káº¿t ThÃºc</th>

                  <th>Tráº¡ng ThÃ¡i</th>

                  <th>Thao TÃ¡c</th>

                </tr>

              </thead>

              <tbody>

                <tr>

                  <td>KM-001</td>

                  <td>Giáº£m 20% cho Ä‘Æ¡n Ä‘áº§u tiÃªn</td>

                  <td>Pháº§n trÄƒm</td>

                  <td>20%</td>

                  <td>01/06/2023</td>

                  <td>30/06/2023</td>

                  <td><span class="status status-active">Äang cháº¡y</span></td>

                  <td class="action-buttons">

                    <button class="btn btn-primary btn-sm view-promotion"><i class="fas fa-eye"></i></button>

                    <button class="btn btn-success btn-sm edit-promotion"><i class="fas fa-edit"></i></button>

                    <button class="btn btn-danger btn-sm delete-promotion"><i class="fas fa-trash"></i></button>

                  </td>

                </tr>

                <tr>

                  <td>KM-002</td>

                  <td>Miá»…n phÃ­ váº­n chuyá»ƒn</td>

                  <td>Váº­n chuyá»ƒn</td>

                  <td>0Ä‘</td>

                  <td>15/06/2023</td>

                  <td>30/06/2023</td>

                  <td><span class="status status-active">Äang cháº¡y</span></td>

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

            <h3>CÃ i Äáº·t Há»‡ Thá»‘ng</h3>

          </div>

          <div class="card-body">

            <div class="tabs" id="settingsTabs">

              <div class="tab active" data-setting="store">ThÃ´ng Tin Cá»­a HÃ ng</div>

              <div class="tab" data-setting="shipping">Váº­n Chuyá»ƒn</div>

              <div class="tab" data-setting="payment">Thanh ToÃ¡n</div>

              <div class="tab" data-setting="notification">ThÃ´ng BÃ¡o</div>

            </div>

            <div class="form-row">

              <div class="form-group">

                <label>TÃªn Cá»­a HÃ ng</label>

                <input type="text" class="form-control" value="Tiệm Hoa nhà tớ">

              </div>

              <div class="form-group">

                <label>Sá»‘ Äiá»‡n Thoáº¡i</label>

                <input type="text" class="form-control" value="0909 123 456">

              </div>

            </div>

            <div class="form-row">

              <div class="form-group">

                <label>Email</label>

                <input type="email" class="form-control" value="contact@tienghoanhato.com">

              </div>

              <div class="form-group">

                <label>Äá»‹a Chá»‰</label>

                <input type="text" class="form-control" value="123 ÄÆ°á»ng Hoa, Quáº­n 1, TP.HCM">

              </div>

            </div>

            <div class="form-group">

              <label>MÃ´ Táº£ Cá»­a HÃ ng</label>

              <textarea class="form-control" rows="4">Tiệm Hoa nhà tớ chuyÃªn cung cáº¥p các loáº¡i hoa tÆ°Æ¡i, bÃ³ hoa Ä‘áº¹p vá»›i giÃ¡ cáº£ hợp lÃ½. ChÃºng tÃ´i cam káº¿t mang Ä‘áº¿n cho khách hÃ ng nhá»¯ng sáº£n pháº©m cháº¥t lÆ°á»£ng nháº¥t.</textarea>

            </div>

            <div class="form-group">

              <button class="btn btn-primary" id="saveSettings">LÆ°u Thay Äá»•i</button>

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

        <h3>ThÃªm Sáº£n Pháº©m Má»›i</h3>

        <button class="modal-close" id="closeProductModal">&times;</button>

      </div>

      <div class="modal-body">

        <div class="form-group">

          <label>TÃªn Sáº£n Pháº©m</label>

          <input type="text" class="form-control" placeholder="Nháº­p tÃªn sáº£n pháº©m">

        </div>

        <div class="form-row">

          <div class="form-group">

            <label>GiÃ¡</label>

            <input type="number" class="form-control" placeholder="Nháº­p giÃ¡">

          </div>

          <div class="form-group">

            <label>Sá»‘ LÆ°á»£ng</label>

            <input type="number" class="form-control" placeholder="Nháº­p sá»‘ lÆ°á»£ng">

          </div>

        </div>

        <div class="form-group">

          <label>Danh Má»¥c</label>

          <select class="form-control">

            <option>Pastel</option>

            <option>Rustic</option>

            <option>Lãng mạn</option>

            <option>ChÃºc má»«ng</option>

            <option>Khai trÆ°Æ¡ng</option>

          </select>

        </div>

        <div class="form-group">

          <label>MÃ´ Táº£</label>

          <textarea class="form-control" rows="4" placeholder="Nháº­p mÃ´ táº£ sáº£n pháº©m"></textarea>

        </div>

        <div class="form-group">

          <label>HÃ¬nh áº¢nh</label>

          <input type="file" class="form-control">

        </div>

        <div class="form-group">

          <button class="btn btn-primary" style="width: 100%;" id="submitProduct">ThÃªm Sáº£n Pháº©m</button>

        </div>

      </div>

    </div>

  </div>



  <!-- Notification -->

  <div class="notification" id="notification">

    <i class="fas fa-check-circle"></i>

    <div>

      <div style="font-weight: 600;" id="notificationTitle">ThÃ nh công!</div>

      <div style="font-size: 0.9rem; color: var(--brown-soft);" id="notificationMessage">Thao tÃ¡c Ä‘Ã£ Ä‘Æ°á»£c thá»±c hiá»‡n</div>

    </div>

  </div>



  <script>

    // Dá»¯ liá»‡u máº«u

    const sampleData = {

      orders: [

        { id: 'DH-00125', customer: 'Nguyá»…n VÄƒn A', date: '15/06/2023', total: '850.000Ä‘', status: 'active' },

        { id: 'DH-00124', customer: 'Tráº§n Thá»‹ B', date: '15/06/2023', total: '1.250.000Ä‘', status: 'pending' },

        { id: 'DH-00123', customer: 'LÃª VÄƒn C', date: '14/06/2023', total: '650.000Ä‘', status: 'completed' },

        { id: 'DH-00122', customer: 'Pháº¡m Thá»‹ D', date: '14/06/2023', total: '2.150.000Ä‘', status: 'inactive' }

      ],

      products: [

        { id: 'SP-001', name: 'Bó Hoa Pastel Morning', price: '650.000Ä‘', stock: 15, category: 'Pastel', status: 'active' },

        { id: 'SP-002', name: 'Bó Hoa Secret Love', price: '890.000Ä‘', stock: 8, category: 'Lãng mạn', status: 'active' },

        { id: 'SP-003', name: 'Bó Hoa Rustic Garden', price: '720.000Ä‘', stock: 0, category: 'Rustic', status: 'inactive' },

        { id: 'SP-004', name: 'Bó Hoa Sunset Vibes', price: '780.000Ä‘', stock: 12, category: 'ChÃºc má»«ng', status: 'active' }

      ]

    };



    // Khá»Ÿi táº¡o á»©ng dá»¥ng

    document.addEventListener('DOMContentLoaded', function() {

      initializeApp();

    });



    function initializeApp() {

      // Xá»­ lÃ½ menu navigation

      document.querySelectorAll('.menu-item').forEach(item => {

        item.addEventListener('click', function() {

          // XÃ³a active class tá»« táº¥t cáº£ các menu item

          document.querySelectorAll('.menu-item').forEach(i => {

            i.classList.remove('active');

          });

          

          // ThÃªm active class cho menu item Ä‘Æ°á»£c click

          this.classList.add('active');

          

          // áº¨n táº¥t cáº£ các content section

          document.querySelectorAll('.content-section').forEach(section => {

            section.classList.remove('active');

          });

          

          // Hiá»ƒn thá»‹ content section tÆ°Æ¡ng á»©ng

          const target = this.getAttribute('data-target');

          document.getElementById(target).classList.add('active');

          

          // Cáº­p nháº­t tiÃªu Ä‘á» header

          document.querySelector('.header-left h1').textContent = this.querySelector('span').textContent;

        });

      });



      // Xá»­ lÃ½ tab switching

      document.querySelectorAll('.tabs').forEach(tabGroup => {

        tabGroup.querySelectorAll('.tab').forEach(tab => {

          tab.addEventListener('click', function() {

            // XÃ³a active class tá»« táº¥t cáº£ các tab trong cÃ¹ng nhÃ³m

            const parent = this.closest('.tabs');

            parent.querySelectorAll('.tab').forEach(t => {

              t.classList.remove('active');

            });

            

            // ThÃªm active class cho tab Ä‘Æ°á»£c click

            this.classList.add('active');

            

            // Thá»±c hiá»‡n các hÃ nh Ä‘á»™ng dá»±a trÃªn tab Ä‘Æ°á»£c chá»n

            handleTabChange(this);

          });

        });

      });



      // Xá»­ lÃ½ modal thêm sáº£n pháº©m

      document.getElementById('addProductBtn').addEventListener('click', function() {

        document.getElementById('addProductModal').style.display = 'flex';

      });



      document.getElementById('addNewProductBtn').addEventListener('click', function() {

        document.getElementById('addProductModal').style.display = 'flex';

      });



      document.getElementById('closeProductModal').addEventListener('click', function() {

        document.getElementById('addProductModal').style.display = 'none';

      });



      // ÄÃ³ng modal khi click bÃªn ngoÃ i

      document.getElementById('addProductModal').addEventListener('click', function(e) {

        if (e.target === this) {

          this.style.display = 'none';

        }

      });



      // Xá»­ lÃ½ thêm sáº£n pháº©m

      document.getElementById('submitProduct').addEventListener('click', function() {

        document.getElementById('addProductModal').style.display = 'none';

        showNotification('ThÃ nh công!', 'Sản phẩm Ä‘Ã£ Ä‘Æ°á»£c thêm thÃ nh công');

      });



      // Xá»­ lÃ½ các nÃºt thao tÃ¡c

      document.querySelectorAll('.view-order, .edit-order, .delete-product, .view-product, .edit-product, .complete-order, .cancel-order').forEach(btn => {

        btn.addEventListener('click', function(e) {

          e.stopPropagation();

          const action = this.classList[2]; // Láº¥y class thá»© 3 Ä‘á»ƒ xÃ¡c Ä‘á»‹nh hÃ nh Ä‘á»™ng

          handleAction(action, this);

        });

      });



      // Xá»­ lÃ½ nÃºt xem táº¥t cáº£ Ä‘Æ¡n hÃ ng

      document.getElementById('viewAllOrders').addEventListener('click', function() {

        // Chuyá»ƒn Ä‘áº¿n trang Ä‘Æ¡n hÃ ng

        document.querySelectorAll('.menu-item').forEach(i => i.classList.remove('active'));

        document.querySelector('.menu-item[data-target="orders"]').classList.add('active');

        

        document.querySelectorAll('.content-section').forEach(section => {

          section.classList.remove('active');

        });

        document.getElementById('orders').classList.add('active');

        

        document.querySelector('.header-left h1').textContent = 'ÄÆ¡n HÃ ng';

      });



      // Xá»­ lÃ½ tÃ¬m kiáº¿m sáº£n pháº©m

      document.getElementById('productSearch').addEventListener('input', function() {

        filterProducts();

      });



      // Xá»­ lÃ½ lá»c danh má»¥c

      document.getElementById('categoryFilter').addEventListener('change', function() {

        filterProducts();

      });



      // Xá»­ lÃ½ lá»c tráº¡ng thÃ¡i

      document.getElementById('statusFilter').addEventListener('change', function() {

        filterProducts();

      });



      // Xá»­ lÃ½ xuáº¥t bÃ¡o cÃ¡o

      document.getElementById('exportReport').addEventListener('click', function() {

        showNotification('ThÃ nh công!', 'BÃ¡o cÃ¡o Ä‘Ã£ Ä‘Æ°á»£c xuáº¥t thÃ nh công');

      });



      // Xá»­ lÃ½ lÆ°u cÃ i Ä‘áº·t

      document.getElementById('saveSettings').addEventListener('click', function() {

        showNotification('ThÃ nh công!', 'CÃ i Ä‘áº·t Ä‘Ã£ Ä‘Æ°á»£c lÆ°u thÃ nh công');

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

      // Logic lá»c sáº£n pháº©m theo tab

      console.log('Lá»c sáº£n pháº©m theo:', tabType);

    }



    function filterOrdersByStatus(status) {

      // Logic lá»c Ä‘Æ¡n hÃ ng theo tráº¡ng thÃ¡i

      console.log('Lá»c Ä‘Æ¡n hÃ ng theo tráº¡ng thÃ¡i:', status);

    }



    function filterProductsByCategory(category) {

      // Logic lá»c sáº£n pháº©m theo danh má»¥c

      console.log('Lá»c sáº£n pháº©m theo danh má»¥c:', category);

    }



    function filterCustomersByType(type) {

      // Logic lá»c khách hÃ ng theo loáº¡i

      console.log('Lá»c khách hÃ ng theo loáº¡i:', type);

    }



    function filterPromotionsByStatus(status) {

      // Logic lá»c khuyáº¿n mÃ£i theo tráº¡ng thÃ¡i

      console.log('Lá»c khuyáº¿n mÃ£i theo tráº¡ng thÃ¡i:', status);

    }



    function showSettingsTab(setting) {

      // Logic hiá»ƒn thá»‹ tab cÃ i Ä‘áº·t

      console.log('Hiá»ƒn thá»‹ cÃ i Ä‘áº·t:', setting);

    }



    function filterProducts() {

      const searchTerm = document.getElementById('productSearch').value.toLowerCase();

      const category = document.getElementById('categoryFilter').value;

      const status = document.getElementById('statusFilter').value;

      

      // Logic lá»c sáº£n pháº©m dá»±a trÃªn các Ä‘iá»u kiá»‡n

      console.log('TÃ¬m kiáº¿m:', searchTerm, 'Danh má»¥c:', category, 'Tráº¡ng thÃ¡i:', status);

    }



    function handleAction(action, element) {

      switch(action) {

        case 'view-order':

          showNotification('Xem Ä‘Æ¡n hÃ ng', 'Äang má»Ÿ chi tiáº¿t Ä‘Æ¡n hÃ ng');

          break;

        case 'edit-order':

          showNotification('Sá»­a Ä‘Æ¡n hÃ ng', 'Äang má»Ÿ form chá»‰nh sá»­a Ä‘Æ¡n hÃ ng');

          break;

        case 'delete-product':

          if (confirm('Báº¡n cÃ³ cháº¯c cháº¯n muá»‘n xÃ³a sáº£n pháº©m nÃ y?')) {

            showNotification('ThÃ nh công!', 'Sản phẩm Ä‘Ã£ Ä‘Æ°á»£c xÃ³a');

          }

          break;

        case 'view-product':

          showNotification('Xem sáº£n pháº©m', 'Äang má»Ÿ chi tiáº¿t sáº£n pháº©m');

          break;

        case 'edit-product':

          showNotification('Sá»­a sáº£n pháº©m', 'Äang má»Ÿ form chá»‰nh sá»­a sáº£n pháº©m');

          break;

        case 'complete-order':

          showNotification('ThÃ nh công!', 'ÄÆ¡n hÃ ng Ä‘Ã£ Ä‘Æ°á»£c Ä‘Ã¡nh dáº¥u hoa n thÃ nh');

          break;

        case 'cancel-order':

          if (confirm('Báº¡n cÃ³ cháº¯c cháº¯n muá»‘n há»§y Ä‘Æ¡n hÃ ng nÃ y?')) {

            showNotification('ThÃ nh công!', 'ÄÆ¡n hÃ ng Ä‘Ã£ Ä‘Æ°á»£c há»§y');

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



    // Xá»­ lÃ½ responsive sidebar

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

