<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function email_check( email ) {
    
    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return (email != '' && email != 'undefined' && regex.test(email));

}
function sendemail() {
	
   var email = $("#userMail").val()
   if(! email_check(email)){
		 alert("올바른 이메일을 입력해주세요");
		return false;
	 }
      $.ajax({
         type: 'GET',
         url: "../membercontroller.do?command=sendemail",
         data:{email: email},
         success:function(ramdom){
            $("#code").html("<input type='text' id='num'><input type='button' value='인증확인' onclick='numchk();'><input type='hidden' id='num2' value='"+ramdom+"'>");
            document.getElementById("userMail").title="n"
            alert("인증번호가 전송되었습니다.");

         },
         error:function(){
            alert("ajax 통신 실패");
         }
   });      
}
function numchk() {
   var num = $("#num").val();
   var num2 = $("#num2").val();
   console.log(num);
   console.log(num2);
   if(num===num2){
      alert("인증되었습니다");
      document.getElementById("userMail").title="y";
      $("#ssss").css('display','none');
   }else{
      alert("인증번호가 틀립니다");
   }
}
</script>
<style type="text/css">
	#btn{
		width:110px;
		height:25px;
		margin-left:65%;
	}
	#header{
		margin-left:-0.7%;
		background-color:#F5A9F2;
	}
	#logo{
		width:130px;
		height:40px;
	}
	#search{
		align:left;
	}
	#pagetitle{
		margin-top:5%;
		margin-left:44%;
	}
	hr{
		margin-top:7%;
	}
	#pic{
		width:100px;
		height:100px;
		margin-left:48%;
	}
	#name{
		margin-top:0.3%;
		margin-left:44%;
		width:300px;
		height:30px;
	}
	#userMail{
		margin-top:0.5%;
		margin-left:44%;
		width:300px;
		height:30px;
	}
	#nametitle{
		font-size:20px;
		margin-top:-2.7%;
		margin-left:44%;
		color:#DA81F5;
	}
	#chk{
		background: #8000FF;
		color:white;
		font-weight:bold;
	}
	#mail{
		background: #8000FF;
		color:white;
		font-weight:bold;
		width:100px;
		height:30px;
	}
	select{
		margin-left:44%;
		width:300px;
		height:30px;
	}
	#sub{
		width:300px;
		height:35px;
		background: #8000FF;
		color:white;
		font-weight:bold;
  		margin-left:44%;
  		text-align:center;
  		font-size:20pt;
	}
	h2{
		margin-left:45%;
		margin-top:-1%;
	}
	h3{
		margin-left:45%;
	}
	div{
		background:#E2A9F3;
		opacity:30;
	}
</style>
</head>
<body>
<div id="header">
	<img src="./resources/assets/img/logo_white.png" id="logo">
		<button  id="btn">
			지역별 검색 
		</button>
		<button>
			카테고리별 검색 
		</button>
		<button >
			Home
		</button>
		<button >
			Create Study
		</button>
		<button >
			MemberShip
		</button>

		<h1 id="pagetitle">Member Ship</h1>

		<hr id="line">
		
		</div>
	<img src="" id="pic">
		<h3>--Please be our colleague--</h3>	
		<h2>정보를 입력해주세요</h2>

	<b id="nametitle">이름</b><br><input type="text" id="name"  style="border: 2px solid #DA81F5;"placeholder="이름을 입력해주세요">
	<b id="nametitle">아이디</b><br><input type="text" id="name"  style="border: 2px solid #DA81F5;"placeholder="아이디를 입력해주세요">
	<button id="chk"style="border: 2px solid #8000FF;">중복확인</button>
	<b id="nametitle">비밀번호 </b><br><input type="text" id="name"  style="border: 2px solid #DA81F5;"placeholder="비밀번호를 입력해주세요">
	<b id="nametitle">비밀번호 확인</b><br><input type="text" id="name"  style="border: 2px solid #DA81F5;"placeholder="비밀번호를 다시 한번 입력해주세요">
	<b id="nametitle">이메일 </b><br><input type="text" id="userMail"  style="border: 2px solid #DA81F5;"placeholder="이메일을 입력해주세요">
	<input type="button"  id="mail"value="인증번호 전송 " onclick="sendemail();">  
	<b id="nametitle">주민등록번호 </b><br><input type="text" id="userMail"  style="border: 2px solid #DA81F5;"placeholder="주민등록번호를 입력해주세요">
	<b id="nametitle">성별 </b><br>
	<select style="border: 2px solid #DA81F5;">
		<option value="male" >
			남자
		</option>
		<option value="female">
			여자
		</option>
	</select>
	<br>
	<br>
	<input type="button" id="sub"value="Join"style="border: none solid #DA81F5;">
	
</body>
</html>