<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                width: 100%;
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
                                src="${pd.getProductImageUrl()}"
                                alt="Ảnh sản phẩm 1"
                                class="product-image"
                                id="product-image"
                                />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <img
                                src="${pd.getProductImageUrl()}"
                                alt="Ảnh sản phẩm 1"
                                class="product-image-small"
                                onclick="showImage('${pd.getProductImageUrl()}')"
                                />
                        </div>
                        <c:forEach items="${imgdt}" var="img">
                            <div class="col-3">
                                <img
                                    src="${img.getImageUrl()}"
                                    alt="Ảnh sản phẩm 2"
                                    class="product-image-small"
                                    onclick="showImage('${img.getImageUrl()}')"
                                    />
                            </div>
                        </c:forEach>
                        <!--                        <div class="col-3">
                                                    <img
                                                        src="images/Products/Men/1_2.jpg"
                                                        alt="Ảnh sản phẩm 3"
                                                        class="product-image-small"
                                                        onclick="showImage('images/Products/Men/1_2.jpg')"
                                                        />
                                                </div>
                                                <div class="col-3">
                                                    <img
                                                        src="images/Products/Men/1_3.jpg"
                                                        alt="Ảnh sản phẩm 4"
                                                        class="product-image-small"
                                                        onclick="showImage('images/Products/Men/1_3.jpg')"
                                                        />
                                                </div>-->
                    </div>

                </div>
                <!-- Nửa bên phải là thông tin sản phẩm nước hoa -->
                <div class="col-md-6 product-details product-description">

                    <div>
                        <h1 id="product-name">${pd.getProductName()}</h1>
                        <p>
                            <strong>Trademark:</strong>
                            <span id="brand">${b.getBrandName()}</span>
                        </p>
                        <p>
                            <strong>Status:</strong>
                            <span id="status">${(pd.getProductStatus()?'Con Hang':'Het Hang')}</span>
                        </p>

                        <p><strong>Price:</strong><input type="text" value="${priceandsize[0].productPrice}" id="priceofproduct" hidden=""> <span id="price">${priceandsize[0].productPrice} $</span></p>

                        <p>
                            <strong>Type:</strong>
                            <select id="perfume-type">
                                <c:forEach items="${priceandsize}" var="size">
                                    <option value="${size.productSize}">${size.productSize}</option>
                                </c:forEach>
                            </select>
                        </p>

                        <div class="quantity-controls">
                            <button onclick="changeQuantity(-1)">-</button>
                            <input type="number" id="quantity" value="1" min="1" readonly />
                            <button onclick="changeQuantity(1)">+</button>
                        </div>
                        <button class="btn btn-primary btn-lg" onclick="addToCart(${pd.productID})">
                            Add to Cart
                        </button>
                    </div>
                </div>

            </div>
        </div>
        <div class="container mt-3">
            <div class="product-block">
                <div class="row">
                    <div
                        class="col-md-2 product-title"
                        onclick="showSection('description')"
                        >
                        Describe
                    </div>
                    <div class="col-md-2 product-title" onclick="showSection('policy')">
                        Policy
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-2 mb-5">
            <div id="description" class="content-section active">
                <p class="col-8">
                    ${pd.getProductDescription()}
                </p>
                <p class="col-8">
                    ${b.getBrandDescription()}
                </p>
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

            var priceAndSizeData = [
            <c:forEach items="${priceandsize}" var="size" varStatus="status">
            {
            size: "${size.productSize}",
                    price: "${size.productPrice}"
            }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
            ];

            document.getElementById("perfume-type").addEventListener("change", function () {
                // Lấy giá trị size được chọn
                var selectedSize = this.value;

                // Lặp qua danh sách các size để tìm size tương ứng và cập nhật giá
                for (var i = 0; i < priceAndSizeData.length; i++) {
                    if (priceAndSizeData[i].size == selectedSize) {
                        // Hiển thị giá của size được chọn
                        document.getElementById("price").innerText = priceAndSizeData[i].price + " $";
                        document.getElementById('priceofproduct').setAttribute("value", priceAndSizeData[i].price);
                        break; // Kết thúc vòng lặp khi tìm được size tương ứng
                    }
                }
            });
            function addToCart(productID) {
                var price = document.getElementById('priceofproduct').value;
                var quantity = document.getElementById('quantity').value;
                var size = document.getElementById('perfume-type').value;

                window.location.href = "/SWP391-G2/cart?productID=" + productID + "&&quantity=" + quantity + "&&price=" + price+"&&size=" + size;
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
