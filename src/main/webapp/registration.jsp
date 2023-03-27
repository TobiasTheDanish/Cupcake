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
        <div class="container justify-content-center" style="display: flex;">

        <table>
            <h6>${requestScope.errormessage}</h6>
            <form action="Register" method="post">
                <tr>
                    <td><label style="color: #3c1460" for="username">Email: </label></td>
                    <td><input style="background: #F2ECEB; border: 2px solid #3c1460" type="email" id="username" name="email" value="${requestScope.email}"/></td>
                </tr>
                <tr>
                    <td>
                        <label style="color: #3c1460" for="password">Password: </label>
                    </td>
                    <td>
                        <input style="background: #F2ECEB; border: 2px solid #3c1460" type="password" id="password" name="password"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="color: #3c1460" for="confirmPassword">Confirm<br> password: </label>
                    </td>
                    <td>
                        <br><input style="background: #F2ECEB; border: 2px solid #3c1460" type="password" id="confirmPassword" name="confirmPassword"/>
                    </td>
                </tr>
                <tr>
                    <td><input style="background: #3c1460; color: #F2ECEB; border-radius: 20px; border: none; padding: 5px 15px;" type="submit" value="Register"/></td>
                </tr>
            </form>
        </table>
        </div>
        <p style="text-align: center;">Already registered? <a style="color: #3c1460;" href="login.jsp">Log in here</a></p>

    </jsp:body>
</t:pagetemplate>