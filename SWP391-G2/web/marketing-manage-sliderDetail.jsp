<%-- 
    Document   : marketing-manage-sliderDetail
    Created on : 25 thg 6, 2024, 10:10:07
    Author     : pna29
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/admin.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            .container-fluid {
                margin: 0 auto;
                padding: 20px;
            }

            .main {
                margin-left: 50px;
                margin-right: 50px;
            }

            .slider-details {
                margin-right: 70px;
                padding: 20px;
                border: 1.5px solid #000;
                background-color: #fff;
            }

            h1 {
                margin-bottom: 40px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .image-preview-container {
                display: flex;
                align-items: center;
            }

            .image-preview {
                width: 100px;
                height: 100px;
                object-fit: cover;
                margin-right: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }


            .btn {
                padding: 10px 20px;
                border-radius: 4px;
                text-decoration: none;
                color: #fff;
                cursor: pointer;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .btn-secondary {
                background-color: #6c757d;
                border: none;
            }

            .mt-5 {
                margin-top: 20px;
            }

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="main">
                <div class="row slider-details">
                    <input type="hidden" id="pageNo" name="pageNo" value="${currentPage}">
                    <div class="col-12">
                        <h1>Slider Details</h1>
                    </div>

                    <div class="col-6">
                        <form class="table-responsive" action="./sliderDetails" method="post" enctype="multipart/form-data">
                            <input type="text" hidden="" name="id" value="${slider.getSliderID()}" class="form-control" >
                            <input type="text" hidden="" name="imageName" value="${slider.sliderImage}" class="form-control" >

                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" name="title" value="${slider.sliderTitle}" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="status">Status:</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="1" ${slider.sliderStatus==1 ? 'selected' : '' }>View</option>
                                    <option value="0" ${slider.sliderStatus==0 ? 'selected' : '' }>Hide</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="updateAt">Update At:</label>
                                <input type="text" id="updatedAt" value="${slider.updateAt}" class="form-control" disabled>
                            </div>
                            <div class="form-group">
                                <label for="productID">Picture Product:</label>
                                <div class="image-preview-container">
                                    <img id="previewImage" class="image-preview" src="${slider.sliderImage}" alt="Preview Image"/>
                                    <div class="file-input">
                                        <input type="file" name="image" id="image" onchange="updatePreview(event)">
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mt-5">Update</button>
                            <a href="manageSlider" class="btn btn-secondary mt-5">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
                                            function updatePreview(event) {
                                                var input = event.target;
                                                var reader = new FileReader();

                                                reader.onload = function () {
                                                    var imgElement = document.getElementById('previewImage');
                                                    imgElement.src = reader.result;
                                                }

                                                reader.readAsDataURL(input.files[0]);
                                            }
                                            function updateUpdatedAt() {
                                                const updatedAtField = document.getElementById('updatedAt');
                                                const currentDate = new Date().toISOString().slice(0, 19).replace('T', ' ');
                                                updatedAtField.value = currentDate;
                                            }

        </script>
    </body>
</html>
