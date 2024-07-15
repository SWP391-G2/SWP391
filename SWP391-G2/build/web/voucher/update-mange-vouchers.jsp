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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
                            <h1>Voucher #${voucher.getVoucherID()}</h1>
                    </div>
                    <c:if test="${voucher.getVoucherID() != null}">
                        <form action="updatevoucher" id="productForm" method="POST">
                            <input name="voucherId" hidden="" type="text" value="${voucher.getVoucherID()}" >       
                        </c:if>
                        <c:if test="${voucher.getVoucherID() == null}">
                            <form action="voucher" id="productForm" method="POST">                           
                            </c:if>
                            <!-- Product Name -->
                            <div class="form-group row">
                                <div class="col-10">  
                                    <label for="detail">Voucher Name:</label>
                                    <input name="voucherName" id="voucher" placeholder="${voucher.getCode()}"  class="col-4 form-control" aria-label="With textarea"/>
                                </div>
                            </div>
                            <!-- Other fields (Category, Brands, Status) -->
                            <div class="form-group row d-flex col-10 justify-content-between ">

                                <div class="col-3 d-flex  align-items-center">
                                    Discount:
                                    <input type="text" name="discount" id="discount" value="${voucher.getDiscount()}" placeholder="${voucher.getDiscount()}" class="col-4 form-control">
                                </div>
                                <div class="col-3 d-flex  align-items-center">
                                    Quantity:     
                                    <input type="text" name="quantity" id="quantity" value="${voucher.getQuantity()}"  placeholder="${voucher.getQuantity()}" class="col-4 form-control">
                                </div>
                                <div class="col-3 d-flex justify-content-around align-items-center">

                                    Status:   
                                    <select class="form-control"  name="statusnew">
                                        <option value="1" ${requestScope.voucher.getStatus()==1 ? 'selected' : '' }>Active</option>
                                        <option value="0" ${requestScope.voucher.getStatus()==0 ? 'selected' : '' }>In-Active</option>
                                    </select>
                                </div>
                                <c:if test="${voucher.getVoucherID() != null}">
                                    <div class="col-3 d-flex justify-content-around align-items-center">
                                        Create Date:
                                        <input type="date" name="createDate" readonly="" value="${voucher.getCreateAt()}"/>
                                    </div>
                                </c:if>

                            </div>

                            <div class="form-group row d-flex col-10 justify-content-between ">                       

                                <div class="col-3 d-flex justify-content-around align-items-center">
                                    Start Date:
                                    <input type="date" name="startDate" value="${voucher.getStartDate()}"/>
                                    <% if (request.getAttribute("error") != null) { %>
                                    <div class="error">
                                        <%= request.getAttribute("error") %>
                                    </div>
                                    <% } %>

                                </div>   
                                <div class="col-3 d-flex justify-content-around align-items-center">
                                    End Date:
                                    <input type="date" name="endDate" value="${voucher.getExpiryDate()}"/>
                                </div>   
                            </div>
                            <!-- Submit and Cancel buttons -->
                            <div class="d-flex justify-content-end">
                                <a class="btn btn-danger ps-2 mx-2" href="../SWP391-G2/voucher">Cancel</a>
                                <c:if test="${voucher.getVoucherID() == null}">
                                    <button type="submit" class="btn btn-primary ps-2" id="updateButton">ADD</button>
                                </c:if>
                                <c:if test="${voucher.getVoucherID() != null}">
                                    <button type="submit" class="btn btn-primary ps-2" id="updateButton">Update</button>
                                </c:if>
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



        document.addEventListener("DOMContentLoaded", function () {
            const input = document.getElementById("discount");
            input.addEventListener("input", function (event) {
                let value = input.value;
                // Chỉ giữ lại các ký tự số
                value = value.replace(/[^0-9]/g, '');
                // Loại bỏ các số từ 1 đến 99
                if (value !== '' && (parseInt(value) < 1 || parseInt(value) > 99)) {
                    value = '';
                }

                input.value = value;
            });
        });

        document.addEventListener("DOMContentLoaded", function () {
            const input = document.getElementById("quantity");
            input.addEventListener("input", function (event) {
                let value = input.value;
                // Chỉ giữ lại các ký tự số
                value = value.replace(/[^0-9]/g, '');
                // Loại bỏ các số từ 1 đến 99
                if (value !== '' && (parseInt(value) < 1 || parseInt(value) > 99)) {
                    value = '';
                }

                input.value = value;
            });
        });
        function updateForm() {
            var form = document.getElementById('productForm');
            // Gọi hành động submit của form
            form.submit();
        }
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const createDateInput = document.querySelector('input[name="createDate"]');
            const startDateInput = document.querySelector('input[name="startDate"]');
            const endDateInput = document.querySelector('input[name="endDate"]');

            function validateDates() {
                const createDate = new Date(createDateInput.value);
                const startDate = new Date(startDateInput.value);
                const endDate = new Date(endDateInput.value);

                // Kiểm tra startDate không thể chọn trước ngày createDate
                if (startDate < createDate) {
                    alert("Start date cannot be before create date.");
                    startDateInput.value = "";
                }

                // Kiểm tra endDate không được chọn trước ngày startDate và createDate
                if (endDate < startDate || endDate < createDate) {
                    alert("End date cannot be before start date or create date.");
                    endDateInput.value = "";
                }
            }

            startDateInput.addEventListener('change', validateDates);
            endDateInput.addEventListener('change', validateDates);
        });
    </script>


</html>