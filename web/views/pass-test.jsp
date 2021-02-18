<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">

    <link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdn.rawgit.com/hilios/jQuery.countdown/2.2.0/dist/jquery.countdown.min.js"></script>
    <title>Redirecting</title>
</head>
<body>
<div class="container pt-5">

    <div style="position: sticky; top: 0; z-index: 2" class="card align-items-center bg-white mb-5">
        <h3>Time left:</h3>
        <div class="badge" style="font-size: 35px; margin-bottom: 20px" id="clock"></div>
        <button form="testForm" class="btn btn-warning align-self-end" style="width: 100%">Submit test</button>

    </div>

<form style="font-size: 16px; font-family: 'Montserrat'" method="post" id="testForm">
    <c:forEach varStatus="loop" items="${list}" var="question">
    <input type="text" name="testID" value="${loop.index + 1}">
    <div class="container card question">
        <strong class="card-header mb-2" id="${question.id}">
                   ${loop.index + 1}.
            ${question.text}


           </strong>

        <div class="form-check d-flex align-items-center mb-2">
            <input class="form-check-input position-static mt-0 mr-2" value="true" type="checkbox" name="1">
            ${question.option1}
        </div>

        <div class="form-check d-flex align-items-center mb-2">
            <input class="form-check-input position-static mt-0 mr-2" type="checkbox" value="true" name="2">
            ${question.option2}
        </div>

        <div class="form-check d-flex align-items-center mb-2">
            <input class="form-check-input position-static mt-0 mr-2" type="checkbox" value="true"  name="3">
            ${question.option3}
        </div>

        <div class="form-check d-flex align-items-center mb-2">
            <input class="form-check-input position-static mt-0 mr-2" type="checkbox" value="true"  name="4">
            ${question.option4}
        </div>
    </div>
<br>
<br>
    </c:forEach>
</form>
</div>

<script type="text/javascript">
    const testTimeMs = <%
    if (request.getParameter("time")!=null){
        out.print(Integer.parseInt(request.getParameter("time")));
    }else {out.print(10);}


    %> * 60;
    const timerBlock = document.querySelector('#clock');

    function timer (seconds, tick, result) {
        if (seconds > 0) {
            tick(seconds);
            seconds -= 1;
            setTimeout(function () {
                timer(seconds, tick, result);
            }, 1000);
        } else {
            result();
        }
    }

    timer(testTimeMs, function (secondsLeft) {
        const minutes = Math.floor(secondsLeft / 60).toFixed(0);
        const seconds = secondsLeft % 60;
        const modifiedSeconds = seconds < 10 ? '0' + seconds : seconds;
        timerBlock.innerHTML = minutes + ':' + modifiedSeconds;
    }, function () {
        const form = document.querySelector('#form');

        form.submit();
    });

</script>

<script>
    function buildForm() {
        const formValue = [];
        let answers = $('form').serializeArray();
        for (let i = 0; i < answers.length; i++) {
            const answer = answers[i];
            const id = +answer.name;
            const values = answers.filter(ans => ans.name === answer.name).map(ans => +ans.value);
            formValue.push({ id, values });

            answers = answers.filter(ans => ans.name !== answer.name);
            i = -1;
        }

        let xhr = new XMLHttpRequest();
        xhr.open("POST", "${pageContext.request.contextPath}/pass");
        xhr.setRequestHeader( "Content-Type", "application/json" );
        xhr.send(JSON.stringify({formValue}));
    }


</script>


<script src="jquery.countdown.js"></script>
</body>
</html>