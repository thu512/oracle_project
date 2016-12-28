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
		
	#info_board h3{	padding:5px 0 0 40px; height:25px;}
     	   
	#info_board li{
	   list-style:none;   
	   border-bottom:1px dotted gray; 
	   padding:5px 0 2px 15px;
	   }
	   
	#info_board li:last-child{border:none;}
	   	   
	.link_bd{text-decoration:none;display:inline-block;color:gray;}
	.link_bd:hover{color:orange}	   
	.link_more{float:right; color:gray;text-decoration:none;display:inline-block;}
	ul{overflow:hidden;}
</style>
   
</head>
<body>
	<div id="info_board">
	
	<hr>
	<h3>자유게시판</h3>	
	
	<hr>
	
	<ul>
	<%
		
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select * from board order by NUM DESC");
		for(int i=0; i<5; i++){
			if(rs.next()){
				out.println("<li><a class='link_bd' href='boardList.jsp'>"+rs.getString("SUBJECT")+"</a></li>");
				
			}
			else{
				out.println("<li><a class='link_bd'>---null---</a></li>");
			}
		}
		
		
		st.close();
		rs.close();
		con.close();
	%>
		
	</ul>
	<hr>
   </div>
</body>
</html>
