<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product | The Perfume Shop</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <!-- Include Bootstrap CSS via CDN link -->
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_manager.css">

        <style>
            .image-preview-container {
                display: flex;
                align-items: center;
            }

            .image-preview {
                width: 60%; /* Đặt kích thước hiển thị ảnh */
                height: auto; /* Đảm bảo tỷ lệ khung hình bảo toàn */
                border: 1px solid #ccc; /* Đường viền để phân biệt vùng ảnh */
            }
        </style>

    </head>

    <body>
        <div class="container-fluid">
            <!-- Navigation -->
            <jsp:include page="../partials/navigation.jsp"></jsp:include>
            <input type="hidden" id="pageNo" name="pageNo" value="${currentPage}">
            <input type="hidden" id="cateId" name="cateId" value="${cateId}">
            <input type="hidden" id="proId" name="proId" value="${proId}">

            <!-- Main Content -->
            <div class="main" style="margin-left: 50px; margin-right: 50px;">
                <div class="topbar">
                </div>



                <!<!-- product detail list -->

                <div class="topbar mb-2">
                    <nav aria-label="breadcrumb" style="background-color: #FFFFFF">
                        <ol class="breadcrumb" style="background-color: #FFFFFF">
                            <li class="breadcrumb-item"><a href="./update-product?proId=${proId}">product</a></li>
                            <li class="breadcrumb-item active" aria-current="page">detail list</li>
                        </ol>
                    </nav>
                </div>

                <div class="row" style="margin-right: 70px;  padding: 10px; border: 1px solid #cccc;">
                    <div class="col-12" style="margin-bottom: 40px;">
                        <h1>Product Detail</h1>
                    </div>
                    <div class="row col-12">
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
                        <div class="row col-9 d-flex justify-content-end">
                            <div class="col-2">
                                <select class="form-control" id="status" name="status">
                                    <option value="-1" ${status==null ? 'selected' : '' }>All status</option>
                                    <option value="1" ${status==1 ? 'selected' : '' }>View</option>
                                    <option value="0" ${status==0 ? 'selected' : '' }>Hide</option>
                                </select>
                            </div>
                            <div class="col-2">
                                <select class="form-control" id="size" name="size">
                                    <option value="" ${size==null ? 'selected' : '' }>All Size</option>
                                    <c:forEach  items="${listSize}" var="sizes" varStatus="loop" >
                                        <option value="${sizes}" ${sizes == size ? 'selected' : '' }>${sizes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-2">
                                <div class="text-right">
                                    <button type="button" class="btn btn-success" data-toggle="modal"
                                            data-target="#addnewModal">
                                        <a href="add-product-detail" style="color: white;" ><ion-icon style="margin-top: 2px;" name="add-outline"></ion-icon> Add New Product Detail</a>
                                    </button>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-12" style="margin-top: 10px;">
                        <div class="table-responsive">
                            <table class="table table-striped">

                                <thead>
                                    <tr>

                                        <th scope="col">#</th>
                                        <th scope="col">Product Image</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Date of init</th>
                                        <th scope="col">Size</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>   
                                    <c:forEach items="${listDetail}" varStatus="loop" var="detail">
                                        <tr>
                                            <td>${(requestScope.currentPage-1)*10+loop.index+1}</td>
                                            <td><img src="images/Products/${cateName}/${detail.image}" style="width: 75px; display: table; margin: 0px -10px;" alt=""></td>
                                            <td class="w-50" >${detail.getProductDescription()}</td>
                                            <td>${detail.getProductCreateDate()}</td>                                      
                                            <td>${detail.getProductSize()}</td>   
                                            <td>${detail.getProductPrice()}</td>   
                                            <td>${detail.getProductAvaiable()}</td>   
                                            <!-- create button Block if status is 1 and Unblock if status is 0 and have tag a href is updateStatusAdmin?status?id-->
                                            <td>
                                                <c:choose>
                                                    <c:when test="${detail.productStatus == 1}">
                                                        <button type="button" onclick="changeStatus('Do you want to change status',${detail.getProductFullDetailID()}, 0)" class="btn btn-danger">
                                                            Hide
                                                        </button>
                                                    </c:when>
                                                    <c:when test="${detail.productStatus == 0}">
                                                        <button type="button" onclick="changeStatus('Do you want to change status',${detail.getProductFullDetailID()}, 1)"  class="btn btn-success">
                                                            View
                                                        </button>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>


                        <nav aria-label="...">
                            <ul class="pagination justify-content-start">
                                <c:if test="${currentPage == 1}">
                                    <li class="page-item disabled">
                                        <button class="page-link" onclick="changePage(${currentPage - 1})">
                                            Previous
                                        </button>
                                    </li>
                                </c:if>
                                <c:if test="${currentPage != 1}">
                                    <li class="page-item">
                                        <button  class="page-link" onclick="changePage(${currentPage - 1})">
                                            Previous
                                        </button>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${totalPage}" var="i">
                                    <c:if test="${currentPage == i}">
                                        <li class="page-item active" aria-current="page">
                                            <button type="button" class="page-link" ">
                                                ${i}
                                                <span class="sr-only">(current)</span>
                                            </button>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage != i}">
                                        <li class="page-item">
                                            <button class="page-link" type="button" onclick="changePage(${i})">${i}</button>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${currentPage == totalPage+1}">
                                    <li class="page-item disabled">
                                        <button class="page-link"
                                                onclick="changePage(${currentPage + 1})">Next</button>
                                    </li>
                                </c:if>
                                <c:if test="${currentPage != totalPage+1}">
                                    <li class="page-item">
                                        <button class="page-link"
                                                onclick="changePage(${currentPage + 1})">Next</button>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
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

    <script>                                  //set time for alertMessage
                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        var myDiv = document.getElementById('myDiv');
                                                        myDiv.style.display = 'block';
                                                        setTimeout(function () {
                                                            myDiv.style.display = 'none';
                                                        }, 10000); // 10 giây = 10,000 miligiây
                                                    });

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
                                                        const size = document.querySelector('#size').value;
                                                        const search = document.querySelector('#search').value;
                                                        const status = document.querySelector('#status').value;
                                                        const cateId = document.querySelector('#cateId').value;
                                                        const proId = document.querySelector('#proId').value;
                                                        window.location.href = 'product-detail?search=' + search +
                                                                '&status=' + status + '&pageNo=1' + '&cateId=' + cateId + '&proId=' + proId + '&size=' + size;
                                                    }
                                                    ;

                                                    // handle filter status
                                                    const status = document.querySelector('#status');
                                                    status.addEventListener('change', () => {
                                                        const size = document.querySelector('#size').value;
                                                        const search = document.querySelector('#search').value;
                                                        const status = document.querySelector('#status').value;
                                                        const cateId = document.querySelector('#cateId').value;
                                                        const proId = document.querySelector('#proId').value;
                                                        window.location.href = 'product-detail?search=' + search +
                                                                '&status=' + status + '&pageNo=1' + '&cateId=' + cateId + '&proId=' + proId + '&size=' + size;
                                                    });


                                                    // handle filter cateID
                                                    const size = document.querySelector('#size');
                                                    size.addEventListener('change', () => {
                                                        const size = document.querySelector('#size').value;
                                                        const search = document.querySelector('#search').value;
                                                        const status = document.querySelector('#status').value;
                                                        const cateID = document.querySelector('#cateId').value;
                                                        const proId = document.querySelector('#proId').value;
                                                        window.location.href = 'product-detail?search=' + search +
                                                                '&status=' + status + '&pageNo=1' + '&cateID=' + cateID + '&proId=' + proId + '&size=' + size;
                                                    });


                                                    // handle pagination
                                                    function changeStatus(message, detailId, newStatus) {
                                                        if (confirm(message)) {
                                                            const size = document.querySelector('#size').value;
                                                            const search = document.querySelector('#search').value;
                                                            const status = document.querySelector('#status').value;
                                                            const cateID = document.querySelector('#cateId').value;
                                                            const proId = document.querySelector('#proId').value;
                                                            window.location.href = 'product-detail?search=' + search +
                                                                    '&status=' + status + '&pageNo=1' + '&cateID=' + cateID + '&proId=' + proId + '&size=' + size + '&detailId=' + detailId + '&newstatus=' + newStatus;
                                                        }
                                                    }
                                                    function changePage(pageNo) {
                                                        const size = document.querySelector('#size').value;
                                                        const search = document.querySelector('#search').value;
                                                        const status = document.querySelector('#status').value;
                                                        const cateID = document.querySelector('#cateId').value;
                                                        const proId = document.querySelector('#proId').value;
                                                        window.location.href = 'product-detail?search=' + search +
                                                                '&status=' + status + '&pageNo=' + pageNo + '&cateID=' + cateID + '&proId=' + proId + '&size=' + size;
                                                    }</script>
</html>