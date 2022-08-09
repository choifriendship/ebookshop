<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('a2f0eba2ccdc01557a0f3e7bf52fe18b'); //발급받은 키 중 javascript키를 사용해준다.
	Kakao.isInitialized();
	function kakaoLogin() {
		Kakao.Auth.loginForm({
			scope : "profile_nickname, account_email",
			success : function(response) {
				console.log(response);
				Kakao.API.request({
					url : "/v2/user/me",
					success : function(res) {
						console.log(res);
						window.location.href = 'main.jsp';
					}
				});
			}
		});
	}
</script>
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
		<form action="loginProcess.jsp" method="post">
			<fieldset>
				<legend>로그인</legend>
				<table>
					<tr>
						<td><label for="id">아이디: </label></td>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<td><label for="pw">비밀번호: </label></td>
						<td><input type="text" name="pw" id="pw"></td>
					<tr>
						<td colspan="2"><input type="submit" value="로그인"> <input
							type="reset" value="다시 작성"></td>
					</tr>
					<tr>
						<td><a href="javascript:kakaoLogin()"><img
								src="kakao_login_small.png"></a></td>
					</tr>
					<tr>
						<td><a href="join.jsp" class="join">회원가입</a></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</section>
</body>
</html>