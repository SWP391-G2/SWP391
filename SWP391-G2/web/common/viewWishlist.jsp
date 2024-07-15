<%-- 
    Document   : viewWishlist
    Created on : 15 thg 7, 2024, 11:34:51
    Author     : pna29
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your Wishlist</h1>
        <c:if test="${not empty wishlist}">

            <table border="1">
                <tr>
                    <th>No</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Size</th>
                    <th>Date Added</th>
                     <th></th>
                      <th></th>
                </tr>
                <c:set var="stt" value="0"/>
                <c:forEach var="item" items="${wishlist}">
                    <c:set var="stt"  value="${stt+1}"/>
                    <tr>
                        <td>${stt}</td>
                        <td>${item.product.productName}</td>
                        <td><img src="${item.product.productImageUrl}" alt="alt"/></td>
                        <td>${item.productFullDetail.productDescription}</td>
                        <td></td>
                        <td>${item.dateAdded}</td>
                        <td><button>Delete</button></td>
                        <td><button>Add to Cart</button></td>
                    </tr>
                </c:forEach>
                    
            </table>

        </c:if>
        <c:if test="${empty wishlist}">
            <p>Your wishlist is empty.</p>
        </c:if>
        <script>

        </script>

    </body>
</html>
