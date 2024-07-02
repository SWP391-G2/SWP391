<%-- 
    Document   : addressdetail
    Created on : Jun 22, 2024, 7:50:48 PM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <style type="text/css">
        .css_select_div{
            text-align: center;
        }
        .css_select{
            display: inline-table;
            width: 25%;
            padding: 5px;
            margin: 5px 2%;
            border: solid 1px #686868;
            border-radius: 5px;
        }
    </style>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Your Address</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Your Address</h2>
            <form method="POST" action="./AddressDetail">
                <div class="form-group">
                    <label for="soDienThoai">Phone Number </label>
                    <input type="tel" class="form-control" id="Phone" name="phone" value="${address.phone}"required>
                    <a>${mess}</a>
                </div>
                <div>
                    <input type="text" id="c" name="city" hidden="">
                    <select class="form-select form-select-sm mb-3" id="city"  aria-label=".form-select-sm">
                        <option value="" selected>Select City(Province)</option>           
                    </select>
                    <input type="text" id="d" name="district" hidden="">
                    <select class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
                        <option value="" selected>Select District</option>
                    </select>

                    <select class="form-select form-select-sm" id="ward" aria-label=".form-select-sm" >
                        <option value="" selected>Chọn phường xã</option>
                    </select>
                </div> 
                <div class="form-group">
                    <label for="diaChi">Address Line </label>
                    <input type="text" class="form-control" id="diaChinha" name="homeaddress" value="${address.address_line}" required>
                </div>
                <div class="form-group form-check">
                    <div>
                        <input type="checkbox" id="status" name="status">
                        <label for="status">Set as default address</label><br>
                    </div>
                </div>


                <button type="submit" name="save" class="btn btn-primary">Add Address</button>
                <div class="mt-5 text-center"> <a class="nav-link" href="./Profile">Back to profile</a></div>
            </form>
        </div>
                
                <h1><%= request.getAttribute("defaultCity") %></h1>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script>
        // Gán giá trị từ JSP vào JavaScript
       var defaultCity = "<%= request.getAttribute("defaultCity") %>";
        var defaultDistrict = "<%= request.getAttribute("defaultDistrict") %>";
       
        var citis = document.getElementById("city");
        var districts = document.getElementById("district");
        

        // Fetch city, district, and ward data
        fetchAddressData();

        function fetchAddressData() {
            var Parameter = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json",
            };

            axios(Parameter).then(function (result) {
                renderCity(result.data);
            });
        }

        function renderCity(data) {
            for (const x of data) {
                citis.options[citis.options.length] = new Option(x.Name, x.Id);
            }

            // Set default city
            citis.value = data.find(city => city.Name === defaultCity)?.Id || "";
            renderDistricts(data);

            citis.onchange = function () {
                renderDistricts(data);
            };

            districts.onchange = function () {
                renderWards(data);
            };
        }

        function renderDistricts(data) {
            districts.length = 1;  // Clear existing options except for the first one
            wards.length = 1;  // Clear existing options except for the first one

            if (citis.value != "") {
                const result = data.filter(n => n.Id === citis.value);

                for (const k of result[0].Districts) {
                    districts.options[districts.options.length] = new Option(k.Name, k.Id);
                }

                // Set default district
                districts.value = result[0].Districts.find(district => district.Name === defaultDistrict)?.Id || "";
                renderWards(data);
            }
        }

        function renderWards(data) {
            wards.length = 1;  // Clear existing options except for the first one

            if (districts.value != "") {
                const dataCity = data.filter((n) => n.Id === citis.value);
                const dataWards = dataCity[0].Districts.filter(n => n.Id === districts.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }

                // Set default ward
                wards.value = dataWards.find(ward => ward.Name === defaultWard)?.Id || "";
            }
        }
    </script>
</html>