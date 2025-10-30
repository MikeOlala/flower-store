// helper: mở modal và init inputs bên trong
function openModalById(id) {
    const modal = document.getElementById(id);
    if (!modal) return;
    modal.style.display = "flex";
    modal.setAttribute('aria-hidden','false');

    // Khởi tạo MDB Input cho tất cả .form-outline bên trong modal
    try {
        if (typeof mdb !== "undefined" && mdb.Input) {
            const outlines = modal.querySelectorAll(".form-outline");
            outlines.forEach(outline => {
                // dùng try/catch vì API mdb có thể khác phiên bản
                try {
                    const inst = (mdb.Input.getInstance && mdb.Input.getInstance(outline)) || new mdb.Input(outline);
                    if (inst && typeof inst.init === "function") inst.init();
                } catch (e) {
                    // fallback: không crash
                }
            });
        }
    } catch (e) { /* ignore */ }

    // Thiết lập trạng thái .active cho input có sẵn value
    const controls = modal.querySelectorAll(".form-outline input, .form-outline textarea, .form-outline select");
    controls.forEach(ctrl => {
        const parent = ctrl.closest('.form-outline');
        if (!parent) return;

        // set active nếu có value
        if (ctrl.value && ctrl.value.trim() !== "") {
            parent.classList.add('active');
        } else {
            parent.classList.remove('active');
        }

        // add listeners (chỉ gán 1 lần)
        if (!ctrl.dataset.fpInit) {
            ctrl.addEventListener('focus', () => parent.classList.add('active'));
            ctrl.addEventListener('blur', () => {
                if (!ctrl.value || ctrl.value.trim() === "") parent.classList.remove('active');
            });
            ctrl.dataset.fpInit = "1";
        }
    });
}

// Event: click vào hàng profile-item để mở modal
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.profile-item[data-modal]').forEach(row => {
        row.addEventListener('click', function () {
            const id = this.getAttribute('data-modal');
            openModalById(id);
        });
    });

    // Đóng modal khi click vùng nền
    document.querySelectorAll('.custom-modal').forEach(modal => {
        modal.addEventListener('click', function (e) {
            if (e.target === modal) closeModal(modal.id);
        });
    });

    // avatar preview
    const avatarInput = document.getElementById('avatarInput');
    if (avatarInput) {
        avatarInput.addEventListener('change', function (event) {
            const file = event.target.files && event.target.files[0];
            if (!file) return;
            const reader = new FileReader();
            reader.onload = function (ev) {
                const img = document.getElementById('avatarPreview');
                if (img) img.src = ev.target.result;
            };
            reader.readAsDataURL(file);
        });
    }
});

// đóng modal
function closeModal(id) {
    const modal = document.getElementById(id);
    if (!modal) return;
    modal.style.display = "none";
    modal.setAttribute('aria-hidden','true');
}

// lưu dữ liệu: cập nhật ngay lên giao diện
function saveField(modalId, label, inputId, displayLabel) {
    const modal = document.getElementById(modalId);
    if (!modal) return;

    const input = document.getElementById(inputId);
    const value = input ? (input.value || '').trim() : '';

    if (value !== '') {
        // tìm row tương ứng (bằng data-modal)
        const row = document.querySelector(`.profile-item[data-modal="${modalId}"]`);
        if (row) {
            // hiển thị giá trị bên phải (tạo span nếu cần)
            let right = row.querySelector('.action');
            if (!right) {
                right = document.createElement('span');
                right.className = 'action';
                row.appendChild(right);
            }
            right.innerText = value;
            right.style.color = '#4b2e05'; // hiển thị giá trị màu chuẩn (không cam)
        }
    }

    closeModal(modalId);
}
