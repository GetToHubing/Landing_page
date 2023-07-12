<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: davidbanker
  Date: 5/22/23
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Register</title>
</head>
<body>
<div class="h-100 d-flex justify-content-center align-items-center">
    <form action="register" method="POST" class="w-50">
        <div class="form-group">
            <label for="email">First Name</label>
            <input type="text" class="form-control" id="fName" name="fName" placeholder=""
                   value="${sessionScope.fName}" required>
        </div>
        <div class="form-group">
            <label for="email">Last Name</label>
            <input type="text" class="form-control" id="lName" name="lName" placeholder=""
                   value="${sessionScope.email}" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="something@gmail.com"
                   value="${sessionScope.email}" required>
        </div>
<%--        if email has already been used this message shows--%>
        <c:if test="${sessionScope.emailUsage == false}">
            <p class="text-danger">${sessionScope.takenEmail}</p>
        </c:if>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password"
                   placeholder="please don't use the word password" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
        </div>
<%--        if passwords were not the same a message shows up--%>
        <c:if test="${sessionScope.samePassword == false}">
            <p class="text-danger">${sessionScope.incPassword}</p>
        </c:if>
        <div class="d-flex justify-content-center mt-2">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        <hr>
        <p class="text-center">Or if you already have an account <a href="login">LOGIN</a></p>
    </form>
</div>

</body>
</html>
