<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	// 전달받은 오류 메세지(msg) 출력 후 이전페이지로 돌아가기
	
	let result = "${msg}";
	
	if(result){
		alert(result);
		location.href ="manager/ManagerInfo.me";
	} else if("${fail}") {
		alert("${fail}");
		history.back();
	} 
	
// 	alert("${msg}");
// 	location.href ="main";
// 	history.back();
</script>
</body>
</html>