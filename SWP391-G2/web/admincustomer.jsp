<%-- 
    Document   : admincustomer
    Created on : May 29, 2024, 4:12:57 PM
    Author     : hatru
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <body>
        <div class="container">
            <aside class="sidebar">
                <h2>Admin Dashboard</h2>
                <nav>
                    <ul>
                        <li><a href="admincustomer?roleID=4">CUSTOMER</a></li>
                        <li><a href="admincustomer?roleID=2">SALE</a></li>
                        <li><a href="admincustomer?roleID=3">MARKETING</a></li>
                        <li><a href="admincustomer?roleID=1">MY PROFILE</a></li>
                        <li><a href="login.jsp">SIGN OUT</a></li>
                    </ul>
                </nav>
            </aside>
            <main class="main-content">
                
                <form action="admincustomer" method="post">
                    <input type="text" name="roleID" value="${roleID}" hidden>
                    
                    <div class="action-bar">
                        <a href="createaccount.jsp" class="create-btn">Create</a>
                        <input type="text" name="searchname" placeholder="Search by name" class="search-input">
                        <button type="submit" class="search-btn">Search</button>
                    </div>

                    <table class="customer-table">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listaccount}" var="u">
                                <tr>
                                    <td>${u.getAccountID()}</td>
                                    <td>${u.getFirstName()}</td>
                                    <td>${u.getLastName()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.getGender() == 1}">
                                                Male
                                            </c:when>
                                            <c:otherwise>
                                                Female
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${u.getEmail()}</td>
                                    <td>${u.getAddress()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.getStatus() == 1}">
                                                Active
                                            </c:when>
                                            <c:otherwise>
                                                Blocked
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.getStatus() == 1}">
                                                <a href="admincreate?block=${u.getAccountID()}">Block</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="admincreate?unblock=${u.getAccountID()}">Unblock</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:forEach items="${requestScope.listsearch}" var="u">
                                <tr>
                                    <td>${u.getAccountID()}</td>
                                    <td>${u.getFirstName()}</td>
                                    <td>${u.getLastName()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.getGender() == 1}">
                                                Male
                                            </c:when>
                                            <c:otherwise>
                                                Female
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${u.getEmail()}</td>
                                    <td>${u.getAddress()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.getStatus() == 1}">
                                                Active
                                            </c:when>
                                            <c:otherwise>
                                                Blocked
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.getStatus() == 1}">
                                                <a href="admincreate?block=${u.getAccountID()}">Block</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="admincreate?unblock=${u.getAccountID()}">Unblock</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <h2 style="color: red">${requestScope.result}</h2>
                </form>
            </main>
        </div>
    </body>
</html>