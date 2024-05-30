<%-- 
    Document   : createaccount
    Created on : May 29, 2024, 9:56:31 PM
    Author     : hatru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User</title>
    <link rel="stylesheet" href="css/account.css">
</head>
<body>
    <div class="container">
        <h1>Create User</h1>
        <form action="adminaccountst" enctype="multipart/form-data" class="user-form">
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" required>

            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image">

            <label for="gender">Gender:</label>
            <select id="gender" name="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>

            <label for="birthday">Birthday:</label>
            <input type="date" id="birthday" name="birthday" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="address">Address:</label>
            <textarea id="address" name="address" required></textarea>

            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
            </select>

            <label for="roleID">Role:</label>
            <select id="roleID" name="roleID">
                <option value="1">Sale</option>
                <option value="2">Marketing</option>
                <option value="3">Customer</option>
            </select>

            <button type="submit">Create User</button>
        </form>
    </div>
</body>
</html>