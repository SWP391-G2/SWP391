<%-- 
    Document   : marketing-manage-sliders
    Created on : 25 thg 6, 2024, 09:13:40
    Author     : pna29
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Marketing Dashboard</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="main" style="margin-left: 50px; margin-right: 50px;">
                <div class="row" style="margin-right: 70px;  padding: 10px; border: 1.5px solid #000;">
                    <input type="hidden" id="pageNo" name="pageNo" value="${currentPage}">
                    <div class="col-12" style="margin-bottom: 40px;">
                        <h1>Slider Management</h1>
                    </div>

                    <div class="col-4">
                        <div class="text-left">
                            <a class="btn btn-success mt-5" style="color: white" href="addSlider">Add new</a>
                        </div>
                    </div>
                    <div class="col-12" style="margin-top: 10px;">
                        <div class="table-responsive">
                            <table class="table table-striped">

                                <thead>
                                    <tr>
                                        <th scope="col">Slider ID</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Slider Title</th>
                                        <th scope="col">Update At</th>
                                        <th scope="col">Account ID</th>
                                        <th scope="col">Slider Status</th>
                                        <th scope="col">Details</th>
                                    </tr>
                                </thead>
                                <tbody>     

                                    <c:forEach items="${sliderList}" var="slider">
                                        <tr>
                                            <td>${slider.sliderID}</td>
                                            <td><img src="${slider.sliderImage}" alt="img" style="width: 80px; height: 80px;" /></td>
                                            <td>${slider.sliderTitle}</td>
                                            <td>${slider.updateAt}</td> 
                                            <td>${slider.accountId}</td>
                                            <td>
                                                <c:if test="${slider.sliderStatus > 0}">
                                                    <input class="form-control w-50" type="number" min="1" onchange="updateStatus(this)"
                                                           value="${slider.sliderStatus}" data-id="${slider.sliderID}">
                                                </c:if>
                                            </td>  
                                            <td>
                                                <c:choose>
                                                    <c:when test="${slider.sliderStatus > 0}">
                                                        <a href="updateStatusSlider?status=0&sliderId=${slider.sliderID}">
                                                            <button type="button" class="btn btn-danger">
                                                                Hide
                                                            </button>
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${slider.sliderStatus == 0}">
                                                        <a href="updateStatusSlider?status=1&sliderId=${slider.sliderID}">
                                                            <button type="button" class="btn btn-success">
                                                                View
                                                            </button>
                                                        </a>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>                                         
                                                <button  class="btn btn-warning btn-sm edit-btn">
                                                    <a href="./sliderDetails?sliderId=${slider.sliderID}"> Edit</a></button>
                                                <button class="btn btn-danger btn-sm delete-btn">Delete</button>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script>

            function updateStatus(slider) {

                window.location.href = './updateStatusSlider?status=' + slider.value + '&sliderId=' + slider.dataset.id;

            }
            document.addEventListener("DOMContentLoaded", function () {
                const deleteButtons = document.querySelectorAll('.delete-btn');
                deleteButtons.forEach(button => {
                    button.addEventListener('click', function () {
                        const sliderID = this.closest('tr').querySelector('td:first-child').innerText;
                        if (confirm(`Are you sure you want to delete slider?`)) {
                            alert(`Slider Deleted !`);
                            // Implement the actual delete functionality here
                        }
                    });
                });
            });
        </script>

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


    </body>
</html>
