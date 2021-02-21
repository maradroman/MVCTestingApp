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
    <title>Tests</title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.css"/>
</head>
<body>
<jsp:include page="header_user.jsp"/>
<div class="container" style="padding-top: 10px; margin-bottom: 100px">
    <h3>Tests</h3>
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
            <th>Pass test</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="test">
                <tr>
                    <td>${test.id}</td>
                    <td>${test.name}</td>
                    <td>${test.complexity}</td>
                    <td>${test.numberOfRequests}</td>
                    <td>${test.timeForTest}</td>
                    <td>${test.topic}</td>
                    <td>${test.questions.size()}</td>
                    <td>
                        <c:set scope="request" var="flag" value="false"/>
                        <c:set scope="request" var="result" value=""/>
                        <c:forEach items="${listpassed}" var="passedTest">
                             <c:if test="${test.id == passedTest.testID}">
                                     <c:set scope="request" var="flag" value="true"/>
                                     <c:set scope="request" var="result" value="${passedTest.result}"/>
                             </c:if>
                        </c:forEach>
                        <c:if test="${flag == 'false'&& test.questions.size() !=0}">
                            <a href="${pageContext.request.contextPath}/pass?time=${test.timeForTest}&testID=${test.id}&userID=${userID}" class="btn btn-warning" style="" role="button" data-bs-toggle="button">pass</a>
                        </c:if>
                        <c:if test="${flag == 'true'}">
                            Result:${result}%
                        </c:if>
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
        $('#datatable').DataTable({
            "lengthChange": false
        });
    })
</script>
</body>
</html>
<%request.getSession().removeAttribute("message");%>
