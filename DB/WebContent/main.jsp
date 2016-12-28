<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<meta http-equiv="Content-Type" content="text/html" >
<title>환영합니다.</title>


<style>
#footer-area {
    width:100%;
    height: 7%;
    font-size: 0.5em;
    margin-top: 50px;
   
    background-color: #555;
  	padding-top: 10px;
	padding-bottom: 10px;
    color: white;
    text-align: center;
    font-weight: bold;    
}
html{
	margin-left: -10px;
}
#login{
	text-align: left;
}
#login a{
	text-decoration: none;
	color: gray;
}
#banner{ 
	marging-left:10px;
	text-align: center;
}
#banner a { 
	text-decoration: none;
}

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
	width: 100%;
	margin-top: 30px;
	border-collapse: collapse;
	cellspacing: 10px;
}
tr{
	margin-right:10%;
}
#f{
	color:red;
}
.table_type1 {width:100%;border-collapse:collapse;}
		
		
.table_type1 th, .table_type1 td {font-size:12px;color:#666;height:30px;max-width:0;text-overflow: ellipsis;-o-text-overflow: ellipsis;-moz-binding: url('ellipsis.xml#ellipsis');white-space: nowrap;overflow:hidden;}
* {font-size: 9pt;}
p {width: 600px; text-align: right;}
table thead tr th {background-color: gray;}
</style>
</head>
<body>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");	
String sql="SELECT * FROM usr WHERE id='"+session.getAttribute("userid")+"'";
Statement st1=conn.createStatement();
ResultSet rs1= st1.executeQuery(sql);       
   
int count=0;

if(rs1.next()){
	
		String s1="select count('mid') from chat where mid='"+session.getAttribute("userid")+"' and push=1";
		rs1= st1.executeQuery(s1); 
		if(rs1.next()){
			count=rs1.getInt(1);			
		}
		rs1= st1.executeQuery(sql);
	
}
%>
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
    	<a href="info.jsp" class="button">고장 사례</a>
    	
    	<%
  			if(rs1.next()){
  			if(rs1.getString("kind").equals("pro")){
  				out.println("<a href='push_chat.jsp?id="+session.getAttribute("userid")+"' class='button'>질문 답변</a>");
  			}
  			else{
  				out.println("<a href='joinlist.jsp' class='button'>고장 질문</a>");
  			}
  			}
  			%>
    	<a href="mboardList.jsp" class="button">분야별 게시판</a>
    	<a href="boardList.jsp" class="button">자유게시판</a>   	  	   
  	</div>
  	
  	<table class="table_type1">
  	<tr>
  	<td width="60%">
  	<%@include file="board.jsp" %>
  	</td>
  	
  	<td width="30">
  	<%@include file="loginlist.jsp" %>
  	</td>
  	</tr>
  	 	
  		
  	</table>
  	<br>
  	<table class="table_type1">
  		<tr>
  			<td width="60%"><%@include file="mboard.jsp" %>	</td>
  		</tr>
  		<tr>
  			<td id="f" width="30%" align='center' bgcolor="gray">새로운쪽지: <%=count%>개	
  			<%
  			rs1= st1.executeQuery(sql);
  			if(rs1.next()){
  			if(rs1.getString("kind").equals("pro")){
  				out.println("<input type='button' value='확인하기' onClick=\"check()\"/>");
  			}
  			else{
  				out.println("<input type='button' value='확인하기' onClick=\"check2()\"/>");
  			}
  			}
  			%>
  			
  			</td>
  		</tr>
  	</table>
  	
  	<div id="footer-area">
      <h5>도박,경마,음란글 등의 미풍양속을 해치는 게시글,계정은 통보없이 삭제됩니다</h5>
  </div>
  	
</body>
<script>
	function check(){		 
		location.href= "push_chat.jsp?id=<%=session.getAttribute("userid")%>";
	}
	function check2(){
		location.href = "joinlist.jsp";
	}
</script>
</html>
