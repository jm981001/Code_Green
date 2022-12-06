<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<meta name="description" content="">
<link rel="icon" href="/Code_Green/resources/img/favicon.png">
<title>마이페이지 - 베지터틀</title>
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



					<div class="col-lg-8">
						<h3>상품 후기 작성</h3>
						<table class="table ps-table--shopping-cart ps-table--responsive">
							<c:forEach var="sell" items="${sellReview }">
								<tbody>
									<tr>
										<td data-label="Product">
											<div class="ps-product--cart">
												<div class="ps-product__thumbnail">
													<a href="ItemDetail.bo?item_idx=${sell.item_idx}&manager_brandname=${sell.manager_brandname}&item_category=${sell.item_category}">
													<img src="/Code_Green/resources/item/${sell.file1 }" alt="" /></a>
												</div>
												<div class="ps-product__content">
													<a href="ItemDetail.bo?item_idx=${sell.item_idx}&manager_brandname=${sell.manager_brandname}&item_category=${sell.item_category}">${sell.item_name }</a>
													<p>
														<strong> ${sell.manager_brandname } </strong>
													</p>
												</div>
											</div>
										</td>
										<td data-label="Total">${sell.item_price }원</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
						
						<hr>

					<!-- ==========리뷰작성=========================================================================================================     -->
						
						<form class="ps-form--review" action="ReviewWritePro.my" method="post" name="reviewForm" enctype="multipart/form-data">
							<h4>PRODUCT REVIEW</h4>
							<p>
								<sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 이동될 수 있습니다.<br> 
								<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및
								요청사항은 베지터틀 내 1:1 문의에 남겨주세요.
							</p>
							<div class="form-group form-group__rating">
								<label>별점을 매겨주세요</label> 
								<select class="ps-rating" data-read-only="false" id="board_star_score" name="board_star_score" required="required">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
							<div class="form-group">
								<input type="hidden" name="board_id" value="${sessionScope.sId}" />
								<input type="hidden" name="member_id" value="${sessionScope.sId}" />
                                <input type="hidden" name="item_idx" value="${param.item_idx}" />
                                <input type="hidden" name="item_category" value="${param.item_category}" />
                                <input type="hidden" name="manager_brandname" value="${param.manager_brandname } " />
                                <input type="hidden" name="sell_idx" value="${param.sell_idx } " />
								<textarea class="form-control" id="board_subject" name="board_subject" rows="1" placeholder="상품후기를 남겨주세요" required="required"></textarea>
                                <textarea class="form-control" id="board_content" name="board_content" rows="6" placeholder="상품후기를 남겨주시면 적립금 1000원을 드립니다." required="required"></textarea>
							</div>
							<div class="form-group submit">
								<input type="file" name="file_1" id="file_1">
	                            <input type="file" name="file_2" id="file_2">
							<div align="right">
								<button class="ps-btn">Submit Review</button>
							</div>
							</div>
						</form>
					</div>
				</div>

				<!-- ==========리뷰작성 끝=========================================================================================================     -->

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