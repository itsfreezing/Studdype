<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ComunityHome</title>


    <script type="text/javascript">
        //왼쪽네비 고정 스크립트
        $(window).scroll(function(){
            var div = document.querySelector('div');        
             var compStyle = window.getComputedStyle(div);
            var height = compStyle.height.substring(0,3);
            if($(document).scrollTop() > height){
                $('.left-navigation').addClass('fixed');
            }else{
                $('.left-navigation').removeClass('fixed');
            }
        });
		
    	//현재 페이지 표시 css
       $(function(){
        	//현제 페이지 이름
        	var currentPage = $("#currentPage").val();
  	   
        
        	$("#"+currentPage).removeClass('navBtn');
        	$("#"+currentPage).addClass('active');
       });
       
        function openWebMeeting(){    		
        	window.open("https://192.168.219.109:9001/webmeeting.html?studyid="+ $("#studyid").val() +"&memberid="+$("#memberid").val());
    		
    		//172.30.1.38  -> localhost
    		//우선 테스트를 위해 아이피주소로 변경해놈
    	};
    </script>
</head>
<body>
	<input type="hidden" id="currentPage" value="${leftnavi }">
	<!--왼쪽 네비게이션-->
    <div class="left-navigation">
        <div class="real-left">
        <ul class="leftnavi-ul">
            <li class="leftnavi-item" > <img src="./resources/assets/img/category_home_gray.png"><input type="button" value="스터디홈" onclick="location.href='communityhome.do'"  class="navBtn" id="studyhome"></li>
            <li class="leftnavi-item" > <img src="./resources/assets/img/category_notice.png"><input type="button" value="공지사항" onclick="location.href='notice.do'"  class="navBtn" id="notice"></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_freeBoard.png"><input type="button" value="자유게시판" onclick="location.href='freeboard.do'" class="navBtn" id="freeboard"></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_dataRoom.png"><input type="button" value="학습자료실" onclick="" class="navBtn"></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_gallery.png"><input type="button" value="갤러리" onclick="" class="navBtn"></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_schedule.png"><input type="button" value="일정관리" onclick="" class="navBtn"></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_meet.png"><input type="button" value="모임관리" onclick="location.href='meetlist.do'" class="navBtn" id="meet"></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_webcam.png"><input type="button" value="화상회의" onclick="openWebMeeting();" class="navBtn"></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_searchBook.png"><input type="button" value="도서검색" onclick="location.href='bookboardform.do'" class="navBtn" id="book"></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_management_gray.png"><input type="button" value="스터디관리" onclick="" class="navBtn"></li>

        </ul>
        </div>
    </div>
    <input type="hidden" value="${login.mem_no }" id="memberid">
    <input type="hidden" value="${study.s_no}" id="studyid">
</body>
</html>