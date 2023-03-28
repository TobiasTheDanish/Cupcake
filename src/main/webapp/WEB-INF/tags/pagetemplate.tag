<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><jsp:invoke fragment="header"/></title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        .cc-purple{
            color: #3c1460;
        }
        .cc-bg-blue{
            background: #C6D2ED;
        }
        .cc-bg-white{
            background: #F2ECEB;
        }
        .cc-blue{
            color: #C6D2ED;
        }
        .cc-white{
            color: #F2ECEB;
        }
    </style>
</head>
<body class="cc-bg-blue">
<header>
    <div style="background: #3c1460; display: flex; justify-content: center; padding: 10px;">
    <img src="${pageContext.request.contextPath}/images/cupcakeimageClose.png" class="img-fluid">
    </div>
    <nav class="navbar navbar-expand-lg cc-bg-blue" style="border-bottom: solid 10px #F2ECEB">
        <div class="container mt-1">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="row col justify-content-between collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="col-6">
                    <div class="navbar-nav">
                        <c:if test="${sessionScope.user != null}">
                            <a class="nav-item nav-link cc-purple" href="${pageContext.request.contextPath}/OrderServlet">My orders</a>
                        </c:if>
                        <c:set var = "requiredRole" value="admin" scope="page"></c:set>
                        <c:if test="${sessionScope.user != null && sessionScope.user.role.equalsIgnoreCase(requiredRole)}">
                            <a class="nav-item nav-link cc-purple" href="${pageContext.request.contextPath}/AdminServlet">Admin</a>
                        </c:if>
                    </div>
                </div>
                <div class="col-6">
                    <div class="navbar-nav justify-content-end">
                        <c:if test="${sessionScope.user == null }">
                            <a class="nav-item nav-link cc-purple" href="${pageContext.request.contextPath}/login.jsp">Login</a>
                        </c:if>
                        <c:if test="${sessionScope.user != null }">
                            <a class="nav-item nav-link mb-0 cc-purple" href="${pageContext.request.contextPath}/AdminHomePage">${sessionScope.user.username}</a>
                            <a class="nav-item nav-link mb-0 cc-purple" href="${pageContext.request.contextPath}/logout">Log out</a>
                            <p class="nav-item nav-link mb-0 cc-purple">${sessionScope.user.wallet} DKK</p>
                            <a class="nav-item nav-link mb-0 cc-purple" href="${pageContext.request.contextPath}/shoppingCartServlet">
                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-bag-check-fill" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zm-.646 5.354a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                                </svg>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>

<div id="body" class="container-fluid: mt-4 mx-4" style="min-height: 400px;">
    <div class="row" style="text-align: center">
        <h1 style="color: #3c1460"><jsp:invoke fragment="header"/></h1>
    </div>
    <div class="row justify-content-center mx-auto">
        <jsp:doBody/>
    </div>
</div>

<!-- Footer -->
<div class="container mt-3">
    <hr/>
    <div class="row mt-4">
        <div class="col">
            Nørgaardsvej 30<br/>
            2800 Lyngby
        </div>
        <div class="col">
            <jsp:invoke fragment="footer"/><br/>
            <p>&copy; 2022 Olsker Cupcakes</p>
        </div>
    </div>

</div>

</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>