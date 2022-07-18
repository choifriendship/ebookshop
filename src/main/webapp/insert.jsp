<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
</head>
<body>
<%
	String name, email, subject, memo, time;
	name = request.getParameter("name");
	email = request.getParameter("email");
	time = request.getParameter("time");
	subject = request.getParameter("subject");
	memo = request.getParameter("memo");
	
	ResultSet rs = null;
	String sql;
	Connection conn = null;
	Statement stmt = null;
	
	String MariaDB = application.getInitParameter("MariaDB");
	String MariaDBURL = application.getInitParameter("MariaDBURL");
	String MariaId = application.getInitParameter("MariaId");
	String MariaPasswd = application.getInitParameter("MariaPasswd");
	
	try {
		Class.forName(MariaDB);
		conn = DriverManager.getConnection(MariaDBURL, MariaId, MariaPasswd);
	} catch(Exception e) {
		out.println("데이터베이스 접속에 문제가 있습니다.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	stmt = conn.createStatement();
	
	sql = "INSERT INTO message (subject, name, time, memo, email) values ('" + subject + "', '" + name + "', '" + time + "', '" + memo + "', '" + email + "');";
	try {
		stmt.executeQuery(sql);
	} catch(Exception e) {
		out.println("데이터베이스 삽입 연산이 실패하였습니다.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<h3>게시글이 등록되었습니다.</h3>
<a href="list.jsp">게시글 리스트 보기</a>
</body>
</html>