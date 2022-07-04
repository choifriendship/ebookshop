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
	      <input type="hidden" id="idDuplication" value="idUncheck">
	      
	      <label for= "name">이름</label>
	      <input type="text" name="name" id="name" required="required"/>
	      
	      <input type="submit" class="join" value="회원가입" onclick="joinCheck()">
	  </fieldset>
	</form>
</body>
<script type="text/javascript">
function idCheck(){ // join.jsp
	let id = join.id.value;
	let url = "idCheck.jsp?id=" +id;
	
	if(!id) {
		alert("아이디를 입력하세요");
	}
	else {
	window.open(url, "idCheck", "width=400, height=200"); // idCheck라는 임의의 이름으로 창이 열린다.
	}
}

function joinCheck() { // join.jsp
	document.join.idDuplication.value = "idUncheck"
}
</script>
</html>