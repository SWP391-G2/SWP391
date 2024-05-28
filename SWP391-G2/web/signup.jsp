

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./assets/img/M.png" type="image/x-icon" />
        <link rel="stylesheet" href="assets/css/loginStyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Store by heart</title>
    </head>
    <body>
        <div class="row vh-100 g-0">
            <!--left side  -->
            <div class="col-6 position-relative d-none d-lg-block">
                <div class="bg-holder" style="background-image: url(assets/img/M.png);"></div>
            </div>

            <!--/ left side  -->

            <!-- right side  -->
            <div class="col-lg-6">
                <c:if test="${requestScope.err !=null}">
                    <div class="row fixed-top text-center">
                        <div class="col-lg-6"></div>
                        <div class="col-lg-6 alert alert-warning" role="alert">
                            ${requestScope.err}
                        </div>
                    </div>
                </c:if>
                <div class="row align-items-center justify-content-center h-100 g-0 px-4 px-sm-">
                    <div class="col col-sm-6 col-lg-7 col-xl-6">
                        <div class="text-center mb-5">
                            <h2 class="fw-bold pb-5">SIGN UP</h2>
                            <form action="signup" method="post" >
                                <div class="input-group mb-3" >
                                    <span class="input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                                        </svg>
                                    </span>
                                    <input type="email" name="email" value="${param.email}" class="form-control form-control-lg fs-6" required placeholder="Email">
                                </div>
                                <div class="row">
                                    <div class="input-group mb-3 col" >
                                        <span class="input-group-text">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                                            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"/>
                                            <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z"/>
                                            </svg>
                                        </span>
                                        <input type="text" name="firstname" required="" value="${param.firstname}" class="form-control form-control-lg fs-6" placeholder="First name">
                                    </div>
                                    <div class="input-group mb-3 col" >
                                        <span class="input-group-text">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                                            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"/>
                                            <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z"/>
                                            </svg>
                                        </span>
                                        <input type="text" name="lastname" required="" value="${param.lastname}" class="form-control form-control-lg fs-6" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="input-group mb-3" >
                                    <span class="input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
                                        </svg>
                                    </span>
                                    <input type="password" name="password" required="" class="form-control form-control-lg fs-6" placeholder="Password">
                                </div>
                                <div class="input-group mb-3" >
                                    <span class="input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
                                        </svg>
                                    </span>
                                    <input type="password" name="confirmpassword"  required="" class="form-control form-control-lg fs-6" placeholder="Confirm password">
                                </div>

                                <div class="input-group mb-3">
                                    <div>
                                        <small><a href="#" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Forgot Password?</a></small>
                                    </div>
                                </div>
                                <button class="btn btn-dark btn-lg w-100 mb-3">Sign up</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ right side  -->
        </div>
    </body>
</html>
