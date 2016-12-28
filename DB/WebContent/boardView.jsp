<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	// 사용할 객체 초기화
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// 파라미터
	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String searchType = request.getParameter("searchType");
	String searchText = request.getParameter("searchText");
	try {
		// 데이터베이스 객체 생성
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");
		// 조회수 증가 쿼리 실행
		pstmt = conn.prepareStatement("UPDATE board SET HIT = HIT + 1 WHERE NUM = ?");
		pstmt.setString(1, num);
		pstmt.executeUpdate();
		// 게시물 상세 조회 쿼리 실행 
		pstmt = conn.prepareStatement(
			"SELECT NUM, SUBJECT, CONTENTS, WRITER, HIT, REG_DATE FROM board "+ 
			"WHERE NUM = ?");
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		rs.next();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"></meta>
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 상세보기</title>
<style type="text/css">
	* {font-size: 9pt;}
	.btn_align {width: 100%; text-align: right;}
	table tbody tr th {background-color: gray;}
	table{
		width:100%;
		boarder : 1px solid black;
		border-collapse : collapse;
	}
	#review_text{
		width:98%;
	}
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href=url;
	}
	// 삭제 체크
	function deleteCheck(url) {
		if (confirm('정말 삭제하시겠어요?')) {
			location.href=url;
		}
	}
</script>
</head>
<body>
	<table border="1" summary="게시판 상세조회">
		<caption>게시판 상세조회</caption>
		<colgroup>
			<col width="100" />
			<col width="500" />
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td><%=rs.getString("SUBJECT") %></td>
			</tr>
			<tr>
				<th align="center">작성자/조회수</th>
				<td><%=rs.getString("WRITER") %> / <%=rs.getInt("HIT") %></td>
			</tr>
			<tr>
				<th align="center">등록 일시</th>
				<td><%=rs.getString("REG_DATE") %></td>
			</tr>
			<tr>
				<td colspan="2"><%=rs.getString("CONTENTS") %></td>
			</tr>
		</tbody>
	</table>
	<p class="btn_align">
		<input type="button" value="목록" onclick="goUrl('boardList.jsp?pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>');" />
		<% 
		String s="<input type='button' value='수정' onclick=\"goUrl('boardModifyForm.jsp?num="+num+"&amp;pageNum="+pageNum+"&amp;searchType="+searchType+"&amp;searchText="+searchText+"');\" />";
		String s2="<input type='button' value='삭제' onclick=\"deleteCheck('boardProcess.jsp?mode=D&amp;num="+num+"&amp;pageNum="+pageNum+"&amp;searchType="+searchType+"&amp;searchText="+searchText+"');\" />";
		if(rs.getString("WRITER").equals(session.getAttribute("userid"))){
			out.println(s);
			out.println(s2);
			
		}
		%>
	</p>
	<table border="1" >
		<tr>
			<td colspan='2' align="center">댓글 리스트</td>
		</tr>
		<%
		
		Statement st = conn.createStatement();
		rs=st.executeQuery("select count(NUM) as TOTAL from free_review");
		rs.next();
		int totalCount=rs.getInt(1);
		if (totalCount == 0) {
			out.println("<tr>");		
			out.println("<td colspan='2'>댓글이 없습니다.</td>");	
			
			
			out.println("<tr>");
		}
		else{
			rs=st.executeQuery("SELECT * from free_review WHERE board_num ="+request.getParameter("num"));
			
			while(rs.next()){
				out.println("<tr>");		
				out.println("<td>"+rs.getString("id")+"</td>");	
				out.println("<td>"+rs.getString("content")+" ("+rs.getString("reg_date")+")");
				String s4="<input type='button' value='삭제' onclick=\"goUrl('d_delete.jsp?num1="+rs.getString("NUM")+"&num="+num+"&pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText+"');\"/>";
				if(rs.getString("id").equals(session.getAttribute("userid"))){
					
					out.println(s4);
					
				}
				out.println("</td></tr>");
			}
		}
		rs.close();
		pstmt.close();
		st.close();
		conn.close();
		%>
		
		
	</table>
	<form method="post" action="f_review.jsp?num=<%=num%>&amp;pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>">
	<table>
		<tr>
			<td align="center"><textarea id="review_text" name="content" rows="3" resize="none"></textarea></td>
			
		</tr>
		
		<tr><td align="right"><input type="submit" value="댓글 입력" /></td></tr>
	</table>
	</form>
</body>

</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>