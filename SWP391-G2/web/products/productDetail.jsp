
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
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
            rel="stylesheet"
            integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <style>
            .product-image {
                width: 70%;
                margin-bottom: 15px;
                cursor: pointer;
                transition: transform 0.3s ease;
            }
            .product-image:hover {
                transform: scale(1.1);
            }
            .product-image-small {
                width: 100%;
                margin-bottom: 15px;
                cursor: pointer;
            }
            .product-image-description{
                width: 100%;
                height: 100%;
            }
            .product-details h1 {
                margin-bottom: 20px;
            }
            .product-details p {
                margin-bottom: 15px;
                font-size: 22px; /* Kích thước chữ cho thẻ p */
            }
            .product-details p strong {
                font-size: 25px; /* Kích thước chữ cho thẻ strong */
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
            .content-section p{
                width: 60%;
                font-size: 22px;
            }
            .product-block .row div {
                cursor: pointer;
            }
            .custom-link {
                color: black;
                text-decoration: none;
            }

            .custom-link:hover {
                color: black;
                text-decoration: none;
            }

            <!--feedback-->



            .testimonial-heading span {
                font-size: 1.2rem;
                font-weight: 500;
                margin-bottom: 10px;
                color: #252525;
                letter-spacing: 2px;
                text-transform: uppercase;
                text-align: center;
                display: block;
            }
            .testimonial-box {
                box-shadow: 2px 2px 30px rgba(0, 0, 0, 0.1);
                background-color: #ffffff;
                padding: 20px;
                margin: 15px;
                cursor: pointer;
            }
            .client-comment-img {
                width: 100px;
                height: 100px;
                overflow: hidden;
                margin-right: 10px;
            }
            .client-comment-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center;
            }
            .name-user strong {
                font-size: 1.1rem;
                color: #3d3d3d;
                letter-spacing: 0.5px;
            }
            .name-user span {
                font-size: 0.8rem;
                color: #979797;
            }
            .reviews {
                color: #f9d71c;
            }
            .client-comment {
                font-size: 0.9rem;
                color: #4b4b4b;
                line-height: 1.5;
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
                                src="images/Products/${c.getCategoryName()}/${p.getProductImageUrl()}"
                                alt="Ảnh sản phẩm 1"
                                class="product-image"
                                id="product-image"
                                />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <img
                                src="images/Products/${c.getCategoryName()}/${p.getProductImageUrl()}"
                                alt="Ảnh sản phẩm 1"
                                class="product-image-small"
                                onclick="showImage('images/Products/${c.getCategoryName()}/${p.getProductImageUrl()}')"
                                />
                        </div>
                        <c:forEach items="${priceandsize}" var="img">
                            <div class="col-3">
                                <img
                                    
                                    src="images/Products/${c.getCategoryName()}/${img.getImage()}"
                                    alt="Ảnh sản phẩm 2"
                                    class="product-image-small"
                                    onclick="showImage('images/Products/${c.getCategoryName()}/${img.getImage()}')"
                                    />
                                
                            </div>
                        </c:forEach>

                    </div>

                </div>
                <!-- Nửa bên phải là thông tin sản phẩm nước hoa -->
                <div class="col-md-6 product-details product-description" style="background: whitesmoke">

                    <div>
                        <h1 id="product-name" class="custom-link">${p.getProductName()}</h1>
                        <p>
                            <strong>Trademark:</strong>
                            <span id="brand">${b.getBrandName()}</span>
                        </p>
                        <p>
                            <strong>Status:</strong>
                            <span id="status">${(pd.getProductStatus()?'In Stock':'Out Of Stock')}</span>
                        </p>
                        <p>
                            <strong>Quantity:</strong>
                            <span id="quantitie">${priceandsize[0].productAvaiable}</span>
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
                            <input type="number" id="quantity" value="1" min="1" readonly="" />
                            <button onclick="changeQuantity(1)">+</button> 
                        </div>
                        <button class="btn btn-primary btn-lg" onclick="addToCart(${p.productID})">
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
                <img src="images/Products/${c.getCategoryName()}/${p.getProductImageUrl()}">
                <p class="col-8">
                    ${b.getBrandDescription()}
                </p>


                <p class="col-8">
                    Perfume has been present in human culture and history for thousands of years. In ancient cultures, essential oils and aromas were used to make perfumes and were used in religious ceremonies and prayer rites. Kings, emperors and aristocrats often used perfume to show nobility and wealth.

                    During the Middle Ages, perfume was used as a means to protect health and fight epidemics. Fragrances are said to have antiseptic and antiseptic properties, and are used to mask odors during pandemics.

                    By the 17th century, perfume became an indispensable part of French life. Perfume is widely used in society and has become a symbol of wealth and nobility. The city of Grasse in southern France is considered the capital of the perfume industry with many famous perfume factories.

                    During the 19th century, the perfume industry became more developed. Perfume makers have used new methods to extract essential oils from different flowers and plants, thereby creating many new perfumes with unique scents.

                    Currently, perfume has become a popular product and is widely used around the world. Perfume manufacturers have used modern technology to create new perfumes with complex scents and longer lasting scents. Perfume is also widely used in other fields such as health, spa and beauty.
                </p>
                <c:forEach items="${priceandsize}" var="img">
                            <div class="col-10">
                                <img
                                    
                                    src="images/Products/${c.getCategoryName()}/${img.getImage()}"
                                    alt="Ảnh sản phẩm 2"
                                    class="product-image-small"
                                    id="product-image"
                                    onclick="showImage('images/Products/${c.getCategoryName()}/${img.getImage()}')"
                                    />
                                
                            </div>
                        </c:forEach>
            </div>
            <div id="policy" class="content-section">
                <p class="col-8">The information security policy is complied with relevant legal regulations on personal information protection and Decree 52/2013/ND-CP of the government on e-commerce issued on May 16, 2013. .

                    Customers who register personal profile information at the website of Perfume World company agree to the terms and conditions of membership of Perfume World company. As follows:

                    1. Purpose: clearly stipulates the website user agreement when registering to purchase or become a member of this website. A member who registers an account in TPS is a person who has registered an account according to the steps prescribed by the World of Perfume company and has been accepted by the company for that registration.

                    When you register as a member on the website, the information we collect includes:

                    First and last name
                    Phone number
                    Email address
                    Delivery address
                    2. Scope of information use: the information we collect as above is only used to provide sales information, delivery, order processing, online payment transactions, promotional programs, company's services to customers. We may share information about your name, address, and phone number with our courier service or partners to deliver your goods.

                    3. The collection and use of each customer's information is only carried out with that customer's consent, unless otherwise prescribed by law.

                    4. After registering, members are responsible for self-managing their accounts, passwords and personal information.

                    5. In case our company confirms that a member violates the following, we may stop or cancel that member's eligibility to use the account, and we are not responsible for such violations. damage arising from the above suspension or cancellation. In case a member damages the interests of our company, or a third person, by violating the provisions stated below, the violating member must be responsible for compensating for those damages.

                    Registering untrue information when registering as a member.
                    There are acts that violate these laws and regulations.
                    Use your account and password for nefarious purposes, or let a third person use it.
                    Cause harm to our company
                    Behavior that our company considers inappropriate
                    6. Complaint mechanism for Customers: Customers have the right to submit complaints to TGNH sales and promotion website. Upon receiving this feedback, TGNH sales and promotion website will confirm the information. In case the buyer's feedback is correct, depending on the level, TGNH sales and promotion website will take corrective measures. promptly to protect the interests of customers.

                    7. The company can change the agreement/policy. When there is a change, we will post it on www.thegioinuochoa.com.vn, and after posting, the agreement will be considered effective. In case of changes or updates to information/policies, if the member uses the service, we consider the member to have accepted all such agreements.

                    8. Customer information is stored on the company's private server and the Company is authorized/authorized to manage and secure customer information.

                    9. All customer information is collected and stored at Perfume World company.

                    10. Purchase information and personal/organizational information on the TGNH sales and promotion website are confidential and are not disclosed to third parties. Perfume World Company is committed to protecting customer information according to in accordance with current laws.

                    11. TGNH is committed to protecting customers' private information through the website's security system, not using it for commercial purposes or any other purpose. We use information security measures to prevent loss, confusion or alteration of data in the system.

                    12. TGNH commits to only using information to create a safe, convenient, professional shopping environment and improve the quality of customer service. In addition, the information is only used by us to resolve issues related to disputes arising in buying, selling, and paying through the website, and to prevent activities that violate Vietnamese law.

                    13. TGNH commits not to share, sell or rent personal information with anyone, in any form except companies and third parties directly related to the delivery of the products you have purchased. in the world of perfume. The information you send to us is only managed and used by TGNH staff for the purpose of contacting or sending emails to provide information to you.

                    We will send personal information about you to other companies or individuals in the following cases:

                    We have your consent to disclose that information
                    We need to disclose your information to provide products or services related to communicating with you.
                    We comply with subpoenas, court orders or legal process.
                    We see that your actions on our websites</p>
            </div>
        </div>


        <div class="container">
            <h2 class="my-4 custom-link text-center" >Similar Products</h2>
            <div class="row">
                <c:forEach items="${psimilar}" var="pl">
                    <div class="col-md-3">
                        <div class="card mb-4">
                            <img
                                src="images/Products/${c.getCategoryName()}/${pl.getProductImageUrl()}"
                                class="card-img-top"
                                alt="..."
                                style="width: 70%; display: block ; margin-right:auto;margin-left: auto"/>
                            <div class="card-body">
                                <h5 class="card-title" >
                                    <a href="detailofproduct?product=${pl.getProductID() }" class="custom-link">${pl.getProductName()}</a>
                                </h5>                               
                                <c:forEach var="pd" items="${priceandsize}" varStatus="status">
                                    <span class="card-text">${pd.getProductPrice()} $</span>
                                    <c:if test="${!status.last}">
                                        -
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <section id="testimonials" class="container my-5">
            <!--heading-->
            <div class="testimonial-heading text-center">
                <h2>Feedback</h2>
            </div>

            <!--testimonials-box-->
            <div class="row justify-content-center">
                <!--box1--------------->
                <div class="col-md-6 col-lg-4">
                    <div class="testimonial-box p-3">
                        <!--top-->
                        <div class="d-flex align-items-center mb-3">
                            <!--profile-->
                            <div class="profile d-flex align-items-center">
                                <!--img-->

                                <!--name-and-username-->
                                <div class="name-user">
                                    <strong>Nguyễn Văn A</strong>
                                    <span>@nguyenvana</span>
                                </div>
                            </div>
                            <!--review-->
                            <div class="reviews ms-auto">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                        <!--Comment-->
                        <div class="client-comment">
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis
                                quod, voluptates, quae, quos dolorum quibusdam quia
                                exercitationem
                            </p>
                            <div class="client-comment-img">
                                <img
                                    src="images/Products/${c.getCategoryName()}/${p.getProductImageUrl()}"
                                    />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Repeat the testimonial-box for more testimonials -->
                <div class="col-md-6 col-lg-4">
                    <div class="testimonial-box p-3">
                        <!--top-->
                        <div class="d-flex align-items-center mb-3">
                            <!--profile-->
                            <div class="profile d-flex align-items-center">
                                <!--img-->

                                <!--name-and-username-->
                                <div class="name-user">
                                    <strong>Nguyễn Văn A</strong>
                                    <span>@nguyenvana</span>
                                </div>
                            </div>
                            <!--review-->
                            <div class="reviews ms-auto">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                        <!--Comment-->
                        <div class="client-comment">
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis
                                quod, voluptates, quae, quos dolorum quibusdam quia
                                exercitationem
                            </p>
                            <div class="client-comment-img">
                                <img
                                    src="images/Products/${c.getCategoryName()}/${p.getProductImageUrl()}"
                                    />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="testimonial-box p-3">
                        <!--top-->
                        <div class="d-flex align-items-center mb-3">
                            <!--profile-->
                            <div class="profile d-flex align-items-center">
                                <!--img-->

                                <!--name-and-username-->
                                <div class="name-user">
                                    <strong>Nguyễn Văn A</strong>
                                    <span>@nguyenvana</span>
                                </div>
                            </div>
                            <!--review-->
                            <div class="reviews ms-auto">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                        <!--Comment-->
                        <div class="client-comment">
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis
                                quod, voluptates, quae, quos dolorum quibusdam quia
                                exercitationem
                            </p>
                            <div class="client-comment-img">
                                <img
                                    src="images/Products/${c.getCategoryName()}/${p.getProductImageUrl()}"
                                    />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <%@include file="../footer.jsp" %>

        <script>
            function showImage(imagePath) {
                document.getElementById("product-image").src = imagePath;
            }

            function changeQuantity(change) {
                var quantityInput = document.getElementById("quantity");
                var currentQuantity = parseInt(quantityInput.value);
                var newQuantity = currentQuantity + change;

                // Lấy số lượng có sẵn từ thẻ span
                var availableQuantity = parseInt(document.getElementById("quantitie").innerText);

                if (newQuantity >= 1 && newQuantity <= 999 && newQuantity <= availableQuantity) {
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
                    price: "${size.productPrice}",
                    quantity: "${size.productAvaiable}"
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
                        document.getElementById("quantitie").innerText = priceAndSizeData[i].quantity;
                        break; // Kết thúc vòng lặp khi tìm được size tương ứng
                    }
                }
            });

            function addToCart(productID) {
                var price = document.getElementById('priceofproduct').value;
                var quantity = document.getElementById('quantity').value;
                window.location.href = "/SWP391-G2/cart?productID=" + productID + "&&quantity=" + quantity + "&&price=" + price;
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>