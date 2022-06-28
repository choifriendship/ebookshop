<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginArea {
		width: 300px;
	}
	table {
		float: left;
	}
	a {
		font-size: small;
	}
</style>
</head>
<body>
	<section id="loginArea">
		<form action="main.jsp" method="post">
		<fieldset>
			<legend>로그인</legend>
				<table>
					<tr>
						<td><label for="id">아이디: </label></td>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="로그인">
						<input type="reset" value="다시 작성"></td>
					</tr>
					<tr>
						<td><a href="joinForm_1.jsp" class="join">회원가입</a></td>
					</tr>
				</table>
		</fieldset>
		</form>
	</section>
</body>
</html>