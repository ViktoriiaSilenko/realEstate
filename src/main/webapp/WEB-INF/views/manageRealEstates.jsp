<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<h3 align="center"> List of all real estates </h3>
<c:if test="${!empty listRealEstates}">
    <table style="border: 1px solid black; border-collapse: collapse;" align="center">
        <tr style="border: 1px solid black;">
            <th width="30" style="border: 1px solid black; text-align: center">Id</th>
            <th width="120" style="border: 1px solid black; text-align: center">Type</th>
            <th width="100" style="border: 1px solid black; text-align: center">Area</th>
            <th width="100" style="border: 1px solid black; text-align: center">NRooms</th>
            <th width="100" style="border: 1px solid black; text-align: center">Price</th>
            <th width="100" style="border: 1px solid black; text-align: center">Description</th>
            <th width="100" style="border: 1px solid black; text-align: center">Photo</th>
            <th width="100" style="border: 1px solid black; text-align: center">Address</th>

            <th width="100" style="border: 1px solid black; text-align: center">Edit</th>
            <th width="100" style="border: 1px solid black; text-align: center">Remove</th>
        </tr>
        <c:forEach items="${listRealEstates}" var="realEstate">
            <tr>
                <td style="border: 1px solid black; text-align: center">${realEstate.id}</td>
                <td style="border: 1px solid black; text-align: center">${realEstate.type}</td>
                <td style="border: 1px solid black; text-align: center">${realEstate.area}</td>
                <td style="border: 1px solid black; text-align: center">${realEstate.nrooms}</td>
                <td style="border: 1px solid black; text-align: center">${realEstate.initPrice}</td>
                <td style="border: 1px solid black; text-align: center">${realEstate.userDescription}</td>
                <td style="border: 1px solid black; text-align: center">${realEstate.photoName}</td>
                <td style="border: 1px solid black; text-align: center">${realEstate.fullAddress}</td>


                <td style="border: 1px solid black; text-align: center"><a href=${contextPath}/editRealEstate/${realEstate.id}>Edit real estate</a></td>
                <td style="border: 1px solid black; text-align: center"><a href=${contextPath}/removeRealEstate/${realEstate.id}>Remove real estate</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<table align="right" cellspacing="20" cellpadding="20">
    <tr>
        <td style="padding: 0 15px;"><h3><a onclick="document.forms['logoutForm'].submit()">Logout</a></h3></td>
        <td style="padding: 0 15px;"><h3><a href=${contextPath}/main>Back</a></h3></td>
    </tr>
</table>

</br>

<form id="logoutForm" method="POST" action="${contextPath}/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

</br>

<h3 id="operationLabel" align="center"></h3>



<c:url var="addAction" value="/realEstates/add"/>


<form:form method="POST" action="${addAction}" modelAttribute="realEstate">
    <spring:bind path="id">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <form:input type="text" id="realEstateId" path="id" class="form-control" placeholder="Id"
                         disabled="true" maxlength="11" size="11" style="width: 250px;"></form:input>
            <form:errors path="id"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="type">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <form:input type="text" id="type" path="type" class="form-control"
                        placeholder="type" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="type"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="area">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <form:input type="text" id="area" path="area" class="form-control"
                        placeholder="area" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="area"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="nrooms">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <form:input type="text" id="nrooms" path="nrooms" class="form-control"
                        placeholder="rooms number" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="nrooms"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="initPrice">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <form:input type="text" id="initPrice" path="initPrice" class="form-control"
                        placeholder="price" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="initPrice"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="userDescription">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <form:input type="text" id="userDescription" path="userDescription" class="form-control"
                        placeholder="description" maxlength="132" size="32" style="width: 250px;"></form:input>
            <form:errors path="userDescription"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="photoName">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <form:input type="text" id="photoName" path="photoName" class="form-control"
                        placeholder="photoName.png" maxlength="82" size="32" style="width: 250px;"></form:input>
            <form:errors path="photoName"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="fullAddress">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <form:input type="text" id="fullAddress" path="fullAddress" class="form-control"
                        placeholder="full address" maxlength="132" size="32" style="width: 250px;"></form:input>
            <form:errors path="fullAddress"></form:errors>
        </div>
    </spring:bind>


    <c:if test="${!empty realEstate.id}">
        <input type='hidden' id='realEstateId' name='realEstateId' value='${realEstate.id}'/>
        <div align="center">
            <input type="submit" value="<spring:message text="Edit real estate"/>"/>
        </div>

        <script>
            document.getElementById("operationLabel").innerHTML = "Edit real estate";
        </script>
    </c:if>

    <c:if test="${empty realEstate.id}">
        <input type='hidden' id='realEstateId' name='realEstateId' value='-1'/>
        <div align="center">
            <input type="submit" value="<spring:message text="Add real estate"/>"/>
        </div>

        <script>
            document.getElementById("operationLabel").innerHTML = "Add real estate";
        </script>
    </c:if>

</form:form>

</br>