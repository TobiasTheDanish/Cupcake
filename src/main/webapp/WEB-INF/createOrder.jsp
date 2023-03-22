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
        <form>
            <label for="bottom-input">Bottom:</label><br>
            <input id="bottom-input"><br>
            <label for="topping-input">Topping:</label><br>
            <input id="topping-input"><br>
            <label for="amount">Amount:</label><br>
            <input id="amount"><br>
        </form>
    </jsp:body>
</t:pagetemplate>
</body>
</html>
