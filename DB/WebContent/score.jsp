<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	int score=0;
	int s_score=0;

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select score from usr where id='"+request.getParameter("id")+"'");
	if(rs.next()){
		score=rs.getInt(1);
		
	}
	s_score=score+Integer.parseInt(request.getParameter("score"));
	PreparedStatement pstm = con.prepareStatement("update usr set score=? where id=?");
	pstm.setInt(1, s_score);
	pstm.setString(2, request.getParameter("id"));
	int i =pstm.executeUpdate();
	out.println("<script>window.close();</script>");
%>
