<%-- 
    Document   : profile
    Created on : Mar 5, 2024, 10:51:11 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%--<jsp:useBean id="a" class="dal.AccountDAO" scope="request"></jsp:useBean>--%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="icon" href="./assets/img/M.png" type="image/x-icon" />
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <script src="assets/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <title>Store Heart</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    </head>
    <body>

        <div class="header container-fluid text-center">
            <nav class="navbar navbar-expand-lg fixed-top text-bg-light shadow-sm">
                <div class="container-fluid">
                    <a style="width: 300px;" class="navbar-brand d-flex justify-content-start" href="#"><img src="assets/img/M.png" alt="alt" width="50px" height="50px"/> <h1 class="text-uppercase">Store by heart</h1></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel"><img src="assets/img/M.png" alt="alt" width="50px" height="50px"/></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-center align-items-center flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <a class="nav-link active mx-lg-2" aria-current="page" href="index.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link mx-lg-2" href="about.jsp">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link mx-lg-2" href="product.jsp">Products</a>
                                </li>
                                <li>
                                    <form method="get" action="/Project_of_assignment/login" class="d-flex" role="search">
                                        <input name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn btn-outline-success" type="submit">Search</button>
                                    </form>
                                </li>
                            </ul>

                            <div style="background-color: #0000; width: 300px;"  class="d-flex justify-content-end align-items-center">

                                <div class="dropdown mx-1">
                                    <button  class="btn btn-outline-dark border-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                                        <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1z"/>
                                        </svg>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <c:if test="${sessionScope.login != null}">
                                            <li><a class="dropdown-item" href="login?logout=1">Logout</a></li>
                                            </c:if>
                                            <c:if test="${sessionScope.login == null}">
                                            <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                                            <li><a class="dropdown-item" href="signup.jsp">Sign up</a></li>
                                            </c:if>
                                    </ul>
                                </div>

                                <div class="btn-group">
                                    <button type="button" class="btn border-0 btn-outline-dark rounded" data-bs-toggle="dropdown" aria-expanded="false">
                                        Shopping Cart  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                                        </svg>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li><button class="dropdown-item" type="button">Action</button></li>
                                        <li><button class="dropdown-item" type="button">Another action</button></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><button class="dropdown-item" type="button">Something else here</button></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- body -->
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="${profile.image}"><span class="font-weight-bold">${profile.lastName}</span><span class="text-black-50">${profile.email}</span><span> </span></div>
                </div>
                <div class="col-md-5 border-right">
                    <form method="Post" action="Profile">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6"><label class="labels">Firstname</label><input name="firstname" type="text" class="form-control" placeholder="firstname" value="${profile.firstName}"></div>
                                <div class="col-md-6"><label class="labels">Surname</label><input name="lastname" type="text" class="form-control" value="${profile.lastName}" placeholder="surname"></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Mobile Number</label><input name="phone" type="text" class="form-control" placeholder="enter phone number" value="${profile.phone}"> ${mess}</div>
                                <div class="col-md-12">
                                   <div class="form-floating">
                                            <select class="form-select" name="gender" id="gender" aria-label="Default select example">
                                                
                                                <option ${profile.gender == 1?"selected":""} value="1">Male</option>
                                                <option ${profile.gender == 2?"selected":""} value="2">Female</option>
                                            </select>
                                            <label for="floatingSelect">Gender</label>
                                        </div>
                                </div>
                                
                                <div class="col-md-12"><label class="labels">birthday</label><input name="birth" type="date" class="form-control" placeholder="Enter Date Of Birth" id="dateinput" value="${profile.birthday}"></div>

                            </div>
                            <div class="row mt-3">

                            </div>
                            <div class="mt-5 text-center"><button name="save" class="btn btn-primary profile-button" type="submit">Save Profile</button></div>




                        </div>
                    </form>

                </div>
                <div class="col-md-4">
                    <div class="p-3 py-5">
                        <div class="mt-5 text-center"> <a class="nav-link" href="./ChangePassword">Change Password</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class="container-fluid bottom-0" id="contact">
        <div class="row">
            <div class="p-5 col-auto col-3 border d-flex align-items-center justify-content-center flex-column fw-bold">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-wallet pb-1" viewBox="0 0 16 16">
                <path d="M0 3a2 2 0 0 1 2-2h13.5a.5.5 0 0 1 0 1H15v2a1 1 0 0 1 1 1v8.5a1.5 1.5 0 0 1-1.5 1.5h-12A2.5 2.5 0 0 1 0 12.5zm1 1.732V12.5A1.5 1.5 0 0 0 2.5 14h12a.5.5 0 0 0 .5-.5V5H2a2 2 0 0 1-1-.268M1 3a1 1 0 0 0 1 1h12V2H2a1 1 0 0 0-1 1"/>
                </svg>
                <p class="text-uppercase">Easy and convenient payment</p>
            </div>
            <div class="col-auto col-3 border d-flex align-items-center justify-content-center flex-column fw-bold">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5zm1.294 7.456A2 2 0 0 1 4.732 11h5.536a2 2 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456M12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                </svg>
                <p class="text-uppercase">Nationwide Delivery</p>
            </div>
            <div class="col-auto  col-3 border d-flex align-items-center justify-content-center flex-column fw-bold">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
                </svg>
                <p class="text-uppercase text-center">Hotline 0944254867<br/>(10:00 - 17:00)</p>
            </div>
            <div class="col-auto  col-3 border d-flex align-items-center justify-content-center flex-column fw-bold">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark-check" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
                <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"/>
                </svg>
                <p class="text-uppercase">quality reputation</p>
            </div>
        </div>
        <div class="container-fluid  bg-black pt-5">
            <div class="container">
                <div class="top pb-5">
                    <div class="row">
                        <div class="col-2">
                            <ul style="list-style-type: none">
                                <li>
                                    <a class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="index.jsp">
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="about.jsp">
                                        About
                                    </a>
                                </li>
                                <li>
                                    <a class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="product.jsp">
                                        Product
                                    </a>
                                </li>

                            </ul>
                        </div>
                        <div class="col-3 text-light">
                            <ul style="list-style-type: none">
                                <li class="pb-1">
                                    <h6>Payment methods <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wallet2" viewBox="0 0 16 16">
                                        <path d="M12.136.326A1.5 1.5 0 0 1 14 1.78V3h.5A1.5 1.5 0 0 1 16 4.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 13.5v-9a1.5 1.5 0 0 1 1.432-1.499zM5.562 3H13V1.78a.5.5 0 0 0-.621-.484zM1.5 4a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5z"/>
                                        </svg></h6>
                                </li>
                                <li>
                                    Payment on delivery <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                                    <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5zm1.294 7.456A2 2 0 0 1 4.732 11h5.536a2 2 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456M12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                                    </svg>
                                </li>
                                <li>
                                    Online payment <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-credit-card-fill" viewBox="0 0 16 16">
                                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1H0zm0 3v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7zm3 2h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1"/>
                                    </svg>
                                </li>
                            </ul>

                        </div>
                        <div class="col-3 text-light">
                            <ul style="list-style-type: none">
                                <li>
                                    CONNECT WITH US
                                </li>
                                <li class="d-flex justify-content-start">
                                    <a class="text-light text-decoration-none " href="#">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                        <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
                                        </svg>
                                    </a>
                                    <a class="text-light text-decoration-none px-3" href="#">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                                        <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.9 3.9 0 0 0-1.417.923A3.9 3.9 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.9 3.9 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.9 3.9 0 0 0-.923-1.417A3.9 3.9 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599s.453.546.598.92c.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.5 2.5 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.5 2.5 0 0 1-.92-.598 2.5 2.5 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233s.008-2.388.046-3.231c.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92s.546-.453.92-.598c.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92m-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217m0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334"/>
                                        </svg>
                                    </a>
                                    <a class="text-light text-decoration-none" href="#">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter-x" viewBox="0 0 16 16">
                                        <path d="M12.6.75h2.454l-5.36 6.142L16 15.25h-4.937l-3.867-5.07-4.425 5.07H.316l5.733-6.57L0 .75h5.063l3.495 4.633L12.601.75Zm-.86 13.028h1.36L4.323 2.145H2.865z"/>
                                        </svg>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-4">
                            <div class="row-cols-4">
                                <div class="col-3 text-light">
                                    <a style="width: 300px;" class="navbar-brand d-flex justify-content-start align-items-center" href="#"><img src="assets/img/M.png" width="100" class="img-thumbnail" alt="..."><h1 class="ps-5 text-uppercase">Store by heart</h1></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="border-light">
                <div class="bottom pb-2">
                    <p class="text-center">Copyright b1g_nguyx</p>
                </div>
            </div>
        </div>
    </div>
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
        const today = new Date();

        // Lấy các thành phần của ngày
        const year = today.getFullYear() -16;
        const month = String(today.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0
        const day = String(today.getDate()).padStart(2, '0'); // Ngày của tháng

        // Định dạng ngày theo 'yyyy-dd-MM'
        const formattedDate = (year) + '-' + month + '-' + day;

        // Đặt thuộc tính 'max' của phần tử input
        document.getElementById('dateinput').setAttribute('max', formattedDate);

    </script>
</html>
