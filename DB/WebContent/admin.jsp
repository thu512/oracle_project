<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자님 안녕하세요</title>

<style>

	body {
	background-image:url('img/admin.jpg');
	background-repeat:no-repeat;
	background-size:cover;
	}

	table{
	width:100%;
	boarder : 1px solid black;
	border-collapse : collapse;
	background-color: rgba( 213, 213, 213, 0.5 );
	}
	
	td{
		align:center;
	}
	
	#print{
	text-align:right;
	}
	
	#banner{
    text-align: center;
  	}
  	
	#banner a { 
	text-decoration: none;	
	}
	
	#b{
	text-decoration: none;
	background: gray;
	}
	
	#b:hover{
	background: red;
	}
</style>
</head>
<body>
	<div id="banner">
		<a href="admin.jsp">
		<img src="img/logo.jpg" width="290" height="78" >		
		</a>
	</div>
	<br>
	<center>
	<a id="b" href="index.jsp">처음으로</a>
	</center>
	
	<%

	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM usr where id <> 'admin'");
	out.println("<center><br>");
	out.println("<h2>관리자 페이지</h2>");
	out.println("<br>");
	
	out.println("<table border="+1+">");
	out.println("<tr><td colspan=7 width=90% align=center>");
	out.println("회원 목록</td></tr>");
	out.println("<tr>");
	
	out.println("<td align=center>");
	out.println("분류");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("아이디");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("이름");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("핸드폰");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("이메일");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("분야");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("action");	
	out.println("</td>");
	out.println("</tr>");
	
	
	while(rs.next()){
		String kind=rs.getString("kind");
		String id=rs.getString("id");
		String name=rs.getString("name");
		String phone=rs.getString("phone");
		String email=rs.getString("email");
		String major=rs.getString("major");
		
		
		
		
		out.println("<tr>");		
		out.println("<td align='center'>"+kind+"<BR></td>");
		out.println("<td align='center'>"+id+"<BR></td>");
		out.println("<td align='center'>"+name+"<BR></td>");
		out.println("<td align='center'>"+phone+"<BR></td>");
		out.println("<td align='center'>"+email+"<BR></td>");
		out.println("<td align='center'>"+major+"<BR></td>");

		
		if(!id.equals("admin")){
			out.println("<td align='center'><input style='WIDTH: 100%;' type='button' value='추방' onclick=\"unregister('"+rs.getString("id")+"')\"/><BR></td>");
		}
		out.println("</tr>");
	}
	
	out.println("</table>");
	out.println("<p id='print'><input type='button' value='회원정보 출력' onClick=\"window.location='print.jsp'\"></p>");
	ResultSet rs1 = st.executeQuery("SELECT * FROM mboard");
	out.println("<br><br><br>");
	
	out.println("<table border="+1+">");
	out.println("<tr><td colspan=5 width=90% align=center>");
	out.println("분야게시판 목록</td></tr>");
	out.println("<tr>");
	
	out.println("<td align=center>");
	out.println("제목");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("게시자");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("분야");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("등록일");	
	out.println("</td>");
	
	
	out.println("<td align=center>");
	out.println("action");	
	out.println("</td>");
	out.println("</tr>");
	
	
	while(rs1.next()){
		String subject=rs1.getString("subject");
		String writer=rs1.getString("writer");
		String reg_date=rs1.getString("reg_date");
		String major=rs1.getString("major");
		
		
		
		
		out.println("<tr>");		
		out.println("<td align='center'>"+subject+"<BR></td>");
		out.println("<td align='center'>"+writer+"<BR></td>");
		
		out.println("<td align='center'>"+major+"<BR></td>");
		out.println("<td align='center'>"+reg_date+"<BR></td>");
	
		out.println("<td align='center'><input style='WIDTH: 100%;' type='button' value='삭제' onclick=\"unregisterMboard("+rs1.getInt("num")+")\"/><BR></td>");
		
		out.println("</tr>");
	}
	
	out.println("</table>");
	
	
	ResultSet rs2 = st.executeQuery("SELECT * FROM board");
out.println("<br><br><br><br>");
	
	out.println("<table border="+1+">");
	out.println("<tr><td colspan=4 width=90% align=center>");
	out.println("자유게시판 목록</td></tr>");
	out.println("<tr>");
	
	out.println("<td align=center>");
	out.println("제목");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("게시자");	
	out.println("</td>");
	
	out.println("<td align=center>");
	out.println("등록일");	
	out.println("</td>");
	
	
	out.println("<td align=center>");
	out.println("action");	
	out.println("</td>");
	out.println("</tr>");
	
	
	while(rs2.next()){
		String subject=rs2.getString("subject");
		String writer=rs2.getString("writer");
		String reg_date=rs2.getString("reg_date");
		
		out.println("<tr>");		
		out.println("<td align='center'>"+subject+"<BR></td>");
		out.println("<td align='center'>"+writer+"<BR></td>");
		
		
		out.println("<td align='center'>"+reg_date+"<BR></td>");
	
		out.println("<td align='center'><input style='WIDTH: 100%;' type='button' value='삭제' onclick=\"unregisterboard("+rs2.getInt("num")+")\"/><BR></td>");
		
		out.println("</tr>");
	}
	
	out.println("</table>");
	out.println("<br><br>");
	
	st.close();
	rs.close();
	rs1.close();
	
	conn.close();
%>

</body>

<script type="text/javascript">
	function unregister(id){
		location.href="unregister.jsp?id="+id;
	}
	
	function unregisterMboard(num){
		location.href="unregisterMboard.jsp?num="+num;
	}
	
	function unregisterboard(num){
		location.href="unregisterboard.jsp?num="+num;
	}
</script>
</html>