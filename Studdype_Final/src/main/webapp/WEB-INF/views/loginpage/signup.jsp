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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function chkpwd(){
	var pw=document.getElementById('memberpw').value;
	var pw2=document.getElementById('mempwd').value;
	if(pw!=pw2){
		document.getElementById('checkpw').style.color="red";
		document.getElementById('checkpw').innerHTML="동일하지 않습니다";
	
	}
	else{
		document.getElementById('checkpw').style.color="blue";
		document.getElementById('checkpw').innerHTML="확인되었습니다";
	}
}

$(document).ready(function(){

	$("#sign").click(function(){	
		if($("#memberId").val().trim()==""){
			alert("아이디를 입력해주세요");
			$("#memberId").focus();
			return false;
		}
		else if($("#memberpw").val().trim()==""){
			alert("password를 입력해주세요");
			$("#memberpw").focus();
			return false;
		}else if($("#memberpw").val()!=$("#mempwd").val()){
			alert("패스워드가 다릅니다");
			$("#memberpw").focus();
			return false;
		}else if($("#memberemail").val()==""){
			alert("이메일을 입력해주세요");
			$("#memberemail").focus();
			return false;
		}else if($("#memberName").val()==""){
			alert("이름을 입력해주세요");
			$("#memberName").focus();
			return false;
		}else if($("#rno1").val()==""||$("#rno2").val()==""){
			alert("주민번호를 입력해주세요");
			$("#rno1").focus();
			return false;
		}
		else if($("#memberphone").val()==""){
			alert("핸드폰번호를 입력해주세요");
			$("#memberphone").focus();
			return false;
		}else if($("#gender").val()==""){
			alert("성별을 선택해주세요");
			$("#gender").focus();
			return false;
		}
	});	
	
	
	
	
	
	
	
	
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
function num_check(){
	var flag=0;
	rno1=[];
	rno2=[];
	sum1=0;
	sum2=0;
	var i=0;
	var j=0;
	var total=0;
	var total2=0;
	var num1=document.getElementById("rno1").value;
	var num2=document.getElementById("rno2").value;
	rno1=num1;//앞자리
	rno2=num2;//뒷자리
	for(i=0;i<6;i++){
		sum1+=parseInt(rno1[i])*(i+2);
	}
	total1=sum1;
	for(j=2;j<6;j++){
		sum2+=parseInt(rno2[j])*j;
	}
	total2=sum2+parseInt((rno1[0])*8)+parseInt((rno1[1])*9);
	if(rno2.length==7){
		flag=1;
	}
	if(flag==1){
		if((11-((total1+total2)%11)%10)==rno2[6]){
			alert("유효한 주민등록번호입니다");
			flag=0;
		}else{
			alert("존재하지 않는 주민등록번호 입니다 다시 확인해주세요");
			flag=0;
		}
	}
}
/*
function validate(){
	
	var form=document.register;
	
	if(form.memberId.value==""){
		alert("아이디를 입력해주세요");
		form.memberId.focus();
		return false;
	}
	if(form.memberpw.value==""){
		alert("비밀번호를 입력해주세요");
		form.memberpw.focus();
		return false;
	}
	if(form.memberemail.value==""){
		alert("이메일을 입력해주세요");
		form.memberemail.focus();
		return false;
	}
	if(form.memberName.value==""){
		alert("이름을 입력해주세요");
		form.memberName.focus();
		return false;
	}
	if(form.rno1.value==""){
		alert("주민등록번호를 입력해주세요");
		form.rno1.focus();
		return false;
	}
	if(form.memberphone.value==""){
		alert("전화번호를 입력해주세요");
		form.memberphone.focus();
		return false;
	}
	
}*/
</script>
<style type="text/css">
.title{
   margin-left:45%;
}
.icos{
	color:red;	
	margin-left:45%;
}
.ico{
   color:red;
}
hr{
   width:900px;
   border:1px solid black;
}
#signtitle{
	margin-left:30%;
}
input{
   width:350px;
   height:44px;
}
#check{
   width:120px;
   height:40px;
}
#sign{
   width:150px;
   height:44px;
}
#rno1{
   width:120px;
   height:30px;
}
#rno2{
   width:120px;
   height:30px;
}
#signup{
	width:150px;
	height:30px;
	margin-left:23%;
}
</style>

</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
<div class="head">
		<h3 class="title">회원가입</h3>
		<p class="sub">
			<span class="icos">*</span>
				필수입력사항	
			<hr>
		</p>
	</div> 
   <div id="signtitle">
      <form action="signup.do" id="signupform" name="register" method="POST" autocomplete="off" >
        <table>
        	<tr>
				<th>
				 아이디
				 	<span class="ico">*</span>
				</th>
                 <td> 
                     <input type="text" title="y" name="mem_id" id="memberId" style="border:1px solid #ccc;"placeholder="아이디를 입력해주세요" />
                     <input type="button" value="중복확인" id="check" >
                 </td>
             </tr>
                    <tr>
						<td colspan=3 id="IdCheck"></td>
					</tr>
                 
                
        </table>
        <br>
	
          <input type="button" id="sign" name="join" value="회원가입">
       </form>
      </div>
</body>
</html>