<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<h1>Login</h1>
<form action="/login" method="POST">
    <label for="username">Username</label>
    <input id ="username" type="text" name="username_input"/>
    <br/>
    <label for="password">password</label>
    <input id = "password" type="password" name="password_input"/>
    <button type="submit">submit</button>
</form>
<p>${exception}</p>
<form action="register.jsp">
    <button type="submit">Register</button>
</form>
<p>${message}</p>
</body>
</html>