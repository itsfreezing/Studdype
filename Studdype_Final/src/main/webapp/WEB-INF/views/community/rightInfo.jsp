<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/community/studyHome.css">

<script type="text/javascript">
//왼쪽네비 고정 스크립트
$(window).scroll(function(){
    var div = document.querySelector('div');        
     var compStyle = window.getComputedStyle(div);
    var height = compStyle.height.substring(0,3);
    if($(document).scrollTop() > height){
        $('#studyRightInfo').addClass('fixed');
        $('.main-section').addClass('left')
    }else{
        $('#studyRightInfo').removeClass('fixed');
        $('.main-section').removeClass('left');
    }
});
</script>
</head>
<body>
	
</body>
</html>