<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="container">

    <p test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h3 align="right"><a onclick="document.forms['logoutForm'].submit()">Logout</a></h3>

        <h2>Welcome, ${pageContext.request.userPrincipal.name}!</h2>

    <br>

    <span style="float:left;">
    <form method="post" action="${contextPath}/main" modelAttribute="searchCriteria">

        <b>Rooms number:</b> <input list="roomsNumberList" type="text" name="roomsNumber" size="10"/>
        <datalist id="roomsNumberList">
            <option value="1">
            <option value="2">
            <option value="3">
        </datalist>
        <b>Price:</b> <input list="priceFromList" type="text" name="priceFrom" size="10"/>
        <datalist id="priceFromList">
            <option value="2000">
            <option value="3000">
            <option value="4000">
            <option value="5000">
            <option value="6000">
        </datalist>
        <b> &#8212; </b> <input list="priceToList" type="text" name="priceTo" size="10"/>
        <datalist id="priceToList">
            <option value="6000">
            <option value="7000">
            <option value="8000">
            <option value="9000">
            <option value="10000">
        </datalist>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit"><b>Search</b></button>

    </form>
    </span>

    <span style="border-left:20px;">
    <form method="get" action="${contextPath}/main">
        <button type="submit"><b>Show All</b></button>
    </form>
    </span>

    <br>

    <p style="text-align:center;">
    <h3><b> Actual list of real estate objects: </b> </h3>

    <c:if test="${not empty listRealEstates}">

        <ul>
            <c:forEach var="element" items="${listRealEstates}">
                <li>
                    <p>${element.userDescription}: </p>
                    <p><i>rooms number:</i> ${element.nrooms},</p>
                    <p><i>total area:</i> ${element.area},</p>
                    <p><i>price:</i> ${element.initPrice}$ ,</p>
                    <p><i>address:</i> ${element.fullAddress} .</p>

                    <p style="text-align:left;">
                        <img src="${contextPath}/resources/jpg/homes_photos/${element.photoName}" style="width:400px;height:250px;"/>
                    </p>
                </li>
            </c:forEach>
        </ul>

    </c:if>
    </p>

</div>