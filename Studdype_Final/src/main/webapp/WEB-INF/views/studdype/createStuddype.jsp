<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ComunityHome</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet" href="./resources/css/studdype/createStuddype.css">
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

</head>
<body>
	<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>

	<!--main conternt 섹션-->
	<div class="main-section">

		<form method="post" enctype="multipart/form-data" action="">

			<div class="form-group">
				<label for="leader">대표사진 업로드</label> <input type="file"
					name="leader">
			</div>

			<div id="textline">
				<div class="form-group" id="leader">
					<label for="mem_name">스터디 개설자</label> <input type="text"
						class="form-control" name="mem_name" value="">
				</div>

				<div class="form-group" id="mem_name">
					<label for="s_name">스터디 이름</label> <input type="text"
						class="form-control" name="s_name" value="">
				</div>
			</div>
			<hr><br><br><br><br>

			<div class="form-group">
				<label for="s_info">스터디 한줄 소개</label> <input type="text"
					class="form-control" name="s_info" value="">
			</div>
			<hr><br>

			<label for="s_content">스터디 상세 소개글</label>
			<textarea class="form-control" rows="3" cols="3" name="s_content"></textarea>
			<hr>
			
			<div>
				<div id="locationsi">
					<label>스터디 지역(시)</label> <select class="form-control">
						<c:forEach begin="1" end="15" step="1" var="cnt">
							<option>${cnt }</option>
						</c:forEach>
					</select>
				</div>
				<div id="locationgu">
					<label>스터디 지역(구/군)</label> <select class="form-control">
						<c:forEach begin="1" end="15" step="1" var="cnt">
							<option>${cnt }</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div id="maxmember">
				<label>스터디 최대인원</label> <select class="form-control">
					<c:forEach begin="1" end="15" step="1" var="cnt">
						<option>${cnt }</option>
					</c:forEach>
				</select>
			</div>
			
			<div id="btn">
				<button  type="submit" class="btn btn-default">스터디 생성</button>
			</div>
		</form>

	</div>

	<jsp:include page="../commond/studdypeFooter.jsp"></jsp:include>
</body>
</html>