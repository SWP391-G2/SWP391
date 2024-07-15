<%-- 
    Document   : checkout
    Created on : Jun 25, 2024, 11:09:19 PM
    Author     : hatru
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="assets/css/testcss/css/style.css" rel="stylesheet">
        <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        -->
        <style>
            .form-control-sm.custom-width {
                width: 40px; /* Thay đổi giá trị này theo nhu cầu của bạn */
            }

            .discount-code {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .input-group.mb-3 {
                display: flex;
                align-items: center;
            }

            .ui-tag__label {
                display: inline-block;
                margin-right: auto;
            }

            .discount-tag {
                display: flex;
                align-items: center;
            }

            .discount-icon {
                margin-right: 5px;
            }
            .btn-primary{

            }
        </style>

    </head>

    <body>

        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Checkout</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Checkout Start -->

        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-7">
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Order Total (${requestScope.listcart.size()} products)</h4>
                        </div>
                        <h5 class="font-weight-medium mb-3">Products</h5>
                        <div class="card-body">
                            <table class="table border-0">
                                <c:if test="${requestScope.listcart != null}">
                                    <c:forEach items="${requestScope.listcart}" var="cart" varStatus="loop">
                                        <tr>
                                            <td>${listproduct[loop.index].getImage()}</td>
                                            <td>${listcart[loop.index].getName()}</td>
                                            <td>${listproduct[loop.index].getProductSize()}</td>
                                            <td>${listcart[loop.index].getQuantity()}</td>
                                            <td>${listproduct[loop.index].getProductPrice()}$</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${requestScope.cookieCart != null}">
                                    <c:set var="o" value="${requestScope.cookieCart}"/>
                                    <c:forEach items="${o.items}" var="i" >
                                        <tr>
                                            <td>${i.product.getImage()}</td>
                                            <td>${i.getName()}</td>
                                            <td>${i.product.getProductSize()}</td>
                                            <td>${i.getQuantity()}</td>
                                            <td>${i.product.getProductPrice()}$</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                            <div class="col-lg-4">
                                <form class="mb-5" action="applyvouchers">
                                    <div class="input-group mb-3 d-flex">
                                        <input type="text" name="voucher" class="form-control p-4" placeholder="Coupon Code">
                                        <input type="hidden" value="${requestScope.totalprice}" name="totalprice"/>
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-dark">Apply Coupon</button>
                                        </div>
                                    </div>
                                    <c:if test="${sessionScope.dis != null}">
                                        <div class="d-flex justify-content-between mb-3 pt-2">
                                            <span class="ui-tag__label">
                                                <span class="discount-tag">
                                                    <span class="discount-icon"><i class="fa fa-tag"></i></span>
                                                    <span class="discount-tag__name">
                                                        ${sessionScope.dis.getDiscount()}
                                                    </span>
                                                </span>
                                            </span>
                                            <button class="ui-tag__close" type="submit" name="delete" data-bind-event-click="sendCode">×</button>
                                        </div>
                                    </c:if>
                                </form>
                            </div>
                            <hr class="mt-0">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Subtotal</h6>
                                <h6 class="font-weight-medium">${requestScope.totalprice}$</h6>
                            </div>
                            <c:set var="total" value="${requestScope.totalprice}"/>
                            <c:if test="${sessionScope.dis != null}">
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Discount(${sessionScope.dis.getDiscount()}%)</h6>
                                    <h6 class="font-weight-medium">${sessionScope.dis.getDiscount()*0.01*total}$</h6>
                                </div>
                            </c:if>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium">Freeship</h6>
                            </div>
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">${total - sessionScope.dis.getDiscount()*0.01*total}$</h5>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-5">
                    <form id="billingForm" action="order" method="post">
                        <div class="mb-4">
                            <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>Full Name</label>
                                    <input class="form-control" value="${param.fullname}" type="text" placeholder="Ha" name="fullname">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Email</label>
                                    <input class="form-control" value="${param.email}" type="text"  id="input1" oninput="syncInputs()" placeholder="Hatrung03022003@gmail.com" name="email">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Mobile No</label>
                                    <input class="form-control" value="${param.phone}" type="text" placeholder="0944362986" name="phone">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Country</label>
                                    <select class="form-select form-select-sm mb-3" value="${param.city}" id="city" name="city" aria-label=".form-select-sm">
                                        <option value="" selected>Chọn tỉnh thành</option>
                                    </select>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>District</label>
                                    <select class="form-select form-select-sm mb-3" value="${param.district}" id="district" name="district" aria-label=".form-select-sm">
                                        <option value="" selected>Chọn quận huyện</option>
                                    </select>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Ward</label>
                                    <select class="form-select form-select-sm" value="${param.ward}"  id="ward" name="ward" aria-label=".form-select-sm">
                                        <option value="" selected>Chọn phường xã</option>
                                    </select>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Address Details</label>
                                    <input class="form-control" value="${param.addressDetails}" type="text" placeholder="Số 143 đường Đào Giã" name="addressDetails">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Note</label>
                                    <input class="form-control" value="${param.note}" type="text" placeholder="Please deliver in the morning" name="note">
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="newaccount" name="newaccount">
                                        <label class="custom-control-label" for="newaccount">Create an account</label>
                                    </div>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="shipto" name="shipto">
                                        <label class="custom-control-label" for="shipto" data-toggle="collapse" data-target="#shipping-address">Ship to different address</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="collapse mb-4" id="shipping-address">
                            <h4 class="font-weight-semi-bold mb-4">Shipping Address</h4>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>Full Name</label>
                                    <input class="form-control" type="text" placeholder="John" name="shippingFirstName">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Last Name</label>
                                    <input class="form-control" type="text" placeholder="Doe" name="shippingLastName">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>E-mail</label>
                                    <input class="form-control" type="text" placeholder="example@email.com" name="shippingEmail">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Mobile No</label>
                                    <input class="form-control" type="text" placeholder="+84944362986" name="shippingPhone">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Address Line 1</label>
                                    <input class="form-control" type="text" placeholder="123 Street" name="shippingAddress1">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>City</label>
                                    <input class="form-control" type="text" placeholder="New York" name="shippingCity">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>State</label>
                                    <input class="form-control" type="text" placeholder="New York" name="shippingState">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>ZIP Code</label>
                                    <input class="form-control" type="text" placeholder="123" name="shippingZip">
                                </div>
                            </div>
                        </div>
                        <input type="hidden" value="${total - sessionScope.dis.getDiscount()*0.01*total}" name="total"/>
                        <input class="form-control" type="email" hidden="" id="input2" name="emailC">

                        <div class="card border-secondary mb-5">
                            <div class="card-header bg-secondary border-0">
                                <h4 class="font-weight-semi-bold m-0">Payment</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" id="paypal" value="vnpay">
                                        <label class="custom-control-label" for="paypal">VN Pay</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" id="directcheck" value="direct">
                                        <label class="custom-control-label" for="directcheck">Direct Check</label>
                                    </div>
                                </div>
                                <div class="">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" id="banktransfer" value="bank">
                                        <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer border-secondary bg-transparent">
                                <button type="submit" class="btn btn-lg btn-block btn-dark font-weight-bold my-3 py-3">Place Order</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Checkout End -->






        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script>

            document.addEventListener('DOMContentLoaded', function () {
                var input1 = document.getElementById('input1');
                var input2 = document.getElementById('input2');

                if (input1 && input2) {
                    input1.addEventListener('input', function () {
                        input2.value = input1.value;
                    });
                } else {
                    console.error('Không tìm thấy các thẻ input với ID "input1" hoặc "input2".');
                }
            });
            var citis = document.getElementById("city");
            var districts = document.getElementById("district");
            var wards = document.getElementById("ward");
            var Parameter = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json",
            };
            var promise = axios(Parameter);
            promise.then(function (result) {
                renderCity(result.data);
            });

            function renderCity(data) {
                for (const x of data) {
                    citis.options[citis.options.length] = new Option(x.Name, x.Id);
                }
                citis.onchange = function () {
                    district.length = 1;
                    ward.length = 1;
                    if (this.value != "") {
                        const result = data.filter(n => n.Id === this.value);

                        for (const k of result[0].Districts) {
                            district.options[district.options.length] = new Option(k.Name, k.Id);
                        }
                    }
                };
                district.onchange = function () {
                    ward.length = 1;
                    const dataCity = data.filter((n) => n.Id === citis.value);
                    if (this.value != "") {
                        const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                        for (const w of dataWards) {
                            wards.options[wards.options.length] = new Option(w.Name, w.Id);
                        }
                    }
                };
            }

            function syncInputs() {
                var input1Value = document.getElementById('email').value;
                document.getElementById('emailc').value = input1Value;
            }

        </script>


    </body>

</html>
