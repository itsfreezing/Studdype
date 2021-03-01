<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
   
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/mainsection.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet" href="./resources/css/studdype/findpw.css">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<style type="text/css">
h1{
   margin-top: 3%;
   font-weight:600;
   margin-left:auto;
   margin-right:auto;
   margin:auto;
   font-size: 30px;
   line-height: 20px;
   text-align: center;
}
span{
   margin-left:auto;
   margin-right:auto;
   margin:auto;
   color:white;
   font-size: 20px;
}
label{
   margin-left: 30%;
   font-weight: 800;
}
#sendExtraPwForm{
   width: 800px;
   margin: auto;
   margin-right: auto;
   margin-left: auto;
   padding-top: 20px;
}
.main_div{
   margin-left: auto;
   margin-right: auto;
   width: 550px;
   height: 280px;
   margin-top: -1%;
   background: white;
   border-radius: 5px;
   opacity: 85%;
}
#id{
   margin-left:3%;
    width:250px;
    height:40px;
    margin-bottom: 3%;
}
#id:hover{
   border: 2px solid #6434ef;
}
#email{
   margin-left:3%;
    width:250px;
    height:40px;
    margin-bottom: 3%;
}
#email:hover{
   border: 2px solid #6434ef;
}
#submit_email{
    width:50px;
    height:40px;
    margin-top: 3%;
    margin-bottom: 10%;
    margin-left:-50%;
    border-radius: 5px;
    background: gray;
    border: 1px;
    color: white;
}
#submit_email:hover{
   background-color: white;
   border: 1px solid #6434ef;
   font-weight:bold;
   color: #6434ef;
   cursor: pointer;
   transition: 0.5s;
}
#chkNum{
   margin-left:3%;
    width:250px;
    height:40px;
    margin-bottom: 5%;
}
#chkNum:hover{
   border: 2px solid #6434ef;
}
#chkNum_btn{
    width:50px;
    height:40px;
    margin-bottom: 18%;
    margin-top: -15%;
    margin-bottom: 10%;
    margin-left:-50%;
    border-radius: 5px;
    background: gray;
    color: white;
}
#chkNum_btn.active:hover{
   background-color: white;
   border: 1px solid #6434ef;
   font-weight:bold;
   color: #6434ef;
   cursor: pointer;
   transition: 0.5s;
}
.main_btn{
   margin-top: 8%;
       width: 550px;
}
#psw_btn{        
display: inline-block;
   width:50%;
   float: left;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
      height:50px;
   background-color: white;
   border: 1px solid #A6A6A6;
   font-size: 15px;
   color: black;
   padding: 1%;
   box-shadow: none;
   border-radius: 0 0 0 5px;
   margin: 0!important;
}
#psw_btn:hover{
   background-color: white;
   border: 1px solid #6434ef;
   font-weight:bold;
   color: #6434ef;
   cursor: pointer;
   transition: 0.5s;
}
#cancel_btn{
   display: inline-block;
   width:50%;
   float: right;  
      height:50px;
   background-color: white;
   border: 1px solid #A6A6A6;
   font-size: 15px;
   color: black;
   padding: 1%;
   box-shadow: none;
   text-align: center;
   font-weight: bold;
   border-radius: 0 0 5px 0;
}

#cancel_btn:hover{
   background-color: white;
   border: 1px solid #6434ef;
   font-weight:bold;
   color: #6434ef;
   cursor: pointer;
   transition: 0.5s;
}
.footer-text{
   margin-top: 20px;
}
</style>

<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>

<script type="text/javascript">
var mem_id;
var mem_email;

$(function() {
   $(".background").show(); 
   $(".background").css({"background-image":"url('resources/assets/img/main3.png')","background-size":"cover"});
   $(".background").css("height", "850px");
   $(".hero-text").html("<h1>비밀번호 찾기</h1><br><span>하단에 정보를 기입해 주시면 임시 비밀번호를 보내드려요.</span>");
   $(".footer-text").css("margin-top", "20px");
});
 
$(function(){
   
   var chkNum_btn = $("#chkNum_btn");
   
   chkNum_btn.attr('disabled', 'disabled');
});

function sendEmail(){
	
	mem_id = $("#id").val();
	mem_email = $("#email").val();
   
   if( mem_id == null || mem_id.trim() ==''){
      alert("아이디를 입력해주세요.");
      return false;
   }else if( mem_email == null || mem_email.trim() ==""){
      alert("이메일을 입력해주세요.");
      return false;
   }else{
		if(chkSubmit()) {
			if(!emailCheck(mem_id, mem_email)) {
				return false;
			}else {
				return true;
			}
		}
		
	}
}

function emailCheck(mem_id, mem_email) {
	var verificationVal = {
            "mem_id":mem_id,
            "mem_email":mem_email
      };

      //인증메일 전송
      $.ajax({
         type:"post",
         url:"sendVerification.do",
         data:JSON.stringify(verificationVal),
         contentType:"application/json",
         dataType:"json",
         success: function(map){
            if(map.isExist == "n"){//이메일이 올바르지 않음
               alert("입력하신 정보와 회원 정보가 일치하지 않습니다!");
            	return false;
            }else{
               alert("이메일을 전송했습니다.")
               var chkNum_btn = $("#chkNum_btn");      
               var eamilInput = $("#email");
               eamilInput.attr("readonly","readonly");
               chkNum_btn.addClass("active");
               chkNum_btn.removeAttr("disabled");
               
            }
         } 
         ,
         error:function(){
            alert("인증메일 전송 ajax 실패 ㅠ..");
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
   
   if( chk == 'y'){
      return false;
   }else{
       return true;
   }
   
}

function cancel(){
   self.close();
}
</script>
</head>
<body>
<div class="background">
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
   
   <div class="main_div">
   <form action="sendExtraPw.do" method="post" id="sendExtraPwForm" onsubmit="return sendEmail()" autocomplete="off">
   <div>
         <table>
            <col width="150px"><col width="350px"><col width="100px">
            <tr>
               <td><label>아이디</label></td>
               <td><input type="text" id="id" placeholder=" 아이디를 입력해 주세요." name="mem_id"></td>
            </tr>
            <tr>
               <td><label>이메일</label></td>
               <td><input type="text" id="email" name="mem_email" placeholder=" 이메일 (email@studdype.com)"></td>
               <td><input type="button" value="전송" id="submit_email" onclick="sendEmail()"></td>
            </tr>
            <tr>
               <td><label>인증번호</label></td>
               <td><input type="text" id="chkNum" name="chkNum" placeholder=" 인증번호 입력" ></td>
               <td><input type="button" name="chk_num" value="확인" id="chkNum_btn" onclick="chkVerifiNum();">
               <input type="hidden" id="chk" title="n">
               </td>
            </tr> 
            <tr style="display:none;" id="chk_ok">
               <td></td>
               <td style="color:#32CD32">인증번호가 같습니다.</td>
            </tr>
            <tr style="display:none;" id="chk_no">
               <td></td>
               <td style="color:red;">인증번호가 다릅니다.</td>
            </tr>          
               
         </table>
         
   </div>
   <div class="main_btn">
      <button type="submit" class="findform_btn" id="psw_btn">비밀번호 찾기</button>
         <input class="findform_btn" id="cancel_btn" value="취소" onClick="location.href='loginform.do'">
   </div>
   
      </form>
      
      </div>
      </div>
   <jsp:include page="../commond/commondFooter.jsp"></jsp:include>
   <!-- 스크립트 -->
   <script src="./resources/assets/js/popper.min.js"></script> 
   <script src="./resources/assets/js/bootstrap.min.js"></script>
   <script src="./resources/assets/js/owl.carousel.min.js"></script>
   <script src="./resources/assets/js/modal-video.js"></script>
   <script src="./resources/assets/js/loadmore.js"></script>
   <script src="./resources/assets/js/prefixfree.min.js"></script>
   <script src="./resources/assets/js/main.js"></script>

</body>
</html>