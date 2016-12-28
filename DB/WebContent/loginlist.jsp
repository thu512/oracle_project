<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
    <title>board sample</title>
    
<style>
	*{margin:10; padding:0;font:12px san-serif;}
		
	#info_board1{width:100%; margin:10px auto;}
		
	#info_board1 h3{padding:5px 0 0 40px; height:25px;}
     	   
	#info_board1 li{
		list-style:none;	  
		border-bottom:1px dotted gray; 
		padding:5px 0 2px 15px;
		}
	   
	#info_board1 li:last-child{border:none;}
	   
	   
	.link_bd1{text-decoration:none;display:inline-block;color:gray;}
	.link_bd1:hover{color:orange}
	   
	.link_more{float:right;color:gray;text-decoration:none;display:inline-block;}
</style>
   
</head>
<body>
<div id="info_board1">
	<hr>
	<h3>전문가 랭킹</h3>	
	<hr>
	<ul>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
		Statement st2 = con2.createStatement();
		ResultSet rs2=st2.executeQuery("select * from usr where kind='pro' order by score desc");
		for(int j=0; j<5; j++){
			if(rs2.next()){
				out.println("<li><a class='link_bd1'>"+(j+1)+". "+rs2.getString("id")+" ("+rs2.getInt("score")+")</a></li>");
						
			}
			else{
				out.println("<li><a class='link_bd1'>---null---</a></li>");
			}
		}
		
		
	%>
		
	</ul>
	<hr>
</div>
</body>
</html>
