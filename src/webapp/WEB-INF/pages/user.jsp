<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User info</title>
</head>
<body>
<div align="center">
    <h1>Information about user</h1>
    <form>
    <%--    <table style="border: 1px; padding: 3px">--%>
    <table border="1" cellpadding="3">
        <tr>
            <td>Login</td>
            <td>Password</td>
            <td>Name</td>
            <td>Amount</td>
            <td>Roles</td>
        </tr>
        <tr>
            <td><c:out value="${user.username}"/></td>
            <td><c:out value="${user.password}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td>${user.amount}</td>
            <td><c:out value="${user.roles}"/></td>
        </tr>
    </table>
    </form>
    <form action="${pageContext.request.contextPath}/logout" method="POST">
        <input type="submit" value="Logout"/>
    </form>
</body>
</html>