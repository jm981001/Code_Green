<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>

	.writeBtn {
	
		float: right;
		border: 2px solid black;
		border-radius: 20px;
		color: black;
		font-weight: bold;
		background-color: transparent;
		margin-right: 10px;
		margin-bottom: 10px;
		padding: 3px 15px;
		 
	
	}

	.btnbtnbtn .statusBtn1,.statusBtn2 {
		float: left;
		font-size: 90%;
		border: none;
		border-radius: 20px;
		color: white;
		margin-right: 10px;
		margin-bottom: 10px;
		padding: 3px 10px;
		
	}
	
	.btnbtnbtn .statusBtn1 {
		background-color: #f34a4a;
	}

	.btnbtnbtn .statusBtn2 {
		background-color: #007bff;
	}
	
	.status_wait{
		color:red;
		padding: 0.25em 0.4em;
	    font-size: 75%;
	    font-weight: 700;
	    line-height: 1;
	    text-align: center;
	}
	
	.status_complete{
		color:#007bff;
		padding: 0.25em 0.4em;
	    font-size: 75%;
	    font-weight: 700;
	    line-height: 1;
	    text-align: center;
	}
	
	
</style>
<script>
	function goGetList(qna_status){
			$.ajax({
				url:"myPageQnaSelectList.bo",
				type:"get",
				data:{ qna_status : qna_status },
				success: function(data){
					$(".table_qnaList").html(data);
				}
			});
		};

</script>
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

<!-- ==========Q&A=========================================================================================================     -->
					<div class="col-lg-8">
                       <div class="ps-section__right">
                            <div class="ps-section--account-setting">
                                <div class="ps-section__header">
                                    <h3>1:1 문의</h3>
                                </div>
                                <div class="ps-section__content">
                                    <div class="table-responsive">
                                    	<div class="ps-section__right">
										<div class="btnbtnbtn">
											<input type="button" class="writeBtn" name="answerStatus" onclick="location.href='WriteQna.bo'" value="문의하기">
											<input type="button" class="statusBtn1" id="qna_status" value="답변대기" onclick="goGetList(this.value)">
											<input type="button" class="statusBtn2" id="qna_status" value="답변완료" onclick="goGetList(this.value)">
										</div>
										<div class="table_qnaList">
                                        <table class="table ps-table ps-table--notification">
                                            <thead>
                                                <tr>
                                                    <th>종류</th>
                                                    <th>제목</th>
                                                    <th>작성일</th>
                                                    <th>답변상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:if test="${empty mantomanList }">
                                            	<td colspan="4">문의내역이 없습니다.</td>
                                            </c:if>
                                            	<c:forEach var="mtmList" items="${mantomanList }">
                                                <tr>
                                                    <td>${mtmList.qna_category }</td>
                                                    <td onclick="location.href='QnaMtmDetail.bo?qna_idx=${mtmList.qna_idx}'" style="font-weight: bold">${mtmList.qna_subject }</td>
                                                    <fmt:parseDate var="dateString" value="${mtmList.qna_date}" pattern="yyyyMMdd" />
                                                    <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>
                                                    <c:if test="${mtmList.qna_status eq '답변대기' }">
                                                    	<td><span class="status_wait">답변대기</span></td>
                                                    </c:if>
                                                    <c:if test="${mtmList.qna_status eq '답변완료' }">
                                                    	<td><span class="status_complete">답변완료</span></td>
                                                    </c:if>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
			                            <!-- 페이징 버튼들 시작 -->
					   		 			<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
					                    <div class="ps-pagination">
					                        <ul class="pagination">
					                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="myPageQnaList.my?pageNum=${pageInfo.pageNum - 1}&qna_status=${qna_status}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
					                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					                            	<c:choose>
					                            		<c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="javascript:void(0);">${i }</a></li></c:when>
					                            		<c:otherwise><li><a href="myPageQnaList.my?pageNum=${i }&qna_status=${qna_status}">${i }</a></li></c:otherwise>
					                            	</c:choose>
					                            </c:forEach>
					                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="myPageQnaList.my?pageNum=${pageInfo.pageNum + 1}&qna_status=${qna_status}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
					                        </ul>
					                    </div>
					                    <!-- 페이징 버튼들 끝 -->  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                  </div> 
<!-- ==========Q&A 끝=========================================================================================================     -->					
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
</body>
</html>