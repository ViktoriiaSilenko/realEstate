<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div id="wrapper">
    <jsp:include page="../section/header.jsp"/>

    <main id="main">
        <div class="account-module">
            <h1 class="form-signin-heading">Real estate site</h1>
            <div>
                <i>This site can be used to find real estates by criteria,
                    <br/> to contact with its owner for more information,
                    <br/> to create advertising about your real estate</i>
            </div>
            <form method="POST" action="${contextPath}/login" name="Login_Form" class="form-signin">

                <div class="form-group ${error != null ? 'has-error' : ''}">

                    <span>${message}</span>
                    <div class="input-wrap">
                        <input name="username" type="text" class="form-control" placeholder="Username" autofocus="true"/>
                    </div>
                    <div class="input-wrap">
                        <input name="password" type="password" class="form-control" placeholder="Password"/>
                    </div>
                    <span>${error}</span>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <button class="btn btn-primary btn-block" type="submit">Log In</button>
                    <a href="${contextPath}/registration">Create an account</a>
                </div>

            </form>

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