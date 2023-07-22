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
    <% Map<String, Map<String, String[]>> newOrder = (Map<String, Map<String, String[]>>) request.getSession().getAttribute("order"); //sets the new/updated hashmap to a session attribute named order
        //the above code is for users to add multiple items to one order
        for (Map.Entry<String, Map<String, String[]>> i : newOrder.entrySet()) {
            System.out.println(i.getKey());
            for (Map.Entry<String, String[]> j : i.getValue().entrySet()) {
                System.out.println(j.getKey() + ": " + Arrays.toString(j.getValue()));
            }
            System.out.println("--------------");
        } %>
    <c:forEach items="${sessionScope.order}" var="entry">
        <p>${entry.key}</p>
        <c:forEach items="${entry.value.entrySet()}" var="pizzaEntry">
            <p>${pizzaEntry.key}: ${pizzaEntry.value[0]}</p>
            <p></p>
        </c:forEach>
        <hr/>
    </c:forEach>

    <a href="pizzaOrder">
        <button type="submit" class="btn btn-primary">Add Item</button>
    </a>
</main>
</body>
</html>
