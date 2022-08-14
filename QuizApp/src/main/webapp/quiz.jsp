<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form action="/answer?index=${index}" method="post" >
    <p>${index+1}. ${qa.answerInputs.get(index).question.description}<p><br/>

    <c:if test = "${qa.answerInputs.get(index).answerInput.equals(qa.answerInputs.get(index).question.mc1)}">
    <input type="radio" id="mc1"  name = "mc" value="${qa.answerInputs.get(index).question.mc1}" checked>
    </c:if>
    <c:if test = "${!qa.answerInputs.get(index).answerInput.equals(qa.answerInputs.get(index).question.mc1)}">
    <input type="radio" id="mc1"  name = "mc" value="${qa.answerInputs.get(index).question.mc1}">
    </c:if>
    <label for="mc1">${qa.answerInputs.get(index).question.mc1}</label><br>

    <c:if test = "${qa.answerInputs.get(index).answerInput.equals(qa.answerInputs.get(index).question.mc2)}">
    <input type="radio" id="mc2" name = "mc" value="${qa.answerInputs.get(index).question.mc2}" checked>
    </c:if>
    <c:if test = "${!qa.answerInputs.get(index).answerInput.equals(qa.answerInputs.get(index).question.mc2)}">
    <input type="radio" id="mc2" name = "mc" value="${qa.answerInputs.get(index).question.mc2}">
    </c:if>
    <label for="mc2">${qa.answerInputs.get(index).question.mc2}</label><br>

    <c:if test = "${qa.answerInputs.get(index).answerInput.equals(qa.answerInputs.get(index).question.mc3)}">
    <input type="radio" id="mc3" name = "mc" value="${qa.answerInputs.get(index).question.mc3}" checked>
    </c:if>
    <c:if test = "${!qa.answerInputs.get(index).answerInput.equals(qa.answerInputs.get(index).question.mc3)}">
    <input type="radio" id="mc3" name = "mc" value="${qa.answerInputs.get(index).question.mc3}">
    </c:if>
    <label for="mc3">${qa.answerInputs.get(index).question.mc3}</label><br>

    <c:if test = "${qa.answerInputs.get(index).answerInput.equals(qa.answerInputs.get(index).question.mc4)}">
    <input type="radio" id="mc4" name = "mc" value="${qa.answerInputs.get(index).question.mc4}" checked>
    </c:if>
    <c:if test = "${!qa.answerInputs.get(index).answerInput.equals(qa.answerInputs.get(index).question.mc4)}">
    <input type="radio" id="mc4" name = "mc" value="${qa.answerInputs.get(index).question.mc4}">
    </c:if>
    <label for="mc4">${qa.answerInputs.get(index).question.mc4}</label><br>

    <c:if test = "${index != 0}">
    <button type="submit" class="btn btn-primary" id="previous" name = "action" value = "previous">Previous</button>
    </c:if>

    <c:if test = "${index != qa.answerInputs.size()-1}">
    <button type="submit" class="btn btn-primary" id="next" name = "action" value = "next">Next</button>
    </c:if>

    <c:if test = "${index == qa.answerInputs.size()-1}">
    <button type="submit" class="btn btn-primary" id="subQa" name = "action" value = "finish">Submit</button>
    </c:if>
    <br>
    <p>${exception}</p>
    <br>
    <div class="btn-group" style="width:100%">
      <button style="width:10%" name="action" value="1">1</button>
      <button style="width:10%" name="action" value="2">2</button>
      <button style="width:10%" name="action" value="3">3</button>
      <button style="width:10%" name="action" value="4">4</button>
      <button style="width:10%" name="action" value="5">5</button>
      <button style="width:10%" name="action" value="6">6</button>
      <button style="width:10%" name="action" value="7">7</button>
      <button style="width:10%" name="action" value="8">8</button>
      <button style="width:10%" name="action" value="9">9</button>
      <button style="width:10%" name="action" value="10">10</button>
    </div>
</form>
</body>
</html>