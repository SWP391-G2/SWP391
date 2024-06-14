<%-- 
    Document   : header
    Created on : Jun 10, 2024, 9:15:05 AM
    Author     : TNO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                                <c:forEach var="category" items="${requestScope.categories}">
                                    <li class="nav-item-lv2">
                                        <a class="nav-link" href="#">
                                            ${category.categoryName}'s Perfumes
                                            <i class="fa fa-caret-right" data-toggle="dropdown"></i>
                                        </a>
                                        <ul class="dropdown-menu-lv2">
                                            <c:forEach var="sub" items="${requestScope.subcategories}">
                                                <c:if test="${sub.categoryID == category.categoryID}">
                                                    <li class="nav-item-lv3">
                                                        <a class="nav-link" href="#">${sub.subCategoryName}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>

                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">BRANDS
                                <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <c:forEach var="brand" items="${requestScope.brands}">
                                    <li class="nav-item-lv2">
                                        <a class="nav-link" href="#">${brand.brandName}</a>
                                    </li>
                                </c:forEach>
                            </ul>

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
                                    <a class="nav-link" href="login">Login</a>
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
