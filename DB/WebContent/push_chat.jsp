<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*"  %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<meta http-equiv="Content-Type" content="text/html" >
<title>환영합니다.</title>


<style>
* {font-size: 9pt;}
p {width: 600px; text-align: right;}
table thead tr th {background-color: gray;}
#login{text-align: left;}
#login a{
	 text-decoration: none;
	 color: gray;
}
#banner{text-align: center;}
#banner a {text-decoration: none;}

#menu_bar {
	width: 100%;
	margin-top: 20px;
	text-align:center;
	margin-bottom: 80px;	
}

#menu_bar a{
	width: 25%;
	float:left;
	text-align:center;
	padding-top: 10px;
	padding-bottom: 10px;
	color: #898989;
	text-decoration: none;
	border-top: 1px solid gray;
    border-bottom: 1px solid gray;
	margin-left: auto;
	margin-right: auto;
	color: black;
}

#menu_bar a:hover {
	background:rgba(0,0,0,0.5);
}


#logout{
	margin-left:10px;	
}

table{
	width: 50%;
	margin-top: 30px;
	margin: 0 auto;
	border-collapse: collapse;
	cellspacing: 10px;
}
tr{
	margin-right:10%;
}
</style>

</head>
<body>

	<div id="login">
		<%=session.getAttribute("userid") %>
		<input type="button" value="로그아웃" onclick="window.location='logout.jsp'"/>
		
	</div>
	
	<div id="banner">
		<a href="main.jsp">
		<img src="img/logo.jpg" width="290" height="78" >
			
		</a>
	</div>
	
	<div id="menu_bar">		      	
    	<a href="info.jsp" class="button">고장 검색</a>
    	<a href="#" class="button">질문답변</a>
    	<a href="mboardList.jsp" class="button">분야게시판</a>
    	<a href="boardList.jsp" class="button">자유게시판</a>   	  	   
  	</div>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
String sql="SELECT distinct usrid FROM chat WHERE mid='"+request.getParameter("id")+"'";
Statement st=conn.createStatement();
ResultSet rs= st.executeQuery(sql);  
Statement st1=conn.createStatement();
ResultSet rs1=null;
%>
  	<table border="1">
  		<tr>
  			<td colspan="2" align="center">
  			답변하기
  			</td>  			
  		</tr>
  		
  		
<% 
  	while(rs.next()){
  		String s1="select count('usrid') from chat where usrid='"+rs.getString("usrid")+"' and push=1 and mid='"+request.getParameter("id")+"'";
		rs1=st1.executeQuery(s1);
		rs1.next();
  		out.println("<tr>");
  		out.println("<td width='80%'>");
  		out.print(rs.getString("usrid")+"("+rs1.getInt(1)+")");
  		
  		out.println("</td>");
  		out.print("<td width='20%' align='center'><input type='button' value='답변하기' onclick=\"idcheck('"+rs.getString("usrid")+"')\"/></td>");
  		out.println("</tr>");
  	
  		  }
  		  
 
%>	
  	</table>
  	
  	
  	
</body>
<script>
function idcheck(id){   
	   var url = "pro_chat.jsp?id=" + id;
	   window.open(url, "get", "height =500, width = 500");
	  }
setTimeout("location.reload()",10000);
</script>
</html>
