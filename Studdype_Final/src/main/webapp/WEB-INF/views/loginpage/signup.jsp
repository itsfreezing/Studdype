<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script type="text/javascript">
function checkpwd(){   //비밀번호, 비밀번호 확인 비교 함수
	  var pwchk = document.forms[0];
	  var pw= pwchk.memberpw.value;
	  var pw2=pwchk.mempw.value;
		if(pw==pw2){
			document.getElementById('checkpw').style.color="blue";
			document.getElementById('checkpw').innerHTML="확인되었습니다";
		}else{
			document.getElementById('checkpw').style.color="red";
			document.getElementById('checkpw').innerHTML="동일한 암호를 입력해주세요";
		}
}

$(document).ready(function(){
//아이디 중복체크 확인 (아이디 중복된 경우 =1, 사용가능하면 =0)
	$("#check").click(function(){
		var mem_id=$("#memberId").val();
		var memberVal = {
				"mem_id":mem_id
		};

		$.ajax({
			url:"idcheck.do",
			data:JSON.stringify(memberVal),
			type:"POST",
			contentType:"application/json",
			dataType:"json",
			success:function(data){
				console.log("0=사용가능 /1=사용불가"+data);
				if(data==0){
					var html="<tr><td colspan='3' style='color:blue'>사용가능</td></tr>";
						$('#IdCheck').empty();
						$('#IdCheck').append(html);
						
				}else {
						var html="<tr><td colspan='3' style='color:red'>이미 존재하는 아이디입니다 </td></tr>";
						$('#IdCheck').empty();
						$('#IdCheck').append(html);
					}
				},error:function(){
					alert("FAIL");
			}		
		});
	});
});	

function signup(){
	if(document.register.mem_id.value==""){
		alert("아이디를 입력해주세요");
		document.register.mem_id.focus();
		return false;
	}else if(document.register.mem_pw.value==""){
		alert("비밀번호 입력해주세요");
		document.register.mem_pw.focus();
		return false;
	}else if(document.register.mem_pw2.value==""){
		alert("비밀번호확인해주세요");
		document.register.mem_pw2.focus();
		return false;
	}
	
	else if(document.register.mem_email.value==""){
		alert("이메일을 입력하고 인증해주세요");
		document.register.mem_email.focus();
		return false;
	}
	else if(document.register.mem_name.value==""){
		alert("이름을 입력해주세요");
		document.register.mem_name.focus();
		return false;
	}
	else if(document.register.mem_rno.title==""){
		alert("주민등록번호를 입력해주세요");
		document.register.mem_rno.focus();
		return false;
	}
	else if(document.register.mem_phone==""){
		alert("핸드폰 번호를 입력해주세요");
		document.register.mem_phone.focus();
	}
	document.register.submit();
}
</script>		
<style type="text/css">
h1{
   margin-top:5%;
   margin-left:46.5%;
   color:white;
}
#header{
   background:#D0A9F5;
}
#line{
   margin-top:6.3%;
}
#logo{
   width:240px;
   height:50px;
}
#title{
   color:black;
   margin-left:46.5%;
}
#pic{
   width:170px;
   height:50px;
   margin-left:47.5%;
}

#big{
   margin-left:46%;
   margin-top:-2%;
   color:blue;
}
h3{
   margin-left:45%;
}
table{
    margin-left: 40%;
}
#name{
    margin-top:1%;
    margin-left:1%;
   margin-bottom:0.5%;
   color:#F5A9F2;
   font-weight:bold;
}

#id{
	width:100px;
	height:30px;
}

#pw{
	width:320px;
	height:30px;	
}

#idtitle{
   margin-top:1%;
   margin-bottom:0.5%;
   margin-left:1%;
   color:#F5A9F2;

}
#check{
   background:#7401DF;
   color:white;
   width:130px;
   height:30px;
   font-weight:bold;
}
#sub{
   background:#7401DF;
   color:white;
   width:330px;
   height:50px;
   font-weight:bold;
   margin-top:15%;
   margin-left:43%;
}
#select{
   margin-left:1%;
   width:330px;
   height:30px;
}

#chk{
   width:100px;
   height:30px;
   
}
input{
   width:320px;
   height:30px;
}

#nametitle{
   width:280px;
   height:30px;
   border: 2px solid #DA81F5;
}
#signUp{
	width:150px;
	height:30px;
}

#phone{
	width:100px;
	height:30px;
}
#phone1{
	width:150px;
	height:30px;
}

</style>

</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

   <img src="" id="pic">
   <br><br>   
      <h3>--Please be our colleague--</h3>
      <br><h2 id="big">정보를 입력해주세요</h2>
  <div id="signtitle">
      <form action="signup.do" id="sign" name="register" method="POST" autocomplete="off" >
        <table>
                    <tr>
                        <td><h3 id="idtitle">아이디</h3></td>
                    </tr>
                    <tr>
                      <td> 
                           <input type="text" title="n" name="mem_id" id="memberId" style="border:2px solid #DA81F5;"placeholder="아이디를 입력해주세요" />
                     		<input type="button" value="중복확인" id="check">
                     </td>
                    </tr>
                    <tr>
						<td colspan=3 id="IdCheck"></td>
					</tr>
                   <tr>
                        <td>
                            <h3 id="idtitle">비밀번호</h3>
                        </td>
                    </tr>   
                    <tr>           
                        <td>
                            <input type="password" id="memberpw"  title="n"name="mem_pw" style="border:2px solid #DA81F5;" placeholder="비밀번호를 입력해주세요"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3 id="idtitle">비밀번호확인</h3>
                        </td>
                    </tr> 
                    <tr>
                        <td colspan="5">
                            <input type="password" name="mem_pw2" style="border:2px solid #DA81F5;" placeholder="비밀번호를 확인해주세요" onclick="checkpwd();" id="mempw" >
                        	<div id="checkpw">동일한 암호를 입력</div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <h3 id="idtitle">이메일</h3>
                        </td>
                    </tr> 
                    <tr>
                    	<td>
                    		<input type="text" title="n" name="mem_email" id="memberemail" style="border: 2px solid #DA81F5;"placeholder="이메일을 입력해주세요"/>

                    	</td>
                    </tr>
                    <tr id="ssss">
                        <td>
                              <h3 id="idtitle">인증번호 </h3>
                          </td>
                        <td id="code" width="600"></td>	
                    </tr>
                    <tr>
                        <td>
                            <h3 id="idtitle">이름</h3>
                        </td>
                    </tr> 
                    <tr>
                        <td><input type="text" name="mem_name" id="memberName"style="border: 2px solid #DA81F5;" placeholder="이름을 입력해주세요"></td>
                    </tr>
                    <tr>
                    	<td>
                    		<h3 id="idtitle">주민등록번호 </h3>
                    	</td>
                    </tr>
                    
                    <tr>
                    	<td colspan="5">
                    		   <input type="text" id="rno1" name="mem_rno" title="n" maxlength="7" >-<input type="password" id="rno2" name="mem_rno" maxlength="8">
                    	</td>
                    </tr>
                    
                    <tr>
                    	<td>
                    		<h3 id="idtitle">핸드폰 번호 </h3>
                    	</td>
                    </tr>
                    <tr>
                    	<td colspan="5">
                    		<select id="phone" name="mem_phone">
                    			<option value="010" selected>010</option>
                    			<option value="011">011</option>
                    			<option value="016">016</option>
                    			<option value="018">018</option>
							</select>-<input type="tel"name="phone2" id="phone1"size="4" maxlength="12" autocomplete="off">
                    	</td>
                    </tr>
                   
                       <tr>
                    	<td>
                    		<h3 id="idtitle">성별 </h3>
                    	</td>
                    </tr>
                    <tr>
                    	<td>
		               		<select id="select" name="mem_gender" id="gender"style="border: 2px solid #DA81F5;">
					        	<option value="M" selected>
					        		남자 
					        	</option>
					        	<option value="F">
					        		여자
					        	</option>
					        </select>
					     </td>
                    </tr>
                
        </table>
        <br>
		<center>
          <input type="button" id="sign" name="join" onclick="signup();"value="회원가입">
       </center>
       </form>
      </div>
	  
  </body>
  </html> 