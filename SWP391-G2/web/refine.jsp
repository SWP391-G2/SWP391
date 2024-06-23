<%-- 
    Document   : product
    Created on : Mar 5, 2024, 4:07:55 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./images/logo/image.png" type="image/x-icon" />
        <link href="css/homestyle.css" rel="stylesheet">
        <title>The Perfume Shop | Genuine Perfume Store</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <style>
            li a:hover {
                color: #f6692a;
            }
            ul li a.active {
                color: #f6692a;
            }

            .li_header {
                color: white;
                margin-left: 50px;
                font-size: 18px;
            }

            .submit-price {
                font-size: 16px;
                background-color: black;
                color: white;
                font-weight: 600;
                padding: 5px 40px;
                border-radius: 20px;
                margin: 10px 0 20px
            }

            .submit-price:hover {
                background-color: rgba(0,0,0,0.3);
                color: black;
                font-weight: 600;
            }
        </style>
    </head>
    <body
        <header>
        <div class="main_header header_transparent header-mobile-m">
            <div class="header_container sticky-header" style="padding: 0">
                <div class="container-fluid" style="background-color: black">
                    <div class="row align-items-center" style="padding: 8px 0">
                        <div class="col-lg-3">
                            <div class="logo">
                                <a href="home"><img src="images/logo/logo0.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="header_search search_form">
                                <form class="input-group search-bar search_form has-validation-callback " action="/search" method="get" role="search" style="max-width: 500px"> 
                                    <input type="search" name="query" value placeholder="Search your products..." class="input-group-field st-default-search-input search-text" autocomplete="off">
                                    <span class="input-group-btn">
                                        <button class="btn icon-fallback-text">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <%@ include file="header_right.jsp" %> 
                        </div>
                    </div>
                    <div class="row" style="justify-content: center; padding: 5px 0"">
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
                                            <a class="nav-link" href="#">PERFUMES
                                                <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <c:forEach var="category" items="${requestScope.categories}">
                                                    <li class="nav-item-lv2">
                                                        <a class="nav-link" href="#">
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
                                                                <a class="nav-link" href="#">${brand.brandName}</a>
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

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="home_section_two color_two mb-70" style="margin-top: 100px; margin-bottom: 50px">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-12">
                    <div class="home_section_left">      
                        <c:set var="cat" value="${requestScope.category}"/>
                        <div class="testimonial_style_two mb-60 rightleft">
                            <div class="testimonial_container">
                                <div class="section_title section_title_style2">
                                    <h2 style="font-size: 20px"><span class="ani-fire">Filter</span></h2>
                                    <i style="font-size: 25px; margin-left: 5px; color:#f6692a" class="fa fa-filter"></i>
                                </div>
                                <form id="f1" action="refine" method="get">

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-12">
                    <div class="home_section_right">
                        <div class="product_area" >
                            <div class="section_title_style2" style="margin-top: 50px">
                                <c:if test="${requestScope.cat.name == null}">
                                    <div style="text-align: start; font-size: 18px; text-transform: uppercase" class="ani-fire">
                                        All Products
                                    </div>
                                </c:if>
                                <h3 style="font-weight: 600; text-decoration: underline">${requestScope.cat.name}</h3>
                                <div style="text-align: center; font-size: 15px">
                                    ${requestScope.cat.describe}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <div class="modal fade" id="modal_box" role="dialog"></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>   
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <script src="js/clickevents.js"></script>
    <<script src="js/main.js"></script>
</body>
</html>
