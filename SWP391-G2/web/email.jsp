<%-- 
    Document   : email
    Created on : May 29, 2024, 10:48:05 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="./images/logo/image.png" type="image/x-icon" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>The perfume shop</title>
    </head>
    <body >
        <div style="height: 300px"></div>
        <div class="container d-flex align-items-center justify-content-center">
            <form method="get" action="email" class="row g-3">
                <div class="col-auto">
                    <label for="staticEmail2" class="visually-hidden"></label>
                    <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="OTP">
                </div>
                <div class="col-auto">
                    <label for="inputPassword2" class="visually-hidden"></label>
                    <input type="number" name="OTP" class="form-control" id="inputPassword2" placeholder="XXXXXX">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-dark mb-3">Confirm identity</button>
                </div>
            </form>
        </div>
    </body>
</html>
