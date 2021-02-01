<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


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
<link rel="stylesheet"
	href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>
<style type="text/css">
	#main {
		float: right;
		display: inline-block;
		margin-right: 5%;
		margin-top: 3%;
		width: 70%;
		
		border-radius: 10px;
		height:900px;
	}
	#book1{
		
		width:700px;
		position:absolute;
		top:70%;
		left:38%;
	}
</style>
<script type="text/javascript">
	function change(){
		var main = document.getElementsByName("bookmain");
		var main_check = 0;
		for(var i=0;i<main.length;i++){
			if(main[i].checked == true){
				var m = main[i].value;
				main_check++;
			}
		}
		location.href="bookchange.do?b_no="+m;
	}

</script>
</head>
<body>
	<!-- 커뮤니티 헤더 -->
	<jsp:include page="../commond/communityHeader.jsp"></jsp:include>
	<!--  헤더 끝  -->
	<!--  커뮤니티 left 네비 -->
	<jsp:include page="../commond/communityLeftNavi.jsp"></jsp:include>
	<!--  네비끝 -->
	<div id="main">
	<p style="position:absolute; top:58%; left:52%; font-size:20px; font-weight:bold;">전체 도서 </p>
	
	<table id="book1"
         class="table table-striped table-bordered table-hover"
         style="border: 1px solid;">

         <thead>
            <tr style="text-align:center;">
               <th>번호</th>
               <th>등록된 책 제목</th>
               <th>대표 도서</th>
            </tr>
         </thead>
         <tbody style="text-align:center;">
            <c:forEach var="bookList" items="${bookList}" varStatus="status" begin="1" end="10">
               <tr style="text-align:center;">
                  <td>${status.count }</td>
                  <td>${bookList.book_title }</td>
                  <c:if test="${bookList.book_ismain eq 'N' }">
                     <td id="mainbook"><input id="bookmain" type="radio" value="${bookList.b_no }"
                        name="bookmain">대표</td>
                  </c:if>
                  <c:if test="${bookList.book_ismain eq 'Y' }">
                     <td id="mainbook"><input id="bookmain" type="radio" value="${bookList.b_no }"
                        name="bookmain" checked="checked" >대표</td>
                  </c:if>
               </tr>
            </c:forEach>

         </tbody>
      </table>            
	
	
	</div>
	<c:if test="${fn:length(bookList) > 11 }">
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:53%; cursor:pointer;" onclick="first();">
		<p>1</p>
		</div>
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:55%;  cursor:pointer;" onclick="second();">
		<p>2</p>
		</div>
	</c:if>
	<c:if test="${fn:length(bookList) > 21 }">
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:53%; cursor:pointer;" onclick="first();">
		<p>1</p>
		</div>
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:55%;  cursor:pointer;" onclick="second();">
		<p>2</p>
		</div>
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:57%;  cursor:pointer;" onclick="third();">
		<p>3</p>
		</div>
	</c:if>
	<c:if test="${fn:length(bookList) > 31 }">
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:53%; cursor:pointer;" onclick="first();">
		<p>1</p>
		</div>
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:55%;  cursor:pointer;" onclick="second();">
		<p>2</p>
		</div>
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:57%;  cursor:pointer;" onclick="third();">
		<p>3</p>
		</div>
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:59%;  cursor:pointer;" onclick="four();">
		<p>4</p>
		</div>
	</c:if>
	<button class="btn btn-purple" style="position:absolute; top: 70%;left: 77%;" onclick="change();">수정하기</button>
	
	
	

</body>
<footer>
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>


</html>