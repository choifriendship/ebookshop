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
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me', // 계정 정보를 가져오는 url
					success : function(response) {

						console.log(response)

						sessionStorage.setItem("kakao_nickname",
								response.kakao_account.profile.nickname);
						sessionStorage.setItem("kakao_email",
								response.kakao_account.email);
						window.location.href='main.jsp'

					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
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
	<ul>
		<li onclick="kakaoLogin();"><a href="javascript:void(0)"> <span>카카오
					로그인</span>
		</a></li>
	</ul>

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
						<td><a href="join.jsp" class="join">회원가입</a></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</section>
</body>
</html>