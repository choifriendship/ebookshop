<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<%
	Connection conn = null;
	Statement stmt = null;

	request.setCharacterEncoding("UTF-8");
	String id 	  = request.getParameter("id");
	String name   = request.getParameter("name");
	int level = 1;
	
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/board";
	
	try {
		Class.forName(driver);
		// 드라이버 연결 DB 커넥션 객체를 얻는다.
		conn = DriverManager.getConnection(url,"java","java");
		
		// SQL 문을 DBMS에 전송할 수 있는 Statement 객체 생성
		stmt = conn.createStatement();
		
		String sql="INSERT INTO message2 VALUES ('"+id+"','"+name+"','"+level+"');";
		// SQL 문을 수행한다. stmt 객체를 반환한다.
		stmt.executeQuery(sql);
		
		// 가입이 완료되면 로그인 화면으로 이동한다.
		System.out.print("가입완료");
		response.sendRedirect("login.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				stmt.close();
				conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
%>
</body>
</html>