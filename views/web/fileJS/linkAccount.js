/* assets/linkedAccount.js
   Logic: render UI, modal, lưu trạng thái vào localStorage
*/
const accounts = [
    { id: "bank", name: "Liên kết Ngân hàng", icon: "bank" }, // dùng icon font
    { id: "momo", name: "Ví MoMo", icon:"img/MOMO-Logo-App.png" },
    { id: "zalopay", name: "ZaloPay", icon: "img/Logo FA-13.png" },
    { id: "viettelpay", name: "ViettelPay", icon: "img/Logo-Viettelpay.jpg" }
];

let selectedAccount = null;

document.addEventListener('DOMContentLoaded', () => {
    renderAccounts();
    // Đóng modal khi click ra ngoài
    const modal = document.getElementById('linkModal');
    if (modal) {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) closeModal();
        });
    }
});

function renderAccounts() {
    const container = document.getElementById('accountList');
    if (!container) return;

    container.innerHTML = ''; // clear

    accounts.forEach(acc => {
        // trạng thái lưu trong localStorage
        const linked = localStorage.getItem(`linked_${acc.id}`) === 'true';

        const item = document.createElement('div');
        item.className = 'linked-item';
        item.dataset.id = acc.id;

        const left = document.createElement('div');
        left.className = 'left';

        // icon: nếu là tên special 'bank' dùng bootstrap icon
        if (acc.icon === 'bank') {
            const i = document.createElement('i');
            i.className = 'bi bi-bank icon-bank';
            left.appendChild(i);
        } else {
            const img = document.createElement('img');
            img.className = 'icon';
            img.src = acc.icon;
            img.alt = acc.name;
            // fallback khi ảnh không tồn tại: dùng placeholder border
            img.onerror = function(){ this.style.display='none'; };
            left.appendChild(img);
        }

        const name = document.createElement('div');
        name.className = 'link-name';
        name.textContent = acc.name;
        left.appendChild(name);

        const status = document.createElement('div');
        status.className = 'status ' + (linked ? 'linked' : 'not-linked');
        status.textContent = linked ? 'Đã liên kết' : 'Chưa liên kết';

        item.appendChild(left);
        item.appendChild(status);

        item.addEventListener('click', () => openModal(acc, linked));

        container.appendChild(item);
    });
}

// open modal
function openModal(account, isLinked) {
    selectedAccount = account;
    const title = document.getElementById('linkTitle');
    const msg = document.getElementById('linkMessage');
    const confirmBtn = document.getElementById('confirmBtn');

    if (!title || !msg || !confirmBtn) return;

    title.textContent = isLinked ? `Hủy liên kết ${account.name}` : `Liên kết ${account.name}`;
    msg.textContent = isLinked ? `Bạn có chắc muốn hủy liên kết với ${account.name}?` : `Bạn có chắc muốn liên kết với ${account.name}?`;

    confirmBtn.textContent = isLinked ? 'Hủy liên kết' : 'Liên kết';
    confirmBtn.onclick = () => confirmLink(account, isLinked);

    const modal = document.getElementById('linkModal');
    modal.setAttribute('aria-hidden', 'false');
}

// close modal
function closeModal() {
    const modal = document.getElementById('linkModal');
    if (modal) modal.setAttribute('aria-hidden', 'true');
}

// confirm action: chuyển trạng thái
function confirmLink(account, wasLinked) {
    const key = `linked_${account.id}`;
    const newState = !wasLinked;
    localStorage.setItem(key, newState ? 'true' : 'false');
    closeModal();
    renderAccounts();
    // nhỏ: thông báo
    setTimeout(() => {
        alert(newState ? `Đã liên kết ${account.name}` : `Đã hủy liên kết ${account.name}`);
    }, 50);
}
