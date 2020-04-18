<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page isELIgnored="false" %>--%>
<%--<jsp:useBean id="usersList" scope="request" type="java.util.List"/>--%>
<html>
<head>
    <title>List of users</title>
</head>
<body>
<%--  <div style="text-align: center" >--%>
<div align="center">
    <h1>List of all users</h1>
    <form action="/admin/userAdd" method="get" id="my_form"></form>
    <%--    <table style="border: 1px; padding: 3px">--%>
    <table border="1" cellpadding="3">
        <tr>
            <td>Login</td>
            <td>Password</td>
            <td>Name</td>
            <td>Amount</td>
            <td>Roles</td>
            <td>Update</td>
            <td>Delete</td>
        </tr>

        <c:forEach items="${usersList}" var="user">
            <tr>
                    <%--                <td><c:out value="${user.login}"/></td>--%>
                <td><c:out value="${user.username}"/></td>
                <td><c:out value="${user.password}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td>${user.amount}</td>
                <td><c:out value="${user.roles}"/></td>

                <td>
                    <div align="center">
                        <form action="${pageContext.servletContext.contextPath}/admin/userUpdate" method="get">
                            <button type="submit" name="login" value="${user.username}" class="btn-link">Update</button>
                        </form>
                    </div>
                </td>
                <td>
                    <div align="center">
                        <form action="${pageContext.servletContext.contextPath}/admin/userDelete" method="get">
                            <button type="submit" name="login" value="${user.username}" class="btn-link">Delete</button>
                        </form>
                    </div>
                </td>

            </tr>
        </c:forEach>
        <tr>
            <td><input type="text" name="username" form="my_form"></td>
            <td><input type="text" name="password" form="my_form"></td>
            <td><input type="text" name="name" form="my_form"></td>
            <td><input type="text" step="0.01" min="0" lang="en" name="amount" form="my_form"></td>
            <%--      <td><input type="text" name="role" form="my_form"></td>--%>
            <td>
                <select name="roles" form="my_form" multiple>
                    <option>USER</option>
                    <option>ADMIN</option>
                </select>
            </td>
            <td>
                <button type="submit" form="my_form">Add new user</button>

            </td>
        </tr>
    </table>

    <h2>${param.message}</h2>

    <%-- <c:if test="${param.deletedLogin != null}">
       <h2>User: "<c:out value="${param.deletedLogin}"/>" deleted </h2>
     </c:if>
     <c:if test="${param.addUserLogin != null}">
       <h2>User: "<c:out value="${param.addUserLogin}"/>" added </h2>
     </c:if>
     <c:if test="${param.wrongRequest != null}">
     <h2>User: "<c:out value="${param.wrongRequest}"/>" not added - user already exist! </h2>
   </c:if>
     <c:if test="${param.updatedLogin != null}">
     <h2>User: "<c:out value="${param.updatedLogin}"/>" updated </h2>
   </c:if>
     <c:if test="${param.wrongUpdate != null}">
     <h2>User: "<c:out value="${param.wrongUpdate}"/>" not updated - login/password wrong! </h2>
   </c:if>--%>
    <br>

    <form action="${pageContext.request.contextPath}/logout" method="POST">
        <input type="submit" value="Logout"/>
    </form>

</div>
</body>
</html>
