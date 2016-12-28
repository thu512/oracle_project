<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>

<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
PreparedStatement pstmt;
ResultSet rs;

String s1="select id from usr where id= ?";            
pstmt=conn.prepareStatement(s1);         
pstmt.setString(1, request.getParameter("id"));                                                
rs=pstmt.executeQuery();
if(rs.next()){
    out.println("<script>opener.join.id.value='';alert('중복된아이디가 있습니다.'); window.close();</script>");
   
    
 }
 else{
	 out.println("<script>opener.join.id_hidden.value='"+request.getParameter("id")+"';alert('사용 가능 합니다.');window.close();</script>");
   	
 }

%>
