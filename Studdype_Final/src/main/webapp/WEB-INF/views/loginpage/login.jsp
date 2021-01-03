<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
   <link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
   <link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
   <link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
   <link rel="stylesheet" href="./resources/assets/css/nice-select.css">
   <link rel="stylesheet" href="./resources/assets/css/animate.css">
   <link rel="stylesheet" href="./resources/assets/css/normalize.css">
   <link rel="stylesheet" href="./resources/css/style.css">
   <link rel="stylesheet" href="./resources/assets/css/responsive.css">
<style type="text/css">
   #center{
      background-color:lightblue;
      background-image:url('./resources/assets/img/img_study8.png');/*임의 배경 설정 */
      width:100%;
      opacity:70%;
   }
   header{
      margin-left:45%;
      
   }
   #line1{
      margin-top:0.5%;
   }
   #line{
      margin-top:5%;
   }
   #title{
      margin-top:20%;
      margin-left:5%;
      color:white;
   }
   #btn{   
   
      margin-left:65%;
   }
   #img{
      height:50px;
      background-color:white;
      border-radius:60%;
      margin-left:5%;
   }
   #chk{
      margin-left:260%;
      margin-top:10%;
      width:280px;
      height:50px;
   }
   #chk1{
      margin-left:260%;
      width:280px;
      margin-top:10%;
      height:50px;
      
   }
   #sign{
      margin-left:43%;
      margin-top:3%;
      width:280px;
      height:50px;
      background-color:purple;
      color:white;
      font-weight:bold;
      font-size:20px;
   }
   
   #email{
      margin-left:40%;
   }
   #foot{
      margin-left:1%;
   }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
   <div id="center">
      <button id="btn">지역별 검색</button>
      <button>카테고리별 검색</button>
      <button>홈으로 가기</button>
      <button>스터디 생성</button>
   
      <header>
         <h1 id="title">
            Login
         </h1>
         <img src="./resources/assets/img/icon_arrow_gray.png" id="img">
      
   
      </header>
      
      <hr id="line">
   </div>
   
<!--    <input type="text" placeholder="아이디를 입력해주세요" id="chk" style="border:2px solid #F5A9F2">
   <br>
   <br>
   <input type="password" placeholder="비밀번호를 입력해주세요" id="chk1" style="border:2px solid #F5A9F2">
   <br>
   <br>
   <br>
    -->
    
    <form action="loginform.do" method="POST">
       <table>
          <tr>
             <td>
                <input type="text" name="ID" id="chk"placeholder="아이디를 입력해주세요" style="border:2px solid #F5A9F2">
             </td>
          </tr>
          <br>
          <tr>
             <td>
                <input type="text" name="pw" id="chk1" placeholder="비밀번호를 입력해주세요" style="border:2px solid #F5A9F2">
             </td>
          </tr>
       
       </table>
    
    
    
    </form>
    
    
   <button id="sign" style="border:0" onclick="location.href='home.jsp'">Sign</button>
   <br>
   <br>
   <a href="email.do" id="email" onClick="window.open(this.href,'','width=700, height=430'); return false;">이메일 계정찾기</a>
   |<a href="pwd.do" id="pwd1" onClick="window.open(this.href,'','width=700, height=430'); return false;">비밀번호 찾기</a>
   |<a href="signform.do" id="">회원가입</a>
   


      
   <hr id="line1">
      <p id="foot">Copyright © StuDdype Inc. All Rights Reserved.</p>



</body>
</html>