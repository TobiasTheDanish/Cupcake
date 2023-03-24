
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
         Your Shopping-cart
    </jsp:attribute>

    <jsp:attribute name="footer">
        Shopping-cart
    </jsp:attribute>

    <jsp:body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm">
                    <div class="card border-dark mb-3" style="max-width: 18rem;">
                        <div class="card-header bg-transparent text-dark"><h5 class="card-title">Cupcake 1</h5>


                                </div>
                                <div class="card-body">
                                    <c:forEach var="item" items="${requestScope.order.orderItems}">
                                        <h5 class="card-title text-dark">${item.bottom.flavor} & ${item.topping.flavor}</h5>
                                        <p class="card-text text-dark">Amount: ${item.amount}</p>
                                        <form action="shoppingCartServlet" method="post">
                                            <input type="hidden" name="cupCakeId" value="1">
                                            <input type="submit" name="action" value="Remove">


                                            <form action="shoppingCartServlet" method="post">
                                                <input type="hidden" name="cupCakeId" value="2">
                                                <input type="submit" name="action" value="Edit">
                                            </form>
                                        </form>
                                    </c:forEach>
                                </div>
                                <div class="card-footer bg-transparent text-dark">Price: ${requestScope.order.price} DKK</div>
                                <form action="CheckoutServlet" method="post">
                                    <input type="submit" value="Checkout">
                                </form>
                            </div>
                        </div>


                    </div>

                </div>

            </div>

        <br>
        <br>
        <br>
        <form action="shoppingCartServlet" method="post">
            <input type="submit" value="Order">
        </form>
    </jsp:body>

</t:pagetemplate>
</body>
</html>
