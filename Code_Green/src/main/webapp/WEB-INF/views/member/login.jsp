<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String clientId = "ilgdXbcRH89unvY3t9Dz";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://itwillbs17.cafe24.com/Code_Green/member/callback", "UTF-8");
	SecureRandom random = new SecureRandom();
	//String state = new BigInteger(130, random).toString();
	String state = session.getAttribute("oauth_state").toString();
// 	out.print(state);
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	//session.setAttribute("state", state);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="icon" href="/Code_Green/resources/img/favicon.png">
<title>로그인 - 베지터틀</title>
<script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"></script>
<!-- Css Styles -->
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
<link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>

<style type="text/css">
h5{
	text-align: center;
}

.ps-btn, button.ps-btn {
	  background-color: #5fa30f;
	  color: #ffffff;
	  margin: 5px;
}
#managerDiv{
  		display: none;
  	}
  	#adminDiv{
  		display: none;
  	}
</style>
<script type="text/javascript">
	function setDisplay() {
		if ($('input:radio[id=memberLogin]').is(':checked')) {
			// 			debugger;
			$('#adminDiv').hide();
			$('#managerDiv').hide();
			$('#memberDiv').show();
		} else if ($('input:radio[id=managerLogin]').is(':checked')) {
			// 			debugger;
			$('#adminDiv').hide();
			$('#memberDiv').hide();
			$('#managerDiv').show();
		} else {
			// 	     	debugger;
			$('#adminDiv').show();
			$('#memberDiv').hide();
			$('#managerDiv').hide();
		}
	}
	
</script>
</head>
<body>

	<!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    <!-- ----------------------------------바디 시작------------------------------------  -->
	<div class="ps-page--my-account">
		<div class="ps-my-account">
			<div class="container">
				<div class="field memberType" align="center" style="position: absolute;; margin-left: 495px; margin-top: 409px;">
					<div style="margin: 20px 0;">
						<label><input type="radio" name="memberType" id="memberLogin" checked onchange="setDisplay()">개인회원</label>
						<label><input type="radio" name="memberType" id="managerLogin" onchange="setDisplay()">기업회원</label>
						<label><input type="radio" name="memberType" id="adminLogin" onchange="setDisplay()">관리자</label>
					</div>
				</div>
				<div id="memberDiv">
					<form class="ps-form--account ps-tab-root"
						action="MemberLoginPro.me" method="post">
						<ul class="ps-tab-list">
							<li class="active">
								<a href="login">로그인</a>
							</li>
							<li>
								<a href="join">회원가입</a>
							</li>
						</ul>
						<div class="ps-tabs">
							<div class="ps-tab active" id="sign-in">
								<div class="ps-form__content">
									<h5>회원계정으로 로그인하세요</h5>
									
									<div class="form-group">
										<input class="form-control" type="text" name="member_id" placeholder="아이디를 입력하세요">
									</div>
									<div class="form-group form-forgot">
										<input class="form-control" type="password" name="member_pass" placeholder="비밀번호를 입력하세요">
									</div>
									<div class="form-group submtit" style="margin-top: 60px;">
										<button class="ps-btn ps-btn--fullwidth">로그인</button>
									</div>
								</div>
								<h5>
									<a href="find_id">아이디</a> / <a href="find_pass">비밀번호 찾기</a>
								</h5>
								<div class="ps-form__footer">
									<div class="form-group submtit">
										<!-- 네이버 로그인 버튼(이미지) -->
										<div id="naver_id_login" style="text-align: center">
											<a href="<%=apiURL%>"><img width="370" height="55" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
										</div>

										<!-- 카카오 로그인 버튼(이미지) -->
										<div class="kakaoLogin">
											<a href="https://kauth.kakao.com/oauth/authorize?client_id=bdb4f4f86451a44ecba533649bd1755c&redirect_uri=http://localhost:8081/kakao&response_type=code">
												<img src="/Code_Green/resources/img/kakao_login.png" style="width: 370px;"/>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>

				<div id="managerDiv">
					<form class="ps-form--account ps-tab-root" action="ManagerLoginPro.me" method="post">
						<ul class="ps-tab-list">
							<li class="active">
								<a href="login">로그인</a>
							</li>
							<li>
								<a href="join">회원가입</a>
							</li>
						</ul>
						<div class="ps-tabs">
							<div class="ps-tab active" id="sign-in">
								<div class="ps-form__content">
									<h5>기업 계정으로 로그인하세요</h5>
									<div class="form-group">
										<input class="form-control" type="text" name="manager_id" placeholder="아이디를 입력하세요">
									</div>
									<div class="form-group form-forgot">
										<input class="form-control" type="password" name="manager_pass" placeholder="비밀번호를 입력하세요">
									</div>
									<div class="form-group submtit" style="margin-top: 60px;">
										<button class="ps-btn ps-btn--fullwidth">로그인</button>
									</div>
								</div>
								<h5>
									<a href="find_id_form">아이디 / 비밀번호 찾기</a>
								</h5>
								<div class="ps-form__footer">
									<div class="form-group submtit">
										<!--                                 네이버 로그인 버튼(이미지) -->
										<div id="naver_id_login" style="text-align: center">
											<a href="<%=apiURL%>"><img width="370" height="55" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
										</div>
										<a href="https://kauth.kakao.com/oauth/authorize?client_id=bdb4f4f86451a44ecba533649bd1755c&redirect_uri=http://localhost:8081/kakao&response_type=code">
												<img src="/Code_Green/resources/img/kakao_login.png" style="width: 370px;"/>
											</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>

				<div id="adminDiv">
					<form class="ps-form--account ps-tab-root" action="AdminLoginPro.me" method="post">
						<ul class="ps-tab-list">
							<li class="active">
								<a href="login">로그인</a>
							</li>
							<li>
								<a href="join">회원가입</a>
							</li>
						</ul>
						<div class="ps-tabs">
							<div class="ps-tab active" id="sign-in">
								<div class="ps-form__content">
									<h5>관리자 계정으로 로그인하세요</h5>
									<div class="form-group">
										<input class="form-control" type="text" name="admin_id" placeholder="아이디를 입력하세요">
									</div>
									<div class="form-group form-forgot">
										<input class="form-control" type="password" name="admin_pass" placeholder="비밀번호를 입력하세요">
									</div>
									<div class="form-group submtit" style="margin-top: 60px;">
										<button class="ps-btn ps-btn--fullwidth">로그인</button>
									</div>
								</div>
								<h5>
									<a href="find_id_form">아이디 / 비밀번호 찾기</a>
								</h5>
								<div class="ps-form__footer">
									<div class="form-group submtit">
										<!--                                 네이버 로그인 버튼(이미지) -->
										<div id="naver_id_login" style="text-align: center">
											<a href="<%=apiURL%>"><img width="370" height="55" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
										</div>

										<a href="https://kauth.kakao.com/oauth/authorize?client_id=bdb4f4f86451a44ecba533649bd1755c&redirect_uri=http://localhost:8081/kakao&response_type=code">
												<img src="/Code_Green/resources/img/kakao_login.png" style="width: 370px;"/>
										</a>
								</div>
							</div>
							</div>
						</div>
					</form>
				</div>


			</div>
		</div>
	</div>




	<!-- ----------------------------------바디 끝--------------------------------------  -->
    
	<!-- 푸터 삽입 -->    
 	<jsp:include page="../inc/footer.jsp"></jsp:include>
 	<!-- 푸터 삽입 -->
 	
</body>
</html>