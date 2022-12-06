<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="icon" href="/Code_Green/resources/img/favicon.png">
<title>장바구니 - 베지터틀</title> 
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
<link rel="stylesheet" href="/Code_Green/resources/css/line.css">
<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 상품 리스트 페이지로 이동 (돌아가기 버튼))
		$("#btnList").click(function() {
			location.href = "ItemList.bo";
		});
		$("#btnRefresh	").click(function() {
			location.reload();
		});

	});

	//장바구니 항목삭제	
	function deleteItem(cart_idx) {
		// alert(cart_idx);
		$.ajax({
			type : 'get',
			url : 'deleteCart',
			data : {
				cart_idx : cart_idx,
			},
			success : function(data) {
				alert('삭제완료.')
				location.reload();
			}
		});
	}
	function updateCart(cart_idx) {
		let count = $("#quan_"+cart_idx).val();
		$.ajax({
			type : 'get',
			url : 'updateCart',
			data : {
				"member_id" : '${sessionScope.sId }',
				"cart_amount" : count,
				"cart_idx" : cart_idx,
			},
			success : function(data) {
				$('.qu').html(count);
				alert('수정완료.')
				location.reload();
			}
		});
	}
	
</script>
</head>

<body>
		
		<!-- 헤더 삽입 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 삽입 -->



 		<!-- 바디시작 -->
 		
 		<div class="ps-page--single">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="/Code_Green">Home</a></li>
                    <li>장바구니</li>
                </ul>
            </div>
        </div>
    </div>



	<div class="ps-section--shopping ps-shopping-cart" name="cartDiv" id="cartYes">
		<div class="container">
			<div class="ps-section__header">
				<h1>Cart</h1>
			</div>
			<c:choose>
				<c:when test="${empty cartList }">
					<div align="center" style="margin: 100px 0 300px 0;">
						<img src="/Code_Green/resources/img/recipe/turtle-icon.png">
						<h3>현재 장바구니 내 상품이 없습니다.</h3>
					</div>	
				</c:when>
				<c:when test="${not empty cartList }">
				<div class="ps-section__content">
					<div class="table-responsive">
						
	<!-- 					<div align="center"> -->
	<!-- 				   </div> -->
							<table class="table ps-table--shopping-cart ps-table--responsive" style="text-align: center;">
								<thead>
									<tr>
										<th>상품명</th>
										<th>가격</th>
										<th>수량</th>
										<th>총 금액</th>
										<th></th>
									</tr>
								</thead>
								
								<c:forEach var="row" items="${cartList}" varStatus="i">
									<input type="hidden" name="cart_idx" value="${row.cart_idx}">
									<input type="hidden" name="rf_item_idx"value="${row.rf_item_idx}">
									<input type="hidden" name="cart_amount"value="${row.cart_amount}">
								<tr>
									<td data-label="Product">
										<div class="ps-product--cart">
											<div class="ps-product__thumbnail">
												<a href="ItemDetail.bo?item_idx=${row.rf_item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${row.manager_brandname}&item_category=${row.item_category}">
			                            		<img src="/Code_Green/resources/item/${row.file1 }">
			                            	</a>
											</div>
											<div class="ps-product__content" style="text-align: left;">
												<a href="ItemDetail.bo?item_idx=${row.rf_item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${row.manager_brandname}&item_category=${row.item_category}">${row.item_name}</a>
	
												<p>
													<strong> ${row.manager_brandname }</strong>
												</p>
	
											</div>
										</div>
									</td>
									<td class="price" data-label="Price"><fmt:formatNumber value="${row.item_price}" pattern="#,###"/> 원</td>
	
									<!-- 수량조절 -->
									<td data-label="Quantity">
										<div class="form-group--number">
											<button type="button" class="up">+</button><!-- 수량 증가 버튼 -->
											<button type="button" class="down">-</button><!-- 수량 감소 버튼 -->
											<input class="form-control" type="text" id="quan_${row.cart_idx}" name="qu"
												placeholder="1" name="cart_amount" value="${row.cart_amount}" min="1"><!-- 수량 -->
										</div> 
										<button type="button" class="quantity_modify_btn" onclick="updateCart('${row.cart_idx}')" data-cart_idx="${row.cart_idx}" style="border: none;">변경</button>
									
									
										<!-- 수량 조정 form -->
									<form action="updateCart" method="get" class="quantity_update_form">
										<input type="hidden" name="cart_idx" class="update_cart_idx">
										<input type="hidden" name="item_amount" class="update_item_amount">
										<input type="hidden" name="member_id" value="${sessionScope.sId }">
									</form>	
	
									</td>
									<td data-label="Total"><fmt:formatNumber value="${row.cart_total*row.cart_amount }" pattern="#,###"/>
										원</td>
									<td>
										<button type="button" id="delBtn" onclick="deleteItem('${row.cart_idx}')" style="border: none;">삭제</button>
									</td>
								</tr>
							</c:forEach>
							</table><!-- class="table ps-table--shopping-cart ps-table--responsive"> -->
					</div><!--<div class="table-responsive"> -->
	
	<!-- 				<div class="ps-section__cart-actions"> -->
	<!-- 				<button class="ps-btn" id="btnList">돌아가기</button> -->
	<!-- 				<button class="ps-btn" id="btnRefresh">새로고침</button> -->
	
	<!-- 				</div> -->
	
				</div>
	
				<!-- 수량 조정 form -->
				<form action="/update" method="get" class="quantity_update_form">
					<input type="hidden" name="cart_idx" class="update_cart_idx">
					<input type="hidden" name="cart_amount" class="update_cart_amount">
				</form>	
	
				<!-- 합계 부분 -->
				<div class="ps-section__footer" style="margin: 100px 0;">
					<div class="row"></div>
					<div class="ps-block--shopping-total" style="width: 100%">
	
						<div class="ps-block__header">
							<p>
								소계 <span><fmt:formatNumber value="${map.sumM}" pattern="#,###"/> 원</span>
							</p>
						</div>
						<div class="ps-block__content">
							
							<ul class="ps-block__product">
								<li>
									<h3 style="color: #666;">
										배송비 <span class="ps-block__shipping"><fmt:formatNumber value="${map.fee}" pattern="#,###"/> 원</span>
									</h3>
								</li>
							</ul>
							
							<h3 style="color: #666;">
								총 주문 금액 <span class="ps-block__shipping"><fmt:formatNumber value="${map.allSum}" pattern="#,###"/> 원</span>
							</h3>
						</div>
					</div>
					<div class="form-group submit" align="right" style="margin-top: 80px;">
				  		<a class="ps-btn ps-btn--fullwidth" style="width: auto"
						href="payment?member_id=${sessionScope.sId }">주문하기</a>
                	</div>
				</div>
			 	</c:when>
		 </c:choose>	
		</div>
	</div>


	<!-- 푸터 시작! -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- 푸터 끝! -->
    
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
    <script src="/Code_Green/resources/Code_Green/resources/plugins/gmap3.min.js"></script>
    <!-- custom scripts-->
    <script src="/Code_Green/resources/js/main.js"></script>
    <script src="/Code_Green/resources/js/quantity.js"></script>
</body>

</html>