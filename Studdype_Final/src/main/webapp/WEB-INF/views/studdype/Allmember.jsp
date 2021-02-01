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
<script type="text/javascript">
	function first(){
		$('#member').show();
  		$('#member2').hide();
  		$('#member3').hide();
	}
	function second(){
		$('#member2').show();
  		$('#member').hide();
  		$('#member3').hide();
	}
	function third(){
		$('#member3').show();
  		$('#member').hide();
  		$('#member2').hide();
	}
	function change(){
		var main = document.getElementsByName("maker");
		var main_check = 0;
		for(var i=0;i<main.length;i++){
			if(main[i].checked == true){
				var m = main[i].value;
				main_check++;
			}
		}
		//location.href="updateleader.do?"+"&s_no="+'${study.s_no}'+"&leader_no="+m;
		var chk_arr = [];
		$("input[name=exile]:checked").each(function(){
			 var chk = $(this).val();
			 chk_arr.push(chk);
			 
		})
		alert(chk_arr);
		location.href="updateleader.do?"+"&s_no="+'${study.s_no}'+"&leader_no="+m+"&exile_no="+chk_arr;
	}
	
	
</script>



<style type="text/css">
	#member{
		
		width:700px;
		position:absolute;
		top:70%;
		left:38%;
	}
	#member2{
		width:700px;
		display:none;
		width:700px;
		position:absolute;
		top:70%;
		left:38%;
	}
	#member3{
	
		display:none;
		width:700px;
		position:absolute;
		top:70%;
		left:38%;
	}
	#main {
	float: right;
	display: inline-block;
	margin-right: 5%;
	margin-top: 3%;
	width: 70%;
	
	border-radius: 10px;
	height:900px;
}

</style>

</head>
<body>
	<!-- 커뮤니티 헤더 -->
	<jsp:include page="../commond/communityHeader.jsp"></jsp:include>
	<!--  헤더 끝  -->
	<!--  커뮤니티 left 네비 -->
	<jsp:include page="../commond/communityLeftNavi.jsp"></jsp:include>
	<!--  네비끝 -->
	<div id="main">
	<p style="position:absolute; top:58%; left:52%; font-size:20px; font-weight:bold;">스터디 전체 멤버</p>
	
	
	
	
	
	
	 <table id="member"
         class="table table-striped table-bordered table-hover">
         <thead>
            <tr>
               <th>이름</th>
               <th>이메일</th>
               <th>아이디</th>
               <th>성별</th>
               <th>추방하기</th>
               <th>대표설정</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="membername" items="${membername}" begin='0' end='9'>
            
               <tr>
                  <td>${membername.mem_name }</td>
                  <td>${membername.mem_email }</td>
                  <td>${membername.mem_id }</td>
                  <td><c:if test="${membername.mem_gender == 'M' }">남자</c:if><c:if test="${membername.mem_gender == 'F' }">여자</c:if></td>
                  <td><input type="checkbox" name="exile" value="${membername.mem_no }">추방</td>
                  <c:if test="${membername.mem_no == login.mem_no }">
                     <td><input name="maker" type="radio" checked="checked"
                        value="${membername.mem_no }">대표</td>
                  </c:if>
                  <c:if test="${membername.mem_no != login.mem_no }">
                     <td><input name="maker" type="radio"
                        value="${membername.mem_no }">대표</td>
                  </c:if>

               </tr>
            
            </c:forEach>

         </tbody>
      </table>
	  <table id="member2"
         class="table table-striped table-bordered table-hover">
         <thead>
            <tr>
               <th>이름</th>
               <th>이메일</th>
               <th>아이디</th>
               <th>성별</th>
               <th>추방하기</th>
               <th>대표설정</th>
            </tr>
         </thead>
         <tbody>
           
            <c:forEach var="membername" items="${membername}" begin="11" end='20'>
           
               <tr>
                  <td>${membername.mem_name }</td>
                  <td>${membername.mem_email }</td>
                  <td>${membername.mem_id }</td>
                  <td><c:if test="${membername.mem_gender == 'M' }">남자</c:if><c:if test="${membername.mem_gender == 'F' }">여자</c:if></td>
                  <td><input type="checkbox" name="exile" value="${membername.mem_no }">추방</td>
                  <c:if test="${membername.mem_no == login.mem_no }">
                     <td><input name="maker" type="radio" checked="checked"
                        value="${membername.mem_no }">대표</td>
                  </c:if>
                  <c:if test="${membername.mem_no != login.mem_no }">
                     <td><input name="maker" type="radio"
                        value="${membername.mem_no }">대표</td>
                  </c:if>

               </tr>
              
            </c:forEach>

         </tbody>
      </table>
      <table id="member3"
         class="table table-striped table-bordered table-hover">
         <thead>
            <tr>
               <th>이름</th>
               <th>이메일</th>
               <th>아이디</th>
               <th>성별</th>
               <th>추방하기</th>
               <th>대표설정</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="membername" items="${membername}" begin='21' >
           
               <tr>
                  <td>${membername.mem_name }</td>
                  <td>${membername.mem_email }</td>
                  <td>${membername.mem_id }</td>
                  <td><c:if test="${membername.mem_gender == 'M' }">남자</c:if><c:if test="${membername.mem_gender == 'F' }">여자</c:if></td>
                  <td><input type="checkbox" name="exile" value="${membername.mem_no }">추방</td>
                  <c:if test="${membername.mem_no == login.mem_no }">
                     <td><input name="maker" type="radio" checked="checked"
                        value="${membername.mem_no }">대표</td>
                  </c:if>
                  <c:if test="${membername.mem_no != login.mem_no }">
                     <td><input name="maker" type="radio"
                        value="${membername.mem_no }">대표</td>
                  </c:if>

               </tr>
               
            </c:forEach>

         </tbody>
      </table>
	<c:if test="${fn:length(membername) > 11 }">
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:53%; cursor:pointer;" onclick="first();">
		<p>1</p>
		</div>
		<div style="height:30px; width:30px; border:1px solid black; text-align:center; position:absolute; top:130%; left:55%;  cursor:pointer;" onclick="second();">
		<p>2</p>
		</div>
	</c:if>
	<c:if test="${fn:length(membername) > 21 }">
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
	<button class="btn btn-purple" style="position:absolute; top: 70%;left: 77%;" onclick="change();">수정하기</button>
	</div>
	
	
	
	
	
	
	
</body>
<footer>
	<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
</footer>
</html>