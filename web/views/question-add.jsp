<%--
  Created by IntelliJ IDEA.
  User: RyzenPC
  Date: 09.02.2021
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add question</title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<%
    String username = (String) session.getAttribute("username");
    if (username == null){
        response.sendRedirect("login");
    }
%>
<body>
<div class="container" style="width: 450px">
    <h1><span class="badge badge-secondary">Question add</span></h1>
<div class="card">
    <div class="card-body">

    <form action="${pageContext.request.contextPath}/questions" method="post" id="form">

<%--        <select class="form-select" name="testID" aria-label="Default select example">--%>
<%--            <option selected>Open this select menu</option>--%>
<%--            <option value="1">cpp</option>--%>
<%--            <option value="2">java</option>--%>
<%--            <option value="3">js</option>--%>
<%--        </select>--%>
        <input type="hidden" name="testID" value="<%= request.getParameter("testID")%>">

        <div class="mb-3">
            <label for="Question" class="form-label">Question</label>
        <input minlength="3" maxlength="1900" id="Question" class="form-control" placeholder="Question" type="text" name="text" required>

            <br>
        </div>
        <div class="mb-3">
            <label for="option1" class="form-label">option1</label>
        <input minlength="3" maxlength="1400" id="option1" class="form-control" placeholder="option1" type="text" name="option1" required>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="true"  name="option1IsCorrect" id="flexCheckDefault1">
                <label class="form-check-label" for="flexCheckDefault1">
                    Right answer
                </label>
            </div>
        </div>
        <div class="mb-3">
            <label for="option2" class="form-label">option2</label>
        <input minlength="3" maxlength="1400" id="option2" class="form-control" placeholder="option2" type="text" name="option2" required>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="true"  name="option2IsCorrect" id="flexCheckDefault2">
                <label class="form-check-label" for="flexCheckDefault2">
                    Right answer
                </label>
            </div>
        </div>
        <div class="mb-3">
            <label for="option3" class="form-label">option3</label>
        <input minlength="3" maxlength="1400" id="option3" class="form-control" placeholder="option3" type="text" name="option3" required>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="true"  name="option3IsCorrect" id="flexCheckDefault3">
                <label class="form-check-label" for="flexCheckDefault3">
                    Right answer
                </label>
            </div>
        </div>
        <div class="mb-3">
            <label for="option4" class="form-label">option4</label>
        <input minlength="3" maxlength="1400" id="option4" class="form-control" placeholder="option4" type="text" name="option4" required>
            <div class="form-check">
                <input class="form-check-input"  type="checkbox" value="true" name="option4IsCorrect" id="flexCheckDefault4">
                <label class="form-check-label" for="flexCheckDefault4">
                    Right answer
                </label>
            </div>
        </div>


        <button type="submit" class="btn btn-primary">submit</button>
    </form>
    </div>
</div>
</div>
</body>
</html>
