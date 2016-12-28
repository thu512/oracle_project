<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
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
 
div{ box-sizing: border-box; }

html, body {height:100%;background-size: cover;}

.wrapper {width:100%; min-height: 100%; background-color: gray; }
.main { width:100%; height:auto; padding-bottom:10%;}
.logo { width:235px; margin:0 auto 50px;}
.logo img { margin-top: 20px; width:50%; height:auto;}    
.login_box { width:35%; height:70%; padding: 10px 44px 20px 44px; margin: 0 auto; background-color: #fff; 
                 opacity: 0.7; border-radius:5px;}
    

label{
	text-align: right;
}
</style>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
	 <div class="wrapper">
        <div class="main">
        	<center>
            <div class="logo">
                <a href="index.jsp"><img src="img/logo.jpg"></a>
            </div>
            </center>
            <div class="login_box">
            
            <form name="join" onsubmit="return join_submit();" method="post" action="signup_db.jsp">
        		<h1>회원가입</h1>
        		<br>
			        <p>
			            선택 :
			            <input type="radio" name="kind" value="pro" > 전문가
			            <input type="radio" name="kind" value="nomal" checked> 일반
			        </p>
					<br>
			        <p><label>아이디 : <input type="text" id="id" name="ID" placeholder="아이디 입력">
			        <input type="hidden" name="id_hidden"/> 
			        </label>
			        <input type="button" value="중복확인" onclick="idcheck()"/></p>
			        <br>
			        <p><label>비밀번호 : <input type="password" name="pwd" id="user_pass" placeholder="비밀번호 입력" /></label></p>
			        <br>
			        <p><label>비밀번호 확인 : <input type="password" name="pwd2" id="chpass" placeholder="비밀번호 확인" /> <font name="check" size="2" color="red"></font> </label></p>
			        <br>
			        <p><label>이름 : <input type="text" name="Name" placeholder="이름 입력"></label></p>
			        <br>
			        <p><label>전화번호 : <input type="tel" name="phone" id="phone" placeholder="전화번호 입력" maxlength="13" minlength="13"></label></p>
			        <br>
			        <p><label>E-mail : <input type="email" name="email" placeholder="이메일 입력"></label></p>
			        <br>
			       
			
			        <p>분야 :<br>
			            <input type="radio" name="major" value="HW"> H/W
			            <input type="radio" name="major" value="SW">S/W
			            <input type="radio" name="major" value="NET">NETWORK
			            <input type="radio" name="major" value="etc" checked>기타
			        </p>
			        <br>
			      
			        <input type="submit" value="확인">
			    </form>
            </div>
        </div>
    </div>

</body>
<script>
function idcheck(){
	   var id = document.getElementById('id').value;
	   if(id.length<1 || id==null){
	    alert("중복체크할 아이디를 입력하십시오");
	    document.getElementById('id').focus();
	    return false;
	   }
	   var url = "idcheck.jsp?id=" + id;
	   window.open(url, "get");
	  }
	  
	  

function join_submit(){

	  if(document.join.id_hidden.value==""){
	    alert("아이디 중복체크를 해주세요");
	    return false;
	  }
	  
	  else{
		  if(document.join.pwd.value==""){
			    alert("비밀번호를 입력해주세요");
			    document.join.pwd.focus();
			    return false;		
			  }
		  
		  else if(document.join.pwd2.value==""){
			    alert("비밀번호를 확인해주세요");
			    document.join.pwd2.focus();
			    return false;		
			  }
		  else if(document.join.pwd.value != document.join.pwd2.value){
			  	alert("비밀번호가 일치하지 않습니다.");
			   return false;
			}
		  else if(document.join.Name.value==""){
			    alert("이름을 입력해주세요");
			    document.join.Name.focus();
			    return false;				
			  }
		  else if(document.join.phone.value==""){
			    alert("휴대폰번호를 입력해주세요");
			    document.join.phone.focus();
			    return false;			
			  }
		  else if(document.join.email.value==""){
			    alert("이메일주소를 입력해주세요");
			    document.join.email.focus();
			    return false;				
			  }
		  else{
			  return true;
		  }
	    

	  }

	}

$(function(){
	  $('#user_pass').keyup(function(){
	   $('font[name=check]').text('');
	  }); //#user_pass.keyup

	  $('#chpass').keyup(function(){
	   if($('#user_pass').val()!=$('#chpass').val()){
	    $('font[name=check]').text('');
	    $('font[name=check]').html("암호틀림");
	   }else{
	    $('font[name=check]').text('');
	    $('font[name=check]').html("암호맞음");
	   }
	  }); //#chpass.keyup
	 });
	 

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