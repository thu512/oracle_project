<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
Statement st = conn.createStatement();
String sql="DELETE FROM usr where id='"+request.getParameter("id")+"'";
String sql1="DELETE FROM chat where usrid='"+request.getParameter("id")+"'";
String sql2="DELETE FROM free_review where id='"+request.getParameter("id")+"'";
String sql3="DELETE FROM mboard where writer='"+request.getParameter("id")+"'";
String sql4="DELETE FROM mreview where id='"+request.getParameter("id")+"'";
String sql5="DELETE FROM board where writer='"+request.getParameter("id")+"'";

int i=st.executeUpdate(sql);
int i1=st.executeUpdate(sql1);
int i2=st.executeUpdate(sql2);
int i3=st.executeUpdate(sql3);
int i4=st.executeUpdate(sql4);
int i5=st.executeUpdate(sql5);

st.close();
conn.close();

response.sendRedirect("admin.jsp");


%>
