<%--
  Created by IntelliJ IDEA.
  User: thc19
  Date: 22-03-2023
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>
<html>
<head>
    <title>Checkout</title>
</head>
<body>

<t:pagetemplate>
    <jsp:attribute name="header">
        Checkout
    </jsp:attribute>

    <jsp:attribute name="footer">
        Checkout
    </jsp:attribute>

    <jsp:body>
        <div class="container d-flex justify-content-center">
        <h4>${requestScope.message}</h4>
        </div>
        <div class="container d-flex justify-content-center">
        <form action="CreateOrderServlet" method="get">
            <input type="submit" value="Create Order Here" style="background: #3c1460; color: #F2ECEB; width: 180px; height: 35px; border: 2px solid #3c1460; border-radius: 20px">
        </form>
        </div>
    </jsp:body>
</t:pagetemplate>
</body>
</html>
