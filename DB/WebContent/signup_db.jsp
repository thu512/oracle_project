<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
Statement st = conn.createStatement();

String kind=request.getParameter("kind");
String id=request.getParameter("ID");
String pw=request.getParameter("pwd");
String name=request.getParameter("Name");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String major=request.getParameter("major");

int i=st.executeUpdate("insert into usr(kind, id, pw, name, phone, email, major) values('"+kind+"','"+id+"','"+pw+"','"+name+"','"+phone+"','"+email+"','"+major+"')");
if(i>0){
	st.close();
	conn.close();
	out.println("<script>alert('정상적으로 가입되었습니다.')</script>");
	response.sendRedirect("login.jsp");
}
else{
	out.println("<script>alert('잘못입력됬습니다.')</script>");
}

%>