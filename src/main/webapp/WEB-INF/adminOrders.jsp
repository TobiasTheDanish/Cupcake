<%--
  Created by IntelliJ IDEA.
  User: sanderroust
  Date: 22/03/2023
  Time: 11.11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Orders for admin</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<t:pagetemplate>
    <jsp:attribute name="header">
         All orders
    </jsp:attribute>

    <jsp:attribute name="footer">
        All orders
    </jsp:attribute>

    <jsp:body>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <c:forEach var="order" items="${requestScope.orders}">
                    <div class="card border-dark m-4" style="max-width: 18rem;">
                        <div class="card-header bg-transparent text-dark">
                            <h5 class="card-title">Order ${order.id}</h5>
                            <p class="card-subtitle text-secondary">Customer: ${order.customer.username}</p>

                        </div>
                        <div class="card-body px-0 py-1">
                            <ul class="list-group list-group-flush">
                                <c:forEach var="item" items="${order.orderItems}">
                                    <li class="list-group-item">
                                        <h5 class="card-title text-dark">${item.bottom.flavor} & ${item.topping.flavor}</h5>
                                        <div style="display: flex; justify-content: space-between;">
                                            <p class="card-text text-dark mb-0">Amount: ${item.amount}</p>
                                            <p class="card-text text-dark mb-0">Price: ${item.price}</p>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="card-footer bg-transparent text-dark">Total price: ${order.price} DKK
                            <form action="AdminViewOrdersServlet" method="post">
                                <input type="hidden" name="orderId" value="${order.id}">
                                <input type="submit" value="Delete">
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </jsp:body>

</t:pagetemplate>
</body>
</html>
