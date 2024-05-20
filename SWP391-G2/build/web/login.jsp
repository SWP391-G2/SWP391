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
        <title>Login Page</title>

        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: Arial, sans-serif;
                background: linear-gradient(to right, #e2e2e2, #c9d6ff);
            }

            .login-container {
                background: #fff;
                padding: 2rem;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 400px;
                width: 100%;
            }

            .title {
                font-size: 2rem;
                margin-bottom: 1rem;
                color: #333;
            }

            .login-form {
                display: flex;
                flex-direction: column;
            }

            .input-group {
                position: relative;
                margin-bottom: 1.5rem;
            }

            .input-group-base {
                position: relative;
                margin-bottom: 1.5rem;
                text-align: left;
            }
            .input-group-base a {
                position: relative;
                margin-bottom: 1.5rem;
                text-align: right;
            }
            .input-group input {
                width: 93%;
                padding: 0.75rem;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 1rem;
                outline: none;
            }

            .input-group label {
                position: absolute;
                top: 50%;
                left: 0.75rem;
                transform: translateY(-50%);
                background-color: #fff;
                padding: 0 0.25rem;
                color: #999;
                transition: 0.3s;
                pointer-events: none;
            }

            .input-group input:focus + label,
            .input-group input:not(:placeholder-shown) + label {
                top: 0;
                transform: translateY(-100%);
                font-size: 0.75rem;
                color: #ff7e5f;
            }

            .btn {
                padding: 0.75rem;
                border: none;
                border-radius: 5px;
                background-color: #ff7e5f;
                color: #fff;
                font-size: 1rem;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn:hover {
                background-color: #feb47b;
            }

            .google-btn {
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #4285F4;
                margin-top: 1rem;
            }

            .google-btn img {
                margin-right: 0.5rem;
            }

            .divider {
                display: flex;
                align-items: center;
                text-align: center;
                margin: 1rem 0;
            }

            .divider::before,
            .divider::after {
                content: '';
                flex: 1;
                border-bottom: 1px solid #ccc;
            }

            .divider::before {
                margin-right: 0.5em;
            }

            .divider::after {
                margin-left: 0.5em;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1 class="title">Login</h1>
            <form action="login" method="post" class="login-form">
                <c:if test="${(requestScope.err != null)}">
                    <h4 style="color: red;">${requestScope.err}</h4>
                </c:if>
                <div class="input-group">
                    <input type="email" value="${param.email}" id="email" name="email" required placeholder="Email" >
                    <label for="email">Email</label>
                </div>
                <div class="input-group">
                    <input type="password" id="password" name="password" required placeholder="Password">
                    <label for="password">Password</label>
                </div>
                <div class="input-group-base">
                    <input type="checkbox">
                    <label>Remember me</label>
                    <a href="#">For got password</a>
                </div>
                <button type="submit" class="btn">Login</button>
                <div class="divider">
                    <span>or</span>
                </div>
                <a style="text-decoration: none" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/SWP391/LoginGoogleHandler&response_type=code&client_id=64210906671-gn1cclen03hhngkbb5ultf010ppcss6p.apps.googleusercontent.com&approval_prompt=force">
                    <button style="width: 100%" type="button" class="btn google-btn">
                        <img src="https://img.icons8.com/color/16/000000/google-logo.png" alt="Google logo">
                        Login with Google
                    </button>
                </a>
            </form>
        </div>
    </body>
</html>