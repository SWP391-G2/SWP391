<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Admin | The Perfume Shop</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <!-- Include Bootstrap CSS via CDN link -->
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_manager.css">
        <style>
            .form-title {
                font-size: 2.5rem; /* Kích thước chữ lớn */
                color: #333; /* Màu chữ tối */
                text-align: center; /* Căn giữa tiêu đề */
                margin-bottom: 20px; /* Khoảng cách dưới tiêu đề */
                font-weight: bold; /* Chữ đậm */
            }

            /* Thông báo lỗi */
            .alert {
                padding: 15px;
                border-radius: 4px;
                margin-bottom: 20px; /* Khoảng cách giữa thông báo lỗi và form */
                font-size: 1rem; /* Kích thước chữ */
                font-weight: bold; /* Chữ đậm */
            }

            /* Cải tiến thông báo lỗi cho dạng danger */
            .alert-danger {
                color: #721c24; /* Màu chữ đỏ đậm */
                background-color: #f8d7da; /* Nền đỏ nhạt */
                border-color: #f5c6cb; /* Viền đỏ nhạt */
            }

           
            
        </style>
    </head>

    <body>
        <jsp:include page="admin-navigation.jsp"></jsp:include>
            <!-- Modal Add New -->

            <div class="main" style="margin-left: 50px; margin-right: 50px;">
                <div class="row" style="margin-right: 70px;  padding: 10px; border: 1.5px solid #000;">
                    <input type="hidden" id="pageNo" name="pageNo" value="${currentPage}">
                <div class="col-12" style="margin-bottom: 40px;">
                    <h1 class="form-title">Add New Account</h1>
                    <c:if test="${requestScope.error != null}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.error}
                        </div>
                    </c:if>
                </div>
                <form action="admincontrolaccount" method="post" >
                    <input type="text" value="${data.getAccountID()}" name="id" hidden>
                    <input type="text" value="${requestScope.roleId}" name="roleId" id="roleId" hidden>
                    <input type="text" value="${requestScope.status}" name="status" id="status" hidden> 
                    <input type="text" value="${requestScope.currentPage}" name="pageNo" id="pageNo" hidden>
                    <input type="text" value="${requestScope.search}" name="search" id="search" hidden>
                    <div class="form-group row">
                        <div class="col-4">
                            <label for="firstName">First Name:</label>
                            <input type="text" class="form-control" id="firstName" name="firstname" required>
                        </div>
                        <div class="col-4">
                            <label for="lastName">Last Name:</label>
                            <input type="text" class="form-control" id="lastName" name="lastname" required>
                        </div>
                        <div class="col-4">
                            <label for="lastName">Password:</label>
                            <input type="password" class="form-control" id="lastName" name="password" required>
                        </div>

                    </div>

                    <div class="form-group row">
                        <div class="col-4">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="col-4">
                            <label for="email">Date Of Birth:</label>
                            <input type="date" class="form-control" id="dob" name="birthDate"
                                   value="<fmt:formatDate value='${data.getBirthDay()}' pattern='yyyy-MM-dd'/>" required>
                        </div>
                        <div class="col-4">
                            <label for="roleId">Role:</label>
                            <select class="form-control" id="role" name="role">
                                <c:forEach items="${requestScope.listRole}" var="role">
                                    <option value="${role.getRoleID()}"> ${role.getRoleName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="confirmClose()">Close</button>
                            <button type="submit" class="btn btn-primary">Add New</button>
                        </div>
                    </div>
                </form>
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
                                function showAlert(message, accountID, status1) {


                                    if (confirm(message)) {
                                        const search = document.querySelector('#search').value;
                                        const roleId = document.querySelector('#roleId').value;
                                        const status = document.querySelector('#status').value;
                                        const pageNo = document.querySelector('#pageNo').value;
                                        window.location.href = 'admincontrolaccount?search=' + search + '&roleId=' + roleId +
                                                '&status=' + status + '&pageNo=' + pageNo + "&accountID=" + accountID + "&statusnew=" + status1;
                                    }
                                }
                                function showDetail(accountID, accountRole) {
                                    const search = document.querySelector('#search').value;
                                    const roleId = document.querySelector('#roleId').value;
                                    const status = document.querySelector('#status').value;
                                    const pageNo = document.querySelector('#pageNo').value;
                                    window.location.href = 'admindetails?search=' + search + '&roleId=' + roleId +
                                            '&status=' + status + '&pageNo=' + pageNo + '&id=' + accountID + '&roleID=' + accountRole;
                                }
    </script>
    <script>
        function confirmClose() {
            if (confirm("Do you want to close?")) {
                // Chuyển hướng về trang servlet cũ
                window.location.href = 'admincontrolaccount';
            }
        }
    </script>
</html>