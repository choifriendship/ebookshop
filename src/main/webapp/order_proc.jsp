<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문처리화면</title>
</head>
<body>
	<h1>인터넷 프로그래머 서점</h1>
	<h2>주문해주셔서 감사합니다.</h2>
<%
	String MariaDB2 = application.getInitParameter("MariaDB2");
	String MariaDBURL2 = application.getInitParameter("MariaDBURL2");
	String MariaId2 = application.getInitParameter("MariaId2");
	String MariaPasswd2 = application.getInitParameter("MariaPasswd2");
	
	String[] ids = request.getParameterValues("id");
	if(ids != null) {
	Class.forName(MariaDB2);
	Connection conn = DriverManager.getConnection(MariaDBURL2, MariaId2, MariaPasswd2);
	Statement stmt = conn.createStatement();
	String sql;
	int recordUpdated;
	ResultSet rs;
%>
<table border=2>
	<tr>
		<th>저자</th>
		<th>제목</th>
		<th>가격</th>
		<th>수량</th>
	</tr>
<%
	for(int i = 0; i < ids.length; i++) {
		sql = "UPDATE book_table SET qty = qty -1 WHERE id = " + ids[i];
		recordUpdated = stmt.executeUpdate(sql);
		sql = "SELECT * FROM book_table WHERE id = " + ids[i];
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
%>
	<tr>
		<td><%= rs.getString("author") %></td>
		<td><%= rs.getString("title") %></td>
		<td><%= rs.getInt("price") %>원</td>
		<td><%= rs.getInt("qty") %></td>
	</tr>
<%
		}
		rs.close();
		}
	stmt.close();
	conn.close();
	}
%>
</table>
<a href="order.jsp"><h3>주문화면으로 돌아가기</h3></a>
</body>
</html>