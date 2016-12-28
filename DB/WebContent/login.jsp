<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
<meta name="HandheldFriendly" content="true"/>
<meta name="MoblieOptimized" content="320"/>
<meta http-equiv="Content-Type" content="text/html">

<title>환영합니다.</title>
<style>
 html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
    display: block;
}
body {
    line-height: 1;
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
 

html, body { height:100%; margin:0px; padding:0px; }

.wrapper { width:100%; height:100%; background-color: gray; }
.main { padding-top:50px;}
.logo { width:235px; margin:0 auto 60px;}
.logo img { width:212px; height:76px;}
    
.login_box { width:60%; height:250px; padding: 45px 10% 38px 10%; margin: 0 auto; background-color: #fff; 
                 opacity: 0.7; border-radius:5px;}
.login_box .input_login { border-bottom: 2px solid #c4c5c4; padding: 20px 0 9px 0;}
.login_box .input_login input { width: 100%; color: #828180; font-size: 15px; border:none; font-family: '돋움';}
.login_box .check { color: #000; font-size: 14px; padding: 9px 0 15px 0;}


#sign{
	 text-align: right;
	 padding:0 auto;;
	 padding-top:60px;
}
#sign a{
	 text-decoration: none;
	 color: gray;
	 font-size: 10px; 
}
 
#button{
	margin-left:88%;
}

</style>
</head>
<body>
	 <div class="wrapper">
        <div class="main">
            <div class="logo">
                <img src="img/logo.jpg">
            </div>
            <div class="login_box">
            <form method="post" action="login_db.jsp">
                <div class="input_login">
                    <input type="text" name="id" placeholder="아이디를 입력하세요" required='required'>
                </div>
                <div class="input_login">
                    <input type="password" name="pw" placeholder="비밀번호를 입력하세요" required='required'>
                </div>
                <div class="check">
                    
                    <input id="button" type="submit" value="로그인">
                </div>
               </form>
                <div id="sign">
					<a href="idpwfind.jsp" >id찾기</a>
					<a>|</a>
					<a href="idpwfind.jsp" >pw찾기</a>
					<a>|</a>
					<a href="signup.jsp" >회원가입</a>
				</div>
            </div>
        </div>
    </div>


</body>
</html>