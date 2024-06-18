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

                <!-- Main Content -->
                <div class="main" style="margin-left: 50px; margin-right: 50px;">
                    <div class="topbar">
                    </div>


                    <!--profile of product-->
                    <div class="row mb-5" style="margin-right: 70px;  padding: 10px; border: 1.5px solid #000;">
                        <div class="col-12" style="margin-bottom: 40px;">
                            <h1>Product #${product.getProductID()}</h1>

                        <c:if test="${param.error != null}">
                            <h6 style="color: red;">In-valid information to add new customer!</h6>
                        </c:if>
                    </div>
                    <form action="update-product" method="post" id="productForm" enctype="multipart/form-data">
                        <input name="productId" value="${product.getProductID()}" hidden=""/>
                        <div class="form-group row">
                            <label for="productID">Product image:</label>
                            <div class="input-group image-preview-container">
                                <div class="input-group">
                                    <input type="file" name="img" required="" disabled="" class="form-control d-none image-preview" id="img" onchange="chooseFile(this)" accept="image/*" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                    <label for="img"><img src="images/Products/${cateName}/${product.productImageUrl}" id="image" class="img-thumbnail rounded-5 image-preview" width="100%" alt="product image"></label>
                                </div>
                                <span id="productImageError" class="text-danger"></span>
                            </div>
                        </div>

                        <!-- Product Name -->
                        <div class="form-group row">
                            <div class="col-10">
                                <label for="productName">Product Name:</label>
                                <input type="text" class="form-control" id="productName"  disabled="" required="" value="${product.getProductName()}" name="productName">
                            </div>
                            <div class="col-2">
                                <label for="productName">Day of init:</label>
                                <input type="text" class="form-control" id="productCreateDate" readonly="" value="${product.getProductCreateDate()}" name="productCreateDate">
                            </div>
                        </div>

                        <!-- Other fields (Category, Brands, Status) -->
                        <div class="form-group row">
                            <div class="col-3 d-flex justify-content-around align-items-center">
                                Category:
                                <select class="form-control ms-2" id="cateId" disabled="" name="newcateId">
                                    <c:forEach items="${listCate}" var="cate">
                                        <option value="${cate.categoryID}" ${cate.categoryID == product.fk_category_id ? 'selected' : '' }>${cate.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-3 d-flex justify-content-around align-items-center">
                                Brands:
                                <select class="form-control ms-2" id="brandId" disabled="" name="newbrandId">
                                    <c:forEach items="${listBrands}" var="brand">
                                        <option value="${brand.getBrandID()}" ${product.getBrandID() == brand.getBrandID() ? 'selected' : '' }>${brand.getBrandName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-3 d-flex justify-content-around align-items-center">
                                Status:
                                <select class="form-control ms-2" id="newstatus" disabled="" name="newstatus">
                                    <option value="1" ${product.getProductStatus() == 1 ? 'selected' : '' }>View</option>
                                    <option value="0" ${product.getProductStatus() == 0 ? 'selected' : '' }>Hide</option>
                                </select>
                            </div>
                        </div>

                        <!-- Update Button -->
                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-dark" id="updateButton"  onclick="enableEditing()">Update</button>
                        </div>
                    </form>
                </div>


                <!<!-- product detail list -->
                <div  style="margin-left: 50px; margin-right: 50px;">
                    <div class="topbar">

                    </div>

                    <div class="row" style="margin-right: 70px;  padding: 10px; border: 1px solid #cccc;">
                        <input type="hidden" id="pageNo" name="pageNo" value="${currentPage}">
                        <div class="col-12" style="margin-bottom: 40px;">
                            <h1>Product Detail</h1>
                        </div>
                        <div class="row col-12 d-flex justify-content-end">
                            <div class="col-2">
                                <select class="form-control" id="status" name="status">
                                    <option value="-1" ${status==null ? 'selected' : '' }>All status</option>
                                    <option value="1" ${status==1 ? 'selected' : '' }>View</option>
                                    <option value="0" ${status==0 ? 'selected' : '' }>Hide</option>
                                </select>
                            </div>
                            <div class="col-2">
                                <select class="form-control" id="c" name="size">
                                    <option value="-1" ${size==null ? 'selected' : '' }>All Size</option>
                                    <c:forEach  items="${listSize}" var="sizes" varStatus="loop" >
                                        <option value="sizes" ${listSize[loop.index] == size ? 'selected' : '' }>${sizes}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-2">
                                <div class="text-right">
                                    <button type="button" class="btn btn-success" data-toggle="modal"
                                            data-target="#addnewModal">
                                        <a style="color: white;" ><ion-icon style="margin-top: 2px;" name="add-outline"></ion-icon> Add New</a>
                                    </button>
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
                                                <td>${detail.getProductDescription()}</td>
                                                <td>${detail.getProductCreateDate()}</td>                                      
                                                <td>${detail.getProductSize()}</td>   
                                                <td>${detail.getProductPrice()}</td>   
                                                <td>${detail.getProductAvaiable()}</td>   
                                                <!-- create button Block if status is 1 and Unblock if status is 0 and have tag a href is updateStatusAdmin?status?id-->
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${detail.productStatus == 1}">
                                                            <button type="button"  class="btn btn-danger">
                                                                Hide
                                                            </button>
                                                        </c:when>
                                                        <c:when test="${detail.productStatus == 0}">
                                                            <button type="button"  class="btn btn-success">
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
                                    <c:if test="${currentPage == totalPage}">
                                        <li class="page-item disabled">
                                            <button class="page-link"
                                                    onclick="changePage(${currentPage + 1})">Next</button>
                                        </li>
                                    </c:if>
                                    <c:if test="${currentPage != totalPage}">
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
                                                        function validateForm() {
                                                            // Reset all error messages
                                                            document.getElementById('productImageError').innerText = '';

                                                            // Validate Product Name
                                                            let productName = document.getElementById('img').value.trim();
                                                            if (productName === '') {
                                                                document.getElementById('productImageError').innerText = 'Product Image is required';
                                                                return false; // Prevent form submission
                                                            }
                                                            // Additional validations for other fields can be added similarly
                                                            return true; // Allow form submission
                                                        }
                                                        function chooseFile(fileInput) {
                                                            if (fileInput.files && fileInput.files[0]) {
                                                                var reader = new FileReader();

                                                                reader.onload = function (e) {
                                                                    $('#image').attr('src', e.target.result);
                                                                }
                                                                reader.readAsDataURL(fileInput.files[0]);
                                                            }
                                                        }

                                                        function enableEditing() {
                                                            if (confirm('Do you want to update')) {
                                                                var formElements = document.getElementById('productForm').elements;
                                                                for (var i = 0; i < formElements.length; i++) {
                                                                    formElements[i].disabled = false;
                                                                }


                                                                var button = document.getElementById('updateButton');
                                                                button.setAttribute('onclick', 'updateForm()');
                                                                var button = document.getElementById('updateButton');
                                                                button.type = 'submit';
                                                                button.innerText = 'Submit';
                                                            }
                                                        }
                                                        function updateForm() {
                                                            var form = document.getElementById('productForm');

                                                            // Gọi hành động submit của form
                                                            form.submit();
                                                        }
    </script>

</html>