<%-- 
    Document   : manageadmin
    Created on : Jun 4, 2024, 11:52:38 PM
    Author     : hatru
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Admin" %>

<!DOCTYPE html>
<html lang="en">

    <%
    Admin detail = (Admin) request.getAttribute("detail");
    %>


    <head>
        <meta charset="utf-8">


        <title>Admin | iLocal Shop</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                background:#f8f8f8
            }
        </style>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <jsp:include page="admin-navigation.jsp"></jsp:include>
                </div>

                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="manage-admin">Manage Admin</a></li>
                        </ul>
                    </div>
                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Admin</span></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>

                                                        <th>Photo</th>
                                                        <th class="max-width">Name</th>
                                                        <th class="sortable">Email</th>
                                                        <th>Role</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>

                                                <tbody>

                                                    <c:forEach items="" var = "listAdmin">
                                                        <tr>
                                                            <td class="align-middle text-center">
                                                                <div class="bg-light d-inline-flex justify-content-center align-items-center align-top" style="width: 35px; height: 35px; border-radius: 3px;"><i class="fa fa-fw fa-photo" style="opacity: 0.8;"></i></div>
                                                            </td>
                                                            <td class="text-nowrap align-middle"></td>
                                                            <td class="text-nowrap align-middle"></td>
                                                            <td class="text-center align-middle">}</td>
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">

                                                                    <form action="manage-admin?service=editAdmin" method="post">
                                                                        <input type="hidden" name="adId" value="">
                                                                        <button class="btn btn-sm btn-outline-secondary badge" type="button" name="edit" data-toggle="modal" data-target="#user-form-modal2">Edit</button>
                                                                    </form>



                                                                    <form action="manage-admin?service=deleteAdmin&adId=" method="post" onsubmit="return confirm('Are you sure you want to delete?');">
                                                                        <button class="btn btn-sm btn-outline-secondary badge" type="submit" name="delete"><i class="fa fa-trash"></i></button>
                                                                    </form>
                                                                </div>

                                                        </tr>                                                   
                                                    </c:forEach>


                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <li class="disabled page-item"><a href="#" class="page-link">?</a></li>
                                                <li class="active page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">?</a></li>
                                                <li class="page-item"><a href="#" class="page-link">»</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center px-xl-3">
                                        <button class="btn btn-success btn-block" type="button" data-toggle="modal" data-target="#user-form-modal">New User</button>
                                    </div>
                                    <hr class="my-3">


                                    <form action="manage-admin?service=searchName" method="post">
                                        <div>
                                            <div class="form-group">
                                                <label>Search by Name:</label>
                                                <div><input name="name" class="form-control w-100" type="text" placeholder="Name" value></div>
                                                <div> <input type="submit" value="Search"></div>
                                            </div>
                                        </div>
                                    </form>



                                    <hr class="my-3">
                                    <div class>
                                        <label>Role:</label>


                                        <form action="manage-admin?service=filterByRoleID" method="post">
                                            <li>
                                                <button type="submit" name="roleID" value="0" style="border: none; background: none; text-decoration: none; cursor: pointer;">All</button>
                                            </li>
                                            <li>
                                                <button type="submit" name="roleID" value="1" style="border: none; background: none; text-decoration: none; cursor: pointer;">Admin</button>
                                            </li>
                                            <li>
                                                <button type="submit" name="roleID" value="2" style="border: none; background: none; text-decoration: none; cursor: pointer;">Marketing</button>
                                            </li>
                                            <li>
                                                <button type="submit" name="roleID" value="3" style="border: none; background: none; text-decoration: none; cursor: pointer;">Sale</button>
                                            </li>
                                        </form>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>










                    <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Create New Admin</h5>
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="py-1">
                                        <form class="form" action="manage-admin?service=addNewAdmin" method="post">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>First Name</label>
                                                                <input class="form-control" type="text" name="firstName" placeholder="" >
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Last Name</label>
                                                                <input class="form-control" type="text" name="lastName" placeholder="" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input class="form-control" type="text" name="email" placeholder="">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Username</label>
                                                                <input class="form-control" type="text" name="username" placeholder="">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Password</label>
                                                                <input class="form-control" type="password" name="password" placeholder="">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Role</label>
                                                                <select class="form-control" name="roleId">                                                          
                                                                    <option value="1">Admin</option>
                                                                    <option value="2">Marketing</option>
                                                                    <option value="3">Sale</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Save Changes</button>
                                                </div>
                                            </div>
                                        </form>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>






                    <!-- ... -->
                    <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal2">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Update Admin</h5>
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="py-1">
                                        <form class="form" action="manage-admin?service=editAdmin" method="post">
                                            <input type="hidden" name="adId" id="adId"> 
                                            <div class="row">
                                                <div class="col">

                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>First Name</label>
                                                                <input class="form-control" type="text" name="firstName" id="firstName" placeholder="First Name">
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Last Name</label>
                                                                <input class="form-control" type="text" name="lastName" id="lastName" placeholder="Last Name">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input class="form-control" type="text" name="email" id="email" placeholder="Email">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Role</label>
                                                                <select class="form-control" name="roleId" id="roleId" placeholder="Role">
                                                                    <option value="1">Admin</option>
                                                                    <option value="2">Marketing</option>
                                                                    <option value="3">Sale</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Save Changes</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
        </script>

        <script>
            $('#user-form-modal2').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Nút m? modal

                var row = button.closest('tr'); // Dòng ch?a thông tin admin
                var firstName = row.find('.text-nowrap.align-middle:eq(0)').text().trim(); // L?y firstName
                var lastName = row.find('.text-nowrap.align-middle:eq(1)').text().trim(); // L?y lastName
                var email = row.find('.text-nowrap.align-middle:eq(1)').text().trim(); // L?y email
                var roleId = row.find('.text-center.align-middle').text().trim(); // L?y roleId

                // ?i?n d? li?u vào form
                $('#firstName').val(firstName);
                $('#lastName').val(lastName);
                $('#email').val(email);
                $('#roleId').val(roleId);

                // C?p nh?t action c?a form ?? g?i thông tin c?a admin ?úng
                var form = $('#user-form-modal2').find('form');
                var adId = row.find('input[name="adId"]').val();
                form.attr('action', 'manage-admin?service=editAdmin&adId=' + adId);
            });
        </script>



    </body>
</html>
</body>
</html>