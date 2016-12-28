<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<%
	String name=request.getParameter("name");
	
	String id=request.getParameter("id");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT pw FROM usr where name='"+name+"' and id='"+id+"'");
	
	if(rs.next()){
		out.println("<script>alert('비밀번호는 "+rs.getString("pw")+" 입니다.');history.back();</script>");
	}
	else{
		out.println("<script>alert('잘못입력하셨습니다.');history.back();</script>");
	}
%>

