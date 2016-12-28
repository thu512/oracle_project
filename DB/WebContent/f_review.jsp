<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<%request.setCharacterEncoding("UTF-8"); %>   
<%
String num = request.getParameter("num");
String pageNum = request.getParameter("pageNum");
String searchType = request.getParameter("searchType");
String searchText = request.getParameter("searchText");

try{

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
String s1="insert into free_review(NUM, board_num, content, id, reg_date) values(N_freview.NEXTVAL,'"+request.getParameter("num")+"','"+request.getParameter("content")+"','"+session.getAttribute("userid")+"',sysdate)";
Statement st = conn.createStatement();
int i=st.executeUpdate(s1);
st.close();            
conn.close();                                              

}
catch(SQLException e){
	out.println("<script>alert('입력실패.')</script>");
}
finally{
	response.sendRedirect("boardView.jsp?num="+num+"&pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText+"");
	
}
%>