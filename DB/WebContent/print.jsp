<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>



<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM usr where id <> 'admin'");
PrintWriter writer = null;

Date dt = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd,hh-mm"); 

try{
	String filePath = "C:\\Project\\DB\\WebContent\\save\\"+sdf.format(dt).toString()+".txt";
	System.out.println(filePath);
	writer = new PrintWriter(filePath);
	
	writer.println(String.format("%-10s%-10s%-10s%-13s%-20s%-20s", "kind","major","id","name","phone","email"));
while(rs.next()){
		String kind=rs.getString("kind");
		String id=rs.getString("id");
		String name=rs.getString("name");
		String phone=rs.getString("phone");
		String email=rs.getString("email");
		String major=rs.getString("major");
		writer.println(String.format("%-10s%-10s%-10s%-10s%-20s%-20s", kind,major,id,name,phone,email,major));
		}

}catch(IOException ioe){
	ioe.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}
finally{
	writer.close();
	rs.close();
	st.close();
	conn.close();
	out.println("<script>alert('파일저장이 완료되었습니다.');</script>");
	response.sendRedirect("admin.jsp");
}
%>