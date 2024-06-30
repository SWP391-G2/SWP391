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

        <div class="cart_section" style="padding-bottom:30%;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-10 offset-lg-1">
                        <div class="cart_container">
                            <div class="cart_title">Shopping Cart<small> </small></div>
                            <div class="cart_items">
                                <ul class="cart_list">
                                    <c:if test="${requestScope.listcart == null}">
                                        <p style="text-align: center; font-size: 30px; margin-top: 5px">No product</p>
                                    </c:if>
                                    <h1>${sessionScope.error}</h1>
                                    <c:if test="${requestScope.listcart != null}">
                                        <c:forEach items="${requestScope.listcart}" var="cart" varStatus="loop">
                                            <li class="cart_item clearfix">
                                                <div class="cart_item_image">${listcart[loop.index].getCardID()}</div>
                                                <div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
                                                    <div class="cart_item_name cart_info_col">
                                                        <div class="cart_item_text">${listproduct[loop.index].getProductDescription()}</div>
                                                    </div>
                                                    <div class="cart_item_color cart_info_col">
                                                        <div class="cart_item_text">${listproduct[loop.index].getProductSize()}</div>
                                                    </div>
                                                    <div class="cart_item_quantity cart_info_col">

                                                        <div class="cart_item_quantity cart_info_col">
                                                            <div class="cart_item_text">
                                                                <form action="cartcontroller" method="post" id="myForm${loop.index}" class="form">
                                                                    <input type ="hidden"  value="${listcart[loop.index].getProductFullDetailID()}" name="pdID"/>
                                                                    <input type ="hidden" value="${listcart[loop.index].getQuantity()}" name="quantity"/>
                                                                    <input type ="hidden" value="${listcart[loop.index].getCardID()}" name="cartID"/>
                                                                    <input type ="hidden" id="quantity${loop.index}" value="${listproduct[loop.index].getProductAvaiable()}" name="avaiable1"/>
                                                                    <input type ="hidden"  value="${listcart[loop.index].getAccountID()}" name="accountID"/> 
                                                                    <input type ="hidden" value="${listproduct[loop.index].getProductAvaiable()}" name="avaiable"/> 
                                                                    <input type ="hidden" value="" id="newquantity${loop.index}" name="newquantity"/>
                                                                    <span id="quanError${loop.index}" class="text-danger"></span>
                                                                    <button type="submit" class="changeQuantity" name="minus" value="1">-</button>

                                                                    <input type="number" class="quantity"  id="newquant${loop.index}"   min="0" pattern="[0-9]*"  name="" type="number"  placeholder="${listcart[loop.index].getQuantity()}"/> 
                                                                    <button type="submit" class="changeQuantity" name="add" value="1">+</button>
                                                                    <a onclick="deleteCart()" href="cartcontroller?cardID=${listcart[loop.index].getCardID()}">DELETE </a>
                                                                </form>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="cart_item_total cart_info_col">

                                                        <div class="cart_item_text"  style="color:red"><fmt:formatNumber value="${ listproduct[loop.index].getProductPrice()* listcart[loop.index].getQuantity()}" type="number" pattern="#,##0" /></div>
                                                    </div>
                                                    <div class="cart_item_action cart_info_col">
                                                        <div class="cart_item_text">
                                                            
                                                        </div>
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
            
            function deleteCart() {
                if (confirm("Do you want delete product?")) {
                    document.getElementById("myForm${loop.index}").submit();
                }
            }



            document.querySelectorAll('.quantity').forEach((inputElement, index) => {
                inputElement.addEventListener('keypress', (event) => {
                    if (event.key === 'Enter') {
                        event.preventDefault();
                        const value = document.getElementById('newquant' + index).value;
                        const value1 = document.getElementById('quantity' + index).value;
                        if (value1 < value) {
                            document.getElementById('quanError' + index).innerText = 'fail';
                            return false;
                        } else {
                            document.getElementById('newquantity' + index).setAttribute('value', value);
                            document.getElementById('myForm' + index).submit();
                        }

                    }
                });
            });
        </script>
    </body>
</html>
