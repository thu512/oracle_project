<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
Statement st = conn.createStatement();
String sql="DELETE FROM board where num="+request.getParameter("num")+"";
int i=st.executeUpdate(sql);
boolean flag=false;
if(i>0){
	flag=true;
}

st.close();
conn.close();
if(flag){
	response.sendRedirect("admin.jsp");
}

%>
