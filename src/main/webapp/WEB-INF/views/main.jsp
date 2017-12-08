<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div id="wrapper">

    <header id="header">
        <div class="container">
            <strong class="logo"><img src="${contextPath}/resources/images/home.svg" alt="Real Estate Site" width="65px" height="65px" align="left"></strong>
            <nav id="nav">
                <p test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <ul class="user-nav">
                    <li class="user"><a href="#">${pageContext.request.userPrincipal.name}!</a></li>

                    <li><a href="${contextPath}/manageUsers">Manage users</a></li>

                    <li><a href="${contextPath}/manageRealEstates">Manage real estates</a></li>

                    <li><a onclick="document.forms['logoutForm'].submit()">Logout <i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main id="main">
        <div class="estate-filter container">
            <div class="top-line">
                <form method="post" action="${contextPath}/main" modelAttribute="searchCriteria">
                    <div class="input-group">
                        <label for="roomsNumber">Rooms number:</label>
                        <div class="input-wrap">
                            <input type="number" id="roomsNumber" name="roomsNumber">
                        </div>
                        <label for="priceFrom">Price:</label>
                        <div class="input-wrap">
                            <input list="priceFromList" type="text" id="priceFrom" name="priceFrom" size="10"/>
                            <datalist id="priceFromList">
                                <option value="2000">
                                <option value="3000">
                                <option value="4000">
                                <option value="5000">
                                <option value="6000">
                            </datalist>
                        </div>

                        <span class="divider">&#8212;</span>

                        <div class="input-wrap">
                            <input list="priceToList" type="text" name="priceTo" size="10"/>
                            <datalist id="priceToList">
                                <option value="6000">
                                <option value="7000">
                                <option value="8000">
                                <option value="9000">
                                <option value="10000">
                            </datalist>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary" ref>Search</button>
                        <a href="${contextPath}/main" class="btn btn-transparent">Show all</a>
                    </div>
                </form>
            </div>

            <c:if test="${not empty listRealEstates}">
                <div class="results">
                    <ul class="results-list">
                        <c:forEach var="element" items="${listRealEstates}">
                            <li>
                                <div class="visual"><img src="${contextPath}/resources/images/homes_photos/${element.photoName}" alt="estate name"></div>
                                <div class="description">
                                    <dl>
                                        <dt>description:</dt>
                                        <dd>${element.userDescription}</dd>
                                        <dt>rooms number:</dt>
                                        <dd>${element.nrooms}</dd>
                                        <dt>total area:</dt>
                                        <dd>${element.area}</dd>
                                        <dt>price:</dt>
                                        <dd>${element.initPrice} $</dd>
                                        <dt>address:</dt>
                                        <dd><address>${element.fullAddress}</address></dd>
                                    </dl>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

        </div>
    </main>
</div>