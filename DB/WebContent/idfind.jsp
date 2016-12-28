<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<%


	String name=request.getParameter("name");
	
	String phone=request.getParameter("phone");
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT id FROM usr where name='"+name+"' and phone='"+phone+"'");
	
	if(rs.next()){
		out.println("<script>alert('id는 "+rs.getString("id")+" 입니다.');history.back();</script>");
	}
	else{
		out.println("<script>alert('일치하는 아이디가 없습니다.');history.back();</script>");
	}
%>

