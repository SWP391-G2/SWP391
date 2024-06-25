<%-- 
    Document   : testcart
    Created on : Jun 16, 2024, 11:40:06 PM
    Author     : hatru
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>


            <tr>
                <th>STT</th>
                <th>ProductDescription</th>
                <th>ProductImage</th>
                <th>ProductAccountID</th>
                <th>ProductQuantity</th>
                <th>ProductSize</th>
                <th>ProductPrice</th>
            </tr>
        
            <c:forEach items="${requestScope.listcart}" var="cart" varStatus="loop">
                <tr>
                   
                    <td>${listcart[loop.index].getCardID()}</td>
                    <td>${listproduct[loop.index].getProductDescription()}</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </c:forEach>



        </table>
    </body>
</html>
