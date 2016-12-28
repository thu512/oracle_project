<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	if(session.isNew()|| session.getAttribute("userid")==null){
		response.sendRedirect("login.jsp");
	}
	else{
		response.sendRedirect("main.jsp");
	}
%>

</body>
</html>    