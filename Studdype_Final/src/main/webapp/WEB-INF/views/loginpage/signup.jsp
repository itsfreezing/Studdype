<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
var finish_flag = 0;  //전체 검사 flag 설정


function pw_check() {   //비밀번호, 비밀번호 확인 비교 함수
  var pw = document.getElementById("pw").value;
  var repw = document.getElementById("repw").value;

  if (pw == "" || repw == "") //두 입력칸 중 비어있는 것이 존재할 때
  {
    alert("비밀번호를 입력해주세요."); //메시지 출력

  } else if (pw != repw) {
    alert("비밀번호가 일치하지 않습니다."); //일치 메시지 출력
  } else {
    alert("비밀번호가 일치합니다."); //일치 메시지 출력
    finish_flag = 1;   //전체 검사 flag 1로 set
  }

}

function personal_num_check() { //주민등록번호 유효성 검사 (마지막 숫자 비교 방식)

	  var flag = 0; //onkeyup 동작용

	  id_num1 = [];
	  id_num2 = []; //빈 배열 생성
	  sum1 = 0;
	  sum2 = 0; //sum 결과값을 받을 배열 생성
	  var i = 0;
	  var j = 0;
	  var total1 = 0;
	  var total2 = 0; //전체 더한 값 변수
	  var num1 = document.getElementById("id_num_1").value;
	  var num2 = document.getElementById("id_num_2").value; //데이터값 불러오기

	  id_num1 = num1;
	  id_num2 = num2; //만들어진 배열에 값을 다시 넣어줌

	  for (i = 0; i < 6; i++) //앞자리 연산
	  {
	    sum1 += parseInt(id_num1[i]) * (i + 2);
	  }
	  //alert(sum1);
	  total1 = sum1;

	  for (j = 2; j < 6; j++) //뒷자리 index 2~5번 연산
	  {
	    sum2 += parseInt(id_num2[j]) * j;
	  }
	  total2 = sum2 + parseInt((id_num2[0]) * 8) + parseInt((id_num2[1]) * 9);
	  //alert(total2);
	  //alert(id_num2[6]);
	  if (id_num2.length == 7) {   //뒷자리가 모두 채워지면?
	    flag = 1;  //flag설정
	  }

	  if (flag == 1)  //flag 1로 바뀌면 유효성 검사 동작
	  {
	  if ((11 - ((total1 + total2) % 11) % 10) == id_num2[6]) //유효성 검사 만족
	  {
	    alert("유효한 주민등록번호 입니다..");
	    flag = 0;  //flag reset
	  }
	  else
	  {
	    alert("유효하지 않은 주민등록 번호 입니다. 다시 확인해주세요.");
	    flag = 0;  //flag reset
	  }
	}
}

	

function show_birth()  //주민번호 생년월일로 자동 출력 함수 
{
	 var birth_year = 0;
	 var birth_month = 0;
	 var birth_day = 0;

	id_num1 = [];
	var num1 = document.getElementById("id_num_1").value;  //주민번호 앞자리 데이터 값

	id_num1 = num1;
		  //alert(id_num1[0]);

	 birth_year = (parseInt(id_num1[0])*10) + parseInt(id_num1[1]);  //생년
	 birth_month = (parseInt(id_num1[2])*10) + parseInt(id_num1[3]);  //월
	 birth_day = (parseInt(id_num1[4])*10) + parseInt(id_num1[5]);  //일 두자리씩 숫자로 뽑아냄

		if(birth_year > 20)    //2020 기준으로 나눠줌
		  {
		     birth_year = 1900 + birth_year;   //앞 두 자리수가 20초과면 1900 더해줌
		  }
		else {
		      
		        birth_year = 2000 + birth_year;  //20 이하면 2000년대
		    }

		  document.getElementById("year").value=birth_year;
		  document.getElementById("month").value=birth_month;
		  document.getElementById("day").value=birth_day;   //id값에 따라 값 바꾸어줌
	}

	

	function finish_check()
	{
	   if(finish_flag == 1)  //비밀번호 확인 누르면? flag 확인
	   {
	     return true;  //True 반환

	   }
	   else {
	     alert("비밀번호 확인을 해주세요.");  //메시지 출력
	     return false;  //False 반환
	   }
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
#btn{
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
#join{
	width:150px;
	height:30px;
}
</style>

</head>
<body>
<div id="header">
   <img src="./resources/assets/img/logo_white.png" id="logo">

      <button>
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
   <br><br>   
      <h3>--Please be our colleague--</h3>
      <br><h2 id="big">정보를 입력해주세요</h2>
   <div id="signtitle">
      <form action="signup.do" method="POST" onsubmit = "return finish_check()">
         <table>
                    <tr>
                        <td><h3 id="idtitle">아이디</h3></td>
                    </tr>
                    <tr>
                      <td> 
                           
                           <input type="text" name="id" value="" style="border:2px solid #DA81F5;" size="25" maxlength="12" placeholder="아이디를 입력해주세요" pattern="[a-zA-Z0-9]{4,12}" title = "4~12자의 영문 대소문자와 숫자로만 입력" required />
                     </td>
                    </tr>

                    <tr>
                        <td>
                            <h3 id="idtitle">비밀번호</h3>
                        </td>
                    </tr>   
                    <tr>           
                        <td>
                            <input type="password" id="pw"name="pw" value=""  style="border:2px solid #DA81F5;" maxlength="12" size="25" placeholder="비밀번호를 입력해주세요" pattern="[a-zA-Z0-9]{4,12}"required />

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3 id="idtitle">비밀번호확인</h3>
                        </td>
                    </tr> 
                    <tr>
                        <td colspan="5">
                            <input type="password" name="repw"style="border:2px solid #DA81F5;" placeholder="비밀번호를 확인해주세요" id="repw" value="" size="20" maxlength="12">
                            <input type="button" name="pwc"  id="btn"value="check" onclick="pw_check()">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <h3 id="idtitle">이메일</h3>
                        </td>
                    </tr> 
                    <tr>
                    	<td>
                    		<input type="text" name="mail" style="border: 2px solid #DA81F5;"placeholder="이메일을 입력해주세요" size="30" pattern="[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}" required />
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
                        <td><input type="text" style="border: 2px solid #DA81F5;" placeholder="이름을 입력해주세요"></td>
                    </tr>
                    <tr>
                    	<td>
                    		<h3 id="idtitle">주민등록번호 </h3>
                    	</td>
                    </tr>
                    <tr>
                    	<td colspan="5">
                    		<input type="text" name="id_num_1" style="border: 2px solid #DA81F5;" id ="id_num_1" maxlength="6" onkeyup="show_birth()" required /> -<input type="password" name="id_num_2" style="border: 2px solid #DA81F5;" id ="id_num_2" maxlength="7" onkeyup="personal_num_check()">
                    	</td>
                    </tr>
                    <tr>
                    	<td>
                    		<h3 id="idtitle">성별 </h3>
                    	</td>
                    </tr>
                    <tr>
                    	<td>
		               		<select id="select" style="border: 2px solid #DA81F5;">
					        	<option value="male">
					        		남자 
					        	</option>
					        	<option value="female">
					        		여자
					        	</option>
					        </select>
					     </td>
                    </tr>
                    
                    
        </table>
		      
		<br>
      		  <center>
		        <input type="submit" name="join"  id="join" value="회원 가입">
		      </center>
        
      </form>
      
        
      
      
   </div>
  </body>
  </html> 