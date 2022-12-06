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

<!-- ==========Q&A=========================================================================================================     -->
					<div class="col-lg-8">
                        <div class="ps-section__right">
                            <div class="ps-section--account-setting">
                                <div class="ps-section__header">
                                    <h3>상품 후기</h3>
                                </div>
                                <div class="ps-section__content">
                                    <div class="table-responsive">
                                        <table class="table ps-table ps-table--notification">
                                            <thead>
                                                <tr>
                                                    <th>주문날짜</th>
                                                    <th>주문번호</th>
                                                    <th>상품갯수</th>
                                                    <th>결제방법</th>
                                                    <th>결제금액</th>
                                                    <th>주문상태</th>
                                                </tr>
                                            </thead>
                                            
                                            
                                           	<c:forEach var="sell" items="${sellList }">
                                            <tbody>
                                                <tr onClick="location.href='myPageReview_detail.my?member_id=${sessionScope.sId}&sell_idx=${sell.sell_idx }'">
<%--                                                     <td>${sell.sell_pay_date }</td> --%>
                                                    <td>2022-10-28 12시50분</td>
                                                    <td>${sell.sell_idx }</td>
                                                    <td>${sell.sell_amount }</td>
                                                    <td>${sell.sell_pay_type }</td>
                                                    <td>${sell.sell_item_total_price }</td>
                                                    <td>${sell.sell_status }</td>
                                                   
                                                </tr>
                                            </tbody>
                                            </c:forEach>
                                        </table>
                                        
                                    <!-- 페이징 버튼들 시작 -->
                                    <div class="ps-pagination">
                                        <ul class="pagination">
                                       		<li><a href="#"><i class="icon-chevron-left"></i></a></li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#"><i class="icon-chevron-right"></i></a></li>
                                        </ul>
                                    </div>
                                    <!-- 페이징 버튼들 끝 -->
                                    
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