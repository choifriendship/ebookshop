<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<style>
	fieldset {
	  width: 220px;
	  border: 1px solid gray;
	}
	input[type=text] {
	  width: 200px;
      margin: 5px;
      margin-top: 6px;
      margin-bottom: 5px;
	}
	input[type=submit] {
	  position: relative;
	  left: 5px;
	}
	.join {
	  width: 200px;
	  height: 40px;
	  color: white;
	  background-color: black;
	  border-radius: 10px;
	}
	label {
	  font-size: small;
	}
</style>
</head>
<body>
	<form name="join" action="joinProcess.jsp" method="get">
	  <fieldset>
	      <label for= "id">아이디</label>
	      <input type="text" name="id" id="id">
	      
	      <input type="button" value="중복확인" onclick="idCheck()"><br>
	      
	      <label for= "name">이름</label>
	      <input type="text" name="name" id="name">
	      
	      <input type="submit" class="join" value="회원가입" onclick="joinCheck()">
	  </fieldset>
	</form>
<script type="text/javascript" src="script.js"></script>
</body>
</html>