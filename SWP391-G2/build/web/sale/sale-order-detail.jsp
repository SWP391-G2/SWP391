<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product | The Perfume Shop</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <!-- Include Bootstrap CSS via CDN link -->
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_manager.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <style>
            .image-preview-container {
                display: flex;
                align-items: center;
            }
            .error {
                color: red;
            }
            .image-preview {
                width: 60%; /* Đặt kích thước hiển thị ảnh */
                height: auto; /* Đảm bảo tỷ lệ khung hình bảo toàn */
                border: 1px solid #ccc; /* Đường viền để phân biệt vùng ảnh */
            }
            .scroll{
                width: 100%;
                height: 530px;
                overflow-y: scroll;
            }
        </style>

    </head>

    <body>
        <div class="container-fluid">
            <!-- Navigation -->
            <jsp:include page="../partials/navigation.jsp"></jsp:include>

                <!-- Main Content -->
                <div class="main">

                    <div class="container-fluid pt-5">
                        <div class="row px-xl-5">
                            <div class="col-lg-7">
                                <div class="card border-secondary mb-5">
                                    <div class="card-header bg-secondary border-0">
                                        <h4 class="font-weight-semi-bold m-0">Order Total (${requestScope.listcart.size()} products)</h4>
                                </div>
                                <h5 class="font-weight-medium mb-3">Products</h5>
                                <div class="card-body ">
                                    <div class="row scroll ">
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
            </div>
        </div>
    </body>


    <!-- =========== Scripts =========  -->
    <script src="js/admin_manager.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.0.2/firebase.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <script>
                    function validateForm() {
                        let isValid = true;

                        // Image validation
                        const img = document.getElementById('img').files;

                        // Detail validation
                        const detail = document.getElementById('detail').value.trim();
                        const detailError = document.getElementById('detailError');
                        if (detail.length < 20 || detail.length > 10000 || !/^(?!\s*$).{20,9999}$/.test(detail)) {
                            detailError.textContent = 'Detail must be between 20 and 10000 characters and cannot be all whitespace';
                            isValid = false;
                        } else {
                            detailError.textContent = '';
                        }

                        // Price validation
                        const price = document.getElementById('price').value;
                        const priceError = document.getElementById('priceError');
                        if (price === '' || isNaN(price) || parseFloat(price) <= 0 || parseFloat(price) >= 10000000) {
                            priceError.textContent = 'Price must be a number greater than 0 and less than 10,000,000';
                            isValid = false;
                        } else {
                            priceError.textContent = '';
                        }

                        // Quantity validation
                        const quantity = document.getElementById('quantity').value;
                        const quantityError = document.getElementById('quantityError');
                        if (quantity === '' || isNaN(quantity) || parseInt(quantity) <= 0 || parseInt(quantity) >= 1000 || !Number.isInteger(parseFloat(quantity))) {
                            quantityError.textContent = 'Quantity must be an integer greater than 0 and less than 1000';
                            isValid = false;
                        } else {
                            quantityError.textContent = '';
                        }

                        return isValid;
                    }

                    function chooseFile(input) {
                        const file = input.files[0];
                        if (file) {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                document.getElementById('image').src = e.target.result;
                                const img = document.getElementById('img').files;
                                imageError.textContent = '';
                                uploadImage();
                            };
                            uploadImage();
                            reader.readAsDataURL(file);
                        }
                    }
                    document.getElementById('productForm').addEventListener('submit', function (event) {
                        if (!validateForm()) {
                            event.preventDefault(); // Prevent form submission if validation fails
                        }
                        uploadImage();
                    });

                    const firebaseConfig = {
                        apiKey: "AIzaSyA007R8TopzTXZxWH9Bip3XtGxoSgql7XI",
                        authDomain: "swp391-g2-72cbb.firebaseapp.com",
                        projectId: "swp391-g2-72cbb",
                        storageBucket: "swp391-g2-72cbb.appspot.com",
                        messagingSenderId: "1066037353813",
                        appId: "1:1066037353813:web:2deb0838eaeb48add1e3dc",
                        measurementId: "G-Z6QYLR7ZC8"
                    };

// Initialize Firebase
                    firebase.initializeApp(firebaseConfig);
                    function uploadImage() {


                        const ref = firebase.storage().ref('image/');
                        const file = document.querySelector('#img').files[0];
                        const metadata = {
                            contentType: file.type
                        };
                        const name = file.name;
                        const uploadIMG = ref.child(name).put(file, metadata);
                        uploadIMG.snapshot.ref.getDownloadURL().then((url) => {
                            if (url != null) {
                                document.getElementById('a').setAttribute('value', url);


                            }
                            ;
                        })
                    }
    </script>

</html>