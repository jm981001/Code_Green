<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/Code_Green/resources/img/favicon.png">
<script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext"rel="stylesheet">
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

<script type="text/javascript">
	function setDisplay() {
		if ($('input:radio[id=memberJoin]').is(':checked')) {
			$('#companyDiv').hide();
			$('#memberDiv').show();
		} else {
			$('#memberDiv').hide();
			$('#companyDiv').show();
		}
	}
	
</script>

<style type="text/css">
#companyDiv {
	display: none;
}
</style>


<title>회원가입 - 베지터틀</title>

</head>
<body>
	<!-- 헤더 삽입 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 삽입 -->


	<div class="ps-vendor-dashboard">
		<div class="container">
			<div class="ps-section__header">
				<h3>회원가입</h3>
			</div>
		</div>
	</div>

	<!-- ----------------------------------바디 시작------------------------------------  -->
	<form action="MemberJoinPro.me" method="post" name="joinForm" id="signup_member" onsubmit="return checkForm()">
		<!--------------------------------개인----------------------------------->
		<div class="member">
			<div class="field memberType">
				<b>구분</b>
				<div>
					<label><input type="radio" name="memberType"id="memberJoin" checked onchange="setDisplay()">개인</label>
					<label><input type="radio" name="memberType" id="companyJoin" onchange="setDisplay()">기업</label>
				</div>
			</div>

			<div id="memberDiv">
				
				<div class="field">
					<b>아이디</b>
					<input type="text" name="member_id" id="member_id" onkeyup="checkId(this.value)" maxlength='20' required="required" placeholder="8-16자리 영문자,숫자,특수문자 조합" style="width: 300px;">
					<input type="button" onclick="dupId()" value="중복체크" style="width: 80px; position: absolute;">
					<span class="placehold-text">
					<span id="checkIdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
					</span>
				</div>
				
				<div class="field">
					<b>비밀번호</b>
					<input type="password" name="member_pass" class="userpw" id="member_pass" onkeyup="checkPasswd(this.value)" required="required" size="20" placeholder="8-20자리 영문자,숫자,특수문자 조합" maxlength='20'>
					<span id="checkPasswdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</div>
				
				<div class="field">
					<b>이름</b>
					<input type="text" name="member_name" onkeyup="checkName(this.value)" id="member_name" maxlength='5' required="required"> 
					<span id="checkNameResult" style="color: red"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</div>
				
				<div class="form-group email-form">
					<label for="email">이메일</label>
					<div class="input-group">
						<input type="text" class="form-control" name="member_email" id="member_email" placeholder="이메일" style="height: 43px; background-color: white;">
						<input type="button" onclick="dupMail()" value="중복체크" style="width: 80px">
<!-- 						<select class="form-control" name="userEmail2" id="userEmail2"> -->
<!-- 							<option>@naver.com</option> -->
<!-- 							<option>@daum.net</option> -->
<!-- 							<option>@gmail.com</option> -->
<!-- 							<option>@hanmail.com</option> -->
<!-- 							<option>@yahoo.co.kr</option> -->
<!-- 						</select> -->
					</div>
						<span class="placehold-text">
							<span id="checkMailResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
						</span>
					
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn" style="background-color:#5fa30f">본인인증</button>
						</div>
						<div class="mail-check-box">
							<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" required="required" style="height: 43px; background-color: white;">
						</div>
						<span id="mail-check-warn"></span>
					</div>
					<div class="field post-code">
						<b>주소</b>
						<div>
							<input type="text" name="member_postcode" id="member_postcode" placeholder="우편번호" maxlength='6' required="required">
							<input type="button" value="주소검색" onclick="Me_execDaumPostcode()" required="required">
						</div>
						<input type="text" name="member_address" id="member_address" placeholder="주소" maxlength='100' required="required">
					</div>

				<div class="field tel-number">
						<b>전화</b>
						<div>
							<input type="tel" placeholder="숫자만 입력 가능합니다" name="member_phone" id="member_phone" maxlength='11' required="required" pattern="[0-9]+">
						</div>
					</div>
					<input type="submit" value="가입하기">
				</div>
			</div>
	</form>
	<!--------------------------------개인----------------------------------->


	<!--------------------------------기업----------------------------------->

	<form action="ManagerJoinPro.me" method="post" name="joinForm" id="signup_company" onsubmit="return checkFormM()" enctype="multipart/form-data">
		<div class="member">
			<div id="companyDiv" style="margin-top: -45px">
				<div class="field">
					<b>아이디</b> <span class="placehold-text">
					<span class="placehold-text">
					<input type="text" id="manager_id" name="manager_id" maxlength='16' onkeyup="checkIdM(this.value)" required="required" style="width: 300px;"></span>
					<input type="button" onclick="dupIdM()" value="중복체크" style="width: 80px; position: absolute; margin: -48px 300px;">
					<span id="checkIdResultM"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
					</span>
				</div>
				<div class="field">
					<b>비밀번호</b> 
					<input type="password" name="manager_pass" class="userpw" id="manager_pass" onkeyup="checkPasswdM(this.value)" required="required" size="20" placeholder="8-20자리 영문자,숫자,특수문자 조합" maxlength='19' required="required">
					<span id="checkPasswdResultM"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</div>
				
				<div class="field">
					<b>기업관리자 이름</b> 
					<input type="text" id="name" name="manager_name" maxlength="5" onkeyup="checkNameM(this.value)" required="required">
					<span id="checkNameResultM"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</div>

				<div class="field">
					<div>
						<b>브랜드 이름</b>
						<input type="text" id="manager_brandname" name="manager_brandname" maxlength="20" required="required">
						<b>로고</b>
						<input type="file" name="file" required="required" style="background-color: white; padding: 0px" /> 
					</div>
				</div>
				<div class="field">
					<div>
						<b>브랜드 소개</b>
						<textarea id="manager_info" name="manager_info" maxlength="1000" required="required" style="width: 380px"></textarea>
					</div>
				</div>
				<div class="field">
					<b>사업자번호</b>
					<input type="text" name="manager_storecode" id="manager_storecode" maxlength="20" required="required">
				</div>

				<div class="form-group email-form" style="width:300px;">
					<label for="email">이메일</label>
					<div class="input-group">
						<input type="text" class="form-control" name="manager_email" id="manager_email" placeholder="이메일" style="width:300px; height: 43px; background-color: white;">
						<input type="button" onclick="dupMailM()" value="중복체크" style="width: 80px; position: absolute; margin: 0px 300px;">
<!-- 						<select class="form-control" name="userEmail4" id="userEmail4"> -->
<!-- 							<option>@naver.com</option> -->
<!-- 							<option>@daum.net</option> -->
<!-- 							<option>@gmail.com</option> -->
<!-- 							<option>@hanmail.com</option> -->
<!-- 							<option>@yahoo.co.kr</option> -->
<!-- 						</select> -->
					</div>
						<span class="placehold-text">
							<span id="checkMailResultM"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
						</span>
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary" id="mail-Check-BtnM" style="background-color:#5fa30f">본인인증</button>
						</div>
						<div class="mail-check-boxM">
							<input class="form-control mail-check-inputM" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" required="required" style="height:43px; width: 380px; background-color: white;">
						</div>
						<span id="mail-check-warnM"></span>
					</div>
				<div class="field post-code">
						<b>주소</b>
						<div>
							<input type="text" name="manager_postcode" id="manager_postcode"
								placeholder="우편번호" maxlength='6' required="required"> <input
								type="button" value="주소검색" onclick="Ma_execDaumPostcode()">
						</div>
						<input type="text" name="manager_address" id="manager_address" placeholder="주소" maxlength='100' required="required">
					</div>
				<div class="field tel-number">
					<b>전화</b>
					<div>
						<input type="tel" placeholder="숫자만 입력 가능합니다" id="manager_phone" name="manager_phone" maxlength="11" required="required" pattern="[0-9]+">
					</div>
				</div>
				<input type="submit" value="가입하기">
			</div>
		</div>
	</form>
	<!--------------------------------기업----------------------------------->


	<!------------------------------------바디 끝--------------------------------------  -->


	<!-- 푸터 삽입 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- 푸터 삽입 -->
	
	
	<!-- 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="/Code_Green/resources/js/checkJoin.js"></script>
	<style type="text/css">
* {
	box-sizing: border-box;
	outline: none;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	background-color: #f5f6f7;
	line-height: 1.5em;
	color: #222;
	margin: 0;
}

a {
	text-decoration: none;
	color: #222;
}

.member {
	width: 400px;
	margin: 50px auto;
	padding: 0 10px;
	margin-bottom: 10px;
}

.member .logo {
	display: block;
	margin: 50px auto;
}

.member .field {
	margin: 5px 0;
}

.member b {
	display: block;
	margin-bottom: 5px;
}

.member input:not(input[type=radio]), .member select {
	border: 1px solid #dadada;
	padding: 10px;
	width: 100%;
	margin-bottom: 5px;
}

.member input[type=button], .member input[type=submit] {
	background-color: #5fa30f;
	color: #fff
}

.member input:focus, .member select:focus {
	border: 1px solid #2db400;
}

.field.birth div {
	display: flex;
	gap: 10px;
}

.field.tel-number div {
	display: flex;
}

.field.tel-number div input:nth-child(1) {
	flex: 2;
}

.field.tel-number div input:nth-child(2) {
	flex: 1;
}

.field.post-code div {
	display: flex;
}

.field.post-code div input:nth-child(1) {
	flex: 2;
}

.field.post-code div input:nth-child(2) {
	flex: 1;
}

memberType div {
	background: none;
	border: none;
}

.placehold-text {
	display: block;
	position: relative;
}

.placehold-text:before {
	position: absolute;
	right: 20px;
	top: 13px;
	pointer-events: none;
}

.userpw {
/* 	background: url(./images/images2/icon-01.png) no-repeat center right */
		15px;
	background-size: 20px;
	background-color: #fff;
}

.userpw-confirm {
/* 	background: url(./images/images2/icon-02.png) no-repeat center right */
		15px;
	background-size: 20px;
	background-color: #fff;
}

.member-footer {
	text-align: center;
	font-size: 12px;
	margin-top: 20px;
}

.member-footer div a:hover {
	text-decoration: underline;
	color: #2db400
}

.member-footer div a:after {
	content: '|';
	font-size: 10px;
	color: #bbb;
	margin-right: 5px;
	margin-left: 7px;
	display: inline-block;
	transform: translateY(-1px);
}

.member-footer div a:last-child:after {
	display: none;
}

@media ( max-width :768px) {
	.member {
		width: 100%;
	}
}

button {
	background-color: #5fa30f;
	color: #fff;
}

.ps-vendor-dashboard .container .ps-section__header {
	padding: 100px 0 10px 0;
}

.ps-footer {
	background-color: white;
}
</style>
</body>
</html>