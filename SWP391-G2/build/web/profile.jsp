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

    </head>
    <body>
        <header class="header bg-secondary">
            <div class="container">
                <div class="header-main">
                    <div class="row">   
                        <div class="col-md-4 hidden-sm hidden-xs">
                            <div class="header_search search_form">
                                <form class="input-group search-bar search_form has-validation-callback " action="/search" method="get" role="search"> 
                                    <input type="search" name="query" value placeholder="Search your products..." class="input-group-field st-default-search-input search-text" autocomplete="off">
                                    <span class="input-group-btn">
                                        <button class="btn icon-fallback-text">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-4 col-100-h">
                            <h1><a href="home">THE PERFUME SHOP</a></h1>
                        </div>

                        <div class="col-md-4 hidden-sm hidden-xs">
                            <div class="my-wishlist">
                                <a href="" data-toggle="tooltip" data-placement="bottom" title="Wishlist" data-customer-id="15588985" class="smartLogin iWishView">
                                    <i class="fa fa-heart" aria-hidden="true"></i>
                                </a>
                            </div>   
                            <div class="my-cart top-cart-contain mini-cart">
                                <a href="cart" class="a-cart">
                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                    <span class="cnt crl-bg count_item_pr">0</span>
                                </a>
                                <div class="top-cart-content">
                                    <ul id="cart-sidebar" class="mini-products-list count_li">
                                        <div class="no-item">
                                            <p>There are no products in the cart.</p>
                                        </div>
                                    </ul>
                                </div>
                            </div>     
                            <div class="my-gear">
                                <a href="#" class="user-profile">
                                    <i class="fa fa-solid fa-gear"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>       

            </div>
            <nav>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-pills nav-fill">
                                <li class="nav-item active">
                                    <a class="nav-link" href="home">HOME</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">ABOUT US</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">PERFUMES
                                        <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <c:forEach var="category" items="${requestScope.categories}">
                                            <li class="nav-item-lv2">
                                                <a class="nav-link" href="#">
                                                    ${category.categoryName}'s Perfumes
                                                    <i class="fa fa-caret-right" data-toggle="dropdown"></i>
                                                </a>
                                                <ul class="dropdown-menu-lv2">
                                                    <c:forEach var="sub" items="${requestScope.subcategories}">
                                                        <c:if test="${sub.categoryID == category.categoryID}">
                                                            <li class="nav-item-lv3">
                                                                <a class="nav-link" href="#">${sub.subCategoryName}</a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">BRANDS
                                        <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <c:forEach var="brand" items="${requestScope.brands}">
                                            <li class="nav-item-lv2">
                                                <a class="nav-link" href="#">${brand.brandName}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>

                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="">BLOGS</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="">CONTACT US</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link "href="#">ACCOUNT
                                        <i class="fa fa-caret-down" data-toggle="dropdown"></i>
                                    </a>
                                    <ul class="dropdown-menu">

                                        <li class="nav-item-lv2">
                                            <c:if test="${sessionScope.account == null}">
                                                 <a class="nav-link" href="login">Login</a>
                                                 <a class="nav-link" href="signup.jsp">Sign Up</a>
                                            </c:if>
                                            <c:if test="${sessionScope.account != null}">
                                                 <a class="nav-link" href="./Profile">Profile</a>
                                                 <a class="nav-link" href="./ChangePassword">Change Password</a>
                                                 <a class="nav-link" href="login?logout=1">Logout</a>
                                            </c:if>
                                        </li>
                                    </ul>                                                                          
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </nav>
        </header>

        <!-- body -->
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <form  method="Post" action="Profile" class="row col-12" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <div class="col-md-3 col-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
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
                            <span class="font-weight-bold">${profile.lastName}</span>
                            <span class="text-black-50">${profile.email}</span>
                        </div>
                    </div>
                    <div class="col-md-5 col-5 border-right">

                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
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

                                <div class="col-md-12"><label class="labels">Birthday</label><input name="birth" type="date" class="form-control" placeholder="Enter Date Of Birth" id="dateinput" value="${profile.birthday}"></div>

                            </div>
                            <div class="row mt-3">

                            </div>
                                <div class="mt-5 text-center">
                                    <button style="--bs-btn-bg: black" name="save" class="btn btn-primary profile-button" type="submit">Save Profile</button>
                                </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-4">
                        <div class="p-3 py-5">
                            <div class="mt-5 text-center"> <a style="color: black" class="nav-link" href="./AddressDetail">Your Address</a></div>
                        </div>
                    </div> 
                </form>
            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="footer.jsp"/>
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
