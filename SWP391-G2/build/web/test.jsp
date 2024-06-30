<%-- 
    Document   : test
    Created on : Jun 20, 2024, 3:19:06 PM
    Author     : nguye
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="proDao" class="Dal.ProductDetailDAO" scope="request"></jsp:useBean>

    </head>
    <body>
        <h1>${proDao.getProductDetail(1)}</h1>
