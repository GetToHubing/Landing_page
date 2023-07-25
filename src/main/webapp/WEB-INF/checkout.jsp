<%@ page import="java.util.Map" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: davidbanker
  Date: 7/19/23
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Checkout</title>
</head>
<body>
<main>

    <section class="card container">
        <div class="card-body">
            <c:forEach items="${sessionScope.order}" var="entry">
                <h4 class="m-0 card-title">${entry.key}</h4>

                <c:forEach items="${entry.value.entrySet()}" var="pizzaEntry">
                    <c:if test="${pizzaEntry.key eq 'Size and Crust'}">
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
                    <c:if test="${pizzaEntry.key eq 'cheese'}">
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
                        <c:forEach items="${pizzaEntry.value}" var="pizzaValues">
                            <p class="m-0 card-text"><b>${pizzaEntry.key}</b>: ${pizzaValues}</p>
                        </c:forEach>
                        <%--                        <p><b>${pizzaEntry.key}</b>: ${pizzaEntry.value}</p>--%>
                    </c:if>
                </c:forEach>
                <%--                    <c:forEach items="${pizzaEntry.value}" var="pizzaValues">--%>
                <%--                        <p class="m-0 card-text"><b>${pizzaEntry.key}</b>: ${pizzaValues}</p>--%>
                <%--                    </c:forEach>--%>
                <hr/>
            </c:forEach>
        </div>
    </section>
    <section class="container">
        <a href="pizzaOrder">
            <button type="submit" class="btn btn-primary">Add Item</button>
        </a>
    </section>
</main>
</body>
</html>
