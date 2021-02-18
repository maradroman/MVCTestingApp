        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>
        <head>
            <title>Add user</title>
            <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

        </head>
<body>

<div class="" style="position: absolute; right:20px" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
    </div>
    <div class="toast-body">
        <p class="lead">
        <%

            String username = (String) request.getSession().getAttribute("username");
            if (username != null){
                response.sendRedirect("tests");
            }

        String status = request.getParameter("status");
        if (status != null){

            if (status.equals("invalidUserPass")){
                out.print("Invalid user and/or password");
            }
            else{
                out.print("Some error occurred, please try again later");
            }
        }
        %>

        </p>
    </div>
</div>

<div class="container" style="width: 450px; padding-top: 70px">
    <div class="card">
        <div class="card-body">

            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label" >Username</label>
                    <input minlength="3" maxlength="45" id="username" class="form-control" placeholder="username" type="text" name="username" value="${user.username}" required><br>
                </div>
                
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input maxlength="45" minlength="1" id="password" class="form-control" placeholder="Password" type="password" name="password"><br>
<%--                    <p class="text-info">*Minimum eight characters, at least one uppercase letter, one lowercase letter and one number</p>--%>
                </div>
                <input type="hidden" name="id" value="${user.id}">
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>

