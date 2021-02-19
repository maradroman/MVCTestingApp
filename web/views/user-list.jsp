<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%

    String username = (String) session.getAttribute("username");

    System.out.println(session.getAttribute("userID"));
    if (username == null){
        response.sendRedirect("login");
    }
%>
<head>
    <title>Title</title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>



<div class="" style="position: absolute; right:20px" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
    </div>
    <div class="toast-body">
        <p class="lead">${message}</p>
    </div>
</div>


<div class="container" style="padding-top: 10px">
    <h1 class=""><span class="badge badge-secondary">Users </span></h1>
<%--    <p class="lead d-inline">User saved successfully</p>--%>


    <table class="table table-hover">
        <tr class="thead-light">

            <th>Username</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Type</th>
            <th>Is blocked</th>
            <th>Actions</th>
<%--            <th>Edit</th>--%>
        </tr>
            <c:forEach items="${list}" var="user">
                <tr>
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.surname}</td>
                <td>${user.email}</td>
                <td>${user.type}</td>
                    <c:if test="${user.type eq 'admin'}">
                        <td></td>
                    </c:if>

                    <c:if test="${user.type eq 'student'}">
                        <td>${user.isBlocked}</td>
                    </c:if>

                    <c:if test="${user.isBlocked eq 'false' && user.type eq 'student'}">
                        <td>
                            <a href="${pageContext.request.contextPath}/users/block?userName=${user.username}" class="btn btn-warning" style="width: 150px" role="button" data-bs-toggle="button">Block user</a>
                            <a href="${pageContext.request.contextPath}/users?action=EDIT&id=${user.id}" class="btn btn-warning" style="" role="button" data-bs-toggle="button">edit</a>
                        </td>
                    </c:if>
                    <c:if test="${user.isBlocked eq 'true' && user.type eq 'student'}">
                        <td>
                            <a href="${pageContext.request.contextPath}/users/unblock?userName=${user.username}" class="btn btn-info" style="width: 150px" role="button" data-bs-toggle="button">Unblock user</a>
                            <a href="${pageContext.request.contextPath}/users?action=EDIT&id=${user.id}" class="btn btn-warning" style="" role="button" data-bs-toggle="button">edit</a>
                        </td>
                    </c:if>
                    <c:if test="${user.type eq 'admin'}">
                        <td></td>
                    </c:if>
<%--                    <td>--%>
<%--                        edit--%>
<%--                    <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">edit</a>--%>
<%--                    </td>--%>
                </tr>

        </c:forEach>
    </table>
    <button class="btn btn-outline-success" style="width: 200px" onclick="window.location.href='views/user-add.jsp'">Add user</button>
</div>

</body>
</html>
<%request.getSession().removeAttribute("message");%>