<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- headers-->
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<link rel="icon" href="/Code_Green/resources/img/favicon.png">
<title>마이페이지 - 베지터틀</title>
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
<link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
    
    
</head>

<body>

    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    
	<!-- ==========왼쪽 사이드바=========================================================================================================     -->
	<main class="ps-page--my-account">
		<section class="ps-section--account">
			<div class="container">
				<div class="row">
					<jsp:include page="../inc/left_mypage.jsp"></jsp:include>


    <!-- ==========개인정보 수정=========================================================================================================     -->
					<div class="col-lg-8">
						<div class="ps-section__right">
							<form class="ps-form--account-setting" action="myPage_userInfo_Update" method="post">
								<div class="ps-form__header">
									<h3>개인정보 수정</h3>
								</div>
								<div class="ps-form__content">
									<div class="form-group">
										<label>이름</label> <input class="form-control" name="member_name" type="text" value="${member.member_name}" readonly="readonly">
									</div>
									<div class="row">
										
										<div class="col-sm-6">
											<div class="form-group">
												<label>아이디</label> <input class="form-control" type="text" name="member_id" value="${member.member_id}" readonly="readonly">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>패스워드</label> <input class="form-control" type="password" name="member_pass" value="${member.member_pass}">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>전화번호</label> <input class="form-control" type="text" name="member_phone" value="${member.member_phone}">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>우편번호</label> <input class="form-control" type="text" id="member_postcode"name="member_postcode" value="${member.member_postcode}">
                                            	<input type="button" onclick="execDaumPostcode()" name="adressBtn" id="adressBtn" value="주소찾기">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>주소</label> <input class="form-control" type="text" id="member_address"name="member_address" value="${member.member_address}">
											</div>
										</div>
										
										<div class="col-sm-6">
											<div class="form-group">
												<label>이메일 주소</label> <input class="form-control" type="text" name="member_email" value="${member.member_email}">
											</div>
										</div>
										
									</div>
								</div>
								<div class="form-group submit">
									<button class="ps-btn">Update</button>
									<input type="button" value="탈퇴" class="ps-btn" onclick="memberDelete('${member.member_id}')">
								</div>
							</form>
						</div>
					</div>

<script type="text/javascript">
	function memberDelete(member_id) {
		// confirm() 함수를 사용하여 "삭제하시겠습니까?" 메세지로 확인받아 result 변수에 저장 후
		// result 변수값이 true 일 경우 MemberDelete.me 서블릿 주소 요청(파라미터로 id 전달)
		let result = confirm("탈퇴하시겠습니까?");
		
		if(result) {
			location.href="memberDelete.me?member_id=" + member_id;
		}
	}
	</script>




					<!-- ---------------------------------------------------------- 나의 정보 끝 ---------------------------------------------------------- -->				
				</div>
			</div>
		</section>
	</main>


	<!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->



	<!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->

	<div id="back2top">
		<i class="icon icon-arrow-up"></i>
	</div>

	<!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->


	<script src="/Code_Green/resources/plugins/jquery.min.js"></script>
	<script src="/Code_Green/resources/plugins/nouislider/nouislider.min.js"></script>
	<script src="/Code_Green/resources/plugins/popper.min.js"></script>
	<script src="/Code_Green/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script src="/Code_Green/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/Code_Green/resources/plugins/imagesloaded.pkgd.min.js"></script>
	<script src="/Code_Green/resources/plugins/masonry.pkgd.min.js"></script>
	<script src="/Code_Green/resources/plugins/isotope.pkgd.min.js"></script>
	<script src="/Code_Green/resources/plugins/jquery.matchHeight-min.js"></script>
	<script src="/Code_Green/resources/plugins/slick/slick/slick.min.js"></script>
	<script src="/Code_Green/resources/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
	<script src="/Code_Green/resources/plugins/slick-animation.min.js"></script>
	<script src="/Code_Green/resources/plugins/lightGallery-master/dist/js/lightgallery-all.min.js"></script>
	<script src="/Code_Green/resources/plugins/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
	<script src="/Code_Green/resources/plugins/select2/dist/js/select2.full.min.js"></script>
	<script src="/Code_Green/resources/plugins/gmap3.min.js"></script>
	<!-- custom scripts-->
	<script src="/Code_Green/resources/js/main.js"></script>
	    <!-- 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
// $(document).ready(function(){
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            document.getElementById("member_postcode").value = data.zonecode;
	            document.getElementById("member_address").value = data.roadAddress;
	        }
	    }).open();
	}
// });	
</script>
</body>
</html>