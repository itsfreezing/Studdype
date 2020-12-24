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
        
        function openWebMeeting(){    		
    		window.open("https://localhost:9001/qwe.html?studyid="+ $("#studyid").val() +"&memberid="+$("#memberid").val());
    		//172.30.1.38  -> localhost
    	};
    </script>
</head>
<body>
	<!--왼쪽 네비게이션-->
    <div class="left-navigation">
        <div class="real-left">
        <ul class="leftnavi-ul">
            <li class="leftnavi-item"> <a href="#"> <img src="./resources/assets/img/category_home_gray.png"><div>스터디 홈</div> </a></li>
            <li class="leftnavi-item"> <a href="#"> <img src="./resources/assets/img/category_notice.png"><div>공지사항</div> </a></li>
            <li class="leftnavi-item"> <a href="#"><img src="./resources/assets/img/category_freeBoard.png"><div>자유게시판</a></li>
            <li class="leftnavi-item"> <a href="#"><img src="./resources/assets/img/category_dataRoom.png"><div>학습자료실</div></a></li>
            <li class="leftnavi-item"> <a href="#"><img src="./resources/assets/img/category_gallery.png"><div>갤러리</div></a></li>
            <li class="leftnavi-item"> <a href="#"><img src="./resources/assets/img/category_schedule.png"><div>일정관리</div></a></li>
            <li class="leftnavi-item"> <a href="#"><img src="./resources/assets/img/category_meet.png"><div>모임관리</div></a></li>
            <li class="leftnavi-item"> <img src="./resources/assets/img/category_webcam.png"><input type="button" value="화상회의" onclick="openWebMeeting();" id="webBtn"></li>
            <li class="leftnavi-item"> <a href="#"><img src="./resources/assets/img/category_searchBook.png"><div>도서검색</div></a></li>
            <li class="leftnavi-item"> <a href="#"><img src="./resources/assets/img/category_management_gray.png"><div>스터디관리</div></a></li>

        </ul>
        </div>
    </div>
    <input type="hidden" value="${memberid }" id="memberid">
    <input type="hidden" value="${studyid }" id="studyid">
</body>
</html>