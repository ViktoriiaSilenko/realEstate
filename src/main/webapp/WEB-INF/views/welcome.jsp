<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Real estates</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <p test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h3 align="right"><a onclick="document.forms['logoutForm'].submit()">Logout</a></h3>

        <p style="text-align:left;">
            <img  src="${contextPath}/resources/jpg/main_image.jpg" alt="Logo" style="width:304px;height:228px;">
        <h2>Welcome, ${pageContext.request.userPrincipal.name}!</h2>
        </p>

    <br>

    <form method="post" action="${contextPath}/welcome" modelAttribute="searchCriteria">
    <p>
        <b>Rooms number:</b> <input type="text" name="roomsNumber" size="10">
        <b>Price from:</b> <input type="text" name="priceFrom" size="10">
        <b>Price to:</b> <input type="text" name="priceTo" size="10">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit">Search</button>
    </p>
    </form>


        <p style="text-align:center;">
        <h3><b> Actual list of real estate objects: </b> </h3>

        <c:if test="${not empty listRealEstates}">

            <ul>
                <c:forEach var="element" items="${listRealEstates}">
                    <li>
                        <tr>
                            <td>${element.userDescription}: </td>
                            <td><u>rooms number:</u> ${element.nrooms},</td>
                            <td><u>total area:</u> ${element.area},</td>
                            <td><u>price:</u> ${element.initPrice}$ ,</td>
                            <td><u>address:</u> ${element.fullAddress}$ .</td>
                        </tr>
                    </li>
                </c:forEach>
            </ul>

        </c:if>



    </p>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>