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
        <title>Wishlist | The Perfume Shop</title>
        <link rel="icon" href="images/logo1.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    </head>
    <body>
        <div class="container px-4 py-5 mx-auto text-center">
            <c:if test="${empty wishlist}">
                <<img src="images/emptycart2.png" width="600px"  alt="Emptycart" />
            </c:if>
            <c:if test="${not empty wishlist}">
                <div class="row d-flex justify-content-center">
                    <div class="col-12">
                        <div class="row text-right">
                            <div class="col-2 mt-2 text_page_head">
                                Nhà cung cấp
                            </div>
                            <div class="col-2 mt-2 text_page_head">
                                Giá
                            </div>
                            <div class="col-2 mt-2 text_page_head" style="padding-right: 30px">
                                Lựa chọn
                            </div>
                            <div class="col-2 mt-2 text_page_head">
                                Nhà cung cấp
                            </div>
                            <div class="col-2 mt-2 text_page_head">
                                Nhà cung cấp
                            </div>
                            <div class="col-2 mt-2 text_page_head">
                                Nhà cung cấp
                            </div>
                            <div class="col-2 mt-2 text_page_head">
                                Nhà cung cấp
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${sessionScope.wishlist}" var="item">
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
                        <td>${item.productFullDetail.productSize}</td>
                        <td>${item.productFullDetail.productPrice}</td>
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
