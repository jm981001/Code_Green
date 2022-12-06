<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/Code_Green/resources/css/find_id.css">
<script type="text/javascript">
// $(document).ready(function(){ 
// 	//member용 이메일 인증
// 	$('#email').click(function() {
// 		const eamil = $('#email').val(); // 이메일 주소값 얻어오기
// 		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		
// 		$.ajax({
// 			type : 'get',
// 			url : 'idFindMail?email='+eamil,
// 			success : function (data) {
// 				console.log("data : " +  data);
// 				code =data;
// 				alert('메일이 전송되었습니다.')
// 			}			
// 		});
// 	});
// });
// alert("${msg}");
</script>
<title>아이디 찾기 - 베지터틀</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form action="idFindMail" method="get">
				<div class="w3-center w3-large w3-margin-top">
					<h3>아이디 찾기</h3>
				</div>
				<div id="wrap">
					<div>
						<label>Email</label>
						<input class="w3-input" type="text" id="email" name="email" required>
					</div>
<!-- 					w3-center -->
					<div class="">
						<button type="submit" id=findBtn class="w-btn w-btn-gra3 w-btn-gra-anim" style="width: 200px;">찾기</button>
						<button type="button" onclick="history.go(-1);" class="w-btn-neon2">Cancel</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>