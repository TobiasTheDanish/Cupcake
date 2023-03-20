<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
             Register
    </jsp:attribute>

    <jsp:attribute name="footer">
            Register
    </jsp:attribute>

    <jsp:body>
        <table>
            <h6>${requestScope.errormessage}</h6>
            <form action="Register" method="post">
                <tr>
                    <td><label for="username">Email: </label></td>
                    <td><input type="email" id="username" name="email" value="${requestScope.email}"/></td>
                </tr>
                <tr>
                    <td>
                        <label for="password">Password: </label>
                    </td>
                    <td>
                        <input type="password" id="password" name="password"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="confirmPassword">Confirm<br> password: </label>
                    </td>
                    <td>
                        <br><input type="password" id="confirmPassword" name="confirmPassword"/>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Register"/></td>
                </tr>
            </form>
        </table>
        <p>Already registered? <a href="login.jsp">Log in here</a></p>

    </jsp:body>
</t:pagetemplate>