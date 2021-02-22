<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public String getResource(ResourceBundle resourceBundle, String resName) throws UnsupportedEncodingException {
        return new String(resourceBundle.getString(resName).getBytes("ISO-8859-1"), "UTF-8");
    }
%>

<% Locale currentLocale = new Locale((String) session.getAttribute("language"), (String) session.getAttribute("country"));
    ResourceBundle resource = ResourceBundle.getBundle("main", currentLocale);
    String LocaleUsername = getResource(resource, "LocaleUsername");
    String LocaleName = getResource(resource, "LocaleName");
    String LocaleSurname = getResource(resource, "LocaleSurname");
    String LocaleEmail = getResource(resource, "LocaleEmail");
    String LocalePassword = getResource(resource, "LocaleSignUp");
    String LocalePassDescription = getResource(resource, "LocalePassDescription");
    String LocaleSubmit = getResource(resource, "LocaleSubmit");
    String LocaleSignUp = getResource(resource, "LocaleSignUp");
%>
<html>


<head>
    <title><%=LocaleSignUp%>></title>
    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<jsp:include page="header_public.jsp"/>
<div class="container" style="width: 450px; padding-top: 70px">
<div class="card">
    <div class="card-body">

    <form action="${pageContext.request.contextPath}/users" method="post">
        <div class="mb-3">
            <label for="username" class="form-label" ><%=LocaleUsername%></label>
        <input minlength="3" maxlength="45" id="username" class="form-control" placeholder="<%=LocaleUsername%>" type="text" name="username" required><br>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label"><%=LocaleName%></label>
        <input minlength="3" maxlength="45" id="name" class="form-control" placeholder="<%=LocaleName%>" type="text" name="name" required><br>
        </div>
        <div class="mb-3">
            <label for="surname" class="form-label"><%=LocaleSurname%></label>
        <input minlength="3" maxlength="45" id="surname" class="form-control" placeholder="<%=LocaleSurname%>" type="text" name="surname" required><br>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label"><%=LocaleEmail%></label>
        <input pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" maxlength="45" id="email" class="form-control" placeholder="<%=LocaleEmail%>" type="text" name="email" required><br>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label"><%=LocaleEmail%>*</label>
        <input pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" maxlength="45" minlength="8" id="password" class="form-control" placeholder="<%=LocaleEmail%>" type="password" name="password"><br>
            <p class="text-info"><%=LocalePassDescription%></p>
        </div>
        <input type="hidden" name="id">
        <button type="submit" class="btn btn-primary"><%=LocaleSubmit%></button>
    </form>
    </div>
</div>
</div>

</body>
</html>
