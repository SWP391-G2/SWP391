<%-- 
    Document   : home
    Created on : 22 thg 5, 2024, 13:37:50
    Author     : pna29
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Perfume Shop | Genuine Perfume Store</title>
        <link rel="icon" href="./images/logo/image.png" type="image/x-icon" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/homestyle.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    </head>
    <body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
        <header class="header bg-secondary">
            <div class="container">
                <div class="header-main">
                    <div class="row">   
                        <div class="col-md-4 hidden-sm hidden-xs">
                            <div class="header_search search_form">
                                <form class="input-group search-bar search_form has-validation-callback " action="/search" method="get" role="search"> 
                                    <input type="search" name="query" value placeholder="Search your products..." class="input-group-field st-default-search-input search-text" autocomplete="off">
                                    <span class="input-group-btn">
                                        <button class="btn icon-fallback-text">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </form>
                            </div>
                        </div>

                        <div class="col-md-4 col-100-h">
                            <h1><a href="home">THE PERFUME SHOP</a></h1>
                        </div>

                        <div class="col-md-4 hidden-sm hidden-xs">
                            <div class="my-wishlist">
                                <a href="" data-toggle="tooltip" data-placement="bottom" title="Wishlist" data-customer-id="15588985" class="smartLogin iWishView">
                                    <i class="fa fa-heart" aria-hidden="true"></i>
                                </a>
                            </div>   
                            <div class="my-cart top-cart-contain mini-cart">
                                <a href="cart" class="a-cart">
                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                    <span class="cnt crl-bg count_item_pr">0</span>
                                </a>
                                <div class="top-cart-content">
                                    <ul id="cart-sidebar" class="mini-products-list count_li">
                                        <div class="no-item">
                                            <p>There are no products in the cart.</p>
                                        </div>
                                    </ul>
                                </div>
                            </div>     
                            <div class="my-gear">
                                <a href="#" class="user-profile">
                                    <i class="fa fa-solid fa-gear"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>       

            </div>
            <nav>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-pills nav-fill">
                                <li class="nav-item active">
                                    <a class="nav-link" href="home">HOME</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">ABOUT US</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">PERFUMES
                                        <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <c:forEach var="category" items="${categories}">
                                            <li class="nav-item-lv2">
                                                <a class="nav-link" href="#">
                                                    ${category.name}
                                                    <i class="fa fa-caret-right" data-toggle="dropdown"></i>
                                                </a>
                                                <ul class="dropdown-menu-lv2">
                                                    <c:forEach var="subcategory" items="${category.subcategories}">
                                                        <li class="nav-item-lv3">
                                                            <a class="nav-link" href="#">${subcategory.name}
                                                                <i class="fa fa-caret-right" data-toggle="dropdown"></i>
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                        </c:forEach>
                                        <li class="nav-item-lv2">
                                            <a class="nav-link" href="#">Gift Set
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">BRANDS
                                        <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="">BLOGS</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="">CONTACT US</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link "href="#">ACCOUNT
                                        <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-item-lv2">
                                            <a class="nav-link" href="login">Log In</a>
                                        </li>
                                        <li class="nav-item-lv2">
                                            <a class="nav-link" href="signup.jsp">Sign Up</a>
                                        </li>
                                    </ul>                                                                          
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </nav>
        </header>
        <section>
            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="8000">
                        <a href="page1.html">
                            <img src="images/Sliders/slider1.jpg" class="d-block w-100" alt="First slide">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>THE PERFUME SHOP</h5>
                            <p>No.1 Genuine Perfume Store in Viet Nam</p>
                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <a href="page2.html">
                            <img src="images/Sliders/slider2.jpg" class="d-block w-100" alt="Second slide">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>THE PERFUME SHOP</h5>
                            <p>No.1 Genuine Perfume Store in Viet Nam</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <a href="page3.html">
                            <img src="images/Sliders/slider3.jpg" class="d-block w-100" alt="Third slide">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>THE PERFUME SHOP</h5>
                            <p>No.1 Genuine Perfume Store in Viet Nam</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>         
        <section class="awe-section-4">
            <div class="section_module_product_index_1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-border clearfix">
                                <div class="heading-title">
                                    <h3><a href="productMen">MEN'S PERFUMES</a></h3>
                                </div>
                                <div class="section_ant_nuty_content_product">  
                                    <div class="col-lg-12 col-md-12 no-padding">
                                        <div class="ant-nuty-section-banner">
                                            <div class="image-effect">
                                                <a href="productMen">
                                                    <img src="//bizweb.dktcdn.net/100/429/123/themes/824870/assets/sec_group_product_banner_1.jpg?1716797210297" 
                                                         data-lazyload="//bizweb.dktcdn.net/100/429/123/themes/824870/assets/sec_group_product_banner_1.jpg?1716797210297"
                                                         alt="MEN'S PERFUMES"
                                                         class="img-responsive center-block">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="section_block_product_tab">
                                            <div class="e-tabs not-dqtab ajax-tab-1"data-section="ajax-tab-1">
                                                <div class="content">
                                                    <div class="tab-1 tab-content current">
                                                        <div class="section-tour-owl products products-view-grid owl-carousel owl-loaded owl-drag"
                                                             data-lg-items="5" data-md-items="5" data-sm-items="4" data-xs-items="3" data-xss-items="2" data-margin="0" data-nav="true" data-dot="false">
                                                            <div class="owl-stage-outer">
                                                                <div class="owl-stage" style="transform: translate3d(-1148px, 0px, 0px); transition: all 0s ease 0s; width: 2296px;">
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                </div>                    
                                                                <div class="owl-nav">
                                                                    <div class="owl-prev">
                                                                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                                                                    </div>

                                                                    <div class="owl-next disabled">
                                                                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="owl-dots disabled"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center xt">
                                                <button>
                                                    <a href="productMen">View All</a>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>   
        <section class="awe-section-5">
            <div class="section_module_product_index_1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-border clearfix">
                                <div class="heading-title">
                                    <h3><a href="productWomen">WOMEN'S PERFUMES</a></h3>
                                </div>
                                <div class="section_ant_nuty_content_product">  
                                    <div class="col-lg-12 col-md-12 no-padding">
                                        <div class="ant-nuty-section-banner">
                                            <div class="image-effect">
                                                <a href="productWomen">
                                                    <img src="//bizweb.dktcdn.net/100/429/123/themes/824870/assets/sec_group_product_banner_2.jpg?1716797210297" 
                                                         data-lazyload="//bizweb.dktcdn.net/100/429/123/themes/824870/assets/sec_group_product_banner_2.jpg?1716797210297"
                                                         alt="WOMEN'S PERFUMES"
                                                         class="img-responsive center-block">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="section_block_product_tab">
                                            <div class="e-tabs not-dqtab ajax-tab-1"data-section="ajax-tab-1">
                                                <div class="content">
                                                    <div class="tab-1 tab-content current">
                                                        <div class="section-tour-owl products products-view-grid owl-carousel owl-loaded owl-drag"
                                                             data-lg-items="5" data-md-items="5" data-sm-items="4" data-xs-items="3" data-xss-items="2" data-margin="0" data-nav="true" data-dot="false">
                                                            <div class="owl-stage-outer">
                                                                <div class="owl-stage" style="transform: translate3d(-1148px, 0px, 0px); transition: all 0s ease 0s; width: 2296px;">
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                </div>                    
                                                                <div class="owl-nav">
                                                                    <div class="owl-prev">
                                                                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                                                                    </div>

                                                                    <div class="owl-next disabled">
                                                                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="owl-dots disabled"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center xt">
                                                <button>
                                                    <a href="productWomen">View All</a>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="awe-section-6">
            <div class="section_module_product_index_1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-border clearfix">
                                <div class="heading-title">
                                    <h3><a href="productUnisex">UNISEX'S PERFUMES</a></h3>
                                </div>
                                <div class="section_ant_nuty_content_product">  
                                    <div class="col-lg-12 col-md-12 no-padding">
                                        <div class="ant-nuty-section-banner">
                                            <div class="image-effect">
                                                <a href="productUnisex">
                                                    <img src="//bizweb.dktcdn.net/100/429/123/themes/824870/assets/sec_group_product_banner_3.jpg?1716797210297" 
                                                         data-lazyload="//bizweb.dktcdn.net/100/429/123/themes/824870/assets/sec_group_product_banner_3.jpg?1716797210297"
                                                         alt="UNISEX'S PERFUMES"
                                                         class="img-responsive center-block">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="section_block_product_tab">
                                            <div class="e-tabs not-dqtab ajax-tab-1"data-section="ajax-tab-1">
                                                <div class="content">
                                                    <div class="tab-1 tab-content current">
                                                        <div class="section-tour-owl products products-view-grid owl-carousel owl-loaded owl-drag"
                                                             data-lg-items="5" data-md-items="5" data-sm-items="4" data-xs-items="3" data-xss-items="2" data-margin="0" data-nav="true" data-dot="false">
                                                            <div class="owl-stage-outer">
                                                                <div class="owl-stage" style="transform: translate3d(-1148px, 0px, 0px); transition: all 0s ease 0s; width: 2296px;">
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                    <div class="owl-item active" style="width: 229.6px;"></div>
                                                                </div>                    
                                                                <div class="owl-nav">
                                                                    <div class="owl-prev">
                                                                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                                                                    </div>

                                                                    <div class="owl-next disabled">
                                                                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="owl-dots disabled"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center xt">
                                                <button>
                                                    <a href="productUnisex">View All</a>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer">
            <div class="site-footer">
                <div class="container">
                    <div class="footer-inner">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <div class="footer-widget">
                                    <h4>
                                        <span>THE PERFUME SHOP</span>
                                    </h4>
                                    <p>
                                        <span>Nhận tất cả các loại nước hoa từ chúng tôi trong vòng 2 ngày giao hàng. Chúng tôi thậm chí có thể đặt hàngnước hoa không có trong cơ sở dữ liệu của chúng tôi. Để làm điều đó vui lòng gửi E-mail của bạn đến E-mail của công ty.</span>
                                    </p>
                                    <p>
                                        <span>Địa chỉ :</span>  Hoa Lac Hi-tech Park, km 29, Đại lộ Thăng Long, Hà Nội, Vietnam
                                    </p>
                                    <p><span>Email :</span> <a href="#">luxuryperfumevn@gmail.com</a></p>
                                    <p><span>Phone :</span> <a href="tel: +91 8888884444">1900 9090</a> </p>
                                    <p style="margin-top: 20px">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.494053017802!2d105.52340642545694!3d21.012908838322463!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2sFPT%20University!5e0!3m2!1sen!2s!4v1710438011585!5m2!1sen!2s" 
                                                width="330" height="200" style="border:1px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">

                                        </iframe>
                                    </p>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <div class="footer-widget">
                                    <h4>
                                        <span>INFORMATION</span>
                                    </h4>
                                    <ul class="list-menu">
                                        <li><a href="home">Home</a></li>
                                        <li><a href="#">About Us</a></li>
                                        <li><a href="#">Perfumes</a></li>
                                        <li><a href="#">Contact Us</a></li>
                                        <li><a href="profile">Profile</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <div class="footer-widget">
                                    <h4>
                                        <span>ACCOUNT</span>
                                    </h4>
                                    <ul class="list-menu">
                                        <li><a href="login">Log In</a></li>
                                        <li><a href="signup.jsp">Sign Up</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <div class="footer-widget">
                                    <h4>
                                        <span>PAYMENT</span>
                                    </h4>
                                    <ul class="list-menu">
                                        <li>
                                            <div class="footer-nav">
                                                <i class="fab fa-cc-visa"></i>
                                                <i class="fab fa-cc-mastercard"></i>
                                                <i class="fas fa-money-bill-wave"></i>
                                                <i class="fas fa-university"></i>
                                        </li>                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </footer>     
    </body>
</html>