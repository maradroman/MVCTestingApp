<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Online testing application</a>
        </div>
        <%--            <ul class="nav navbar-nav">--%>
        <%--                <li class="active"><a href="${pageContext.request.contextPath}/login">Sign In</a></li>--%>
        <%--                <li class="active"><a href="${pageContext.request.contextPath}/users?action=SIGNUP">Sign Up</a></li>--%>


        <%--            </ul>--%>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light rounded" aria-label="Eleventh navbar example">
        <div class="container-fluid">
            <span class="navbar-brand">Navigation</span>


            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/users">Student info</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/tests">Tests</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Results</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
</nav>


