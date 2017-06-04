<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

</br>
</br>
</br>
