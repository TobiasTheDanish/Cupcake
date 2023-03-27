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
    <div class="container justify-content-center" style="display: flex;">
        <div class="row">
            <div class="col">
        <img style="width: 320px; height: 400px" src="images/cupcakelogo1.png">
            </div>
            <div class="col-2">
            <button style="background: #3c1460;margin-top: 50px; width: 120px; height: 35px; border: 2px solid #3c1460; border-radius: 20px" id="button__back" onclick="">
                <p style="color: #F2ECEB; margin: auto;">Log in</p>
            </button>
            </div>
            <div class="col">
        <img style="width: 320px; height: 400px" src="images/cupcakelogo2.png">
            </div>
        </div>
    </div>

    </jsp:body>

</t:pagetemplate>