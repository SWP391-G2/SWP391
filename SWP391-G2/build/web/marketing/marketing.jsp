<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Manage Product | The Perfume Shop</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <!-- Include Bootstrap CSS via CDN link -->
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_manager.css">
       
    </head>

    <body>
     
        <div class="container-fluid">
            <!-- Navigation -->
            <jsp:include page="../partials/navigation.jsp"></jsp:include>

                <!-- Main Content -->
                <div class="main" style="margin-left: 50px; margin-right: 50px;">
                    <div class="topbar">
                        <!-- <div class="toggle">
        
        </div> -->
                    </div>

                    <div class="row" style="margin-right: 70px;  padding: 10px; border: 1.5px solid #000;">
                        <input type="hidden" id="pageNo" name="pageNo" value="${currentPage}">
                    <div class="col-12" style="margin-bottom: 40px;">
                        <h1>Product</h1>
                        <c:if test="${param.exist != null}">
                            <h6 style="color: red;">Account alrealdy exist!</h6>
                        </c:if>
                        <c:if test="${param.error != null}">
                            <h6 style="color: red;">In-valid information to add new customer!</h6>
                        </c:if>
                    </div>
                    <div class="col-3">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search" value="${search}"
                                   id="search" name="search">
                            <div class="input-group-append">
                                <button class="btn btn-secondary" type="button" id="btnSearch">
                                    <ion-icon name="search-outline"></ion-icon>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <select class="form-control" id="status" name="status">
                            <option value="-1" ${status==null ? 'selected' : '' }>All status</option>
                            <option value="1" ${status==1 ? 'selected' : '' }>View</option>
                            <option value="0" ${status==0 ? 'selected' : '' }>Hide</option>
                        </select>
                    </div>
                    <div class="col-2">
                        <select class="form-control" id="cateID" name="cateId">
                            <option value="-1" ${cateId==null ? 'selected' : '' }>All Category</option>
                            <c:forEach var="i" items="${listCate}" >
                                <option value="${i.categoryID}" ${i.categoryID== cateID ? 'selected' : '' }>${i.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <script>
                        // handle filter search
                        const searchInput = document.querySelector('#search');
                        searchInput.addEventListener('keydown', (event) => {
                            if (event.key === 'Enter') {
                                performSearch();
                            }
                        });
                        const btnSearch = document.querySelector('#btnSearch');
                        btnSearch.addEventListener('click', () => {
                            performSearch(); // call function
                        });
                        function performSearch() {
                            const search = document.querySelector('#search').value;
                            const status = document.querySelector('#status').value;
                            const pageNo = document.querySelector('#pageNo').value;
                            const cateID = document.querySelector('#cateID').value;
                            window.location.href = 'manage-product?search=' + search +
                                    '&status=' + status + '&pageNo=1' + '&cateID=' + cateID;
                        }
                        ;

                        // handle filter status
                        const status = document.querySelector('#status');
                        status.addEventListener('change', () => {
                            const search = document.querySelector('#search').value;
                            const status = document.querySelector('#status').value;
                            const pageNo = document.querySelector('#pageNo').value;
                            const cateID = document.querySelector('#cateID').value;
                            window.location.href = 'manage-product?search=' + search +
                                    '&status=' + status + '&pageNo=1' + '&cateID=' + cateID;
                        });


                        // handle filter cateID
                        const cateID = document.querySelector('#cateID');
                        cateID.addEventListener('change', () => {
                            const search = document.querySelector('#search').value;
                            const status = document.querySelector('#status').value;
                            const pageNo = document.querySelector('#pageNo').value;
                            const cateID = document.querySelector('#cateID').value;
                            window.location.href = 'manage-product?search=' + search +
                                    '&status=' + status + '&pageNo=1' + '&cateID=' + cateID;
                        });


                        // handle pagination
                        function changePage(pageNo) {
                            const search = document.querySelector('#search').value;
                            const status = document.querySelector('#status').value;
                            const cateID = document.querySelector('#cateID').value;
                            window.location.href = 'manage-product?search=' + search +
                                    '&status=' + status + '&pageNo=' + pageNo + '&cateID=' + cateID;
                        }

                    </script>

                    <div class="col-4">
                        <div class="text-right">
                            <button type="button" class="btn btn-success" data-toggle="modal"
                                    data-target="#addnewModal">
                                <a style="color: white;" href="addProduct"><ion-icon style="margin-top: 2px;" name="add-outline"></ion-icon> Add New</a>
                            </button>
                        </div>
                    </div>
                    <div class="col-12" style="margin-top: 10px;">
                        <div class="table-responsive">
                            <table class="table table-striped">

                                <thead>
                                    <tr>

                                        <th scope="col">Product ID</th>
                                        <th scope="col">Product Image</th>
                                        <th scope="col">Product Name</th>
                                        
                                        <th scope="col">Category</th>
                                        <th scope="col">Stock</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>                    
                                    <c:forEach items="${listProduct}" var="listProduct">
                                        <tr>

                                            <td>${listProduct.proID}</td>
                                            <td><img src="${pageContext.request.contextPath}/img/${listProduct.proImage}" style="width: 75px; display: table; margin: 0px -10px;" alt=""></td>
                                            <td><a href="manage-productDetail?proId=${listProduct.proID}">${listProduct.proName}</a></td>
                                            <td><fmt:formatNumber value="${listProduct.proPrice}" type="number" pattern="#,##0" /> VND</td>
                                            <td>${listProduct.getCateNameByCateID()}</td>                                      
                                            <td><a href="manage-productDetailStock?proId=${listProduct.proID}">Stock</a></td>
                                            <!-- create button Block if status is 1 and Unblock if status is 0 and have tag a href is updateStatusAdmin?status?id-->
                                            <td>
                                                <c:choose>
                                                    <c:when test="${listProduct.proStatus == 1}">
                                                        <a href="updateStatusProduct?status=0&proId=${listProduct.proID}">
                                                            <button type="button" class="btn btn-danger">
                                                                Hide
                                                            </button>
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${listProduct.proStatus == 0}">
                                                        <a href="updateStatusProduct?status=1&proId=${listProduct.proID}">
                                                            <button type="button" class="btn btn-success">
                                                                View
                                                            </button>
                                                        </a>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>


                        <input type="hidden" id="pageNo" name="pageNo" value="${currentPage}">
                        <input type="hidden" id="totalPage" name="pageNo" value="${totalPage}">
                        <div class="pagination" style="text-align: center">
                            Page
                            <input type="number" value="${currentPage}" min="1" max="${totalPage}" id="currentPage"/>
                            /${totalPage}</div>



                    </div>
                </div>

            </div>
        </div>
    </body>


    <!-- =========== Scripts =========  -->
    <script src="js/admin_manager.js"></script>
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <script>
                        var alertMessage = ${sessionScope.alertMessage};

                        if (alertMessage) {
                            alert("Update product detail successfully!");
                        }

        <%
                session.removeAttribute("alertMessage");
        %>
    </script>

    <script>
        // handle pagination
        const page = document.querySelector('#currentPage');

        page.addEventListener('change', () => {
            const currentPageRaw = document.getElementById('currentPage').value;
            const totalPage = document.getElementById('totalPage').value;
            validatePage(currentPageRaw, totalPage);
            const currentPage = document.getElementById('currentPage').value;
            changePage(currentPage);
        });

        function validatePage(pageNo, totalPage) {
            if (pageNo >= totalPage) {
                console.log("sakdfjklasd");
                document.getElementById('currentPage').value = totalPage;
            } else if (pageNo <= 1) {
                document.getElementById('currentPage').value = 1;
            }
        }
    </script>


</html>