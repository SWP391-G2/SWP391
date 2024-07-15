<%-- 
    Document   : profile
    Created on : Mar 5, 2024, 10:51:11 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <style>

    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="icon" href="./assets/img/M.png" type="image/x-icon" />
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <script src="assets/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <style type="text/css">
            body{
                background-color:#f2f6fc;
                color:#69707a;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                width: 150px;
                border-radius: 50% !important;
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }

            #buttonVip2{
                display: none;
            }

            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }

            body {
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                width: 100%;
                font-family: "Nunito", sans-serif;
                background-image: url(images/magic.gif);
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }

            .card{
                border: none;
                border-radius: 10px;
                width: 100%;
                margin-top: 10%;
            }

            .fa-ellipsis-v{
                font-size: 10px;
                color: #C2C2C4;
                margin-top: 6px;
                cursor: pointer;
            }
            .text-dark{
                font-weight: bold;
                margin-top: 8px;
                font-size: 13px;
                letter-spacing: 0.5px;
            }
            .card-bottom{
                background: #3E454D;
                border-radius: 6px;
            }
            .flex-column{
                color: #adb5bd;
                font-size: 13px;
            }
            .flex-column p{
                letter-spacing: 1px;
                font-size: 18px;
            }
            .btn-secondary{
                height: 40px!important;
                margin-top: 3px;
            }
            .btn-secondary:focus{
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="main_header header_transparent header-mobile-m">
                <div class="header_container sticky-header" style="padding: 0">
                    <div class="container-fluid" style="background-color: black">
                        <div class="row align-items-center" style="padding: 8px 0">
                            <div class="col-lg-2">
                                <div class="logo">
                                    <a href="home"><img src="images/logo/logo0.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main_menu menu_two menu_position">
                                    <nav>
                                        <ul class="nav nav-pills nav-fill">
                                            <li class="nav-item active">
                                                <a class="nav-link" href="home">HOME</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">ABOUT US</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" class="${cid_refine==0?"active":""}" href="refine?cid=${0}">PERFUMES
                                                    <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <c:forEach var="category" items="${requestScope.categories}">
                                                        <li class="nav-item-lv2">
                                                            <a class="nav-link" class="${category.categoryID==cid_refine?"active":""}" href="refine?cid_refinee=${category.categoryID}">
                                                                ${category.categoryName}'s Perfumes
                                                            </a>
                                                        </li>
                                                    </c:forEach>                                                  
                                                </ul>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">BRANDS
                                                    <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                                </a>
                                                <ul class="dropdown-menu multi-column">
                                                    <div class="row">
                                                        <c:forEach var="brand" items="${requestScope.brands}">
                                                            <div class="col-md-4">
                                                                <li class="nav-item-lv2">
                                                                    <a class="nav-link" href="refine?bid_refinee=${brand.getBrandID()}">${brand.getBrandName()}</a>
                                                                </li>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </ul>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="">CONTACT US</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="">BLOGS</a>
                                            </li>

                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="header_search search_form">
                                    <form class="input-group search-bar search_form has-validation-callback " action="searchHome" method="get" role="search"> 
                                        <input type="text" name="query" value placeholder="Search your products..." class="input-group-field st-default-search-input search-text" autocomplete="off">
                                        <span class="input-group-btn">
                                            <button class="btn icon-fallback-text">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </span>
                                    </form>
                                </div>
                            </div>                 
                            <div class="col-lg-2">
                                <jsp:include page="header_right.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container-xl px-4 mt-4" style="padding-top: 100px; padding-bottom: 100px">
            <div class="row">
                <form  method="Post" action="Profile" class="row col-12" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <div class="col-xl-4">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Ảnh đại diện</div>
                            <div class="card-body text-center box_info">
                                <c:if test="${!profile.image.isEmpty()}">
                                    <div class="input-group">
                                        <input type="file" name="img" class="form-control d-none" id="inputGroupFile04" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                        <label for="inputGroupFile04"><img src="./images/Account/${profile.image}" id="image" class="img-thumbnail rounded-5" width="100%" alt="${sessionScope.account.getImage()}"></label>
                                    </div>
                                </c:if>
                                <c:if test="${profile.image.isEmpty()}">
                                    <div class="input-group">
                                        <input type="file" name="img" class="form-control d-none" id="inputGroupFile04" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                        <label for="inputGroupFile04"><img src="images/Account/default.png" id="image" class="img-thumbnail rounded-5" width="100%" alt="defaut.png"></label>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="card mb-4 mb-xl-0">
                            <div class="container d-flex justify-content-center">
                                <div class="card p-3" style="margin: 10px 0">
                                    <!--                                    <div class="col-md-4 col-4">
                                                                            <div class="p-3 py-5">
                                                                                <div class="mt-5 text-center"> <a style="color: black" class="nav-link" href="./AddressMain">Your Address</a></div>
                                                                            </div>
                                                                        </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8" style="margin-top: -37px">

                        <div class="card mb-4">
                            <div class="card-header" style="font-weight: 700">HỒ SƠ CỦA BẠN</div>
                            <div class="card-body">
                                <div class="row mt-2">
                                    <div class="col-md-6">
                                        <label class="labels">First name</label>
                                        <input name="firstname" type="text" class="form-control" id="firstname" placeholder="firstname" value="${profile.firstName}"${mess1}>
                                        <span  style="color: red" id="FnameError"></span>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Last name</label>
                                        <input name="lastname" type="text" class="form-control" id="lastname" value="${profile.lastName}" placeholder="lastname"${mess1}>
                                        <span style="color: red" id="LnameError"></span>
                                    </div>
                                    <div class="col-md-6">
<!--                                        <label class="labels">Phone : ${address.phone}</label>-->
                                        <label class="mb-1" for="inputPhone">Phone</label>
                                       
                                            <input class="form-control acceptEdit"  name="phone" type="text" value="${address.phone}">
                                        
                                    </div>

                                            <div > 
                                        <label class="labels">Address : ${address.addressLine}, ${address.wards}, ${address.district}, ${address.city}</label>
                                    </div>

                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <div class="form-floating">
                                            <select class="form-select" name="gender" id="gender" aria-label="Default select example">

                                                <option ${profile.gender == 1?"selected":""} value="1">Male</option>
                                                <option ${profile.gender == 2?"selected":""} value="2">Female</option>
                                            </select>
                                            <label for="floatingSelect">Gender</label>
                                        </div>
                                    </div>

                                    <div class="col-md-12"><label class="labels">Birthday</label><input name="birth" type="date" class="form-control" placeholder="Enter Date Of Birth" id="dateinput" value="${profile.birthDay}"></div>

                                </div>
                                <div class="row mt-3">

                                </div>
                                <div class="mt-5 text-center">
                                    <button style="--bs-btn-bg: black" name="save" class="btn btn-primary profile-button" type="submit">Save Profile</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- body -->



        <footer class="footer">

            <jsp:include page="footer.jsp"/>
        </footer>
    </body>
    <script>
        function chooseFile(fileInput) {
            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image').attr('src', e.target.result);
                }
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    </script>
    <script>
        function isOnlyWhitespace(input) {
            return /^\s*$/.test(input);
        }

        function validateForm() {
            // Lấy giá trị của các input
            var fname = document.getElementById('firstname').value;
            var lname = document.getElementById('lastname').value;

            // Lấy các phần tử để hiển thị lỗi
            var FnameError = document.getElementById('FnameError');
            var LnameError = document.getElementById('LnameError');

            // Định nghĩa các regex cho kiểm tra input
            var nameRegex = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠ-ỹ0-9][a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠ-ỹ0-9 ]{0,198}[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠ-ỹ0-9]$/; // Chỉ chấp nhận chữ cái, số và khoảng trắng, độ dài từ 2 đến 200 ký tự, không được nhập space ở đầu và không được nhập toàn khoảng trắng
            // Xóa thông báo lỗi trước đó
            FnameError.textContent = '';
            LnameError.textContent = '';


            // Kiểm tra input
            var valid = true;

            // Kiểm tra name
            if (isOnlyWhitespace(lname)) {
                LnameError.textContent = 'Brand Name cannot contain only whitespace.';
                valid = false;
            } else if (!nameRegex.test(lname)) {
                LnameError.textContent = 'Brand names cannot have leading spaces, must be between 2 and 200 characters, and contain only letters, numbers, and spaces.';
                valid = false;
            } else if (/^\d+$/.test(lname)) {
                LnameError.textContent = 'Brand Name cannot contain whole numbers.';
                valid = false;
            }
            if (isOnlyWhitespace(fname)) {
                FnameError.textContent = 'Brand Name cannot contain only whitespace.';
                valid = false;
            } else if (!nameRegex.test(fname)) {
                FnameError.textContent = 'Brand names cannot have leading spaces, must be between 2 and 200 characters, and contain only letters, numbers, and spaces.';
                valid = false;
            } else if (/^\d+$/.test(fname)) {
                FnameError.textContent = 'Brand Name cannot contain whole numbers.';
                valid = false;
            }


            // Nếu tất cả đều hợp lệ, return true để submit form
            return valid;
        }

    </script>
    <script>
        const today = new Date();

        // Lấy các thành phần của ngày
        const year = today.getFullYear() - 16;
        const month = String(today.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0
        const day = String(today.getDate()).padStart(2, '0'); // Ngày của tháng

        // Định dạng ngày theo 'yyyy-dd-MM'
        const formattedDate = (year) + '-' + month + '-' + day;

        // Đặt thuộc tính 'max' của phần tử input
        document.getElementById('dateinput').setAttribute('max', formattedDate);

    </script>
</html>
