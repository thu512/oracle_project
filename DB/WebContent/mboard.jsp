<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<title>board sample</title>
    
<style>
*{margin:10; padding:0;font:12px san-serif;}
		
#info_board{ width:100%; margin:10px auto;}
		
#info_board h3{padding:5px 0 0 40px; height:25px;}
     	   
#info_board li{
	   list-style:none;
	   background:url(/img/bullet.gif)no-repeat left center;
	   border-bottom:1px dotted gray; 
	   padding:5px 0 2px 15px;
	   }
	   
#info_board li:last-child{border:none;}
	   
#info_board li:hover{background:url(/img/bullet_orange.gif)no-repeat left center;}
.link_bd{text-decoration:none;display:inline-block;color:gray;}
.link_bd:hover{color:orange}
	   
.link_more{float:right; color:gray;text-decoration:none;display:inline-block;}
</style>
   
</head>
<body>
	<div id="info_board">
	
	<hr>
	<h3>최근 질문</h3>	
	
	<hr>
	
	<ul>
	<%
		int x=1;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
		Statement st12 = connn.createStatement();
		ResultSet rs12=st12.executeQuery("select * from mboard order by NUM DESC");
		while(rs12.next() && x<6){
			x++;
			out.println("<li><a class='link_bd' href='mboardList.jsp'>("+rs12.getString("major")+")"+rs12.getString("SUBJECT")+"</a></li>");
		}
		
		st12.close();
		rs12.close();
		connn.close();
	%>
		
	</ul>
	<hr>
   </div>
</body>
</html>
