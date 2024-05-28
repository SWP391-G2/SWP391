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
        <style>
            .line::before{
                content: 'Or';
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                background-color: #ffff;
                color: #232836;
                padding: 0 15px;
            }
        </style>
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
                        <div class="mt-3 mb-3">

                            <a class="btn btn-lg btn-light w-100"  href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/SWP391-G2/LoginGoogleHandler&response_type=code&client_id=64210906671-gn1cclen03hhngkbb5ultf010ppcss6p.apps.googleusercontent.com&approval_prompt=force"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 48 48">
                                <path fill="#FFC107" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path><path fill="#FF3D00" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path><path fill="#4CAF50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path><path fill="#1976D2" d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
                                </svg>  Login With Google</a>
                        </div>
                        <div class="position-relative bg-secondary-subtle mb-3 line" style="width: 100%; height: 1px;"></div>
                        <form action="login" method="post" >
                            <div class="input-group mb-3" >
                                <span class="input-group-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                                    </svg>
                                </span>
                                <input type="email" required="" name="email" value="${requestScope.email}" class="form-control form-control-lg fs-6" placeholder="Email">
                            </div>
                            <div class="input-group mb-3" >
                                <span class="input-group-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
                                    </svg>
                                </span>
                                <input type="password" required="" name="password" value="${requestScope.password}" class="form-control form-control-lg fs-6" placeholder="Password">
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