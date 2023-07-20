<%--
  Created by IntelliJ IDEA.
  User: davidbanker
  Date: 7/17/23
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Profile Page</title>
</head>


<body>
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Pizza World</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <c:if test="${sessionScope.email == null}">
                <a class="nav-link active text-black d-flex justify-content-end" aria-current="page" href="login"><i
                        class="bi-person-fill"></i> Login</a>
                <a class="nav-link active text-black d-flex justify-content-end" aria-current="page" href="register"><i
                        class="bi-person-fill"></i> Register</a>
            </c:if>
            <a class="nav-link active text-black d-flex justify-content-end" aria-current="page" href="pizzaOrder"><i
                    class="bi-person-fill"></i> Build Pizza</a>
            <c:if test="${sessionScope.email != null}">
                <a class="nav-link active text-black d-flex justify-content-end" aria-current="page" href="profile"><i
                        class="bi-person-fill"></i> Profile</a>
                <a class="nav-link active text-black d-flex justify-content-end" aria-current="page" href="logout"><i
                        class="bi-person-fill"></i> Logout</a>
            </c:if>
        </div>
    </div>
</nav>
<main>

    <section class="mt-5 d-flex justify-content-center align-items-center">
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
            <%--        if email has already been used this message shows--%>
            <c:if test="${sessionScope.emailUsage == false}">
                <p class="text-danger">${sessionScope.takenEmail}</p>
            </c:if>
            <div class="form-group">
                <label for="address">Change Favorite Address</label>
                <input type="text" class="form-control" id="address" name="address"
                       value="${address}">
            </div>
            <div class="form-group">
                <label for="password">New Password</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <div class="d-flex justify-content-center mt-2">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </section>
    <section class="d-flex justify-content-center align-items-center text-center">
        <form action="delete" method="POST" class="">
            <p>Delete Profile</p>
            <button type="submit" class="btn btn-danger ">Delete</button>
        </form>
    </section>
</main>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
