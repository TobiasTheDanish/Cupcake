<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<html>
<head>
    <title>adminUserList</title>
</head>
<body>
<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 50%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>
<t:pagetemplate>
    <jsp:attribute name="header">
         User overview
    </jsp:attribute>

    <jsp:attribute name="footer">
        User overview
    </jsp:attribute>

    <jsp:body>
<h6>${requestScope.errormessage}</h6>
<table>
    <tr>
        <th>User List</th>
    </tr>
    <c:forEach var="user" items="${requestScope.userList}">
    <tr>
        <td>${user.toString()}</td>
        <td>
            <form action="EditWalletServlet" method="post">
                <label for="wallet">Edit wallet:</label><br>
                <input type="text" id="wallet" name="wallet" value=${user.currency}><br>
                <input type="hidden" name="user_id" value="${user.id}">
                <input class="mt-2" type="submit" value="Confirm">
            </form>
        </td>
    </tr>
    </c:forEach>
</table>
    </jsp:body>
</t:pagetemplate>

</body>
</html>
