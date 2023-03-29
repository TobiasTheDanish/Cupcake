<%--
  Created by IntelliJ IDEA.
  User: basti
  Date: 22-03-2023
  Time: 11:57
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
    <title>Shopping cart</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<t:pagetemplate>
<jsp:attribute name="header">
         Shopping cart
    </jsp:attribute>

<jsp:attribute name="footer">
        Shopping cart
    </jsp:attribute>

<jsp:body>
<div class="container-fluid" style="display: flex; justify-content: center;">
    <div class="row">
        <div class="card border-dark my-4" style="background: #F2ECEB; max-width: 18rem;">
            <div class="card-header text-dark" style="background: #F2ECEB"><h5 class="card-title" style="color: #3c1460;"> Shopping
                Cart</h5>
                <p class="card-subtitle text-secondary">
                    Kunde: ${sessionScope.shoppingcart.customer.username}</p>

            </div>
            <div class="card-body" style="background: #F2ECEB">
                <c:if test="${sessionScope.shoppingcart.orderItems.size() == 0}">
                    <h5 class="card-title text-dark">Your shopping cart looks empty</h5>
                    <p class="card-text text-dark">Add some cupcakes <a href="CreateOrderServlet">here</a>
                    </p>
                </c:if>


                <c:if test="${sessionScope.shoppingcart.orderItems.size() != 0}">
                    <c:forEach var="item" items="${sessionScope.shoppingcart.orderItems}">
                        <h5 class="card-title text-dark">${item.bottom.flavor} & ${item.topping.flavor}</h5>
                        <c:if test="${requestScope.editing==null || requestScope.editing != sessionScope.shoppingcart.orderItems.indexOf(item) }">
                            <p class="card-text text-dark">Amount: ${item.amount}</p>

                        </c:if>
                        <c:if test="${requestScope.editing != null && requestScope.editing == sessionScope.shoppingcart.orderItems.indexOf(item)}">
                            <div style="display: flex; flex-direction: row;">
                                <label style="margin-right: 1em;" for="updateInput">Amount: </label>
                                <input style="margin-bottom: 1em; width: 75px;" id="updateInput" form="updateForm" type="text" name="newAmount" value="${item.amount}">
                            </div>
                        </c:if>
                        <div style="display: flex; flex-direction: row;">
                            <form action="shoppingCartServlet" method="post">
                                <input type="hidden" name="orderItemId"
                                       value="${sessionScope.shoppingcart.orderItems.indexOf(item)}">
                                <input type="hidden" name="action" value="Remove">
                                <input type="submit" value="Remove" style="margin-right: 1em;">

                            </form>

                            <c:if test="${requestScope.editing==null || requestScope.editing != sessionScope.shoppingcart.orderItems.indexOf(item) }">
                                <form action="shoppingCartServlet" method="post">
                                    <input type="hidden" name="orderItemId"
                                           value="${sessionScope.shoppingcart.orderItems.indexOf(item)}">
                                    <input type="hidden" name="action" value="Edit">
                                    <input type="submit" value="Edit">

                                </form>
                            </c:if>
                            <c:if test="${requestScope.editing != null && requestScope.editing == sessionScope.shoppingcart.orderItems.indexOf(item)}">
                                <form id="updateForm" action="shoppingCartServlet" method="post">
                                    <input type="hidden" name="orderItemId"
                                           value="${sessionScope.shoppingcart.orderItems.indexOf(item)}">
                                    <input type="hidden" name="action" value="Update">
                                    <input type="submit" value="Update">

                                </form>
                            </c:if>
                        </div>

                    </c:forEach>
                </c:if>
            </div>
            <c:if test="${sessionScope.shoppingcart.orderItems.size() != 0}">
                <div class="card-footer bg-transparent text-dark">
                    <p>Total price: ${sessionScope.shoppingcart.price} DKK</p>
                    <form action="CheckoutServlet" method="post">
                        <input type="submit" value="Checkout">
                    </form>
                </div>
            </c:if>
        </div>
        </jsp:body>

        </t:pagetemplate>
</body>
</html>
