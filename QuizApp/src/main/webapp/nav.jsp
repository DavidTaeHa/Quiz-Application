<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <title>Home Page</title>
    </head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href=" ">Quiz Home</a >
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/mainpage">Home</a >
        </div>
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="${pageContext.request.contextPath}feedback.jsp">Feedback</a>
        </div>
        <div class="navbar-nav">
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}quizlist.jsp">Quiz</a>
                </div>
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </div>
</nav>
</body>
</html>