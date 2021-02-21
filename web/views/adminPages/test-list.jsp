<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
         language="java"%>
<html>
<%

    String username = (String) session.getAttribute("username");

    System.out.println(session.getAttribute("userID"));
    if (username == null){
        response.sendRedirect("login");
    }
%>
<head>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Title</title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.css"/>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
</head>


<body>
<jsp:include page="header_admin.jsp"/>

<div class="alert alert-success card toast align-items-center shadow p-3 mb-5 bg-body rounded" style="position: absolute; right:20px" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">

        <strong class="me-auto "><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
        </svg></strong>
    </div>
</div>
<div class="container" style="padding-top: 10px; margin-bottom: 100px">
    <h1><span class="badge badge-secondary">Tests</span></h1>

    <a href="${pageContext.request.contextPath}/tests?action=add" class="btn btn btn-warning mb-5" style="width: 200px" role="button" data-bs-toggle="button">Add test</a>

    <table id="datatable" class="table table-hover">
        <thead>
        <tr class="thead-light">
            <th>ID</th>
            <th>Test name</th>
            <th>Complexity</th>
            <th>Number of requests</th>
            <th>Time for test</th>
            <th>Topic</th>
            <th>Questions</th>
            <th>Add question</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="test">
                <tr>
                    <td>${test.id}</td>

                    <td>
                        <a href="${pageContext.request.contextPath}/pass?time=${test.timeForTest}&testID=${test.id}&userID=${userID}">${test.name}</a>


                    </td>


                    <td>${test.complexity}</td>
                    <td>${test.numberOfRequests}</td>
                    <td>${test.timeForTest}</td>
                    <td>${test.topic}</td>
                    <td>${test.questions.size()}</td>


                    <td>
                        <a href="${pageContext.request.contextPath}/questions?testID=${test.id}" class="btn btn-warning" style="" role="button" data-bs-toggle="button">+</a>

                    </td>
                </tr>

        </c:forEach>
        </tbody>
        <tfoot></tfoot>
    </table>

</div>

<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#datatable').DataTable();
    })
</script>
</body>
</html>
<%request.getSession().removeAttribute("message");%>
