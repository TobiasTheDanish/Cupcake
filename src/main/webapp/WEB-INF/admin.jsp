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
    <title>Admin Site</title>
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
    <div class="col-md justify-content-center">
        <div class="mx-auto" style="width: 120px">
    View User List:
    <form action="AdminUserListServlet">
        <input style="background: #F2ECEB; color: #3c1460; border: 2px solid #3c1460; margin-left: 17px" type="submit" value="Users">
    </form>
    <br>
    View All Orders:
    <form action="AdminViewOrdersServlet">
        <input style="background: #F2ECEB; color: #3c1460; border: 2px solid #3c1460; margin-left: 15px" type="submit" value="Orders">
    </form>
        </div>
    </div>
    </jsp:body>
    </t:pagetemplate>

</body>
</html>
