<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/studdype/header&footer.css">
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/infoStyle.css">
<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script type="text/javascript">
<!-- 스크롤 위치에 따라서 <h1>글씨 안보이게 z-index 변경 -->
$(window).scroll(function(){
    var scrollValue = $(document).scrollTop(); 
    console.log(scrollValue);
    if ( scrollValue > 125 && scrollValue <= 375 ){
		$(".justify-content-center").attr("style","z-index:2");
	} else {
		$(".justify-content-center").attr("style","z-index:3");
	}
});

$(function(){
	$(".hero-text").html("<hr id='infoHR'><h1>개인정보처리방침</h1>"); 
	$(".feature-page.header-area").css({"background-image":"url('resources/assets/img/policy.png')"});	
	
});
</script>

</head>
<body>
<jsp:include page="../commond/studdypeHeader.jsp"></jsp:include>
<a class="navbar-brand" href="studyList.do"><img src="./resources/assets/img/logo_white.png" alt="" id="logo"></a>
<div class="main-section3">
	<div style="width: 50%; font-size: 20px; margin: 10% 25%;">
	-개인정보 처리방침-<br><br><br><br>
	
	
		
	최종 업데이트: 2021 년 02 월 07 일<br><br>
	
	목차<br><br>
	1. 소개<br>
	2. StuDdype가 수집하는 정보<br><br>
	<hr><br>
	
	1. 소개<br>
	StuDdype 서비스를 사용해주셔서 감사합니다! 회원님의 신뢰는 당사에게 매우 중요한 의미를 가지며, 당사는 회원님의 개인정보와 개인정보의 보안을 지켜드릴 것을 약속드립니다. 당사에게 공유된 정보는 당사가 StuDdype를 통한 훌륭한 경험을 제공하는데에 많은 도움을 줍니다. 당사가 StuDdype 당사는 개인정보보호팀을 마련하였으며, 개인정보보호팀은 당사가 수집하는 모든 개인정보를 보호하고 그러한 개인정보가 전 세계적으로 적절하게 처리되는지를 보장하도록 지원합니다.<br><br>
	
	본 개인정보 처리방침에는 회원님의 StuDdype 플랫폼 및 결제 서비스의 접속 및 사용과 관련하여 당사가 개인정보를 수집, 사용, 처리 및 공개하는 방식이 기재되어 있습니다. 본 개인정보 처리방침은 모든 웹사이트, 플랫폼 및 이와 연결된 서비스들에서 개인정보를 처리하는 방식을 설명하고 있습니다. 해당 사이트의 개인정보 처리방침을 읽어보시기 바랍니다.<br><br>
	
	1-1 정의<br><br>
	
	본 개인정보 처리방침에서 정의되지 않은 용어들(“리스팅,” “StuDdype 플랫폼” 등)은 당사의 이용약관(“이용약관”)에 정의된 의미를 갖습니다.<br><br>
	
	1-2 정보처리자<br><br>
	
	본 개인정보 처리방침에서 “StuDdype,” “당사,” “당사를,” 또는 “당사의”는 본 방침에 따라 회원님의 정보에 대한 책임을 부담하는 StuDdype 회사(“정보처리자”)를 지칭합니다.<br><br>
	
	회원님의 거주국이 한국인 경우, 정보처리자는 StuDdype, Inc 입니다.<br><br>
	1-3 결제 적용<br><br>
	
	본 개인정보 처리방침은 결제 서비스 약관(“결제 서비스 약관”)에 따라 StuDdype Payments가 회원님에게 제공하는 결제 서비스에 대해서도 적용됩니다. 회원님은 결제 서비스를 사용하는 과정에서도 회원님의 정보(개인정보를 포함)를 일반적으로 회원님의 거주국에 따라 결정되는 정보처리자(“결제정보처리자”)이기도 한 하나 이상의 StuDdype Payments 회사(들)에게 제공하게 됩니다.<br><br>
	
	회원님이 거주국을 변경하는 경우, 정보처리자 및/또는 결제정보처리자는 해당 변경일로부터 상기와 같은 회원님의 새로운 거주국에 따라 결정됩니다. 이와 관련하여 기존에 회원님의 개인정보를 수집하였던 정보처리자 및/또는 결제정보처리자는 해당 개인정보를 변경된 새로운 정보처리자 및/또는 결제정보처리자에게 이전하여야 하는데 이는 회원님과의 계약관계를 이행하기 위하여 위와 같은 개인정보의 이전이 필요하기 때문입니다.<br><br>
	
	정보처리자들 및 결제정보처리자들의 연락정보는 아래 연락처 항목을 참조하십시오.<br><br>
	<hr><br>
	2. StuDdype가 수집하는 정보<br>
	당사는 일반적으로 3개 유형의 정보를 수집합니다.<br><br>
	
	2-1 회원님이 당사에게 제공하는 정보<br><br>
	
	2-1-1 StuDdype 플랫폼을 사용하기 위하여 필요한 정보<br><br>
	
	</div>
</div>
<jsp:include page="../commond/commondFooter.jsp"></jsp:include>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/loadmore.js"></script>
<script src="./resources/assets/js/prefixfree.min.js"></script>
<script src="./resources/assets/js/main.js"></script>
</body>
</html>