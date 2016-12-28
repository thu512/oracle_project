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
 

html, body { margin:0px; padding:0px; }

.wrapper { width:100%; height:100%; background-color: gray; }
.main { width:100%; height:100%;}
.logo { width:235px; margin:0 auto 60px;}
.logo img { margin-top: 20px; width:212px; height:76px;}
    
.login_box { width:100%; height:200px; padding: 10px 10% 38px 10%; margin: 0 auto; background-color: #fff; 
                 opacity: 0.7; border-radius:5px;}
                 
.login_box1 { width:100%; height:160px; padding: 10px 10% 38px 10%; margin: 0 auto; background-color: #fff; 
                 opacity: 0.7; border-radius:5px;}

table{
	margin-left:39%;
}

td{margin: 50px; width: 100%;}

</style>
</head>
<body>
	 <div class="wrapper">
        <div class="main">
            <div class="logo">
                <img src="img/logo.jpg">
            </div>
            <table cellspacing="50">
            <tr>
            <td>
             <div class="login_box1">
            
            <form action="idfind.jsp">
        		<h1>ID찾기</h1>
        		<br>
			        
			          
			        <p><label>이름 : <input type="text" name="name" placeholder="이름 입력" required>
			        </label>
			        </p>
			        <br>
			        
			       
					<p><label>핸드폰번호: <input type="tel" name="phone" id="phone" placeholder="전화번호 입력" maxlength="13" minlength="13"></label></p>
			        <br>
			     
			        
			        <input type="submit" value="확인">
			        <input type="button" value="로그인하러가기" onclick="location.href='index.jsp'">
			        
			    </form>
            </div>
            <br>
            </td>
            </tr>
            <tr>
            <td>
           
            <div class="login_box">
            
            <form action="pwfind.jsp">
        		<h1>PW찾기</h1>
        		<br>
			      
			        <p><label>아이디 : <input type="text" name="id" placeholder="아이디 입력" required>
			        </p>
			        <br>
			        
			        <p><label>이름 : <input type="text" name="name" placeholder="이름 입력" required></label></p>
			        <br>
			        
			        
			    
			        <input type="submit" value="확인">
			        <input type="button" value="로그인하러가기" onclick="location.href='index.jsp'">
			        
			    </form>
            </div>
            <br>
            </td>
            </tr>
            
           </table>
        </div>
    </div>

</body>
<script>
function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

var pnum = document.getElementById('phone');
pnum.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}

</script>
</html>