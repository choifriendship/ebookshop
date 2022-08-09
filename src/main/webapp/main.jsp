<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('a2f0eba2ccdc01557a0f3e7bf52fe18b'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그아웃  
function kakaoLogout() {
	if (Kakao.Auth.getAccessToken()) {
		Kakao.API.request({
			url : '/v1/user/unlink',
			success : function(response) {
				console.log(response)
				window.location.href='login.jsp';
			},
			fail : function(error) {
				console.log(error)
			},
		})
		Kakao.Auth.setAccessToken(undefined)
	}
	
}
</script>
<style>
	* {
    margin: 0 auto;
    padding: 10px;
    text-align: center;
  }
  table {
    border-spacing: 10px;
  }
  td {
    border: 1px solid black;
    border-radius: 5px;
  }
</style>
</head>
<body>
  <fieldset>
    <h3>온라인 서점 사이트</h3>
			<table>
				<tr>
					<td><a href="order.jsp">주문하기</a></td>
				</tr>
				<tr>
					<td><a href="list.jsp">게시판으로 가기</a></td>
				</tr>
				<tr>
					<td><a href="logout.jsp" onclick="kakaoLogout()">로그아웃</a></td>
				</tr>
			</table>
  </fieldset>
</body>
</html>