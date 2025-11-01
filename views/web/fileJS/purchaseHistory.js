// Dữ liệu mẫu
const orders = [
    {
        id: 1,
        name: "Bó hoa Whimsy well",
        price: "910,000 VND",
        date: "28/10/2025",
        status: "shipping",
        img:"img/hoa 2.jpg",
        items: [
            { name: "Hoa hướng dương", quantity: 5 }
        ]
    },
    {
        id: 2,
        name: "Giỏ hoa Bliss charm",
        price: "1,450,000 VND",
        date: "20/10/2025",
        status: "delivered",
        img: "img/hoa 1.jpg",
        items: [
            { name: "Hoa hồng Đà Lạt", quantity: 6 },
            { name: "Hoa baby trắng", quantity: 2 }
        ]
    },
    {
        id: 3,
        name: "Hoa Tulip Everelle",
        price: "1,880,500 VND",
        date: "12/09/2025",
        status: "delivered",
        img: "img/giỏ hoa.jpg",
        items: [
            { name: "Hoa tulip trắng", quantity: 10 }
        ]
    }


];

document.addEventListener("DOMContentLoaded", () => {
    renderOrders(orders);

    const modal = document.getElementById('orderModal');
    if (modal) {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) closeModal();
        });
    }
});

// Hiển thị danh sách đơn
function renderOrders(list) {
    const container = document.getElementById("orderList");
    if (!container) return;
    container.innerHTML = '';

    list.forEach(order => {
        const item = document.createElement('div');
        item.className = 'order-item';
        item.innerHTML = `
      <div class="order-left">
        <img src="${order.img}" alt="${order.name}" class="order-img">
        <div class="order-info">
          <div class="order-name">${order.name}</div>
          <div class="order-date">Ngày đặt: ${order.date}</div>
          <div class="order-status ${order.status}">
            ${getStatusText(order.status)}
          </div>
        </div>
      </div>
      <div><strong>${order.price}</strong></div>
    `;
        item.addEventListener('click', () => openModal(order));
        container.appendChild(item);
    });
}

// Lọc trạng thái
function filterOrders() {
    const value = document.getElementById("statusFilter").value;
    const filtered = value === "all" ? orders : orders.filter(o => o.status === value);
    renderOrders(filtered);
}

// Đổi text trạng thái
function getStatusText(status) {
    switch (status) {
        case "delivered": return "Đã giao";
        case "shipping": return "Đang giao";
        case "cancelled": return "Đã hủy";
        default: return "Không xác định";
    }
}

// Modal chi tiết đơn
function openModal(order) {
    const modal = document.getElementById('orderModal');
    const title = document.getElementById('orderTitle');
    const detail = document.getElementById('orderDetail');

    title.textContent = `Chi tiết - ${order.name}`;
    detail.innerHTML = `
    <p><strong>Ngày đặt:</strong> ${order.date}</p>
    <p><strong>Giá:</strong> ${order.price}</p>
    <p><strong>Trạng thái:</strong> ${getStatusText(order.status)}</p>
    <hr>
    <p><strong>Sản phẩm:</strong></p>
    <ul>
      ${order.items.map(i => `<li>${i.name} - SL: ${i.quantity}</li>`).join('')}
    </ul>
  `;
    modal.setAttribute('aria-hidden', 'false');
}

function closeModal() {
    const modal = document.getElementById('orderModal');
    modal.setAttribute('aria-hidden', 'true');
}
