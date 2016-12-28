<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/css?family=Raleway:200,100,400" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="jquery.lightbox-0.5.css"/>
<script src="http://code.jquery.com/jquery.lightbox-1.10.2.js"></script>
<script src="jquery.lightbox-0.5.js"></script>
<script>
	$(document).ready(function(){
		$('a.light').lightBox();
	});
</script>

<style>

* {font-size: 9pt;}
p {width: 600px; text-align: right;}
table thead tr th {background-color: gray;}
.italic { font-style: italic; }
.small { font-size: 0.8em; }

/** LIGHTBOX MARKUP **/

.lightbox {
	/** Default lightbox to hidden */
	display: none;

	/** Position and style */
	position: fixed;
	z-index: 999;
	width: 100%;
	height: 100%;
	text-align: center;
	top: 0;
	left: 0;
	background: rgba(0,0,0,0.8);
}
.paint{
	width:100%;
}
.lightbox img {
	/** Pad the lightbox image */
	max-width: 90%;
	max-height: 80%;
	margin-top: 2%;
}

.lightbox:target {
	/** Remove default browser outline */
	overflow:scroll;

	/** Unhide lightbox **/
	display: block;
}
	#login{
	 text-align: left;
}
#login a{
	 text-decoration: none;
	 color: gray;
}
 #banner{
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





a{
	text-decoration:none;
}


@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
  font-family:'Nanum Gothic';
}

nav ul {
  list-style:none;
  margin: 0;
  padding: 0;
  width: 100%;
  hight: 100%;
}

nav ul li {
  margin: 3px;
}

nav ul li a {
  display: block;
  padding: .5em;
  background-color: #eee;
  text-decoration: none;
  color:#000;
  text-shadow: 0 0 1px rgba(0,0,0,0);
  font-weight: bold;
  transition:all .5s;
}

nav ul li a:hover {
  background-color: #ddd;
}

nav ul:hover li a:not(:hover) {
  color:transparent;
  text-shadow: 0 0 3px rgba(0,0,0,.5);
}
</style>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
String sql="SELECT * FROM usr WHERE id='"+session.getAttribute("userid")+"'";
Statement st1=conn.createStatement();
ResultSet rs1= st1.executeQuery(sql);       
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
    	<a href="info2.jsp" class="button">고장 사례</a>
    	
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
    	<a href="mboardList.jsp" class="button">분야게시판</a>
    	<a href="boardList.jsp" class="button">자유게시판</a>   	  	   
  	</div>
  	
  	
  	<table style="table-layout: fixed;">
  		<tr>
  		<td rowspan="2" width="20%" valign="top">
  			<nav>
	<ul>
		<li><a href="info.jsp">H/W</a></li>
		<li><a href="info2.jsp">S/W</a></li>
		<li><a href="info3.jsp">NETWORK</a></li>
		
	</ul>
</nav>
  		</td>
  		<td width="40%">
  		
	  		<a href="#img1">
				<img class="paint" src="img/blue.jpg">
				
			</a>
	
			<!-- lightbox container hidden with CSS -->
			<a href="#_" class="lightbox" id="img1">
			  <img src="img/blue2.jpg">
			  <img src="img/blue3.jpg">
			  <img src="img/blue4.jpg">
			</a>

  		</td>
  		<td width="40%">
  				<a href="#img2">
					<img class="paint" src="img/rak.jpg">
				</a>

				<!-- lightbox container hidden with CSS -->
				<a href="#_" class="lightbox" id="img2">
				  <img src="img/rak2.jpg">
				  <img src="img/rak3.jpg">
				  <img src="img/rak4.jpg">
				  <img src="img/rak5.jpg">
				</a>
  		</td>
  		
  		</tr>
  			
  		<tr>
  			<td>
  				<a href="#img3">
				<img class="paint" src="img/hangle.jpg">
			</a>
	
			<!-- lightbox container hidden with CSS -->
			<a href="#_" class="lightbox" id="img3">
			  <img class="paint" src="img/hangle2.jpg">
			  <img class="paint" src="img/hangle3.jpg">
			  <img class="paint" src="img/hangle4.jpg">
			  <img class="paint" src="img/hangle5.jpg">
			  <img class="paint" src="img/hangle6.jpg">
			  <img class="paint" src="img/hangle7.jpg">
			  <img class="paint" src="img/hangle8.jpg">
			  <img class="paint" src="img/hangle9.jpg">
			  <img class="paint" src="img/hangle10.jpg">
			  <img class="paint" src="img/hangle11.jpg">
			  <img class="paint" src="img/hangle12.jpg">
			  <img class="paint" src="img/hangle13.jpg">
			  <img class="paint" src="img/hangle14.jpg">
			  <img class="paint" src="img/hangle15.jpg">
			</a>
  			</td>
  			
  			
  		<td>
  			<a href="#img4">
				<img class="paint" src="img/update.jpg">
			</a>
	
			<!-- lightbox container hidden with CSS -->
			<a href="#_" class="lightbox" id="img4">
			  <img class="paint" src="img/update2.jpg">
			  <img class="paint" src="img/update3.jpg">
			  <img class="paint" src="img/update4.jpg">
			  <img class="paint" src="img/update5.jpg">
			  <img class="paint" src="img/update6.jpg">
			  <img class="paint" src="img/update7.jpg">
			  <img class="paint" src="img/update8.jpg">
			  
			</a>
  		</td>
  		
  		</tr>
  		
  		
  	</table>
  	  	
</body>
</html>