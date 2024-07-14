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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                            <h1>Product #${detail.getProductFullDetailID()}</h1>

                        <c:if test="${param.error != null}">
                            <h6 style="color: red;">In-valid information to add new customer!</h6>
                        </c:if>
                    </div>
                    <form action="update-product-detail" id="productForm" method="post" enctype="multipart/form-data">
                        <input type="text" value="${proId}" name="proId"  hidden="">
                        <input type="text" value="${cateId}" name="cateId" hidden="">
                        <input type="text" value="${detail.getProductFullDetailID()}" name="detailId" hidden="">
                        <!-- Product image -->
                        <div class="form-group row">
                            <label for="productID">Product image:</label>
                            <div class="input-group image-preview-container">
                                <div class="input-group">
                                    <input  type="file" name="img" required="" class="form-control d-none image-preview" id="img" onchange="chooseFile(this)" accept="image/*" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                    <label for="img"><img src="images/Products/${cateName}/${detail.getImage()}" id="image" class="img-thumbnail rounded-5 image-preview" width="100%" alt="product image"></label>
                                </div>
                                <span id="productImageError" class="text-danger"></span>
                            </div>
                        </div>

                        <!-- Product Name -->
                        <div class="form-group row">
                            <div class="col-10">  
                                <label for="detail">Product Detail:</label>
                                <textarea  name="detail" id="detail" required="" class="form-control" aria-label="With textarea">${detail.getProductDescription()}</textarea>
                            </div>
                        </div>
                        <!-- Other fields (Category, Brands, Status) -->
                        <div class="form-group row d-flex col-10 justify-content-between ">

                            <div class="col-3 d-flex justify-content-around align-items-center">
                                Price:
                                <input type="number" required="" name="price" value="${detail.getProductPrice()}" class="ms-2 form-control">
                            </div>
                            <div class="col-3 d-flex justify-content-around align-items-center">
                                Quantity:
                                <input type="number" required="" name="quantity" value="${detail.getProductAvaiable()}" class="ms-2 form-control">
                            </div>
                            <div class="col-3 d-flex justify-content-around align-items-center">
                                Size:
                                <select  class="form-control ms-2"  required=""id="size" name="size" >
                                    <option value="30ml" ${detail.getProductSize().equals("30ml") ? 'selected' : ''}  >30ml</option>
                                    <option value="50ml" ${detail.getProductSize().equals("50ml") ? 'selected' : ''}  >50ml</option>
                                    <option value="100ml" ${detail.getProductSize().equals("100ml") ? 'selected' : ''} >100ml</option>
                                </select>
                            </div>
                            <div class="col-3 d-flex justify-content-around align-items-center">
                                Status: 
                                <select class="form-control ms-2" required="" id="status" name="status" >
                                    <option value="1" ${detail.getProductStatus()==1 ? 'selected' : '' }>View</option>
                                    <option value="0" ${detail.getProductStatus()==0 ? 'selected' : '' }>Hide</option>
                                </select>
                            </div>
                        </div>

                        <!-- Submit and Cancel buttons -->
                        <div class="d-flex justify-content-end">
                            <a class="btn btn-danger ps-2 mx-2" href="../SWP391-G2/product-detail?proId=${proId}&cateId=${cateId}">Cancel</a>
                            <button type="button" class="btn btn-primary ps-2" id="updateButton"  onclick="updateForm()">Update</button>
                        </div>
                    </form>
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
                                    Swal.fire({
                                        title: "Do you want to update?",
                                        icon: "warning",
                                        showCancelButton: true,
                                        confirmButtonColor: "#3085d6",
                                        cancelButtonColor: "#d33",
                                        confirmButtonText: "Update"
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            let timerInterval;
                                            Swal.fire({
                                                title: "Updated form is in preparation",
                                                html: "",
                                                timer: 1500,
                                                timerProgressBar: true,
                                                didOpen: () => {
                                                    Swal.showLoading();
                                                    const timer = Swal.getPopup().querySelector("b");
                                                    timerInterval = setInterval(() => {
                                                        timer.textContent = `${Swal.getTimerLeft()}`;
                                                    }, 100);
                                                },
                                                willClose: () => {
                                                    clearInterval(timerInterval);
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
                                            }).then((result) => {
                                                /* Read more about handling dismissals below */
                                                if (result.dismiss === Swal.DismissReason.timer) {
                                                    console.log("I was closed by the timer");
                                                }
                                            });

                                        }
                                    });
                                }
                                function updateForm() {
                                    var form = document.getElementById('productForm');

                                    // Gọi hành động submit của form
                                    form.submit();
                                }
    </script>

</html>