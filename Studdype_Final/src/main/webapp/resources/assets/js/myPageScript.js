$(function(){
	$("#alert-success").hide();
   	$("#alert-danger").hide();
   	$("input").keyup(function(){
	
		var pwd1=$("#pwd1").val(); 
	  	var pwd2=$("#pwd2").val(); 
	  
		if(pwd1 != "" || pwd2 != ""){
	    	
			if(pwd1 == pwd2){ 
	        	$("#alert-success").show(); 
	            $("#alert-danger").hide(); 
	            $("#submit").removeAttr("disabled"); 
	        }else{ 
        		$("#alert-success").hide();
               	$("#alert-danger").show();
               	$("#submit").attr("disabled", "disabled"); 
            } 
	    }
	}); 
});
 
// 회원탈퇴
function getout(){
	
	var no = '${login.mem_no}';
	
	if('${LeaderList}'!="[]"){
		alert('본인이 팀장인 스터디가 존재합니다. 스터디 관리를 통해 스터디 대표를 양도해주세요.');
	}else{
		
		if(confirm("정말 회원 탈퇴 하시겠습니까?")==true){
			location.href="memberDelete.do?mem_no="+no;
		}else{
			return;
		}
	}
}

//내가 신청한 가입 삭제
function receivedelete(){
	var a = '${Appli}'
	var e = window.event,
	btn = e.target || e.srcElement;
	var c= (btn.id);
	var d = document.getElementById(c).value;
	var f = document.getElementById(c).name;
	
	
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href="receivedelete.do?mem_no="+d+"&s_no="+f;
	}else{
		return;
	}
	
}

//팀장일 경우 가입 신청 거절버튼
function reject(){
	var a = '${Appli}'
   	var e = window.event,
   	btn = e.target || e.srcElement;
   	var c = (btn.id);
   	var d = document.getElementById(c).value;
   	var f = document.getElementById(c).name;
	   
   if(confirm("정말 거절하시겠습니까?") == true){
	   location.href="receivereject.do?mem_no="+d+"&s_no="+f;
   }else{
	   return;
   }
} 

//팀장일 경우 가입신청 수락버튼
function agree(){
   var a = '${Appli}'
   var e = window.event,
   btn = e.target || e.srcElement;
   var c = (btn.id);
   var d = document.getElementById(c).value;
   var f = document.getElementById(c).name;
   
 	alert('mem_no:'+d+"s_no:"+f);
   	if (confirm("정말 수락하시겠습니까?") == true){    //확인
   		location.href="receiveagree.do?mem_no="+d+"&s_no="+f;
   	}else{   
	    return;
	}
	
}

function myapply(){
   $('#myapply').show();
   $('#Receive').hide();
   $('#meet').hide();
   $('#a').css("color","#808080");
   $('#b').css("color","white");
   $('#c').css("color","white");

}
     
function receive(){
   $('#myapply').hide();
   $('#Receive').show();
   $('#meet').hide();
   $('#b').css("color","#808080");
   $('#a').css("color","white");
   $('#c').css("color","white");
} 

function meet(){
   $('#myapply').hide();
   $('#Receive').hide();
   $('#meet').show();
   $('#c').css("color","#808080");
   $('#b').css("color","white");
   $('#a').css("color","white");
}
        
//비밀번호 변경
function showPw(multipleFilter) {
	
	const popup = document.querySelector('#popup');
    
	if (multipleFilter) {
       popup.classList.add('multiple-filter');
    } else {
       popup.classList.remove('multiple-filter');
    }
    
	popup.classList.remove('hide');
}

function pwclosePopup() {
	const popup = document.querySelector('#popup');
    popup.classList.add('hide');
}

function changepw(){
	var a = $('input[name=pwd2]').val();
	         
	location.href="changepw.do?mem_no="+'${login.mem_no}'+"&new_pw="+a;
}

//이메일 변경 
function showEmail(multipleFilter) {
    
const emailpopup = document.querySelector('#emailpopup');
    
    if (multipleFilter) {
       emailpopup.classList.add('multiple-filter');
    } else {
       emailpopup.classList.remove('multiple-filter');
    }
    
    emailpopup.classList.remove('hide');
}

function closeemailPopup() {
	const emailpopup = document.querySelector('#emailpopup');
	emailpopup.classList.add('hide');
}
     
function changeemail(){
	var a = $('input[name=newemail]').val();
	location.href="changeemail.do?mem_no="+'${login.mem_no}'+"&new_email="+a;

}
     
//전화번호 변경
function showphone(multipleFilter) {
	const phonepopup = document.querySelector('#phonepopup');
    
    if (multipleFilter) {
       phonepopup.classList.add('multiple-filter');
    } else {
       phonepopup.classList.remove('multiple-filter');
    }
    
    phonepopup.classList.remove('hide');
}

function closephonePopup() {
	const emailpopup = document.querySelector('#phonepopup');
    phonepopup.classList.add('hide');
}

function changephone(){
	var a = $('input[name=newphone]').val();
    //location.href="changeemail.do?mem_no="+'${login.mem_no}'+"&new_email="+a;
}