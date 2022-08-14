<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="nav.jsp" %>
<h1>Feedback</h1>
<form action="/feedback" method="POST">
  <label for="stars">Choose a Rating:</label>
  <select name="stars" id="stars">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
  </select>
  </br>
  <label for="feedback">Feedback:</label>
   <textarea id ="feedback" col="50" row="10" name="feedback"></textarea>
  <input type="submit" value="Submit">
</form>
<p>${message}</p>
<p>${fill_error}</p>
</body>
</html>