<%--
  Created by IntelliJ IDEA.
  User: thc19
  Date: 22-03-2023
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<html>
<head>
    <title>Order</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<t:pagetemplate>
    <jsp:attribute name="header">
         Design your cupcake
    </jsp:attribute>

    <jsp:attribute name="footer">
        Design your cupcake
    </jsp:attribute>

    <jsp:body>
        <h6>${requestScope.errormessage}</h6>
        <div class="container">
        <form action="CreateOrderServlet" method="post">
            <div class="row justify-content-center">
                <div class="col mx-auto">
            <label for="bottom-input">Bottom:</label><br>
            <select class="p-1" style="background: #F2ECEB; color: #3c1460; border-radius: 10px; border: solid 2px #3c1460" id="bottom-input" name="bottom">
                <c:forEach var="bottom" items="${requestScope.bottoms}">
                    <option value="${bottom.id}">${bottom.flavor} : ${bottom.price} DKK</option>
                </c:forEach>
            </select><br>
                </div>

                <div class="col mx-auto">
            <label for="topping-input">Topping:</label><br>
            <select class="p-1" style="background: #F2ECEB; color: #3c1460; border-radius: 10px; border: solid 2px #3c1460" id="topping-input" name="topping">
                <c:forEach var="topping" items="${requestScope.toppings}">
                    <option value="${topping.id}">${topping.flavor} : ${topping.price} DKK</option>
                </c:forEach>
            </select><br>
                </div>

                <div class="col mx-auto">
            <label for="amount">Amount:</label><br>
            <input style="background: #F2ECEB; color: #3c1460; border-radius: 10px; border: solid 2px #3c1460" id="amount" name="amount"><br>
                </div>
            <br>
            </div>
            <div class="row" style="margin-left: 1px">
            <input style="background: #F2ECEB; color: #3c1460; width: 11em; margin-top: 4em; border-radius: 10px; border: solid 2px #3c1460" type="submit" value="Add to cart">
            </div>
        </form>
        </div>
                <div style="display: flex; justify-content: center">
                </div>

        <c:if test="${sessionScope.shoppingcart != null}">
            <h6>Shopping cart</h6>
            <table style="border: 1px solid grey">
                <tr style="border-bottom: 1px solid grey">
                    <th style="border-right: 1px solid grey">Bottom</th>
                    <th style="border-right: 1px solid grey">Topping</th>
                    <th style="border-right: 1px solid grey">Amount</th>
                    <th>Price</th>
                </tr>
                <c:forEach var="item" items="${sessionScope.shoppingcart.orderItems}">
                    <tr style="border-bottom: 1px solid grey">
                        <td style="border-right: 1px solid grey">${item.bottom.flavor}</td>
                        <td style="border-right: 1px solid grey">${item.topping.flavor}</td>
                        <td style="border-right: 1px solid grey">${item.amount}</td>
                        <td>${item.price} DKK</td>
                    </tr>
                </c:forEach>
                <tr>
                    <form action="CheckoutServlet" method="post">
                        <input type="submit" value="Checkout">
                    </form>
                </tr>
            </table>
        </c:if>
    </jsp:body>
</t:pagetemplate>
</body>
</html>
