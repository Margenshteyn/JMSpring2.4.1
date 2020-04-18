<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Modify users</title>
</head>
<body>

<div align="center">
<%--    <form action="${pageContext.request.contextPath}/admin/userUpdate?id=${user.id}" method="POST">--%>
<%--    <form action="${pageContext.request.contextPath}/admin/userUpdate" id="updateForm" method="POST">--%>
<%--    <form id="updateForm" method="POST">--%>
    <form action="/admin/userUpdate" method="post" id="updateForm"></form>
        Update user <br><br>
        Login:<br>
<%--        <input type="text" name="login" value="${param.login}"><br>--%>
<%--        <input type="text" name="username" value="${param.username}"><br>?--%>
        <input type="text" name="username" value="${user.username}" form="updateForm"><br>

        Password:<br>
        <input type="text" name="password" placeholder="Enter old password" form="updateForm"> <br>
        New password:<br>
        <input type="text" name="newPassword" placeholder="Enter new password" form="updateForm"><br>
        Name:<br>
        <%--      value="${param.name} чтобы в форме отображалась текущее имя  --%>
<%--        <input type="text" name="newName" value="${param.name}"><br>--%>
<%--        <input type="text" name="newName" value="${user.name}" form="updateForm"><br>--%>
        <input type="text" name="name" value="${user.name}" form="updateForm"><br>
        Amount on account:<br>
<%--        <input type="text" step="0.01" min="0" lang="en" name="newAmount" value="${param.amount}"><br><br>--%>
<%--        <input type="text" step="0.01" min="0" lang="en" name="newAmount" value="${user.amount}" form="updateForm"><br><br>--%>
        <input type="text" step="0.01" min="0" lang="en" name="amount" value="${user.amount}" form="updateForm"><br><br>
        Role:
        <select name="roles" form="updateForm" multiple>
            <option>USER</option>
            <option>ADMIN</option>
        </select><br>

<%--        <input formmethod="post" type="submit" value="Update user"/>--%>
<%--        <br><button type="submit" form="updateForm" >Update user</button>--%>
    <button type="submit" form="updateForm">Update user</button>
    <br>
<%--    <button onclick="location.href='/index'"> Home </button>--%>
    <form action="${pageContext.request.contextPath}/logout" method="POST">
        <input type="submit" value="Logout"/>
    </form>

</div>
</body>
</html>