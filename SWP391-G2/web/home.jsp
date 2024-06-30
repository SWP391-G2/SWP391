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
        <link href="css/homestyle.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdn.tailwindcss.com/3.3.2"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"/>
        <style>

            .responsiveFacets_sectionItemLabel:hover {
                cursor: pointer;
                background-color: rgba(28, 29, 24, 0.2);
            }

            .responsiveFacets_sectionItem:hover {
                cursor: pointer;
            }

        </style>

    </head>

    <body style="background: #f8f8f8">
        <header>
            <div class="main_header header_transparent header-mobile-m">
                <div class="header_container sticky-header">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-lg-2">
                                <div class="logo">
                                    <a href="home"><img src="images/logo/logo0.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main_menu menu_two menu_position">
                                    <nav>
                                        <ul class="nav nav-pills nav-fill">
                                            <li class="nav-item active">
                                                <a class="nav-link" href="home">HOME</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">ABOUT US</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="refine?cid_refine=${0}">PERFUMES
                                                    <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <c:forEach var="category" items="${requestScope.categories}">
                                                        <li class="nav-item-lv2">
                                                            <a class="nav-link" href="refine?cid_refinee=${category.categoryID}">
                                                                ${category.categoryName}'s Perfumes
                                                            </a>
                                                        </li>
                                                    </c:forEach>                                                  
                                                </ul>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">BRANDS
                                                    <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                                </a>
                                                <ul class="dropdown-menu multi-column">
                                                    <div class="row">
                                                        <c:forEach var="brand" items="${requestScope.brands}">
                                                            <div class="col-md-4">
                                                                <li class="nav-item-lv2">
                                                                    <a class="nav-link" href="refine?bid_refinee=${brand.getBrandID()}">${brand.getBrandName()}</a>
                                                                </li>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </ul>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="">CONTACT US</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="">BLOGS</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link "href="#">ACCOUNT
                                                    <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                                </a>
                                                <c:if test="${sessionScope.account == null}">
                                                    <ul class="dropdown-menu">
                                                        <li class="nav-item-lv2">                                                     
                                                            <a class="nav-link" href="login">Log In</a>
                                                            <a class="nav-link" href="signup.jsp">Sign Up</a>
                                                        </c:if>
                                                        <c:if test="${sessionScope.account != null}">
                                                            <a href="profile">Profile</a>
                                                            <a id="logout" data-toggle="modal" data-target="#modal_box" href="#" onclick="confirmLogout('modal_box')">
                                                                <i class="fa-solid fa-right-from-bracket"></i>
                                                                ${sessionScope.account==null ? "": "Đăng xuất"}
                                                            </a>
                                                        </c:if>
                                                    </li>
                                                </ul>     

                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="header_search search_form">
                                    <form class="input-group search-bar search_form has-validation-callback " action="searchHome" method="get" role="search"> 
                                        <input type="text" name="query" value placeholder="Search your products..." class="input-group-field st-default-search-input search-text" autocomplete="off">
                                        <span class="input-group-btn">
                                            <button class="btn icon-fallback-text">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </span>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <jsp:include page="header_right.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- slider section starts  -->

         <section class="slider_section slider_section2 mb-66">
        <div class="slider_area owl-carousel">
            <c:forEach var="slider" items="${sessionScope.sliders}">
                <div class="single_slider d-flex align-items-center" data-bgimg="${slider.sliderImage}">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-6 col-md-6 offset-md-6">
                                <div class="slider_content slider_content2 content_right">
                                    <h1 style="text-align: left">${slider.sliderTitle}</h1>
                                    <!-- Add more dynamic content here if needed -->
                                    <a href="#" class="button">Shop Now <i class="fa fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

        <!-- home section area starts  -->
        <div class="home_section_two color_two mb-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-12">
                        <div class="home_section_left">
                            <!-- deals product area starts -->
                            <div class="deals_product_area mb-68">
                                <div class="section_title section_title_style2">
                                    <h2><span class="ani-fire">Hot Deals</span></h2>
                                    <i style="color: orangered; font-size: 25px; margin-left:5px" class="fa-solid fa-fire"></i>
                                </div>
                                <div class="row">
                                    <div class="deals_carousel product_column1 owl-carousel">
                                        <c:set var="hd" value=""/>
                                        <div class="col-lg-3">
                                            <article class="single_product">
                                                <figure>
                                                    <div class="product_thumb">
                                                        <a href="#" class="primary_img">
                                                            <img src="images/Products/Women/22_0.jpg" alt="">
                                                        </a>
                                                        <div class="action_links">
                                                            <ul>
                                                                <li class="add_to_cart"
                                                                    onclick=""
                                                                    >
                                                                    <a href="#" data-toggle="modal" data-target="#modal_box" title="Thêm vào giỏ hàng">
                                                                        <i class="fa fa-shopping-cart"></i>
                                                                    </a>
                                                                </li>
                                                                <li class="wishlist">
                                                                    <a href="#" onclick="" title="Thêm vào mục yêu thích">
                                                                        <i style="color: #f6692a" class="fa-solid fa-heart"></i>
                                                                    </a>
                                                                </li>
                                                                <li class="quick_button" >

                                                                    <a href="#" data-toggle="modal" data-target="#modal_box"
                                                                       onclick="" 
                                                                       title="Xem sản phẩm">
                                                                        <i class="fa fa-eye" ></i>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <figcaption class="product_content">
                                                        <!-- for deals timing -->
                                                        <div class="product_timing">
                                                            <div id="countdown" data-countdown="2024-06-29T00:00:00">
                                                                <div class="countdown_area">
                                                                    <div class="single_countdown ani-fire">
                                                                        <div id="day" class="countdown_number"></div>
                                                                        <div class="countdown_title">days</div>
                                                                    </div>
                                                                    <div class="single_countdown ani-fire">
                                                                        <div id="hour" class="countdown_number"></div>
                                                                        <div class="countdown_title">hours</div>
                                                                    </div>
                                                                    <div class="single_countdown ani-fire">
                                                                        <div id="minutes" class="countdown_number"></div>
                                                                        <div class="countdown_title">minutes</div>
                                                                    </div>
                                                                    <div class="single_countdown ani-fire">
                                                                        <div id="sec" class="countdown_number"></div>
                                                                        <div class="countdown_title">secs</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <h4 class="product_name ani-fire"style="font-size: 13px">
                                                            <a href="#">DIOR JOY EDP FOR WOMEN</a>
                                                        </h4>

                                                        <div class="price_box">
                                                            <span class="old_price">Rs. 9100</span>
                                                            <span class="current_price">Rs. 8650</span>
                                                        </div>
                                                    </figcaption>
                                                </figure>
                                            </article>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                            <!-- Giftset starts -->

                            <div class="small_product_area mb-68">
                                <div class="section_title section_title_style2">
                                    <h2><span class="ani-fire">Gift Set</span></h2>
                                    <i style="color: orangered; font-size: 25px; margin-left:5px" class="fa-solid fa-gift"></i>
                                </div>
                                <div class="small_product_container sidebar_product_column1 owl-carousel">
                                    <c:set var="breakLoop" value="false" />
                                    <c:forEach var= "j" begin="1" end="2" step="1" >
                                        <c:set var="count" value="0" />
                                        <div class="small_product_list">
                                            <c:if test="${breakLoop == true}">
                                                <c:set var="count" value="4"/>
                                            </c:if>
                                            <c:forEach items="${requestScope.productGiftset}" var="giftSet" varStatus="status" >
                                                <c:if test="${(not breakLoop && count < 5) || (breakLoop && 5 < count && count < 10)}">
                                                    <c:if test="${count == status.index}">
                                                        <article class="single_product" data-toggle="modal" data-target="#modal_box">
                                                            <figure 
                                                                onclick="">
                                                                <div class="product_thumb">
                                                                    <a href="#" class="primary_img">
                                                                        <img src="${giftSet.productImageUrl}" alt="">
                                                                    </a>
                                                                </div>
                                                                <figcaption class="product_content">
                                                                    <h4 class="product_name ani-fire" style="font-size: 13px">
                                                                        <a href="#">${giftSet.productName}</a>
                                                                    </h4>
                                                                    <div class="price_box">
                                                                        <span class="current_price"> $${giftSet.priceMin} - $${giftSet.priceMax}</span>
                                                                    </div>
                                                                </figcaption>
                                                            </figure>
                                                        </article>
                                                        <c:set var="count" value="${count + 1}" />
                                                    </c:if>
                                                    <c:if test="${count == 5}">
                                                        <c:set var="breakLoop" value="true" />
                                                    </c:if>
                                                </c:if>

                                            </c:forEach>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- best-sellers start -->
                    <div class="col-lg-9 col-md-12">
                        <div class="home_section_right">
                            <!-- product area starts  -->

                            <div class="product_area mb-65">
                                <div class="section_title section_title_style2">
                                    <h2><span class="ani-fire">Top 5 best-sellers products</span></h2>
                                    <i style="color: orangered; font-size: 25px; margin-left:5px" class="fa-solid fa-star"></i>
                                </div>
                                <div class="row">
                                    <div class="product_carousel product_column3 owl-carousel">
                                        <c:forEach items="${requestScope.productsTopSellers}" var="t">
                                            <div class="col-lg-3">
                                                <article class="single_product" style="border: 2px solid #f6692a; border-radius: 3px; padding: 20px; width: 100%; height: auto;">
                                                    <figure>
                                                        <div class="product_thumb">
                                                            <a href="#" class="primary_img">
                                                                <img src="${t.getProductImageUrl()}" alt="">
                                                            </a>
                                                            <div class="action_links">
                                                                <ul>
                                                                    <li class="add_to_cart"
                                                                        onclick="">
                                                                        <a href="#" data-toggle="modal" data-target="#modal_box" title="Thêm vào giỏ hàng">
                                                                            <i class="fa fa-shopping-cart"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li class="wishlist">
                                                                        <a href="#" onclick="" title="Thêm vào mục yêu thích">
                                                                            <i style="color: #f6692a" class="fa-solid fa-heart"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li class="quick_button" 
                                                                        onclick="" >
                                                                        <a href="#" data-toggle="modal" data-target="#modal_box"
                                                                           title="Xem sản phẩm">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <figcaption class="product_content">
                                                            <h4 class="product_name ani-fire" style="font-size: 13px">
                                                                <a href="#">${t.getProductName()}</a>
                                                            </h4>
                                                            <div class="price_box">
                                                                <span class="current_price">$${t.priceMin} - $${t.priceMax}</span>
                                                            </div>
                                                        </figcaption>
                                                    </figure>
                                                </article>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="banner_area banner_style_two mb-58">
                                <div class="single_banner">
                                    <div class="banner_thumb">
                                        <a href="#">
                                            <img src="images/Banner/banner4.png" alt="">

                                        </a>
                                        <div class="banner_content">
                                            <h3 style="color: #f8f8f8;">Sale up to </h3>
                                            <h2><span class="ani-fire">45%</span></h2>
                                            <p>Versace</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="single_banner" style="padding-top: 10px">
                                    <div class="banner_thumb">
                                        <a href="#">
                                            <img src="images/Banner/banner5.jpg" alt="">

                                        </a>
                                        <div class="banner_content">
                                            <h2><span class="ani-fire">THE PERFUME SHOP</span></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- gìtset end -->



        <!-- banner area starts -->
        <div class="banner_area mb-66">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <figure class="single_banner">
                            <div class="banner_thumb">
                                <a href="#">
                                    <img src="images/Banner/banner1.jpg" alt="">
                                </a>
                                <div class="banner_content">
                                    <h3>Colections</h3>
                                    <h2 class="ani-fire">Men</h2>
                                    <p>The Perfume Shop</p>
                                </div>
                            </div>
                        </figure>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <figure class="single_banner">
                            <div class="banner_thumb">
                                <a href="#">
                                    <img src="images/Banner/banner2.jpg" alt="">
                                </a>
                                <div class="banner_content" >
                                    <h3>Colections</h3>
                                    <h2 class="ani-fire">Women</h2>
                                    <p>The Perfume Shop</p>
                                </div>
                            </div>
                        </figure>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <figure class="single_banner">
                            <div class="banner_thumb">
                                <a href="#">
                                    <img src="images/Banner/banner3.jpg" alt="">
                                </a>
                                <div class="banner_content">
                                    <h3>Colections</h3>
                                    <h2 class="ani-fire">Unisex</h2>
                                    <p>The Perfume Shop</p>
                                </div>
                            </div>
                        </figure>
                    </div>
                </div>
            </div>
        </div>
        <!-- banner area ends -->

        <!-- ProductMen -->
        <div class="product_area product_area_two mb-65" >
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_title">
                            <h2><span class="ani-fire">Men's Perfumes</span></h2>
                        </div>
                    </div>
                </div>
                <div  class="tab-content">
                    <div class="tab-pane fade show active" id="Men" role="tabpanel">
                        <div class="row" >
                            <div  class="product_carousel product_column4 owl-carousel">
                                <c:forEach items="${requestScope.productsMen}" var="p">
                                    <div class="col-lg-3">
                                        <article class="single_product" style="border: 2px solid #f6692a; border-radius: 3px; padding: 20px; width: 100%; height: auto;">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a href="#" class="primary_img">
                                                        <img src="${p.productImageUrl}" alt="">
                                                    </a>
                                                    <div class="action_links">
                                                        <ul>
                                                            <li class="add_to_cart">

                                                                <a href="#" data-toggle="modal" data-target="#modal_box" title="Thêm vào giỏ hàng">
                                                                    <i class="fa fa-shopping-cart"></i>
                                                                </a>
                                                            </li>
                                                            <li class="wishlist">
                                                                <a href="#"  title="Thêm vào mục yêu thích">
                                                                    <i style="color: #f6692a" class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </li>
                                                            <li class="quick_button">

                                                                <a href="#" data-toggle="modal" data-target="#modal_box" 
                                                                   title="Xem sản phẩm">
                                                                    <i class="fa fa-eye"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name ani-fire" style="font-size: 13px">
                                                        <a href="#">${p.productName}</a>
                                                    </h4>

                                                    <div class="price_box">                                                       
                                                        <span class="current_price"> $${p.priceMin} - $${p.priceMax}
                                                        </span>
                                                    </div>                                                  
                                                </figcaption>
                                            </figure>
                                        </article>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ProductWomen -->
        <div class="product_area product_area_two mb-65">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_title">
                            <h2><span class="ani-fire">Women's Perfumes</span></h2>
                        </div>
                    </div>
                </div>
                <div  class="tab-content">
                    <div class="tab-pane fade show active" id="Men" role="tabpanel">
                        <div class="row">
                            <div  class="product_carousel product_column4 owl-carousel">
                                <c:forEach items="${requestScope.productsWomen}" var="p">
                                    <div class="col-lg-3">
                                        <article class="single_product" style="border: 2px solid #f6692a; border-radius: 3px; padding: 20px; width: 100%; height: auto;">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a href="#" class="primary_img">
                                                        <img src="${p.productImageUrl}" alt="">
                                                    </a>
                                                    <div class="action_links">
                                                        <ul>
                                                            <li class="add_to_cart">

                                                                <a href="#" data-toggle="modal" data-target="#modal_box" title="Thêm vào giỏ hàng">
                                                                    <i class="fa fa-shopping-cart"></i>
                                                                </a>
                                                            </li>
                                                            <li class="wishlist">
                                                                <a href="#"  title="Thêm vào mục yêu thích">
                                                                    <i style="color: #f6692a" class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </li>
                                                            <li class="quick_button">

                                                                <a href="#" data-toggle="modal" data-target="#modal_box" 
                                                                   title="Xem sản phẩm">
                                                                    <i class="fa fa-eye"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name ani-fire" style="font-size: 13px">
                                                        <a href="#">${p.productName}</a>
                                                    </h4>

                                                    <div class="price_box">                                                       
                                                        <span class="current_price">  $${p.priceMin} - $${p.priceMax}
                                                        </span>
                                                    </div>                                                  
                                                </figcaption>
                                            </figure>
                                        </article>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ProductUnisex -->
        <div class="product_area product_area_two mb-65">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_title">
                            <h2><span class="ani-fire">Unisex's Perfumes</span></h2>
                        </div>
                    </div>
                </div>
                <div  class="tab-content">
                    <div class="tab-pane fade show active" id="Men" role="tabpanel">
                        <div class="row">
                            <div  class="product_carousel product_column4 owl-carousel">
                                <c:forEach items="${requestScope.productsUnisex}" var="pUnisex">
                                    <div class="col-lg-3">
                                        <article class="single_product" style="border: 2px solid #f6692a; border-radius: 3px; padding: 20px; width: 100%; height: auto;" >
                                            <figure>
                                                <div class="product_thumb">
                                                    <a href="#" class="primary_img">
                                                        <img src="${pUnisex.productImageUrl}" alt="">
                                                    </a>
                                                    <div class="action_links">
                                                        <ul>
                                                            <li class="add_to_cart">

                                                                <a href="#" data-toggle="modal" data-target="#modal_box" title="Thêm vào giỏ hàng">
                                                                    <i class="fa fa-shopping-cart"></i>
                                                                </a>
                                                            </li>
                                                            <li class="wishlist">
                                                                <a href="#"  title="Thêm vào mục yêu thích">
                                                                    <i style="color: #f6692a" class="fa-solid fa-heart"></i>
                                                                </a>
                                                            </li>
                                                            <li class="quick_button">

                                                                <a href="#" data-toggle="modal" data-target="#modal_box" 
                                                                   title="Xem sản phẩm">
                                                                    <i class="fa fa-eye"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name ani-fire" style="font-size: 13px">
                                                        <a href="#">${pUnisex.productName}</a>
                                                    </h4>

                                                    <div class="price_box">                                                       
                                                        <span class="current_price">  $${pUnisex.priceMin} - $${pUnisex.priceMax}
                                                        </span>
                                                    </div>                                                  
                                                </figcaption>
                                            </figure>
                                        </article>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- blog section starts  -->

        <section class="blog_section blog_two color_two mb-65">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_title">
                            <h2><span class="ani-fire">From Our Blog</span></h2>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="blog_carousel blog_column3 owl-carousel">
                        <div class="col-lg-3">
                            <div class="single_blog">
                                <figure>
                                    <div class="blog_thumb">
                                        <a href="#">
                                            <img src="images/blog1.jpg" alt="">
                                        </a>
                                    </div>
                                    <figcaption class="blog_content">
                                        <h4 class="post_title">
                                            <a href="#">
                                                Flavours of Perfume
                                            </a>
                                        </h4>
                                        <p class="post_desc">
                                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse excepturi cumque
                                            nulla saepe. Error, rem odio perferendis ullam facere veniam commodi minima
                                            delectus velit at obcaecati. Nam dolorem eligendi voluptates.
                                        </p>
                                        <footer class="btn_more">
                                            <a href="#">Read More...</a>
                                        </footer>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="single_blog">
                                <figure>
                                    <div class="blog_thumb">
                                        <a href="#">
                                            <img src="images/blog2.jpg" alt="">
                                        </a>
                                    </div>
                                    <figcaption class="blog_content">
                                        <h4 class="post_title">
                                            <a href="#">
                                                Divine Of India
                                            </a>
                                        </h4>
                                        <p class="post_desc">
                                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse excepturi cumque
                                            nulla saepe. Error, rem odio perferendis ullam facere veniam commodi minima
                                            delectus velit at obcaecati. Nam dolorem eligendi voluptates.
                                        </p>
                                        <footer class="btn_more">
                                            <a href="#">Read More...</a>
                                        </footer>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="single_blog">
                                <figure>
                                    <div class="blog_thumb">
                                        <a href="#">
                                            <img src="images/blog3.jpg" alt="">
                                        </a>
                                    </div>
                                    <figcaption class="blog_content">
                                        <h4 class="post_title">
                                            <a href="#">
                                                Wardrobe Collection
                                            </a>
                                        </h4>
                                        <p class="post_desc">
                                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse excepturi cumque
                                            nulla saepe. Error, rem odio perferendis ullam facere veniam commodi minima
                                            delectus velit at obcaecati. Nam dolorem eligendi voluptates.
                                        </p>
                                        <footer class="btn_more">
                                            <a href="#">Read More...</a>
                                        </footer>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="single_blog">
                                <figure>
                                    <div class="blog_thumb">
                                        <a href="#">
                                            <img src="images/blog4.jpg" alt="">
                                        </a>
                                    </div>
                                    <figcaption class="blog_content">
                                        <h4 class="post_title">
                                            <a href="#">
                                                Best Perfume for Party
                                            </a>
                                        </h4>
                                        <p class="post_desc">
                                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse excepturi cumque
                                            nulla saepe. Error, rem odio perferendis ullam facere veniam commodi minima
                                            delectus velit at obcaecati. Nam dolorem eligendi voluptates.
                                        </p>
                                        <footer class="btn_more">
                                            <a href="#">Read More...</a>
                                        </footer>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- blog section ends -->
        <footer class="footer">
            <div class="site-footer">
                <div class="container">
                    <div class="footer-inner">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-2">
                                <div class="footer-widget">
                                    <h4>
                                        <span>THE PERFUME SHOP</span>
                                    </h4>
                                    <p>
                                        <span>Địa chỉ :</span>  Hoa Lac Hi-tech Park, km 29, Đại lộ Thăng Long, Hà Nội, Vietnam
                                    </p>
                                    <p><span>Email :</span> <a href="#">swp391g2@gmail.com</a></p>
                                    <p><span>Phone :</span> <a href="tel: +91 8888884444">0986686686</a> </p>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-2">
                                <div class="footer-widget">
                                    <h4>
                                        <span>INFORMATION</span>
                                    </h4>
                                    <ul class="list-menu">
                                        <li><a href="home">Home</a></li>
                                        <li><a href="#">About Us</a></li>
                                        <li><a href="#">Contact Us</a></li>
                                        <li><a href="profile">Profile</a></li>
                                    </ul>
                                </div>
                            </div>                          
                            <div class="col-xs-12 col-sm-6 col-md-2">
                                <div class="footer-widget">
                                    <h4>
                                        <span>WAYS TO SHOP</span>
                                    </h4>
                                    <ul class="list-menu">

                                        <li><a href="">Men's Perfumes</a></li>
                                        <li><a href="">Women's Perfumes</a></li>
                                        <li><a href="">Unisex's Perfumes</a></li>
                                        <li><a href="">Gift Set</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-2">
                                <div class="footer-widget">
                                    <h4>POLICY</h4>
                                    <ul class="list-menu">
                                        <li><a href="">Purchase Policy</a></li>
                                        <li><a href="">Information Privacy Policy </a></li>
                                        <li><a href="">Delivery Policy</a></li>
                                        <li><a href="">Warranty Exchange-Return Policy</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-2">
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

                            <div class="col-xs-12 col-sm-6 col-md-2">
                                <div class="footer-widget">
                                    <h4>
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.494053017802!2d105.52340642545694!3d21.012908838322463!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2sFPT%20University!5e0!3m2!1sen!2s!4v1710438011585!5m2!1sen!2s" 
                                                width="280" height="230" style="border:1px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">

                                        </iframe>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
        <script src="js/clickevents.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                                                function setCountDown() {
                                                                    var countdownElement = document.getElementById("countdown");
                                                                    var countDownDate = new Date(countdownElement.getAttribute("data-countdown")).getTime();
                                                                    var x = setInterval(function () {
                                                                        var now = new Date().getTime();
                                                                        var distance = countDownDate - now;
                                                                        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                                                        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                                                        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                                                        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                                                        document.getElementById("day").innerHTML = days;
                                                                        document.getElementById("hour").innerHTML = hours;
                                                                        document.getElementById("minutes").innerHTML = minutes;
                                                                        document.getElementById("sec").innerHTML = seconds;

                                                                        if (distance < 0) {
                                                                            clearInterval(x);
                                                                            document.getElementById("day").innerHTML = "EXPIRED";
                                                                            document.getElementById("hour").innerHTML = "EXPIRED";
                                                                            document.getElementById("minutes").innerHTML = "EXPIRED";
                                                                            document.getElementById("sec").innerHTML = "EXPIRED";
                                                                        }
                                                                    }, 1000);
                                                                }
                                                                window.onload = setCountDown;
        </script>
    </body>
</html>
