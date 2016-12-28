<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<title>Insert title here</title>
	
</head>
<style type="text/css">
	* {font-size: 9pt;}
	p {width: 100%; text-align: right;}
	table tbody tr th {background-color: gray;}
	table{
		width:100%;
	}
</style>
<body>
<%
	


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
String s1="select * from chat where (mid='"+request.getParameter("id")+"' and usrid='"+session.getAttribute("userid")+"') or (usrid='"+request.getParameter("id")+"' and mid='"+session.getAttribute("userid")+"') order by reg_date";
String s2="update chat set push=0 where mid='"+session.getAttribute("userid")+"' and usrid='"+request.getParameter("id")+"'";
Statement st = conn.createStatement();
ResultSet rs =st.executeQuery(s1);
%>
	
<form method="post" action="chat_p.jsp">
	<table border="1" summary="채팅창" >
		<caption>채팅방</caption>
		
		<tbody>
			<tr>
				<th width="20%" align="center">질문자ID</th>
				<td width="30%"><input style="WIDTH: 50%;" type="text" name="subject" readonly name='contents' value="<%=request.getParameter("id")%>"/></td>
				<th width="20%" align="center">작성자</th>
				<td width="30%"><input style="WIDTH: 50%;" type="text" name="writer"  readonly name='contents' value="<%=session.getAttribute("userid") %>"/></td>
			</tr>
			<tr>
				<td align="center" colspan="4">
					<% 
					
					out.print("<textarea id='ca' style='WIDTH: 98%; HEIGHT: 100%' readonly name='contents' cols='50' rows='10'>");
					while(rs.next()){
						
						out.println("["+rs.getString("usrid")+"]: "+rs.getString("contents")+" - "+rs.getString("reg_date"));
						
					}
					try{
						st.executeUpdate(s2);
					}catch(SQLException e){
						out.println("<script>alert('새로운 메세지가 없습니다.');</script>");
					}finally{
						rs.close();
						st.close();
						conn.close();
					}
					%>
					</textarea>
					<input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3" width="70%">
					<input style="WIDTH: 95%;" type="text" name="chat" id="ch"/>
					
				</td>
				<td  width="30%">
					<input style="WIDTH: 100%;" type="submit" value="글쓰기"/>
					
				</td>
			</tr>
		</tbody>
	</table>
	<br>
	<input style="WIDTH: 100%;" type="button" value="종료" onclick="win_close()"/>
</form>

</body>
<script>
function set_ta_scroll(){
    document.getElementById('ca').scrollTop = document.getElementById('ca').scrollHeight;
}

window.onload = set_ta_scroll;

function chat(id,text){
	alert("asdasd");
	var ch = document.getElementById('ch');
	var ca = document.getElementById('ca');
	ca.value += id+":"+text+"\n";
	ch.value=" ";
}
	
function win_close(){
	window.close();
}

setTimeout("location.reload()",20000);

	
</script>
</html>
	