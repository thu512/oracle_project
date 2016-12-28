<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"></meta>
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>환영합니다.</title>


<style>
a{
	text-decoration: none;
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
	border: 1px solid gray;
	border-collapse: collapse;
	cellspacing: 10px;
}

td{
	border: 1px solid gray;
}

.table_type1 {width:100%;border-collapse:collapse;}
		
		
.table_type1 tbody th, .table_type1 tbody #subject {
	font-size:12px;color:#666;height:30px;
	max-width:0;text-overflow: ellipsis;-o-text-overflow: ellipsis;-moz-binding: url('ellipsis.xml#ellipsis');
	white-space: nowrap;overflow:hidden;
}
* {font-size: 9pt;}
p {width: 600px; text-align: right;}
table thead tr th {background-color: gray;}
</style>
<script>
function goUrl(url) {
	location.href=url;
}
</script>
</head>
<body>

<%
	String uid=request.getParameter("id");
	if(session.isNew()||session.getAttribute("userid")==null){
		session.setAttribute("userid",uid);
	}
	session.setMaxInactiveInterval(1800);
%>

	<div id="login">
		<%=session.getAttribute("userid") %>
		<input type="button" value="로그아웃" onclick="window.location='logout.jsp'"/>
		
	</div>
	
	<div id="banner">
		<a href="main.jsp">
		<img src="img/logo.jpg" width="290" height="78" >
		<%--C:\work\projects\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ROOT --%>		
		</a>
	</div>
	
	<div id="menu_bar">		      	
    	<a href="info.jsp" class="button">고장 사례</a>
    	<%
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection connnn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
    	String sql12="SELECT * FROM usr WHERE id='"+session.getAttribute("userid")+"'";
    	Statement st11=connnn.createStatement();
    	ResultSet rs11= st11.executeQuery(sql12);  
  			if(rs11.next()){
  			if(rs11.getString("kind").equals("pro")){
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
  	
  	<%
	// 사용할 객체 초기화
	
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int pageNumTemp = 1;
	int listCount = 10;
	int pagePerBlock = 10;
	String whereSQL = "";
	// 파라미터
	String pageNum = request.getParameter("pageNum");
	String searchType = request.getParameter("searchType");
	String searchText = request.getParameter("searchText");
	// 파라미터 초기화
	if (searchText == null) {
		searchType = "";
		searchText = "";
	}
	if (pageNum != null) {
		pageNumTemp = Integer.parseInt(pageNum);
	}
	// 한글파라미터 처리
	String searchTextUTF8 = new String(searchText.getBytes("ISO-8859-1"), "UTF-8");
	// 데이터베이스 커넥션 및 질의문 실행
	// 검색어 쿼리문 생성
	
	try {
		
		// 게시물의 총 수를 얻는 쿼리 실행
		pstmt = conn.prepareStatement("SELECT COUNT(NUM) AS TOTAL FROM board" + whereSQL);
		if (!"".equals(whereSQL)) {
			if ("ALL".equals(searchType)) {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setString(2, searchTextUTF8);
				pstmt.setString(3, searchTextUTF8);
			} else {
				pstmt.setString(1, searchTextUTF8);
			}
		}
		rs = pstmt.executeQuery();
		rs.next();
		int totalCount = rs.getInt("TOTAL");
		// 게시물 목록을 얻는 쿼리 실행
		pstmt = conn.prepareStatement("select * from(SELECT NUM, SUBJECT, WRITER, REG_DATE, HIT FROM board ORDER BY NUM DESC)where rownum between ? and ?");
		if (!"".equals(whereSQL)) {
			// 전체검색일시
			if ("ALL".equals(searchType)) {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setString(2, searchTextUTF8);
				pstmt.setString(3, searchTextUTF8);
				pstmt.setInt(4, listCount * (pageNumTemp-1));
				pstmt.setInt(5, listCount);			
			} else {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setInt(2, listCount * (pageNumTemp-1));
				pstmt.setInt(3, listCount);			
			}
		} else {	
			pstmt.setInt(1, listCount * (pageNumTemp-1));
			pstmt.setInt(2, listCount);
		}
		rs = pstmt.executeQuery();
%>






	
	<table class="table_type1" border="1" summary="자유게시판 목록">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="50" />
			<col width="300" />
			<col width="80" />
			<col width="100" />
			<col width="70" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록 일시</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (totalCount == 0) {
			%>
			<tr>
				<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
			</tr>
			<%
			} else {
				int i = 0;
				while (rs.next()) {
					i++;
			%>
			<tr>
				<td align="center"><%=totalCount - i + 1 - (pageNumTemp - 1) * listCount %></td>
				<td id="subject"><a href="boardView.jsp?num=<%=rs.getInt("NUM")%>&amp;pageNum=<%=pageNumTemp%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>"><%=rs.getString("SUBJECT") %></a></td>
				<td align="center"><%=rs.getString("WRITER") %></td>
				<td align="center"><%=rs.getString("REG_DATE").substring(0, 10) %></td>
				<td align="center"><%=rs.getInt("HIT") %></td>
			</tr>
			<%
				}
			}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td align="center" colspan="5">
				<%
				// 페이지 네비게이터
				if(totalCount > 0) {
					int totalNumOfPage = (totalCount % listCount == 0) ? 
							totalCount / listCount :
							totalCount / listCount + 1;
					
					int totalNumOfBlock = (totalNumOfPage % pagePerBlock == 0) ?
							totalNumOfPage / pagePerBlock :
							totalNumOfPage / pagePerBlock + 1;
					
					int currentBlock = (pageNumTemp % pagePerBlock == 0) ? 
							pageNumTemp / pagePerBlock :
							pageNumTemp / pagePerBlock + 1;
					
					int startPage = (currentBlock - 1) * pagePerBlock + 1;
					int endPage = startPage + pagePerBlock - 1;
					
					if(endPage > totalNumOfPage)
						endPage = totalNumOfPage;
					boolean isNext = false;
					boolean isPrev = false;
					if(currentBlock < totalNumOfBlock)
						isNext = true;
					if(currentBlock > 1)
						isPrev = true;
					if(totalNumOfBlock == 1){
						isNext = false;
						isPrev = false;
					}
					StringBuffer sb = new StringBuffer();
					if(pageNumTemp > 1){
						sb.append("<a href=\"").append("boardList.jsp?pageNum=1&amp;searchType="+searchType+"&amp;searchText="+searchText);
						sb.append("\" title=\"<<\"><<</a>&nbsp;");
					}
					if (isPrev) {
						int goPrevPage = startPage - pagePerBlock;			
						sb.append("&nbsp;&nbsp;<a href=\"").append("boardList.jsp?pageNum="+goPrevPage+"&amp;searchType="+searchType+"&amp;searchText="+searchText);
						sb.append("\" title=\"<\"><</a>");
					} else {
						
					}
					for (int i = startPage; i <= endPage; i++) {
						if (i == pageNumTemp) {
							sb.append("<a href=\"#\"><strong>").append(i).append("</strong></a>&nbsp;&nbsp;");
						} else {
							sb.append("<a href=\"").append("boardList.jsp?pageNum="+i+"&amp;searchType="+searchType+"&amp;searchText="+searchText);
							sb.append("\" title=\""+i+"\">").append(i).append("</a>&nbsp;&nbsp;");
						}
					}
					if (isNext) {
						int goNextPage = startPage + pagePerBlock;
	
						sb.append("<a href=\"").append("boardList.jsp?pageNum="+goNextPage+"&amp;searchType="+searchType+"&amp;searchText="+searchText);
						sb.append("\" title=\">\">></a>");
					} else {
						
					}
					if(totalNumOfPage > pageNumTemp){
						sb.append("&nbsp;&nbsp;<a href=\"").append("boardList.jsp?pageNum="+totalNumOfPage+"&amp;searchType="+searchType+"&amp;searchText="+searchText);
						sb.append("\" title=\">>\">>></a>");
					}
					out.print(sb.toString());
				}
				%>
				</td>
			</tr>
		</tfoot>
	</table>
	
		<br>
		<input type="button" value="글쓰기" onclick="goUrl('boardWriteForm.jsp');" />
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
</body>
</html>

  	
  	
  	

