<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Admin | The Perfume Shop</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
        <style>
            /* Base styles for black and white theme */
            body {
                background-color: #f8f9fa;
                color: #343a40;
                font-family: Arial, sans-serif;
            }

            .modal-content {
                background-color: #fff;
                border: 1px solid #343a40;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .modal-header {
                background-color: #343a40;
                color: #fff;
                border-bottom: 1px solid #495057;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .modal-title {
                color: #fff;
            }

            .btn-primary {
                background-color: #343a40;
                border-color: #343a40;
            }

            .btn-primary:hover {
                background-color: #495057;
                border-color: #495057;
            }

            .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
            }

            .btn-secondary:hover {
                background-color: #5a6268;
                border-color: #545b62;
            }

            .form-control {
                border: 1px solid #343a40;
                color: #343a40;
                margin-bottom: 15px;
                padding: 10px;
            }

            .form-control:focus {
                border-color: #495057;
                box-shadow: none;
            }

            label {
                color: #343a40;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .modal-footer {
                border-top: 1px solid #495057;
            }

            .modal-body {
                padding: 20px;
            }

            .close {
                color: #fff;
                opacity: 1;
            }

            .select-css {
                display: block;
                font-size: 16px;
                font-family: Arial, sans-serif;
                color: #343a40;
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
                border: 1px solid #343a40;
                border-radius: 4px;
                background-color: #fff;
                margin-bottom: 15px;
            }

            .select-css:focus {
                border-color: #495057;
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Modal Add New -->
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Add New Users</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="admincontrolaccount" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="service" value="addNewAdmin">
                            <div class="form-group row">
                                <div class="col-12">
                                    <label for="firstname">First Name:</label>
                                    <input type="text" class="form-control" id="firstname" name="firstname" required>
                                </div>
                                <div class="col-12">
                                    <label for="lastname">Last Name:</label>
                                    <input type="text" class="form-control" id="lastname" name="lastname" required>
                                </div>
                                <div class="col-12">
                                    <label for="password">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                <div class="col-12">
                                    <label for="gender">Gender:</label>
                                    <select name="gender" id="gender" class="form-control">
                                        <option value="1">Male</option>
                                        <option value="2">Female</option>
                                        <option value="3">None</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <label for="birthDate">Birth Date:</label>
                                    <input type="date" class="form-control" id="birthDate" name="birthDate" required>
                                </div>
                                <div class="col-12">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="col-12">
                                    <label for="role">Role:</label>
                                    <c:forEach items="${listRole}" var="role">
                                        <option value="${role.roleID}" ${role.roleID==roleId ? 'selected' : '' }>
                                            ${role.roleName}
                                        </option>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add New</button>
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
</html>