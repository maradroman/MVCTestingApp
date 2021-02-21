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
<jsp:include page="header_user.jsp"/>
<div class="" style="position: absolute; right:20px" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
    </div>
    <div class="toast-body">
        <p class="lead">${message}</p>
    </div>
</div>


<div class="container" style="padding-top: 10px">

       <h4> Welcome, ${user.name} ${user.surname}</h4>



    <table class="table table-hover">
        <tr class="thead-light">
            <th>Username</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Type</th>
            <th>Action</th>
        </tr>
            <tr>
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.surname}</td>
                <td>${user.email}</td>
                <td>${user.type}</td>
                <td><a href="${pageContext.request.contextPath}/users?action=EDIT" class="btn btn-warning">edit</a></td>
            </tr>


    </table>
</div>

</body>
</html>
<%request.getSession().removeAttribute("message");%>