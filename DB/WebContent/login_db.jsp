<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

if(request.getParameter("id").equals("admin")){
	 if(request.getParameter("pw").equals("admin")){
		 response.sendRedirect("admin.jsp");
		 return;
	 }
}

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");

String sql="SELECT * FROM usr WHERE id='"+request.getParameter("id")+"'";
Statement st=conn.createStatement();
ResultSet rs= st.executeQuery(sql);       
boolean flag=false;   


if(rs.next()){
	
	 
	 String ps=request.getParameter("pw");
	 if(ps.equals(rs.getString("pw"))){
		 String uid=request.getParameter("id");
			if(session.isNew()||session.getAttribute("userid")==null){
				session.setAttribute("userid",uid);
			}
			session.setMaxInactiveInterval(1800000);
		 flag=true;
	 }
	 else{
		 out.println("<script>alert('pw가 틀렸습니다.'); history.back(); </script>");
	 }
	 
	 
	}
	else{
		out.println("<script>alert('id가존재하지않습니다.'); history.back(); </script>");
	}

rs.close();
st.close();
conn.close();
if(flag){
	response.sendRedirect("main.jsp");
}
%>