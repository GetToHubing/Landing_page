<%--
  Created by IntelliJ IDEA.
  User: davidbanker
  Date: 7/19/23
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/custom.css" type="text/css"/>

    <title>Checkout</title>
</head>
<body>
<main class="row row-cols-1 row-cols-md-2 justify-content-center">

    <section class="card col-md-5 col-lg-4 my-md-5 me-md-3">
        <div class="card-body">
            <%--            itterates through the pizzaOrder map to display each item in the users pizza order--%>
            <c:forEach items="${sessionScope.order}" var="entry">
                <h4 class="m-0 card-title">${entry.key}</h4>
                <%--            if I understand correctly, since I used a 'normal' hashmap the key/value pairs load in randomly which is why there are a bunch of if conditionals; so I could load the information in the order I wanted. A sortedMap should have been used I think, but at this point I don't really wan't to change it since it's all working, maybe in the future --%>
                <c:forEach items="${entry.value.entrySet()}" var="pizzaEntry">
                    <c:if test="${pizzaEntry.key eq 'Size and Crust'}">
                        <c:forEach items="${pizzaEntry.value}" var="pizzaValues">
                            <p class="m-0 card-text"><b>${pizzaEntry.key}</b>: ${pizzaValues}</p>
                        </c:forEach>
                    </c:if>
                </c:forEach>

                <c:forEach items="${entry.value.entrySet()}" var="pizzaEntry">
                    <c:if test="${pizzaEntry.key eq 'cheese'}">
                        <c:forEach items="${pizzaEntry.value}" var="pizzaValues">
                            <p class="m-0 card-text"><b>${pizzaEntry.key}</b>: ${pizzaValues}</p>
                        </c:forEach>
                    </c:if>
                </c:forEach>

                <c:forEach items="${entry.value.entrySet()}" var="pizzaEntry">
                    <c:if test="${pizzaEntry.key eq 'sauce'}">
                        <c:forEach items="${pizzaEntry.value}" var="pizzaValues">
                            <p class="m-0 card-text"><b>${pizzaEntry.key}</b>: ${pizzaValues}</p>
                        </c:forEach>
                    </c:if>
                </c:forEach>

                <c:forEach items="${entry.value.entrySet()}" var="pizzaEntry">
                    <c:if test="${pizzaEntry.key eq 'sauceAmount'}">
                        <c:forEach items="${pizzaEntry.value}" var="pizzaValues">
                            <p class="m-0 card-text"><b>${pizzaEntry.key}</b>: ${pizzaValues}</p>
                        </c:forEach>
                    </c:if>
                </c:forEach>

                <c:forEach items="${entry.value.entrySet()}" var="pizzaEntry">
                    <c:if test="${pizzaEntry.key eq 'topping'}">
                        <div class="d-flex flex-wrap my-0">
                            <p class="me-1 card-text my-0"><b>Toppings:</b></p>
                            <c:forEach items="${pizzaEntry.value}" var="pizzaValues">
                                <p class="mx-1 my-0 card-text">${pizzaValues}</p>
                            </c:forEach>
                        </div>
                    </c:if>
                </c:forEach>
                <%--                the below code is used to match the order with the cost of the order--%>
                <c:forEach items="${sessionScope.costMap}" var="i">
                    <c:if test="${i.key eq entry.key}">
                        <p class="d-flex justify-content-end">$${i.value}</p>
                    </c:if>
                </c:forEach>
                <hr>
            </c:forEach>
        </div>
    </section>
    <section class="card col-md-5 col-lg-4 align-self-start my-5 ms-md-3">
        <div class="card-body">
            <div class="d-flex">
                <p class="card-title w-100">Cost</p>
                <p class="card-text">$${sessionScope.finalCost}</p>
            </div>
            <div class="d-flex">
                <p class="card-text w-100">Tax</p>
                <p class="card-text">$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                        value="${sessionScope.finalCost * .0625}"/></p>
            </div>
        </div>
        <div class="card-footer d-flex align-items-center">
            <p class="card-text mb-0 w-100">Final Cost</p>
            <p class="card-text">$<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                    value="${sessionScope.finalCost + (sessionScope.finalCost * .0625)}"/></p>
        </div>
    </section>
</main>
<section class="">
    <a href="pizzaOrder" class="">
        <button type="submit" class="btn btn-primary">Add Item</button>
    </a>
</section>
</body>
</html>
