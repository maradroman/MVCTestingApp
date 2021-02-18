<%--
  Created by IntelliJ IDEA.
  User: RyzenPC
  Date: 09.02.2021
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java"%>
<html>
<head>
    <title>Add test</title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<%
    String username = (String) session.getAttribute("username");
    if (username == null){
        response.sendRedirect("login");
    }
%>
<body>
<div class="container" style="width: 450px; padding-top: 70px">
<div class="card">
    <div class="card-body">

    <form action="${pageContext.request.contextPath}/tests" method="post">

        <div class="mb-3">
            <label for="name" class="form-label">Test name</label>
        <input minlength="3" maxlength="45" id="name" class="form-control" placeholder="name" type="text" name="name" required><br>
        </div>





        <div class="mb-3">
            <label for="complexity" class="form-label">complexity</label>
        <input id="complexity" class="form-control-range"  type="range" name="complexity" min="1" max="10" step="1">
1_____2_____3_____4_____5____6_____7_____8____9____10
        </div>

        <div class="mb-3">
            <label for="timeForTest" class="form-label">timeForTest</label>
        <input minlength="1" maxlength="10" id="timeForTest" class="form-control" placeholder="timeForTest" type="text" name="timeForTest" required><br>
        </div>

        <div class="mb-3">
            <label for="topic" class="form-label">topic</label>
        <input minlength="1" maxlength="10" id="topic" class="form-control" placeholder="topic" type="text" name="topic" required><br>
        </div>

        <button type="submit" class="btn btn-primary">submit</button>
    </form>
    </div>

</div>
</div>

</body>
</html>
