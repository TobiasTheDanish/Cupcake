f<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
             Login
    </jsp:attribute>

    <jsp:attribute name="footer">
            Login
    </jsp:attribute>

    <jsp:body>

        <table>
            <h6>${requestScope.errormessage}</h6>
            <form action="login" method="post">
                <tr>
                    <td><label for="email">Email: </label></td>
                    <td><input type="email" id="email" name="email"/></td>
                </tr>
                <tr>
                    <td><label for="password">Password: </label></td>
                    <td><input type="password" id="password" name="password"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Log in"/></td>
                </tr>
            </form>
        </table>
        <p>Not already registered? <a href="registration.jsp">Register here</a></p>

    </jsp:body>
</t:pagetemplate>