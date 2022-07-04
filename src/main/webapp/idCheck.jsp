<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>
	<h3>아이디 중복 확인 결과</h3>
<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String MariaDB = application.getInitParameter("MariaDB");
	String MariaDBURL = application.getInitParameter("MariaDBURL");
	String MariaId = application.getInitParameter("MariaId");
	String MariaPasswd = application.getInitParameter("MariaPasswd");

	int check = -1;
	
	String id = request.getParameter("id");
	
	try {
		Class.forName(MariaDB);	
		conn = DriverManager.getConnection(MariaDBURL, MariaId, MariaPasswd);
		
		String sql = "SELECT id FROM message2 where id= ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			check = 1;
		}
		else{
			check = 0;
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	if(check==1){
%>
		<b>"입력 id: <%= id %> 는 이미 사용중인 아이디입니다.</b>
		<form name="idCheck" action="idCheck.jsp" method="post">
		<br>다른 아이디를 선택하세요.<br>
		<input type="text" name="id"/>
		<input type="submit" value="중복확인"/>
		</form>
<%
	}
	else{
%>				
		<b>입력 id: <%= id %>는 사용하실 수 있는 아이디입니다.</b>
		<input type="hidden" id="conf" value="1">
		<input type="button" value="닫기" onclick="setid(id)">
<%		
	}
%>
<script> // jsp에서 id를 가져와 js에서 사용하기 위해 js를 따로 설정
	function setid(){
		opener.document.join.id.value= "<%=id %>";
		window.self.close();
		
		let a = document.querySelector("#conf"); // 중복 확인이 끝나면 value 값이 1로 되어 중복체크 알림이 뜨지 않는다. 
		if(a.value == 1){
			opener.document.querySelector("#hidden_id").value = "1";
		}
	}
</script>    
</body>
</html>