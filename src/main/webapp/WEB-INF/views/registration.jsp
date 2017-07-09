<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div id="wrapper">
    <jsp:include page="../section/header.jsp"/>
    <main id="main">
        <div class="account-module">
            <h1 class="form-signin-heading">Create your account</h1>

            <form:form method="POST" modelAttribute="userForm" class="form-signin">
                <spring:bind path="username">
                    <div class="input-wrap ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true"/>
                        <form:errors path="username"/>
                    </div>
                </spring:bind>

                <spring:bind path="password">
                    <div class="input-wrap ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="password" class="form-control" placeholder="Password"/>
                        <form:errors path="password"/>
                    </div>
                </spring:bind>

                <spring:bind path="confirmPassword">
                    <div class="input-wrap ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="confirmPassword" class="form-control" placeholder="Confirm your password"/>
                        <form:errors path="confirmPassword"/>
                    </div>
                </spring:bind>

                <spring:bind path="email">
                    <div class="input-wrap ${status.error ? 'has-error' : ''}">
                        <form:input type="email" path="email" class="form-control" placeholder="Email"/>
                        <form:errors path="email"/>
                    </div>
                </spring:bind>

                <table align="center" cellspacing="20" cellpadding="20">
                    <tr>
                        <td style="padding: 0 15px; width: 65%"><button class="btn btn-primary" type="submit">Submit</button></td>
                        <td style="padding: 0 15px;"><h3><a href="${contextPath}/login" style="color:red">Cancel</a></h3></td>
                    </tr>
                </table>

            </form:form>


        </div>
    </main>

</div>

</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>