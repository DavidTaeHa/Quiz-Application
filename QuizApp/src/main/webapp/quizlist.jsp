<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<h1>Quizlist</h1>
<form action="/quiz" method="GET">
  <label for="stars">Choose a Quiz to take:</label>
  <select name="topic" id="topic">
    <option value="Geography">Geography</option>
    <option value="Math">Math</option>
    <option value="History">History</option>
  </select>
  </br>
  <input type="submit" value="Submit">
</form>
</body>
</html>