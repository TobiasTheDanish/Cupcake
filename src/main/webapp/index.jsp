<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
    </jsp:attribute>

    <jsp:attribute name="footer">
        Welcome to the frontpage
    </jsp:attribute>

    <jsp:body>

    <h1 style="color: #3c1460; font-size: xxx-large; text-align: center">Maybe the best <br> cupcakes in the world.</h1>
    <h3 style="color: #3c1460; font-size: large; text-align: center">Make your first order today!</h3>

    </jsp:body>

</t:pagetemplate>