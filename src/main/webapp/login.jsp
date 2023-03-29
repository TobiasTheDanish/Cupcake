<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <td><p style="text-align: center;">${requestScope.errormessage}</p></td>
        <div class="container justify-content-center" style="display: flex">
        <table>
            <form style="border: 2px solid #3c1460" action="login" method="post">
                <tr>
                    <td><label style="color: #3c1460" for="email">Email: </label></td>
                    <td><input style="background: #F2ECEB; border: 2px solid #3c1460" type="email" id="email" name="email"/></td>
                </tr>
                <tr>
                    <td><label style="color: #3c1460" for="password">Password: </label></td>
                    <td><input style="background: #F2ECEB; border: 2px solid #3c1460" type="password" id="password" name="password"/></td>
                </tr>
                <tr>
                    <td><input style="background: #3c1460; color: #F2ECEB; border-radius: 20px; border: none; padding: 5px 15px;" type="submit" value="Log in"/></td>
                </tr>
            </form>
        </table>
        </div>
        <p style="text-align: center;">Not already registered? <a style="color: #3c1460" href="registration.jsp">Register here</a></p>

    </jsp:body>
</t:pagetemplate>