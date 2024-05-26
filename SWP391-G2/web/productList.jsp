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
        <link rel="icon" href="./assets/img/M.png" type="image/x-icon" />
        <link rel="stylesheet" href="assets/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Store Heart</title>
        <style>
            html{
                scroll-behavior: smooth;
            }
        </style>
    </head>
    <body>

        <form method="get" action="/listProduct" class="d-flex" role="search">
            <input name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-light" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
                <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018"/>
                <path d="M13 6.5a6.47 6.47 0 0 1-1.258 3.844q.06.044.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11"/>
                </svg></button>
        </form>
        <!--    product   -->
        <div class="p-5"></div>
        <div class="row p-5 ">
            <div class="col-2">
                <!-- search price start -->
                <form action="ProductList" method="get">

                    <div class="pt-5">
                        <div class=" d-flex justify-content-between">
                            <input type="number" class="w-50" name="min" value="${param.min}" placeholder="price min">-<input type="number" value="${param.max}" class="w-50" placeholder="price max" name="max">
                        </div>
                        <c:if test="${ranger}">
                            <p class="text-danger">Please input valid price range</p>
                        </c:if>
                        <button type="submit" name="checkprice" value="1" class="btn btn-dark text-uppercase w-100 mt-3">Apply</button> 
                    </div>
                </form>
                <!-- search price end -->
            </div>
            <div class="col-10"> 
                <div class=" rounded container bg-secondary-subtle">
                    <div class="p-5">

                        <div class="row  d-flex justify-content-xxl-evenly" >
                            <c:forEach var="y" items="${requestScope.listProduct}">
                                <div class="col-auto ps-2 pb-3 ">
                                    <div class="card shadow" style="width: 18rem;">
                                        <a href="#" style="" class="disabled text-dark text-decoration-none link-underline-opacity-0" id="moreinformation">
                                            <img src="assets/img/products/P${y.productID}.png" class="card-img-top img-thumbnail" alt="P${y.productImageID}">
                                            <div class="card-body">
                                                <h5 class="card-title">${y.productName}</h5>
                                                <p class="card-text">${y.productDetail}</p>
                                                <p class="ps-2 card-text text-secondary">${y.productPrice} VND</p>
                                                <a href="#" class="pt-2 btn btn-dark">Add to Cart</a>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center pb-3">
                                    <c:if test="${tag-1>0}">
                                        <li class="page-item">
                                            <a class="page-link" href="/Product/ProductList?index=${tag-1}" >Previous</a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="1" end="${requestScope.endP}" var="i">
                                        <li class="page-item ${tag == i ? "active":""}"><a class="page-link" href="/Product/ProductList?index=${i}">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${tag<endP}">
                                        <li class="page-item">
                                            <a class="page-link" href="/Product/ProductList?index=${tag+1}">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>

                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!--    product   -->
        <!-- footer -->

    </body>
</html>
