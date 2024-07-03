<%-- 
    Document   : newProductDetail
    Created on : Jun 29, 2024, 9:37:16 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Detal</title>
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon" />

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../css/testcss/style.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shop Detail</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Shop Detail Start -->
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 pb-5">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner border">
                            <div class="carousel-item active">
                                <img class="w-100 h-100" src="images/Products/${c.getCategoryName()}/${img.getImage()}"
                                     alt="Ảnh sản phẩm 2"
                                     onclick="showImage('images/Products/${c.getCategoryName()}/${img.getImage()}')"
                                     />
                            </div>
                            <c:forEach items="${priceandsize}" var="img">
                                <div class="carousel-item">
                                    <img class="w-100 h-100"  src="images/Products/${c.getCategoryName()}/${img.getImage()}"
                                         alt="Ảnh sản phẩm 2"
                                         onclick="showImage('images/Products/${c.getCategoryName()}/${img.getImage()}')"
                                         />
                                </div>
                            </c:forEach>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>

                <div class="col-lg-7 pb-5">
                    <p><input type="text" id="productductFullDetailID" value="${priceandsize[0].productFullDetailID}" hidden=""></p>

                    <h3 class="font-weight-semi-bold">${p.getProductName()}</h3>
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star-half-alt"></small>
                            <small class="far fa-star"></small>
                            <c:forEach var="i" begin="1" end="${averageStart}">
                                <small class="fas fa-star"></small>
                            </c:forEach>
                            <c:forEach var="i" begin="${averageStart + 1}" end="5">
                                <small class="far fa-star empty"></small>
                            </c:forEach>
                        </div>
                        <small class="pt-1">(${getTotalFeedback} Reviews)</small>
                    </div>
                    <h3 class="font-weight-semi-bold mb-4" id="price">
                        <input type="text" value="${priceandsize[0].productPrice}" id="priceofproduct" hidden="">
                        $ ${priceandsize[0].productPrice}
                    </h3>
                    <p class="mb-4">
                        ${pd.getProductDescription()}
                    </p>
                    <div class="d-flex mb-3">
                        <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
                        <form>
                            <c:forEach items="${priceandsize}" var="size">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input
                                        type="radio"
                                        class="custom-control-input"
                                        id="size-1"
                                        name="size"
                                        value="${size.productSize}"
                                        />
                                    <label class="custom-control-label" for="size-1">${size.productSize}</label>
                                </div>
                            </c:forEach>

                            <!--                            <div class="custom-control custom-radio custom-control-inline">
                                                            <input
                                                                type="radio"
                                                                class="custom-control-input"
                                                                id="size-2"
                                                                name="size"
                                                                />
                                                            <label class="custom-control-label" for="size-2">S</label>
                                                        </div>-->
                        </form>
                    </div>
                    <div class="d-flex mb-4">                                  
                        <div class="d-flex align-items-center mb-4 pt-2">
                            <div class="input-group quantity mr-3" style="width: 130px">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary btn-minus" onclick="changeQuantity(-1)">
                                        <i  class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" id="quantity" class="form-control bg-secondary text-center" value="1" />
                                <div class="input-group-btn">
                                    <button class="btn btn-primary btn-plus" onclick="changeQuantity(1)">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <button class="btn btn-primary px-3" id="addToCartBtn" ${priceandsize[0].productAvaiable == 0 ? 'disabled' : ''}  onclick="addToCart(${p.productID})">
                                <i class="fa fa-shopping-cart mr-1" ></i> Add To Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row px-xl-5">
                    <div class="col">
                        <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                            <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1"
                               >Description</a
                            >
                            <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Policy</a>
                            <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Feedback</a>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="tab-pane-1">
                                <h4 class="mb-3">Product Description</h4>
                                <p>
                                    ${pd.getProductDescription()}
                                </p>
                                <p>
                                    ${b.getBrandDescription()}
                                </p>
                            </div>
                            <div class="tab-pane fade" id="tab-pane-2">
                                <h4 class="mb-3">Policy Information</h4>
                                <p >The information security policy is complied with relevant legal regulations on personal information protection and Decree 52/2013/ND-CP of the government on e-commerce issued on May 16, 2013. .

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
                                    We see that your actions on our websites
                                </p>
                               
                            </div>
                            <div class="tab-pane fade" id="tab-pane-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4 class="mb-4">review for "${p.getProductName()}"</h4>
                                        <div class="media mb-4">
                                            <img
                                                src="img/user.jpg"
                                                alt="Image"
                                                class="img-fluid mr-3 mt-1"
                                                style="width: 45px"
                                                />
                                            <div class="media-body">
                                                <h6>
                                                    John Doe<small> - <i>01 Jan 2045</i></small>
                                                </h6>
                                                <div class="text-primary mb-2">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                    <i class="far fa-star"></i>
                                                </div>
                                                <p>
                                                    Diam amet duo labore stet elitr ea clita ipsum,
                                                    tempor labore accusam ipsum et no at. Kasd diam
                                                    tempor rebum magna dolores sed sed eirmod ipsum.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="media mb-4">
                                            <img
                                                src="img/user.jpg"
                                                alt="Image"
                                                class="img-fluid mr-3 mt-1"
                                                style="width: 45px"
                                                />
                                            <div class="media-body">
                                                <h6>
                                                    John Doe<small> - <i>01 Jan 2045</i></small>
                                                </h6>
                                                <div class="text-primary mb-2">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                    <i class="far fa-star"></i>
                                                </div>
                                                <p>
                                                    Diam amet duo labore stet elitr ea clita ipsum,
                                                    tempor labore accusam ipsum et no at. Kasd diam
                                                    tempor rebum magna dolores sed sed eirmod ipsum.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="media mb-4">
                                            <img
                                                src="img/user.jpg"
                                                alt="Image"
                                                class="img-fluid mr-3 mt-1"
                                                style="width: 45px"
                                                />
                                            <div class="media-body">
                                                <h6>
                                                    John Doe<small> - <i>01 Jan 2045</i></small>
                                                </h6>
                                                <div class="text-primary mb-2">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                    <i class="far fa-star"></i>
                                                    <p>
                                                        Diam amet duo labore stet elitr ea clita
                                                        ipsum, tempor labore accusam ipsum et no
                                                        at. Kasd diam tempor rebum magna dolores
                                                        sed sed eirmod ipsum.
                                                    </p>
                                                </div>
                                                <p>
                                                    Diam amet duo labore stet elitr ea clita ipsum,
                                                    tempor labore accusam ipsum et no at. Kasd diam
                                                    tempor rebum magna dolores sed sed eirmod ipsum.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h4 class="mb-4">Leave a review</h4>
                                        <small
                                            >Your email address will not be published. Required fields
                                            are marked *</small
                                        >
                                        <div class="d-flex my-3">
                                            <p class="mb-0 mr-2">Your Rating * :</p>
                                            <div class="text-primary">
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                        </div>
                                        <form>
                                            <div class="form-group">
                                                <label for="message">Your Review *</label>
                                                <textarea
                                                    id="message"
                                                    cols="30"
                                                    rows="5"
                                                    class="form-control"
                                                    ></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="name">Your Name *</label>
                                                <input type="text" class="form-control" id="name" />
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Your Email *</label>
                                                <input type="email" class="form-control" id="email" />
                                            </div>
                                            <div class="form-group mb-0">
                                                <input
                                                    type="submit"
                                                    value="Leave Your Review"
                                                    class="btn btn-primary px-3"
                                                    />
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Shop Detail End -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>

            <!-- Contact Javascript File -->
            <script src="mail/jqBootstrapValidation.min.js"></script>
            <script src="mail/contact.js"></script>

            <!-- Template Javascript -->
            <script src="js/main.js"></script>
    </body>
</html>

