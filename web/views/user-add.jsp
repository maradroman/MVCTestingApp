<%--
  Created by IntelliJ IDEA.
  User: RyzenPC
  Date: 09.02.2021
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Add user</title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<div class="container" style="width: 450px; padding-top: 70px">
<div class="card">
    <div class="card-body">

    <form action="${pageContext.request.contextPath}/users" method="post">
        <div class="mb-3">
            <label for="username" class="form-label" >Username</label>
        <input minlength="3" maxlength="45" id="username" class="form-control" placeholder="username" type="text" name="username" value="${user.username}" required><br>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
        <input minlength="3" maxlength="45" id="name" class="form-control" placeholder="Name" type="text" name="name" value="${user.name}" required><br>
        </div>
        <div class="mb-3">
            <label for="surname" class="form-label">Surname</label>
        <input minlength="3" maxlength="45" id="surname" class="form-control" placeholder="Surname" type="text" name="surname" value="${user.surname}" required><br>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
        <input pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" maxlength="45" id="email" class="form-control" placeholder="Email" type="text" name="email" value="${user.email}" required><br>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password*</label>
        <input pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" maxlength="45" minlength="8" id="password" class="form-control" placeholder="Password" type="password" name="password"><br>
            <p class="text-info">*Minimum eight characters, at least one uppercase letter, one lowercase letter and one number</p>
        </div>
        <input type="hidden" name="id" value="${user.id}">
        <button type="submit" class="btn btn-primary">submit</button>
    </form>
    </div>
</div>
</div>

</body>
</html>
