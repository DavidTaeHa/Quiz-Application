<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
<h1>${topic} Quiz</h1>
<h2>${userName}&#39;s Results</h2>
<p>Elapsed Time: ${minutes}:${seconds}</p>
<table class="table">
    <thead>
    <tr>
        <th>Description</th>
        <th>User Answer</th>
        <th>Actual Answer</th>
        <th>Correctness</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${qa.answerInputs}" var="a">
        <tr>
            <td><c:out value="${a.question.description}"></c:out></td>
            <td><c:out value="${a.answerInput}"></c:out></td>
            <td><c:out value="${a.question.answer}"></c:out></td>
            <td><c:out value="${a.correct}"></c:out></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p>Score: ${score}/10</p>
<p>${result}</p>
<form action="quizlist.jsp">
    <button type="submit">Go to Quiz Menu</button>
</form>
</body>
</html>