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


        <!--    product   -->
        <div class="p-5"></div>
        <div class="row p-5 ">
            <div class="col-2">

                <form action="listP" method="get">

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
            </div>
            <div class="col-10"> 
                <div class=" rounded container bg-secondary-subtle">
                    <div class="p-5">

                        <div class="row  d-flex justify-content-xxl-evenly" >
                            <!--
                            <c:if test="${all != null}">

                                <div class=" d-flex justify-content-between">
                                    <span class="text-uppercase fw-bold fs-2">Similar products</span>
                                </div> 
                                <c:if test="${all.isEmpty()}">
                                    <div class="d-flex justify-content-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-terminal-x" viewBox="0 0 16 16">
                                        <path d="M2 3a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h5.5a.5.5 0 0 1 0 1H2a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v4a.5.5 0 0 1-1 0V4a1 1 0 0 0-1-1z"/>
                                        <path d="M3.146 5.146a.5.5 0 0 1 .708 0L5.177 6.47a.75.75 0 0 1 0 1.06L3.854 8.854a.5.5 0 1 1-.708-.708L4.293 7 3.146 5.854a.5.5 0 0 1 0-.708M5.5 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-4.854-1.354a.5.5 0 0 0 0 .708l.647.646-.647.646a.5.5 0 0 0 .708.708l.646-.647.646.647a.5.5 0 0 0 .708-.708l-.647-.646.647-.646a.5.5 0 0 0-.708-.708l-.646.647-.646-.647a.5.5 0 0 0-.708 0"/>
                                        </svg>
                                    </div>
                                    <h3 class="text-center">No result for researching</h3>
                                </c:if>
                                <c:forEach var="y" items="${requestScope.all}">
                                    <div class="col-auto ps-2 pb-3 ">
                                        <div class="card shadow" style="width: 18rem;">
                                            <a href="/Project_of_assignment/detail?p=${y.id}&&pc=${pcc.name}" style="" class="disabled text-dark text-decoration-none link-underline-opacity-0" id="moreinformation">
                                                <img src="assets/img/products/${y.image}" class="card-img-top img-thumbnail" alt="${y.image}">
                                                <div class="card-body">
                                                    <h5 class="card-title">${y.name}</h5>
                                                    <p class="card-text">${y.descriotion}</p>
                                                    <p class="ps-2 card-text text-secondary">${y.price} VND</p>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center pb-3">
                                <c:if test="${tag-1>0}">
                                    <li class="page-item">
                                        <a class="page-link" href="/Project_of_assignment/listP?search=${sr}&&index=${tag-1}&&max=${param.max}&&min=${param.min}" >Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${requestScope.endP}" var="i">
                                    <li class="page-item ${tag == i ? "active":""}"><a class="page-link" href="/Project_of_assignment/listP?search=${sr}&&index=${i}&&max=${param.max}&&min=${param.min}">${i}</a></li>
                                </c:forEach>
                                <c:if test="${tag<endP}">
                                <li class="page-item">
                                    <a class="page-link" href="/Project_of_assignment/listP?search=${sr}&&index=${tag+1}&&max=${param.max}&&min=${param.min}">Next</a>
                                </li>
                                </c:if>
                            </ul>
                        </nav>
                            </c:if>
                           
                            <c:if test="${requestScope.listP != null}">
                                -->
                                <c:forEach var="y" items="${requestScope.listP}">
                                    <div class="col-auto ps-2 pb-3 ">
                                        <div class="card shadow" style="width: 18rem;">
                                            <a href="#" style="" class="disabled text-dark text-decoration-none link-underline-opacity-0" id="moreinformation">
                                                <img src="assets/img/products/P${y.productID}" class="card-img-top img-thumbnail" alt="P${y.productImageID}">
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
                            </c:if>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!--    product   -->
        <!-- footer -->

    </body>
</html>
