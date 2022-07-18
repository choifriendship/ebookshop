<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
	String id = request.getParameter("id");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String MariaDB = application.getInitParameter("MariaDB");
	String MariaDBURL = application.getInitParameter("MariaDBURL");
	String MariaId = application.getInitParameter("MariaId");
	String MariaPasswd = application.getInitParameter("MariaPasswd");
	
	Boolean connect = false;
	
	try {
		
		// 1. 데이터베이스(mariaDB) 드라이버 로드
		Class.forName(MariaDB);
		
		// 2. 드라이버 매니저 연결 + 커넥션 생성
		conn = DriverManager.getConnection(MariaDBURL, MariaId, MariaPasswd);
		
		connect = true;
		
		// conn을 받아 store에 저장
		stmt = conn.createStatement();
		
		String sql = "SELECT * FROM message2 WHERE id ='" + id + "'";
		
		// 데이터베이스에서  sql 실행 후 결과 값을 가져온다.
		rs = stmt.executeQuery(sql);
		
		//rs에 있는 것을 하나하나씩 꺼내온다.
		while(rs.next()){
			if(rs.getString("id").equals(id)){
				// 세션에 id란 변수에 이름을 담아서 저장
				int level = Integer.parseInt(rs.getString("level")); 
				session.setAttribute("id", id);
				session.setAttribute("level", level);
				response.sendRedirect("main.jsp");
			}
		}
		
		// 아니라면 로그인 화면으로 돌아간다.
		 response.sendRedirect("login.jsp");
	}
	catch (Exception e){
		connect = false;
		e.printStackTrace();
	} 
	finally {
		try {
			rs.close();
			stmt.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
</body>
</html>