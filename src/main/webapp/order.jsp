<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>
<title>온라인 서점</title>
</head>
<body>
	<button>계산기</button>
	<div class="counter" style="display: none">
		<input id="result" value="0">
		<div class="button1">
			<input type="button" value="7" id="button" onclick="add('7')">
			<input type="button" value="8" id="button" onclick="add('8')">
			<input type="button" value="9" id="button" onclick="add('9')">
			<input type="button" value="+" id="operater" onclick="add('+')">
		</div>
		<div class="button2">
			<input type="button" value="4" id="button" onclick="add('4')">
			<input type="button" value="5" id="button" onclick="add('5')">
			<input type="button" value="6" id="button" onclick="add('6')">
			<input type="button" value="-" id="operater" onclick="add('-')">
		</div>
		<div class="button3">
			<input type="button" value="1" id="button" onclick="add('1')">
			<input type="button" value="2" id="button" onclick="add('2')">
			<input type="button" value="3" id="button" onclick="add('3')">
			<input type="button" value="x" id="operater" onclick="add('*')">
		</div>
		<div class="button4">
			<input type="button" value="c" id="reset" onclick="res()"> <input
				type="button" value="0" id="button" onclick="add('0')"> <input
				type="button" value="=" id="operater" onclick="solve()"> <input
				type="button" value="/" id="operater" onclick="add('/')">
		</div>
	</div>
	<script>
		$(document).ready(function(){
			  isShow = true; //변수 하나를 설정 화면에 보이면 true, 보이지 않으면 false;
			  $('button').on('click',function(){
			    if(isShow){ //보이니까 숨기고
			      isShow = false;
			      $('.counter').hide();   //요소를 안보이게 한다.
			    }else{  //안보이니까 보이게 한다
			      isShow = true;
			      $('.counter').show();   //요소를 보이게 한다
			    }
			  })
			})
		
	</script>
	<fieldset>
		<h1>인터넷 프로그래머 문고</h1>
		<h3>제목을 입력하세요:</h3>
		<form method="post">
			책 제목: <input type="text" name="title"> <input type="submit"
				value="검색">
		</form>

		<%
		String MariaDB2 = application.getInitParameter("MariaDB2");
		String MariaDBURL2 = application.getInitParameter("MariaDBURL2");
		String MariaId2 = application.getInitParameter("MariaId2");
		String MariaPasswd2 = application.getInitParameter("MariaPasswd2");

		String title = request.getParameter("title");
		if (title != null) {
			Class.forName(MariaDB2);
			Connection conn = DriverManager.getConnection(MariaDBURL2, MariaId2, MariaPasswd2);
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM book_table WHERE title LIKE '%" + title + "%' ORDER BY title ASC";
			ResultSet rs = stmt.executeQuery(sql);
		%>
		<hr>
		<form method="post" action="order_proc.jsp">
			<table border=1 cellpadding=5>
				<tr>
					<th>주문</th>
					<th>저자</th>
					<th>제목</th>
					<th>가격</th>
					<th>남아있는 수량</th>
				</tr>
				<%
				while (rs.next()) {
					int id = rs.getInt("id");
				%>
				<tr>
					<td><input type="checkbox" name="id" value="<%=id%>"></td>
					<td><%=rs.getString("author")%></td>
					<td><%=rs.getString("title")%></td>
					<td><%=rs.getInt("price")%>원</td>
					<td><%=rs.getInt("qty")%>권</td>
				</tr>
				<%
				}
				%>
			</table>
			<br> <input type="submit" value="주문"> <input
				type="reset" value="초기화">
		</form>
		<a href="<%=request.getRequestURI()%>"><h3>다시 주문하기</h3></a>
		<%
		rs.close();
		stmt.close();
		conn.close();
		}
		%>
	</fieldset>
</body>
</html>