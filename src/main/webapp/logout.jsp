<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 회원 인증 정보 속성 삭제
	session.removeAttribute("id");

	// 속성 삭제 후, 페이지 이동
	response.sendRedirect("login.jsp");
%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>