<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Welcome to the logged in area
    </jsp:attribute>

    <jsp:attribute name="footer">
        Logged in area
    </jsp:attribute>

    <jsp:body>
        <div class="col-lg-3 justify-content-center">
        <c:if test="${sessionScope.user != null}">
            <p style="text-align: center">You are logged in with the role of "${sessionScope.user.role}".</p>

            <form action="CreateOrderServlet" method="get">
                <input style="background: #F2ECEB; border: 2px solid #3c1460; color: #3c1460; margin-left: 120px" type="submit" value="Create Order Here">
            </form>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>You are not logged in yet. You can do it here: <a
                    href="../login.jsp">Login</a></p>
        </c:if>
        </div>
    </jsp:body>

</t:pagetemplate>