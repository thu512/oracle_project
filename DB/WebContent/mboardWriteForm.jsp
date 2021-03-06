<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"></meta>
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 등록 폼</title>
<script src="//cdn.ckeditor.com/4.6.0/basic/ckeditor.js"></script>
<style type="text/css">
	* {font-size: 9pt;}
	p {width: 100%; text-align: right;}
	table tbody tr th {background-color: gray;}
	table{
		width:100%;
	}
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href=url;
	}
	// 등록 폼 체크
	function boardWriteCheck() {
		var form = document.boardWriteForm;
		if (form.subject.value == '') {
			alert('제목을 입력하세요.');
			form.subject.focus();
			return false;
		}
		if (form.writer.value == '') {
			alert('작성자을 입력하세요');
			form.writer.focus();
			return false;
		}
		if (form.major.value == '') {
			alert('분야를 선택하세요');
			
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form name="boardWriteForm" action="mboardProcess.jsp" method="post" onsubmit="return boardWriteCheck();">
	<input type="hidden" name="mode" value="W" />
	<table border="1" summary="게시판 등록 폼">
		<caption>분야별 게시판 게시글 등록</caption>
		<colgroup>
			<col width="100" />
			<col width="500" />
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td><input type="text" name="subject" size="30" maxlength="100" /></td>
			</tr>
			<tr>
				<th align="center">작성자</th>
				<td><input type="text" name="writer" maxlength="20" readonly name='contents' value="<%=session.getAttribute("userid") %>"/></td>
			</tr>
			<tr>
				<th align="center">분야</th>
				<td>
						<input type="radio" name="major" value="HW"> H/W
			            <input type="radio" name="major" value="SW">S/W
			            <input type="radio" name="major" value="NET">NETWORK
			            <input type="radio" name="major" value="etc">기타
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="contents" cols="30" rows="10"></textarea>
					<script>
					CKEDITOR.replace('contents');
					</script>
				</td>
			</tr>
		</tbody>
	</table>
	<p>
		<input type="button" value="목록" onclick="goUrl('mboardList.jsp');" />
		<input type="submit" value="글쓰기" />
	</p>
	</form>
</body>
</html>


