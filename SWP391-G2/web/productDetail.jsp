<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chi Tiết Sản Phẩm Nước Hoa</title>
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <style>
      .product-image {
        width: 70%;
        margin-bottom: 15px;
        cursor: pointer;
      }
      .product-image-small {
        width: 70%;
        margin-bottom: 15px;
        cursor: pointer;
      }
      .product-details h1 {
        margin-bottom: 20px;
      }
      .product-details p {
        margin-bottom: 10px;
      }
      .product-description {
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      }
      .quantity-controls {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
      }
      .quantity-controls button {
        width: 30px;
        height: 30px;
        text-align: center;
        padding: 0;
        margin: 0 5px;
      }
      .quantity-controls input {
        width: 50px;
        text-align: center;
        margin: 0 5px;
      }
      .nav-buttons {
        margin-bottom: 15px;
      }
      .content-section {
        display: none;
      }
      .content-section.active {
        display: block;
      }
      .product-block .row div {
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="container mt-5">
      <div class="row">
        <!-- Nửa bên trái gồm hai ảnh sản phẩm -->
        <div class="col-md-6 d-flex flex-column justify-content-between">
          <div class="row">
            <div class="col-12">
              <img
                src="1-1.png"
                alt="Ảnh sản phẩm 1"
                class="product-image"
                id="product-image"
              />
            </div>
          </div>
          <div class="row">
            <div class="col-6">
              <img
                src="1-1.png"
                alt="Ảnh sản phẩm 1"
                class="product-image-small"
                onclick="showImage('1-1.png')"
              />
            </div>
            <div class="col-6">
              <img
                src="1-2.png"
                alt="Ảnh sản phẩm 2"
                class="product-image-small"
                onclick="showImage('1-2.png')"
              />
            </div>
          </div>
        </div>
        <!-- Nửa bên phải là thông tin sản phẩm nước hoa -->
        <div class="col-md-6 product-details product-description">
          <div>
            <h1 id="product-name">Tên Nước Hoa</h1>
            <p>
              <strong>Thương hiệu:</strong>
              <span id="brand">Tên Thương Hiệu</span>
            </p>
            <p>
              <strong>Tình Trạng:</strong>
              <span id="status">còn hàng</span>
            </p>
            <p><strong>Giá:</strong> <span id="price">1,500,000 VND</span></p>
            <p>
              <strong>Loại:</strong>
              <select id="perfume-type">
                <option value="50ml">50ml</option>
                <option value="100ml">100ml</option>
                <option value="200ml">200ml</option>
              </select>
            </p>
            <div class="quantity-controls">
              <button onclick="changeQuantity(-1)">-</button>
              <input
                type="number"
                id="quantity"
                value="1"
                min="1"
                readonly
              />
              <button onclick="changeQuantity(1)">+</button>
            </div>
            <button class="btn btn-primary btn-lg" onclick="addToCart()">
              Thêm vào giỏ hàng
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="container mt-3">
      <div class="product-block">
        <div class="row">
          <div class="col-md-2 product-title" onclick="showSection('description')">Mô tả</div>
          <div class="col-md-2 product-title" onclick="showSection('policy')">Chính sách</div>
        </div>
      </div>
    </div>
    <div class="container mt-2 mb-5">
      <div id="description" class="content-section active">
        <p class="col-8">Lorem ipsum dolor sit amet consectetur adipisicing elit. At nostrum ipsum dignissimos sit veritatis! Veniam culpa delectus debitis non consectetur iure, harum earum assumenda cumque. Voluptatibus quos provident minima ratione!</p>
      </div>
      <div id="policy" class="content-section">
        <p class="col-8">Chính sách bảo hành và đổi trả hàng hóa...</p>
      </div>
    </div>
      
      
      
    <script>
      function showImage(imagePath) {
        document.getElementById("product-image").src = imagePath;
      }

      function changeQuantity(change) {
        var quantityInput = document.getElementById("quantity");
        var currentQuantity = parseInt(quantityInput.value);
        var newQuantity = currentQuantity + change;
        if (newQuantity >= 1) {
          quantityInput.value = newQuantity;
        }
      }

      function showSection(sectionId) {
        var sections = document.getElementsByClassName("content-section");
        for (var i = 0; i < sections.length; i++) {
          sections[i].classList.remove("active");
        }
        document.getElementById(sectionId).classList.add("active");
      }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
