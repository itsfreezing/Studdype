



$(function(){
	$("#alert-success").hide();
   	$("#alert-danger").hide();
   	$("input").keyup(function(){
	
		var pwd1=$("#pwd1").val(); 
	  	var pwd2=$("#pwd2").val(); 
	  
		
		if(pwd1 != "" || pwd2 != ""){
	    		
			if(pwd1 == pwd2){ 
				$("#aaaaa").hide();
	        	$("#alert-success").show(); 
	            $("#alert-danger").hide(); 
	            $("#submit").removeAttr("disabled"); 
	        }else{ 
				$("#aaaaa").hide();
        		$("#alert-success").hide();
               	$("#alert-danger").show();
               	$("#submit").attr("disabled", "disabled"); 
            } 
	    }
	}); 
});
 


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
			var b = $('input[name=mem_no]').val();
		    var c = $('input[name=newemail]').val();
		
		    location.href="changephone.do?mem_no="+b+"&new_phone="+a+"&new_email="+c;
}
	



     
