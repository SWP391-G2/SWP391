<%-- 
    Document   : viewwishlist
    Created on : 1 thg 7, 2024, 16:25:19
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
            body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background-color: #fff;
                background-repeat: no-repeat;
            }

            .plus-minus {
                position: relative;
            }

            .plus {
                position: absolute;
                top: -4px;
                left: 2px;
                cursor: pointer;
            }

            .minus {
                position: absolute;
                top: 8px;
                left: 5px;
                cursor: pointer;
            }

            .vsm-text:hover {
                color: #FF5252;
            }

            .book, .book-img {
                width: 120px;
                height: 180px;
                border-radius: 5px;
            }

            .book {
                margin: 20px 15px 5px 15px;
            }

            .border-top {
                border-top: 1px solid #EEEEEE !important;
                margin-top: 20px;
                padding-top: 15px;
            }

            .card {
                margin: 40px 0px;
                padding: 40px 50px;
                border-radius: 20px;
                border: none;
                box-shadow: 1px 5px 10px 1px rgba(0,0,0,0.2);
            }

            input, textarea {
                background-color: #F3E5F5;
                padding: 8px 15px 8px 15px;
                width: 100%;
                border-radius: 5px !important;
                box-sizing: border-box;
                border: 1px solid #F3E5F5;
                font-size: 15px !important;
                color: #000 !important;
                font-weight: 300;
            }

            input:focus, textarea:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #9FA8DA;
                outline-width: 0;
                font-weight: 400;
            }

            button:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                outline-width: 0;
            }

            .pay {
                width: 80px;
                height: 40px;
                border-radius: 5px;
                border: 1px solid #673AB7;
                margin: 10px 20px 10px 0px;
                cursor: pointer;
                box-shadow: 1px 5px 10px 1px rgba(0,0,0,0.2);
            }

            .gray {
                -webkit-filter: grayscale(100%);
                -moz-filter: grayscale(100%);
                -o-filter: grayscale(100%);
                -ms-filter: grayscale(100%);
                filter: grayscale(100%);
                color: #E0E0E0;
            }

            .gray .pay {
                box-shadow: none;
            }

            #tax {
                border-top: 1px lightgray solid;
                margin-top: 10px;
                padding-top: 10px;
            }

            .btn-blue {
                border: none;
                border-radius: 10px;
                background-color: #673AB7;
                color: #fff;
                padding: 8px 15px;
                margin: 20px 0px;
                cursor: pointer;
            }

            .btn-blue:hover {
                background-color: #311B92;
                color: #fff;
            }

            #checkout {
                float: left;
            }

            #check-amt {
                float: right;
            }

            .btnAdd, .btnSub {
                padding: 5px 10px;
                margin-left: 7px;
                margin-right: 7px;
                border: none;
            }

            @media screen and (max-width: 768px) {
                .book, .book-img {
                    width: 100px;
                    height: 150px;
                }

                .card {
                    padding-left: 15px;
                    padding-right: 15px;
                }

                .mob-text {
                    font-size: 13px;
                }

                .pad-left {
                    padding-left: 20px;
                }
            }

            .text_page_head{
                font-size: 18px;
                font-weight: 600;
            }
            .text_page {
                font-size: 14px;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
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
                                                <a class="nav-link" class="${cid_refine==0?"active":""}" href="refine?cid=${0}">PERFUMES
                                                    <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <c:forEach var="category" items="${requestScope.categories}">
                                                        <li class="nav-item-lv2">
                                                            <a class="nav-link" class="${category.categoryID==cid_refine?"active":""}" href="refine?cid_refinee=${category.categoryID}">
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

                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <jsp:include page="header_right.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container px-4 py-5 mx-auto text-center">
            <c:if test="${sessionScope.listItemsInWishList == null || sessionScope.wishListSize == 0}">
                <<img src="images/emptycart2.png" width="600px"  alt="Emptycart" />
            </c:if>
            <c:if test="${sessionScope.wishListSize != 0}">
                <div class="row d-flex justify-content-center">
                    <div class="col-4">
                        <h4 class="heading">Sản phẩm yêu thích</h4>
                    </div>
                    <div class="col-8">
                        <div class="row text-right">
                            <div class="col-4 mt-2 text_page_head">
                                Nhà cung cấp
                            </div>
                            <div class="col-4 mt-2 text_page_head">
                                Giá
                            </div>
                            <div class="col-4 mt-2 text_page_head" style="padding-right: 30px">
                                Lựa chọn
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${sessionScope.listItemsInWishList}" var="item">
                    <c:set var="p" value="${item.product}" />
                    <div class="row d-flex justify-content-center border-top">
                        <div class="col-4">
                            <div class="row d-flex">
                                <div class="book col-7" style="margin-right: 30px; flex: 1">
                                    <img src="${item.product.image[0]}" style="width: 170px; height: 150px" class="book-img">
                                </div>
                                <div class="my-auto flex-column d-flex pad-left col-5">
                                    <h6 class="mob-text">${item.product.name}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="my-auto col-8 ">
                            <div class="row text-right">
                                <div class="col-4 text_page">
                                    <p class="mob-text">${item.product.supplier.companyName}</p>
                                </div>
                                <div class="col-2 text_page">
                                    ${item.price}
                                </div>
                                <div class="col-6" style="margin-top: -15px;display: flex; justify-content: space-between; align-items: center;" >
                                    <div class="col-9">
                                        <form action="viewwishlist" method="post" style="display:flex">
                                            <input name="quantity" type="number" min="1" max="100" step="1" value="1" style="width:100px">
                                            <input name="id" type="hidden" value="${p.id}">
                                            <input name="role" type="hidden" value="add">
                                            <button type="submit"  style="padding: 7px 15px; border: none; border-radius: 5px; background-color: orangered; color: white"F >
                                                Thêm
                                            </button>                                         
                                        </form>
                                    </div>
                                    <div class="col-3" style="text-align: center">
                                        <a  href="viewwishlist?rid=${item.product.id}"
                                            style="color: orange; font-size: 30px">
                                            <i class="fa-regular fa-heart"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>


        <footer class="footer">        
            <jsp:include page="footer.jsp"/>
        </footer>
    </body>
</html>
