<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="vi">

<head>

  <meta charset="UTF-8">

  <title>Sá»­a há»“ sÆ¡</title>



  <!-- MDB CSS -->

  <link rel="stylesheet" href="../../MDB5-STANDARD-UI-KIT-Free-9.2.0 (1)/css/mdb.min.css">

  <link rel="stylesheet" href="../assets/settingProfile.css">



  <!-- Bootstrap Icons -->

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>



<body>

<!-- Header -->

<div class="header d-flex align-items-center justify-content-between px-3 py-2">

  <a href="profileCustomer.html" class="text-white fs-5"><i class="bi bi-arrow-left"></i></a>

  <h5 class="m-0 text-white">CÃ i Ä‘áº·t há»“ sÆ¡</h5>

  <button class="btn text-white fw-bold" id="saveProfile">âœ”</button>

</div>



<!-- Avatar -->

<div class="avatar-section text-center py-4">

  <div class="avatar-wrapper mx-auto">

    <img id="avatarPreview" src="img/default-avatar.png" alt="Avatar" class="avatar-img rounded-circle">

    <label for="avatarInput" class="btn-edit">Sá»­a</label>

    <input type="file" id="avatarInput" accept="image/*" hidden>

  </div>

</div>



<!-- Profile Items -->

<div class="container mt-2">

  <div class="profile-item d-flex justify-content-between align-items-center" data-modal="nameModal">

    <span class="field-name">TÃªn</span>

    <a href="javascript:void(0)" class="action">Thiáº¿t láº­p ngay</a>

  </div>



  <div class="profile-item d-flex justify-content-between align-items-center" data-modal="bioModal">

    <span class="field-name">Bio</span>

    <a href="javascript:void(0)" class="action">Thiáº¿t láº­p ngay</a>

  </div>



  <div class="profile-item d-flex justify-content-between align-items-center" data-modal="genderModal">

    <span class="field-name">Giá»›i tÃ­nh</span>

    <a href="javascript:void(0)" class="action">Thiáº¿t láº­p ngay</a>

  </div>



  <div class="profile-item d-flex justify-content-between align-items-center" data-modal="birthModal">

    <span class="field-name">NgÃ y sinh</span>

    <a href="javascript:void(0)" class="action">Thiáº¿t láº­p ngay</a>

  </div>



  <div class="section-label mt-3">ThÃ´ng tin cÃ¡ nhÃ¢n</div>

  <div class="profile-item d-flex justify-content-between align-items-center" data-modal="phoneModal">

    <span>Sá»‘ Ä‘iá»‡n thoáº¡i</span>

    <a href="javascript:void(0)" class="action">Thiáº¿t láº­p ngay</a>

  </div>



  <div class="profile-item d-flex justify-content-between align-items-center" data-modal="emailModal">

    <span>Email</span>

    <a href="javascript:void(0)" class="action">Thiáº¿t láº­p ngay</a>

  </div>



  <!-- NÃºt chuyá»ƒn sang trang TÃ i khoáº£n liÃªn káº¿t -->

  <div class="setting-item" onclick="goToLinkedAccount()">

    <div class="section-label mt-3">TÃ i khoáº£n liÃªn káº¿t</div>

  </div>

</div>



<!-- ====== MODALS ====== -->



<!-- Name Modal -->

<div id="nameModal" class="custom-modal" aria-hidden="true">

  <div class="modal-content">

    <h5 class="mb-3">Nháº­p tÃªn cá»§a báº¡n</h5>

    <div class="form-outline mb-3">

      <input type="text" id="nameInput" class="form-control form-control-lg" placeholder=" " />

      <label class="form-label" for="nameInput">Há» vÃ  tÃªn</label>

    </div>

    <div class="d-flex justify-content-end">

      <button class="btn-save" onclick="saveField('nameModal','TÃªn','nameInput')">LÆ°u</button>

    </div>

  </div>

</div>



<!-- Bio Modal -->

<div id="bioModal" class="custom-modal" aria-hidden="true">

  <div class="modal-content">

    <h5 class="mb-3">Giá»›i thiá»‡u báº£n thÃ¢n</h5>

    <div class="form-outline mb-3">

      <textarea id="bioInput" class="form-control form-control-lg" rows="3" placeholder=" "></textarea>

      <label class="form-label" for="bioInput">Bio</label>

    </div>

    <div class="d-flex justify-content-end">

      <button class="btn-save" onclick="saveField('bioModal','Bio','bioInput')">LÆ°u</button>

    </div>

  </div>

</div>



<!-- Gender Modal -->

<div id="genderModal" class="custom-modal" aria-hidden="true">

  <div class="modal-content">

    <h5 class="mb-3">Chá»n giờ›i tÃ­nh</h5>

    <div class="form-outline mb-3">

      <select id="genderInput" class="form-select form-control-lg" placeholder=" ">

        <option value="">-- Chá»n giờ›i tÃ­nh --</option>

        <option value="Nam">Nam</option>

        <option value="Ná»¯">Ná»¯</option>

        <option value="KhÃ¡c">KhÃ¡c</option>

      </select>

      <label class="form-label" for="genderInput">Giá»›i tÃ­nh</label>

    </div>

    <div class="d-flex justify-content-end">

      <button class="btn-save" onclick="saveField('genderModal','Giá»›i tÃ­nh','genderInput')">LÆ°u</button>

    </div>

  </div>

</div>



<!-- Birth Modal -->

<div id="birthModal" class="custom-modal" aria-hidden="true">

  <div class="modal-content">

    <h5 class="mb-3">NgÃ y sinh</h5>

    <div class="form-outline mb-3">

      <input type="date" id="birthInput" class="form-control form-control-lg" placeholder=" " />

      <label class="form-label" for="birthInput">NgÃ y sinh</label>

    </div>

    <div class="d-flex justify-content-end">

      <button class="btn-save" onclick="saveField('birthModal','NgÃ y sinh','birthInput')">LÆ°u</button>

    </div>

  </div>

</div>



<!-- Phone Modal -->

<div id="phoneModal" class="custom-modal" aria-hidden="true">

  <div class="modal-content">

    <h5 class="mb-3">Nháº­p sá»‘ Ä‘iá»‡n thoáº¡i</h5>

    <div class="form-outline mb-3">

      <input type="tel" id="phoneInput" class="form-control form-control-lg" placeholder=" " pattern="[0-9]{10}" />

      <label class="form-label" for="phoneInput">Sá»‘ Ä‘iá»‡n thoáº¡i</label>

    </div>

    <div class="d-flex justify-content-end">

      <button class="btn-save" onclick="saveField('phoneModal','Sá»‘ Ä‘iá»‡n thoáº¡i','phoneInput')">LÆ°u</button>

    </div>

  </div>

</div>



<!-- Email Modal -->

<div id="emailModal" class="custom-modal" aria-hidden="true">

  <div class="modal-content">

    <h5 class="mb-3">Nháº­p email cá»§a báº¡n</h5>

    <div class="form-outline mb-3">

      <input type="email" id="emailInput" class="form-control form-control-lg" placeholder=" " />

      <label class="form-label" for="emailInput">Äá»‹a chá»‰ email</label>

    </div>

    <div class="d-flex justify-content-end">

      <button class="btn-save" onclick="saveField('emailModal','Email','emailInput')">LÆ°u</button>

    </div>

  </div>

</div>



<!-- Scripts -->

<script src="../../MDB5-STANDARD-UI-KIT-Free-9.2.0 (1)/js/mdb.umd.min.js"></script>

<script src="fileJS/settingProfile.js"></script>



<!-- ThÃªm hÃ m chuyá»ƒn trang -->

<script>

  function goToLinkedAccount() {

    window.location.href = "linkAccount.html";

  }

</script>

</body>

</html>



