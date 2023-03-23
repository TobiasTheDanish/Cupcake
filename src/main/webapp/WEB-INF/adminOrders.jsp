<%--
  Created by IntelliJ IDEA.
  User: sanderroust
  Date: 22/03/2023
  Time: 11.11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Orders for admin</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<t:pagetemplate>
    <jsp:attribute name="header">
         Welcome to the logged in area
    </jsp:attribute>

    <jsp:attribute name="footer">
        Logged in area
    </jsp:attribute>

    <jsp:body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm">
                    <div class="card border-dark mb-3" style="max-width: 18rem;">
                        <div class="card-header bg-transparent text-dark"><h5 class="card-title">Order 2</h5>
                            <p class="card-subtitle text-secondary"> #12324 </p>

                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-dark">Vanilla / Orange</h5>
                            <p class="card-text text-dark">Amount: 7</p>
                        </div>
                        <div class="card-footer bg-transparent text-dark">Price: 13 DKK</div>
                    </div>

                </div>
        <br>
                <div class="col-sm">
        <div class="card border-dark mb-3" style="max-width: 18rem;">
            <div class="card-header bg-transparent text-dark"><h5 class="card-title">Order 2</h5>
                    <p class="card-subtitle text-secondary"> #12324 </p>

            </div>
            <div class="card-body">
                <h5 class="card-title text-dark">Chocolate / Strawberry</h5>
                <p class="card-text text-dark">Amount: 4</p>
            </div>
            <div class="card-footer bg-transparent text-dark">Price: 11 DKK</div>
        </div>
                </div>

                <div class="col-sm">

                </div>

                <div class="col-sm">

                </div>

                <div class="col-sm">

                </div>

            </div>
        </div>
    </jsp:body>

</t:pagetemplate>
</body>
</html>
