<%-- 
    Document   : cart
    Created on : Oct 15, 2023, 4:22:02 PM
    Author     : windy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Cart | iLocal Shop</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <!-- Link Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Link File CSS -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/cssCart.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="cart_section" style="padding-bottom:30%;">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="cart_container">
                                <div class="cart_title">Shopping Cart<small> </small></div>
                                <div class="cart_items">
                                    <ul class="cart_list">
                                    <c:if test="${requestScope.listItem == null}">
                                        <p style="text-align: center; font-size: 30px; margin-top: 5px">No product</p>
                                    </c:if>
                                    <c:if test="${requestScope.listItem != null}">
                                        <c:forEach items="${requestScope.listItem}" var="i">
                                            <li class="cart_item clearfix">
                                                <div class="cart_item_image"><img src="pdimg/${i.proImage}" alt=""></div>
                                                <div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
                                                    <div class="cart_item_name cart_info_col">
                                                        <div class="cart_item_text">${i.proName}</div>
                                                    </div>
                                                    <div class="cart_item_color cart_info_col">
                                                        <div class="cart_item_text">${i.pdColor}</div>
                                                    </div>
                                                    <div class="cart_item_quantity cart_info_col">

                                                        <div class="cart_item_quantity cart_info_col">
                                                            <div class="cart_item_text">
                                                                <form action="cart" method="post" class="form">
                                                                    <input type ="hidden" value="${i.pdID}" name="pdID"/>
                                                                    <input type ="hidden" value="${i.getQuantity()}" name="quantity"/> 
                                                                    <button type="submit" class="changeQuantity" name="action" value="-">-</button>

                                                                    <input class="quantity" name="quantity" type="text" value="${i.quantity}"/> 
                                                                    <button type="submit" class="changeQuantity" name="action" value="+">+</button>
                                                                </form>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="cart_item_price cart_info_col">
                                                        <div class="cart_item_text"><fmt:formatNumber value="${i.proPrice}" type="number" pattern="#,##0" /></div>
                                                    </div>
                                                    <div class="cart_item_total cart_info_col">
                                                        <div class="cart_item_text" style="color:red"><fmt:formatNumber value="${i.proPrice*i.quantity}" type="number" pattern="#,##0" /></div>
                                                    </div>
                                                    <div class="cart_item_action cart_info_col">
                                                        <div class="cart_item_text"><form action="cart" method="post">
                                                                <input type="hidden" name="pdID" value="${i.pdID}"/>
                                                                <input type="submit" value="Delete" name="delete"/>
                                                            </form></div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                        <form action="cart" method="post" id="deleteForm">
                                            <input type="hidden" value="true" name="deleteAll"/>
                                            <input onclick="notice()" class="deleteAll" type="button" value="Empty Cart" name="deleteAll"/>
                                        </form>

                                    </c:if>

                                </ul>
                            </div>
                            <c:if test="${requestScope.listItem != null}">
                                <div class="order_total">
                                    <div class="order_total_content text-md-right">
                                        <div class="order_total_title">Order Total:</div>
                                        <c:set var="sum" value="0"></c:set>
                                        <c:forEach items="${listItem}" var="i" varStatus="status">
                                            <c:if test="${status.last eq true}">
                                                <div class="order_total_amount"><fmt:formatNumber value="${sum + i.proPrice*i.quantity}" type="number" pattern="#,##0" /></div>
                                            </c:if>
                                            <c:set var="sum" value="${sum + i.proPrice*i.quantity}"></c:set>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>

                            <div class="cart_buttons"> 
                                <button type="button" class="button cart_button_clear"><a href="home">Continue Shopping</a></button>
                                <c:if test="${requestScope.listItem != null}">
                                    <button type="button" class="button cart_button_checkout"><a href="order">Check out</a></button> 
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <script>
            function notice() {
                if (confirm("Delete all items in cart?")) {
                    document.getElementById("deleteForm").submit();
                }
            }
        </script>
    </body>
</html>
