<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa hồ sơ</title>

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
    <h5 class="m-0 text-white">Cài đặt hồ sơ</h5>
    <button class="btn text-white fw-bold" id="saveProfile">✔</button>
</div>

<!-- Avatar -->
<div class="avatar-section text-center py-4">
    <div class="avatar-wrapper mx-auto">
        <img id="avatarPreview" src="img/default-avatar.png" alt="Avatar" class="avatar-img rounded-circle">
        <label for="avatarInput" class="btn-edit">Sửa</label>
        <input type="file" id="avatarInput" accept="image/*" hidden>
    </div>
</div>

<!-- Profile Items -->
<div class="container mt-2">
    <div class="profile-item d-flex justify-content-between align-items-center" data-modal="nameModal">
        <span class="field-name">Tên</span>
        <a href="javascript:void(0)" class="action">Thiết lập ngay</a>
    </div>

    <div class="profile-item d-flex justify-content-between align-items-center" data-modal="bioModal">
        <span class="field-name">Bio</span>
        <a href="javascript:void(0)" class="action">Thiết lập ngay</a>
    </div>

    <div class="profile-item d-flex justify-content-between align-items-center" data-modal="genderModal">
        <span class="field-name">Giới tính</span>
        <a href="javascript:void(0)" class="action">Thiết lập ngay</a>
    </div>

    <div class="profile-item d-flex justify-content-between align-items-center" data-modal="birthModal">
        <span class="field-name">Ngày sinh</span>
        <a href="javascript:void(0)" class="action">Thiết lập ngay</a>
    </div>

    <div class="section-label mt-3">Thông tin cá nhân</div>
    <div class="profile-item d-flex justify-content-between align-items-center" data-modal="phoneModal">
        <span>Số điện thoại</span>
        <a href="javascript:void(0)" class="action">Thiết lập ngay</a>
    </div>

    <div class="profile-item d-flex justify-content-between align-items-center" data-modal="emailModal">
        <span>Email</span>
        <a href="javascript:void(0)" class="action">Thiết lập ngay</a>
    </div>

    <!-- Nút chuyển sang trang Tài khoản liên kết -->
    <div class="setting-item" onclick="goToLinkedAccount()">
        <div class="section-label mt-3">Tài khoản liên kết</div>
    </div>
</div>

<!-- ====== MODALS ====== -->

<!-- Name Modal -->
<div id="nameModal" class="custom-modal" aria-hidden="true">
    <div class="modal-content">
        <h5 class="mb-3">Nhập tên của bạn</h5>
        <div class="form-outline mb-3">
            <input type="text" id="nameInput" class="form-control form-control-lg" placeholder=" " />
            <label class="form-label" for="nameInput">Họ và tên</label>
        </div>
        <div class="d-flex justify-content-end">
            <button class="btn-save" onclick="saveField('nameModal','Tên','nameInput')">Lưu</button>
        </div>
    </div>
</div>

<!-- Bio Modal -->
<div id="bioModal" class="custom-modal" aria-hidden="true">
    <div class="modal-content">
        <h5 class="mb-3">Giới thiệu bản thân</h5>
        <div class="form-outline mb-3">
            <textarea id="bioInput" class="form-control form-control-lg" rows="3" placeholder=" "></textarea>
            <label class="form-label" for="bioInput">Bio</label>
        </div>
        <div class="d-flex justify-content-end">
            <button class="btn-save" onclick="saveField('bioModal','Bio','bioInput')">Lưu</button>
        </div>
    </div>
</div>

<!-- Gender Modal -->
<div id="genderModal" class="custom-modal" aria-hidden="true">
    <div class="modal-content">
        <h5 class="mb-3">Chọn giới tính</h5>
        <div class="form-outline mb-3">
            <select id="genderInput" class="form-select form-control-lg" placeholder=" ">
                <option value="">-- Chọn giới tính --</option>
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
                <option value="Khác">Khác</option>
            </select>
            <label class="form-label" for="genderInput">Giới tính</label>
        </div>
        <div class="d-flex justify-content-end">
            <button class="btn-save" onclick="saveField('genderModal','Giới tính','genderInput')">Lưu</button>
        </div>
    </div>
</div>

<!-- Birth Modal -->
<div id="birthModal" class="custom-modal" aria-hidden="true">
    <div class="modal-content">
        <h5 class="mb-3">Ngày sinh</h5>
        <div class="form-outline mb-3">
            <input type="date" id="birthInput" class="form-control form-control-lg" placeholder=" " />
            <label class="form-label" for="birthInput">Ngày sinh</label>
        </div>
        <div class="d-flex justify-content-end">
            <button class="btn-save" onclick="saveField('birthModal','Ngày sinh','birthInput')">Lưu</button>
        </div>
    </div>
</div>

<!-- Phone Modal -->
<div id="phoneModal" class="custom-modal" aria-hidden="true">
    <div class="modal-content">
        <h5 class="mb-3">Nhập số điện thoại</h5>
        <div class="form-outline mb-3">
            <input type="tel" id="phoneInput" class="form-control form-control-lg" placeholder=" " pattern="[0-9]{10}" />
            <label class="form-label" for="phoneInput">Số điện thoại</label>
        </div>
        <div class="d-flex justify-content-end">
            <button class="btn-save" onclick="saveField('phoneModal','Số điện thoại','phoneInput')">Lưu</button>
        </div>
    </div>
</div>

<!-- Email Modal -->
<div id="emailModal" class="custom-modal" aria-hidden="true">
    <div class="modal-content">
        <h5 class="mb-3">Nhập email của bạn</h5>
        <div class="form-outline mb-3">
            <input type="email" id="emailInput" class="form-control form-control-lg" placeholder=" " />
            <label class="form-label" for="emailInput">Địa chỉ email</label>
        </div>
        <div class="d-flex justify-content-end">
            <button class="btn-save" onclick="saveField('emailModal','Email','emailInput')">Lưu</button>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="../../MDB5-STANDARD-UI-KIT-Free-9.2.0 (1)/js/mdb.umd.min.js"></script>
<script src="fileJS/settingProfile.js"></script>

<!-- Thêm hàm chuyển trang -->
<script>
    function goToLinkedAccount() {
        window.location.href = "linkAccount.html";
    }
</script>
</body>
</html>
