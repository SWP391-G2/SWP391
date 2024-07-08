<%-- 
    Document   : test
    Created on : Jul 4, 2024, 2:16:27 PM
    Author     : nguye
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table table-striped align-items-center">

            <thead>
                <tr>
                    <th scope="col">Product ID</th>
                    <th scope="col">Product Image</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Brands</th>
                    <th scope="col">Date of init</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>   
            <c:forEach items="${listProduct}" varStatus="loop" var="Product">
                <tr>
                    <td>${Product.productID}</td>
                    <td><a href="update-product?proId=${Product.productID}">${Product.productName}</a></td>
                    <td>${listCate[Product.getCategoryID()-1].getCategoryName()}</td>                                      
                    <td>${listBrands[Product.getBrandID()-1].getBrandName()}</td>                                      
                    <td>${Product.productCreateDate}</td>   
                    <!-- create button Block if status is 1 and Unblock if status is 0 and have tag a href is updateStatusAdmin?status?id-->
                    <td>
                <c:choose>
                    <c:when test="${Product.productStatus == 0}">
                        <button type="button" onclick="changeStatus('Do you want to set view product?',${Product.productID}, 1)" class="btn w-75 btn-warning">
                            Hidden
                        </button>
                    </c:when>
                    <c:when test="${Product.productStatus == 1}">
                        <button type="button" onclick="changeStatus('Do you want to set hine product?',${Product.productID}, 0)" class="btn w-75 btn-success">
                            Show
                        </button>
                    </c:when>
                </c:choose>
                </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
