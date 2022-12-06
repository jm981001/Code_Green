<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<section id="passForm">
		<form action="ReviewDeletePro.bo" name="deleteForm" method="post">
			<!-- 글번호와 페이지번호도 함께 폼 파라미터로 전달 -->
			<input type="hidden" name="board_idx" value="${board.board_idx }">
			<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
			<input type="hidden" name="item_idx" value="${item.item_idx }">
						<input type="submit" value="삭제">&nbsp;&nbsp;
		</form>
	</section>
</body>
</html>





