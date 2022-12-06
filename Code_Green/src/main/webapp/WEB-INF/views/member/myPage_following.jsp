<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
 <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
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
	#unfollowBtn{
		border: 1px solid green;
		width: 90px; height: 30px;
		background-color: transparent;
		border-radius: 20px;
		padding: 5px;
		color:green;
	}
	
	
</style>
<script>

	// 언팔로우 버튼
	function unFollow(rf_manager_idx){
		
		let check = confirm("팔로우를 취소하시겠습니까?");
		if(check){
			$.ajax({
				url:"UnfollowBrand.my",
				type:"post",
				data:{
					rf_manager_idx: rf_manager_idx,
					rf_member_idx: ${sessionScope.sIdx}
				},
				success: function(msg){
					alert(msg);
					location.reload();
				},
			})
		}		
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
                                    <h3><i class="icon-star"></i> 팔로우 브랜드</h3>
                                </div>
                                <div class="ps-section__content">
                                    <div class="table-responsive">
                                        <table class="table ps-table">
                                            <thead>
                                                <tr>
                                                    <th width="30%">브랜드</th>
                                                    <th>브랜드명</th>
                                                    <th>팔로우 취소</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:if test="${empty followList }">
                                            	<tr><td colspan="3">현재 팔로우중인 브랜드가 없습니다.</td></tr>
                                            </c:if>
                                              <c:forEach var="follow" items="${followList }">
                                                	 <tr>
	                                                    <td><img src="<%=request.getContextPath() %>/resources/img/brand_logo/${follow.manager_original_file}" width="140px" height="40px"></td>
	                                                    <td>${follow.manager_brandname }<br><i class="fi fi-sr-following">  ${follow.store_follower_cnt }</i></td>
	                                                    <td><button id="unfollowBtn" onclick="unFollow(${follow.rf_manager_idx})"><i class="fi fi-rr-cross-circle">unfollow</i></button></td>
	                                                 </tr>
                                               </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                
                                <!-- 페이징 버튼들 시작 -->
			   		 			<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
			                    <div class="ps-pagination">
			                        <ul class="pagination">
			                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="myPageFollowingList.my?pageNum=${pageInfo.pageNum - 1}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
			                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			                            	<c:choose>
			                            		<c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="javascript:void(0);">${i }</a></li></c:when>
			                            		<c:otherwise><li><a href="myPageFollowingList.my?pageNum=${i }">${i }</a></li></c:otherwise>
			                            	</c:choose>
			                            </c:forEach>
			                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="myPageFollowingList.my?pageNum=${pageInfo.pageNum + 1}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
			                        </ul>
			                    </div>
			                    <!-- 페이징 버튼들 끝 -->
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