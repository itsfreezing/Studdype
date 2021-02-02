<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function idsearch() { //이름,이메일로 '찾기' 버튼
	var doc=document.getElementsByName("name")[0];
	
	var emailtitle = $("#email1").attr('title');
	var email = $("#email1").val()+"@"+$("#email2").val();
	if(doc.value.trim()==""||doc.value==null){
		alert("이름을 입력해주세요");
		return false;
	}
	 if(emailtitle=="n"){
		alert("이메일인증번호 확인해주세요");
		return false;
	}else{
		   var target="email.do?command=searchid&name="+doc.value.trim()+"&email="+email;
		   open(target,"","width=900,height=700");
		   self.close();
	}
}
function cancel(){
	self.close();
}
</script>
</head>
<body>
	<h1>
		이메일 계정 찾기 
	</h1>
	<form action="email.do">
	<table>
		<tr>
			<th>
			이름
			</th>
			<td>
				<input type="text" name="name" id="name1" title="n">
			</td>
			
		</tr>
		<tr class="email">
			<th>
				이메일
			</th>
			<td>
				<input type="text" name="email"id="email1" > @ <input type="text" name="email" id="email2" >
			</td>
			<td>
              <input type="button" id="btn"value="인증번호 전송" onclick="sendnum();">
            </td>
         	<tr id="code">
            </tr>
		</tr>
		
		  	<tr>
              <td><input type="button" id="search" value="찾기" onClick="idsearch();">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"value="취소  "id="cancel" onClick="cancel();"></td>
             </tr>
		
		
		</table>
	</form>
</body>
</html>