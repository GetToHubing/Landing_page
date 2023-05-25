<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: davidbanker
  Date: 5/22/23
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Login</title>
</head>
<body>
<div class="container-fluid h-100 d-flex justify-content-center align-items-center ">
    <form action="login" method="post" class="w-50">
        <c:if test="${sessionScope.bool}">
            <p class="text-danger">${sessionScope.incorrect}</p>
        </c:if>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="something@gmail.com" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="" required>
        </div>
        <div class="d-flex justify-content-center mt-2">
        <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        <hr>
        <p class="text-center">Or if you don't already have an account <a href="register">REGISTER</a></p>
    </form>
</div>
</body>
</html>
