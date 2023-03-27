<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>
<%--
  Created by IntelliJ IDEA.
  User: tobiasberg
  Date: 22/03/2023
  Time: 10.18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<t:pagetemplate>
<jsp:attribute name="header">
         Admin site
    </jsp:attribute>

<jsp:attribute name="footer">
        Admin
    </jsp:attribute>

<jsp:body>
    View User List:
    <form action="AdminUserListServlet">
        <input type="submit" value="User List">
    </form>
    <br>
    <br>
    View All Orders:
    <form action="AdminViewOrdersServlet">
        <input type="submit" value="Orders">
    </form>
    </jsp:body>
    </t:pagetemplate>

</body>
</html>
