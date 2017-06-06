<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<h3 align="center"> List of all users </h3>
<c:if test="${!empty listUsers}">
    <table style="border: 1px solid black; border-collapse: collapse;" align="center">
        <tr style="border: 1px solid black;">
            <th width="30" style="border: 1px solid black; text-align: center">Id</th>
            <th width="120" style="border: 1px solid black; text-align: center">Name</th>
            <th width="120" style="border: 1px solid black; text-align: center">Email</th>
            <th width="100" style="border: 1px solid black; text-align: center">Edit</th>
            <th width="100" style="border: 1px solid black; text-align: center">Remove</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td style="border: 1px solid black; text-align: center">${user.id}</td>
                <td style="border: 1px solid black; text-align: center">${user.username}</td>
                <td style="border: 1px solid black; text-align: center">${user.email}</td>
                <td style="border: 1px solid black; text-align: center"><a href=${contextPath}/editUser/${user.id}>Edit user</a></td>
                <td style="border: 1px solid black; text-align: center"><a href=${contextPath}/removeUser/${user.id}>Remove user</a></td>
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



<c:url var="addAction" value="/users/add"/>


<form:form method="POST" action="${addAction}" modelAttribute="user">
    <spring:bind path="id">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <label for="userId" style="align: left;">Id:</label>
            <form:input type="text" id="userId" path="id" class="form-control" placeholder="Id"
                         disabled="true" maxlength="11" size="11" style="width: 250px;"></form:input>
            <form:errors path="id"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="username">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <label for="userName" style="align: left;">Username:</label>
            <form:input type="text" id="userName" path="username" class="form-control"
                        placeholder="Username" autofocus="true" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="username"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="password">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <label for="userPassword" style="align: left;">Password:</label>
            <form:input type="password" id="userPassword" path="password" class="form-control"
                        placeholder="Password" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="password"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="email">
        <div class="form-group ${status.error ? 'has-error' : ''}" align="center">

            <label for="userEmail" style="align: left;">Email:</label>
            <form:input type="email" id="userEmail" path="email" class="form-control"
                        placeholder="Email" maxlength="32" size="32" style="width: 250px;"></form:input>
            <form:errors path="email"></form:errors>
        </div>
    </spring:bind>

    <c:if test="${!empty user.id}">
        <input type='hidden' id='userId' name='userId' value='${user.id}'/>
        <div align="center">
            <input type="submit" value="<spring:message text="Edit user"/>"/>
        </div>

        <script>
            document.getElementById("operationLabel").innerHTML = "Edit user";
        </script>
    </c:if>

    <c:if test="${empty user.id}">
        <input type='hidden' id='userId' name='userId' value='-1'/>
        <div align="center">
            <input type="submit" value="<spring:message text="Add user"/>"/>
        </div>

        <script>
            document.getElementById("operationLabel").innerHTML = "Add user";
        </script>
    </c:if>

</form:form>

</br>