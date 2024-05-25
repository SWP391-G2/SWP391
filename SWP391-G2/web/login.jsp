<%-- 
    Document   : login
    Created on : May 20, 2024, 10:17:40 PM
    Author     : nguye
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <title>Login Page</title>
    </head>
    <div class="row vh-100 g-0">
        <!-- left side  -->
        <div class="col-6 position-relative d-none d-lg-block">
            <div class="bg-holder" style="background-image: url(assets/img/M.png);"></div>
        </div>

        <!--/ left side  -->

        <!-- right side  -->
        <div class="col-lg-6">
            <c:if test="${requestScope.err != null}">
                <div class="row fixed-top">
                    <div class="col-lg-6"></div>
                    <div class="col-lg-6 alert alert-warning text-center" role="alert">
                        ${requestScope.err}
                    </div>
                </div>
            </c:if>
            <div class="row align-items-center justify-content-center h-100 g-0 px-4 px-sm-">
                <div class="col col-sm-6 col-lg-7 col-xl-6">
                    <div class="text-center mb-5">
                        <h2 class="fw-bold pb-5">Login</h2>
                        <form action="login" method="post" >
                            <div class="input-group mb-3" >
                                <span class="input-group-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                                    </svg>
                                </span>
                                <input type="text" name="email" value="${requestScope.em}" class="form-control form-control-lg fs-6" placeholder="Username">
                            </div>
                            <div class="input-group mb-3" >
                                <span class="input-group-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
                                    </svg>
                                </span>
                                <input type="password" name="password" value="${requestScope.pa}" class="form-control form-control-lg fs-6" placeholder="Password">
                            </div>
                            <div class="input-group mb-3 d-flex justify-content-between">
                                <div class="form-check">
                                    <input type="checkbox" name="remember" class="form-check-input" id="formCheck">
                                    <label for="formCheck" class="form-check-label text-secondary"><small>Remember Me</small></label>
                                </div>
                                <div>
                                    <small><a href="#" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Forgot Password?</a></small>
                                </div>
                            </div>
                            <button class="btn btn-dark btn-lg  w-100 mb-3" name="login"> Login</button>

                        </form>
                        <div class="text-center">
                            <small>Don't have an accout? <a href="signup.jsp" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Sign Up</a></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ right side  -->
    </div>
</body>
</html>