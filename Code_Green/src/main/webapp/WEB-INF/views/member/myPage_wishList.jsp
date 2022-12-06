<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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



					<!-- ==========찜한 상품=========================================================================================================     -->
					<div class="col-lg-9">
					<div class="ps-section--shopping ps-whishlist">
					<h3>찜한 상품 ${listCount }</h3><br><br>
							<div class="ps-section__content">
								<div class="table-responsive">
									<table class="table ps-table--whishlist ps-table--responsive">
										<tbody>
											<c:if test="${empty WishList }">
                                            	<tr><td colspan="5">현재 찜한 상품이 없습니다.</td></tr>
                                            </c:if>
										   <c:forEach var="item" items="${WishList }">
											 <!-- 장바구니 담을 정보 -->
											<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
											<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
											<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
											<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >
				                                                 <input type="hidden" id="item_category_${item.item_idx}" name="item_category_${item.item_idx}" value="${item.item_category}" >
											<tr>
												<td data-label="Remove"><a href="deleteWish?member_id=${sessionScope.sId}&heart_idx=${item.heart_idx}&member_idx=${item.member_idx}"><i
														class="icon-cross"></i></a></td>
												<td data-label="Product">
													<div class="ps-product--cart">
													
														<div class="ps-product__thumbnail">
															<a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}"><img src="/Code_Green/resources/item/${item.file1 }" alt="" /></a>
														</div>
														<div class="ps-product__content">
															<a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
															<p><strong> ${item.item_price }원</strong></p>
														</div>
														
													</div>
												</td>
												<td class="price" data-label="Price"> </td>
												<td data-label="Status"><span
													class="ps-tag ps-tag--in-stock"> </span></td>
												<td data-label="action"><a class="ps-btn" onclick="addCart('${item.item_idx}')">담기</a></td>
											</tr>
											
										</c:forEach>
										</tbody>
									</table>
					
					 								 <!-- 페이징 버튼들 시작 -->
				                   <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
				                    <div class="ps-pagination">
				                        <ul class="pagination">
				                           
				                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="myPageWishList.my?member_id=${sessionScope.sId}&pageNum=${pageInfo.pageNum - 1}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
				                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				                               <c:choose>
				                                  <c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="#">${i }</a></li></c:when>
				                                  <c:otherwise><li><a href="myPageWishList.my?member_id=${sessionScope.sId}&pageNum=${i }">${i }</a></li></c:otherwise>
				                               </c:choose>
				                            </c:forEach>
				                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="myPageWishList.my?member_id=${sessionScope.sId}&pageNum=${pageInfo.pageNum + 1}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
				                        </ul>
				                    </div>
				                    <!-- 페이징 버튼들 끝 -->
								</div>
							</div>
						</div>
					</div>
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
	<script type="text/javascript">
		function addCart(item_idx) {
			let cart_total = $("#cart_total_"+item_idx).val();
			let	item_name = $("#item_name_"+item_idx).val();
			let manager_brandname = $("#manager_brandname_"+item_idx).val();
			let file1 = $("#file1_"+item_idx).val();
			
			$.ajax({
				type : 'get',
				url : 'addCart',
				data: {
					'rf_item_idx' 		: item_idx,
					'rf_member_idx'		: ${sessionScope.sIdx},
					'cart_amount'		: 1,
					'cart_total'		: cart_total,
					'item_name'			: item_name,
					'manager_brandname'	: manager_brandname,
					'file1'				: file1,
				},
				success : function (cartCount) {
					alert('장바구니에 담았습니다.')
					$('#cartCount i').html(cartCount);
				}
			});
		}
	</script>
</body>
</html>