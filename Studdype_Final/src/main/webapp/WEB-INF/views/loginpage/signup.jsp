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
	else if(pw==""||pw==null){
		   document.getElementById('checkpw').style.color="red";
		   document.getElementById('checkpw').innerHTML="비밀번호를 입력해주세요";
  }
	else{
		document.getElementById('checkpw').style.color="blue";
		document.getElementById('checkpw').innerHTML="확인되었습니다";
	}
}
$(function(){
	
	var chkNum_btn = $("#chkNum_btn");
	
	chkNum_btn.attr('disabled', 'disabled');
});
function sendmail(){
	   var mem_email = $("#memberMail").val();
	   var emailVal={
			   "mem_email":mem_email
	   };
	   if(mem_email==null||mem_email.trim()==''){
			 alert("올바른 이메일을 입력해주세요");
			return false;
		 }
	   $.ajax({
	         type:'POST',
	         url: "sendmail.do",
	         data:JSON.stringify(emailVal),
	         contentType:"application/json",
			 dataType:"json",
	         success:function(ramdom){
	            $("#code").html("<input type='text' id='num'><input type='button' value='인증확인' onclick='numchk();'><input type='hidden' id='num2' value='"+ramdom+"'>");
	            document.getElementById("memberMail").title="n"
	            alert("인증번호가 전송되었습니다.");

	         },
	         error:function(){
	            alert("ajax 통신 실패");
	         }
	   }); 
}

function chkVerifiNum(){
	var input = $("#chkNum").val();
	
	var verificationVal = {
			"chk":input
	};

	//인증번호 확인
	$.ajax({
		type:"post",
		url:"chkVerification.do",
		data:JSON.stringify(verificationVal),
		contentType:"application/json",
		dataType:"json",
		success: function(map){
			if(map.isExist == "n"){//이메일이 올바르지 않음
				$("#chk_ok").hide();
				$("#chk_no").show();
				$("#chk").attr("title",'n');
			
			}else{
				$("#chk_no").hide();
				$("#chk_ok").show();
				$("#chk").attr("title",'y');
			}
		} 
		,
		error:function(){
			alert("인증번호 확인 ajax 실패 ㅠ..");
		}
		
		
	});		
}

function chkSubmit(){
	var chk = $("#chk").attr("title");
	var form = $("#sendExtraPwForm");
	
	if( chk == 'y'){
		form.submit();
	}else{
		alert("이메일 인증을 해주세요.");
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
		signupform.submit();
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
				console.log("1=사용가능 /0=사용불가"+data);
				alert(data);
				if(data==1){
					$("#chkid_ok").show();
					$("#chkid_no").hide();
					$("#chk").attr("title",'y');
				}
				else {
					$("#chkid_no").show();
					$("#chkid_ok").hide();
					$("#chk").attr("title",'n');
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

</script>
<style type="text/css">
.title{
   margin-left:45%;
}
.icos{
	color:red;	
	margin-left:65%;
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
   margin-left:17%;
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
                     <input type="text"  name="mem_id" id="memberId" style="border:1px solid #ccc;"placeholder="아이디를 입력해주세요" />
                    <input type="button" value="중복확인" id="check" >
                     <input type="hidden" id="chk" title="y"><!-- 사용가능할경우  -->
                 </td>
             </tr>
             <tr style="display:none;" id="chkid_ok">
   				<td></td>
   				<td style="color:blue">아이디 사용 가능</td>
   			</tr>
   			<tr style="display:none;" id="chkid_no">
   				<td></td>
   				<td style="color:red;">중복된 아이디 존재 </td>
   			</tr>
            
              <tr>
                 <th align="right" width="100">
                    비밀번호 <span class="ico">*</span>
                 </th>
             
                 <td colspan="4">
                    <input type="password" id="memberpw"name="mem_pw" style="border:1px solid #ccc">
                 </td>
              </tr>
         
              <tr>
                 <th align="right" width="100">
                 비번확인 <span class="ico">*</span>
                 </th>
                 <td>
                 	<input type="password" id="mempwd"name="mempwchk" style="border:1px solid #ccc"onclick="chkpwd();">
                    <div id="checkpw">동일한 암호를 입력</div>
                 </td> 
              </tr>     
                <tr>
                 <th align="right" width="100">
                    이메일<span class="ico">*</span>
                 </th>
                 <td>
                    <input type="text" id="memberMail"name="mem_email" style="border:1px solid #ccc" placeholder="email@studdype.com">
                    <input type="button" value="인증번호 전송" id="submit_email" onclick="sendmail();">
                 </td>
              </tr>
              <tr>
   				<td><label for="chkNum">인증번호</label></td>
   				<td>
	   				<input type="text" id="chkNum" name="chkNum" placeholder="인증번호 입력" style="border:1px solid #ccc">
	   				<input type="button" value="확인" id="chkNum_btn" onclick="chkVerifiNum();" >
	   				<input type="hidden" id="chk" title="n">
   				</td>
   			</tr> 
   			<tr style="display:none;" id="chk_ok">
   				<td></td>
   				<td style="color:#4075dd">인증번호가 같습니다.</td>
   			</tr>
   			<tr style="display:none;" id="chk_no">
   				<td></td>
   				<td style="color:red;">인증번호가 다릅니다.</td>
   			</tr> 
              <tr>
                 <th align="right" width="100">
                    이름<span class="ico">*</span>
                   
                 </th>
                 <td>
                    <input type="text" id="memberName" name="mem_name" style="border:1px solid #ccc"> 
                 </td>
              </tr>
	            <tr>
	               <th align="right" width="100">
	                       주민번호<span class="ico">*</span>
	                 </th>
	                 <td colspan="5">
	                    <input type="text" id="rno1" name="mem_rno"style="border:1px solid #ccc" maxlength="6">-<input type="password"name="memrno" id="rno2" style="border:1px solid #ccc" onkeyup="num_check();">
	                 </td>
	            </tr>
            	<tr>
            		<th align="right" width="100">
            			핸드폰번호<span class="ico">*</span>
            		</th>
            		<td colspan="5">
            			<input type="tel" id="memberphone" name="mem_phone" maxlength="13" style="border:1px solid #ccc; width:350px;"pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"/>
            		</td>
            	</tr>
            	 <tr>
                    <th align="right" width="100">
            			성별<span class="ico">*</span>
            		</th>
            		<td>
            		<!-- 	<input type="radio" style="width:23px;height:23px;" name="mem_gender" value="m">M
            			<input type="radio" style="width:23px; height:23px;" name="mem_gender" value="f">F
            		 -->
            		<input type="radio" style="width:23px;height:23px;" name="mem_gender" value="M">M
            		<input type="radio" style="width:23px;height:23px;" name="mem_gender" value="F">F
            		
            		</td>
                </tr>  
             	
        </table>
        <br>
          <input type="submit" id="sign" name="join" value="회원가입">
       </form>
      </div>
</body>
</html>