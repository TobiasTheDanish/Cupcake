<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tobiasberg
  Date: 22/03/2023
  Time: 12.07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminUserList</title>
</head>
<body>
<h3>Liste over brugere</h3>
<c:forEach var="user" items="${requestScope.userList}">
    ${user.toString()}
    <br>
</c:forEach>
</body>
</html>
