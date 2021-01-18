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
	  var pw= pwchk.pw.value;
	  var pw2=pwchk.mempw.value;
		if(pw==pw2){
			document.getElementById('checkpw').style.color="blue";
			document.getElementById('checkpw').innerHTML="확인되었습니다";
		}else{
			document.getElementById('checkpw').style.color="red";
			document.getElementById('checkpw').innerHTML="동일한 암호를 입력해주세요";
		}
}

function ChkConfirm(){
	var chk=document.getElementsByName("mem_id")[0].title;
	if(chk=="y"){
		alert("아이디중복체크해주세요");
		document.getElementsByName("mem_id")[0].focus();
	}else {
		
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
function sign(){
	var memberId=document.getElementById("memberId").title;
	var memberpw=document.getElementById("memberpw").title;
	var memberName=$("#memberName").val();
	var email=document.getElementById("memberemail").title;
	var mem_rrn=$("#rno1").val()+"-"+$("#rno2").val();

		if(memberId=="n"){
			alert("아이디 중복확인해주세요");
			return false;
		}else if(memberpw=="y"){
			alert("비밀번호를 입력해주세요");
			$("#memberpw").focus();
			return false;
		}

		else if(email=="n"){
			alert("이메일을 입력해주세요");
			$("#mememail").focus();
			return false;
		}
		
		else if(!memberName){
			alert("이름을 입력해주세요");
			$("#memberName").focus();
			return false;
		}
		
		else if(mem_rrn=="n"){
			alert("주민번호를 입력해주세요");
			$("#rno1"+"#rno2").focus();
			return false;
		}
		
		sign.submit();
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
                            <input type="password" id="memberpw"  title="y"name="pw" style="border:2px solid #DA81F5;" placeholder="비밀번호를 입력해주세요" pattern="[a-zA-Z0-9]{4,12}"required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3 id="idtitle">비밀번호확인</h3>
                        </td>
                    </tr> 
                    <tr>
                        <td colspan="5">
                            <input type="password" name="mem_pw" style="border:2px solid #DA81F5;" placeholder="비밀번호를 확인해주세요" onclick="checkpwd();" id="mempw" >
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
                    		<input type="text" title="n" name="mem_email" id="memberemail" style="border: 2px solid #DA81F5;"placeholder="이메일을 입력해주세요" size="30" pattern="[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}" required />
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
                    		   <input type="text" id="rno1" name="mem_rno" title="n" maxlength="6" >-<input type="password"name="mem_rno" id="rno2" >
                    	</td>
                    </tr>
                    
                    <tr>
                    	<td>
                    		<h3 id="idtitle">핸드폰 번호 </h3>
                    	</td>
                    </tr>
                    <tr>
                    	<td colspan="5">
                    		<select id="phone1" name="mem_phone">
                    			<option value="010" selected>010</option>
                    			<option value="011">011</option>
                    			<option value="016">016</option>
                    			<option value="018">018</option>
							</select>-<input type="tel"name="mem_phone" id="phone2"size="4" maxlength="4"pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"  autocomplete="off">-
							<input type="tel" name="mem_phone" id="phone3" size="4" maxlength="4" autocomplete="off">
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
					        	<option value="M">
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
          <input type="submit" id="sign" name="join" onclick="sign();"value="회원가입">
       </center>
       </form>
      </div>
	  
  </body>
  </html> 