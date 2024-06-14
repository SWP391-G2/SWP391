<%-- 
    Document   : marketing
    Created on : May 29, 2024, 8:40:42 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <jsp:useBean id="s" class="Dal.SliderDAO" scope="request"></jsp:useBean>
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/admin.css">
        </head>
        <body >
            <div class="container-fluid">
                <div class="row">
                    <aside class="col-md-2 sidebar text-light bg-dark" style="">
                        <h2 class="text-center  my-3">Marketing Dashboard</h2>
                        <nav class="nav flex-column">
                            <a class="nav-link text-light" href="admincustomer?roleID=4">SLIDERS</a>
                            <a class="nav-link text-light" href="admincustomer?roleID=2">FEEDBACK</a>
                            <a class="nav-link text-light" href="admincustomer?roleID=3">CATEGORIES</a>
                            <a class="nav-link text-light" href="admincustomer?roleID=1">POSTS</a>
                            <a class="nav-link text-light" href="admincustomer?roleID=1">PRODUCTS</a>
                            <a class="nav-link text-light" href="admincustomer?roleID=1">MY PROFILE</a>
                            <a class="nav-link text-light" href="login.jsp">SIGN OUT</a>
                        </nav>
                    </aside>
                    <main class="col-md-10 main-content">
                        <h1 class="my-4">SLIDERS Management</h1>

                        <!-- Search and filter section -->
                        <div class="search-filter mb-4 w-100 d-flex justify-content-end">
                            <form action="admincustomer" method="get" class="search-form form-inline mb-2">
                                <input type="text" name="searchQuery" class="form-control mr-2" placeholder="Search by name">
                                <button type="submit" class="btn btn-dark">Search</button>
                            </form>

                            <!-- Filter by role -->
                        </div>

                        <!-- Customer table -->
                        <table class="table table-striped customer-table">
                            <thead class="thead-dark">
                                <tr>
                                    <th>STT</th>
                                    <th>Status</th>
                                    <th>Title</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>

                            <c:forEach items="${s.all}" var="sl">
                            <tbody>
                                <tr>
                                    <td>${sl.sliderID}</td>
                                    <td>
                            <c:choose>
                                <c:when test="${sl.sliderStatus == 1}">
                                    <p class="text-start">Active</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="text-danger">Block</p>
                                </c:otherwise>
                            </c:choose>
                            </td>
                            <td>${sl.sliderTitle}</td>
                            <td>
                                <button class="btn btn-warning btn-sm edit-btn">Edit</button>
                                <button class="btn btn-danger btn-sm delete-btn">Delete</button>
                            </td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </main>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>