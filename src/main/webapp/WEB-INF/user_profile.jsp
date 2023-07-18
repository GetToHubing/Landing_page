<%--
  Created by IntelliJ IDEA.
  User: davidbanker
  Date: 7/17/23
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Profile Page</title>
</head>
<body class="h-100 d-flex justify-content-center align-items-center">
<form action="profile" method="POST" class="w-50">
    <div class="form-group">
        <label for="fName">Change First Name</label>
        <input type="text" class="form-control" id="fName" name="fName"
               value="${fName}">
    </div>
    <div class="form-group">
        <label for="lName">Change Last Name</label>
        <input type="text" class="form-control" id="lName" name="lName"
               value="${lName}">
    </div>
    <div class="form-group">
        <label for="email">Change Email</label>
        <input type="email" class="form-control" id="email" name="email"
               value="${sessionScope.email}">
    </div>
    <div class="form-group">
        <label for="address">Change Favorite Address</label>
        <input type="text" class="form-control" id="address" name="address"
               value="${address}">
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" name="password">
    </div>
    <div class="d-flex justify-content-center mt-2">
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>
</body>
</html>
