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
	var pw2=document.getElementById('mempw').value;
	if(pw!=pw2){
		$("#chkpw_no").show();
		$("#chkpw_ok").hide();
		$("#chkpw").hide();
	
	}
	else if(pw==""||pw==null){
		  $("#chkpw").show();
		  $("#chkpw_no").hide();
		  $("#chkpw_ok").hide();
  }
	else{
		$("#chkpw_ok").show();
		$("#chkpw_no").hide();
		$("#chkpw").hide();
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
	         success:function(map){
	          if(map.isExist=="n"){
	        	  alert("메일이 잘못되었습니다");
	        	  
	          }else{
	        	  alert("인증번호 전송");
	        	  var chkNum_btn=$("#chkNum_btn");
	        	  var emailInput=$("#memberMail");
	        	  emailInput.attr("readonly","readonly");
	        	  chkNum_btn.removeAttr("disabled");
	          }
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

$(document).ready(function(){	
	
	$("#sign").click(function(){	
		if($("#memberId").val().trim()==""||$("#memberId").val()==null){
			alert("아이디를 입력해주세요");
			$("#memberId").focus();
			return false;
		}/*else if($("#check").attr("title")=="n"){
			alert("아이디 중복체크해주세요");
			return false;
		}*/
		else if($("#memberpw").val().trim()==""||$("#memberpw").val()==null){
			alert("password를 입력해주세요");
			$("#memberpw").focus();
			return false;
		}else if($("#memberpw").val()!=$("#mempw").val()){
			alert("패스워드가 다릅니다");
			$("#memberpw").focus();
			return false;
		}else if($("#memberMail").val().trim()==""||$("#memberMail").val()==null){
			alert("이메일을 입력해주세요");
			$("#memberemail").focus();
			return false;
		}/*else if($("#memberMail").attr("title")=="n"){
			alert("이메일 인증해주세요");
			return false;
		}*/
		else if($("#memberName").val()==""){
			alert("이름을 입력해주세요");
			$("#memberName").focus();
			return false;
		}else if($("#unum1").val()==""||$("#unum1").val()==null){
			alert("주민번호를 입력해주세요");
			$("#rno1").focus();
			return false;
		}else if($("#unum2").val()==""||$("#unum2").val()==null){
			alert("주민번호 뒷자리를 입력해주세요");
			$("#rno2").focus();
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
	 var num1 = document.getElementById("unum1");
     var num2 = document.getElementById("unum2");
     var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
     var arrNum2 = new Array();
     
     for (var i=0; i<num1.value.length; i++) {
          arrNum1[i] = num1.value.charAt(i);
      } // 주민번호 앞자리를 배열에 순서대로 담는다.

      for (var i=0; i<num2.value.length; i++) {
          arrNum2[i] = num2.value.charAt(i);
      } // 주민번호 뒷자리를 배열에 순서대로 담는다.

      var tempSum=0;

      for (var i=0; i<num1.value.length; i++) {
          tempSum += arrNum1[i] * (2+i);
      } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

      for (var i=0; i<num2.value.length-1; i++) {
          if(i>=2) {
              tempSum += arrNum2[i] * i;
          }
          else {
              tempSum += arrNum2[i] * (8+i);
          }
      } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함
      if((11-(tempSum%11))%10!=arrNum2[6]) {
    		$("#chknum_no").show();
			$("#chknum_ok").hide();
          return false;
      }else{
    	  $("#chknum_ok").show();
			$("#chknum_no").hide();
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
   color:green;
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
#chkNum_btn{
	width:120px;
	height:40px;
}
#submit_email{
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
			
			<hr>
	</div> 
   <div id="signtitle"> 
      <form action="signup.do" id="signupform" name="register" method="POST" autocomplete="off">
        <table>
        	<tr>
				<th>
				 아이디
				 	<span class="ico">*</span>
				</th>
                 <td> 
                     <input type="text"  name="mem_id" id="memberId" title="n" style="border:1px solid #ccc;"placeholder="아이디를 입력해주세요"/>
                    <input type="button" value="중복확인" id="check" title="n" >
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
                 	<input type="password" id="mempw" name="mempwchk" style="border:1px solid #ccc"onclick="chkpwd();">
                 </td> 
              </tr> 
              <tr style="display:none;" id="chkpw_ok">
   				<td></td>
   				<td style="color:blue">확인되었습니다</td>
   			</tr>
   			<tr style="display:none;" id="chkpw_no">
   				<td></td>
   				<td style="color:red;">패스워드가 다릅니다</td>
   			</tr>
   			<tr style="display:none;" id="chkpw">
   				<td></td>
   				<td style="color:red;">패스워드를 입력해주세요</td>
   			</tr>
   			
                
                <tr>
                 <th align="right" width="100">
                    이메일<span class="ico">*</span>
                 </th>
                 <td>
                    <input type="text" id="memberMail"name="mem_email" title="n" style="border:1px solid #ccc" placeholder="email@studdype.com">
                    <input type="button" value="인증번호 전송" id="submit_email" onclick="sendmail();">
                 </td>
              </tr>
              <tr>
   				<td><label for="chkNum">인증번호<span class="ico">*</span></label></td>
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
	                    <input type="text" name="unum1" id="unum1" style="border:1px solid #ccc" maxlength="6">-
	                    <input type="password"name="unum2" id="unum2" style="border:1px solid #ccc" maxlength="7" onkeyup="num_check();">
	                 </td>
	            </tr>
	            <tr style="display:none;" id="chknum_ok">
	   				<td></td>
	   				<td style="color:blue">올바른 주민번호입니다</td>
   				</tr>
	   			<tr style="display:none;" id="chknum_no">
	   				<td></td>
	   				<td style="color:red;">올바르지 않은 주민번호 입니다</td>
	   			</tr> 
            	<tr>
            		<th align="right" width="100">
            			핸드폰번호<span class="ico">*</span>
            		</th>
            		<td colspan="5">
            			<input type="tel" id="memberphone" name="mem_phone" maxlength="13" style="border:1px solid #ccc; width:350px;"pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-1234-5678 형식에 맞게 입력해주세요"/>
            		</td>
            	</tr>
            	 <tr>
                    <th align="right" width="100">
            			성별<span class="ico">*</span>
            		</th>
            		<td>
            		 	
            		<input type="radio" style="width:23px;height:23px;" name="mem_gender" id="gender" value="M" >M
            		<input type="radio" style="width:23px;height:23px;" name="mem_gender" id="gender"value="F">F
            		 

            		</td>
                </tr>  
             	
        </table>
        <br>
          <input type="submit" id="sign" name="join" value="회원가입" >
       </form>
   </div>
     <jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>

	<script src="./resources/assets/js/popper.min.js"></script>
	<script src="./resources/assets/js/bootstrap.min.js"></script>
	<script src="./resources/assets/js/owl.carousel.min.js"></script>
	<script src="./resources/assets/js/modal-video.js"></script>
	<script src="./resources/assets/js/loadmore.js"></script>
	<script src="./resources/assets/js/prefixfree.min.js"></script>
	<script src="./resources/assets/js/main.js"></script>
</body>
</html>