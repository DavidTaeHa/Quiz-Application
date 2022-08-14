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
<h1>Register</h1>
<form action="/register" method="POST">
    <label for="username">Username</label>
    <input id ="username" type="text" name="username_input"/>
    <br/>
    <label for="password">password</label>
    <input id = "password" type="password" name="password_input"/>
    <br/>
    <label for="confirm_password">confirm password</label>
    <input id = "confirm_password" type="password" name="confirm_password_input"/>
    <button type="submit">submit</button>
</form>
<p>${match_error}</p>
<p>${fill_error}</p>
<p>${name_error}</p>
<form action="index.jsp">
    <button type="back">Back</button>
</form>
</body>
</html>