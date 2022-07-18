<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
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
					<td><a href="logout.jsp">로그아웃</a></td>
				</tr>
			</table>
  </fieldset>
</body>
</html>