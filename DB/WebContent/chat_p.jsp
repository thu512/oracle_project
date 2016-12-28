<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
String s1="insert into chat values('"+request.getParameter("id")+"','"+session.getAttribute("userid")+"','"+request.getParameter("chat")+"',sysdate,1)";
Statement st = conn.createStatement();
int i=st.executeUpdate(s1);
st.close();            
conn.close();                                              

}
catch(SQLException e){
	out.println("<script>alert('입력실패.')</script>");
}
finally{
	out.println("<script>");
	out.println("var url = \"pro_chat.jsp?id=" + request.getParameter("id")+"\";");
	out.println("window.open(url, 'get', 'height =500, width = 500');");
	out.println("</script>");
}
%>
</body>
</html>