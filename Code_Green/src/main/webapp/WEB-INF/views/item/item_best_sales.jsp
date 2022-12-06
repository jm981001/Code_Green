<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.Code_Green.vo.ItemVO"%>
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
    <title>베스트 상품 - 베지터틀</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/autopart.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/vendor.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<script type="text/javascript">
function addHeart(item_idx) {
	let manager_brandname = $("#manager_brandname_"+item_idx).val();
	let item_category = $("#item_category_"+item_idx).val();
	$.ajax({
		type : 'get',
		url : 'addHeart',
		data: {
			'item_idx' 		: item_idx,
			'member_idx'		: ${sessionScope.sIdx},
			'member_id'		: '${sessionScope.sId}',
			'manager_brandname'	: manager_brandname,
			'item_category' :item_category,
		},
		success : function (data) {
			alert(data)
		}
	});
}
	</script>
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
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    <!-- 바디시작 -->
    <div class="ps-page--single ps-page--vendor">
        <section class="ps-store-list">
            <div class="container">
      			<aside class="ps-block--store-banner-newitemlist">
                	<!-- 브랜드 정보 및 대표이미지 넣을 곳 -->
                    <div class="ps-block__content bg--cover" data-background="http://itwillbs17.cdn1.cafe24.com/best.jpg">
                    </div>
                </aside>
                        <!-- ---------------------------------------------- 신상품------------------------------------------------------------------- -->
				<div class="ps-product-list ps-product-list--2">
					<div class="container">
						<div class="ps-section__header">
							<h3>베스트 상품</h3>
							<ul class="ps-section__links">
								<li><a href="BestItemList.bo">신상품순</a></li>
								<li><a href="Item_best_sales.bo">판매량순 </a></li>
								<li><a href="Item_best_cheap.bo">낮은 가격순</a></li>
								<li><a href="Item_best_ex.bo">높은 가격순</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="ps-section__wrapper">
                    <div class="ps-section__right">
                         <div class="ps-shopping ps-tab-root">
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                                <%
//                                                 	List<ItemVO> itemList = (List<ItemVO>) request.getAttribute("item");
//                                                 	int score = (int)Math.round(Double.parseDouble(item.board_star_score));
//                                                 	pageContext.setAttribute("score", score);
													
                                                %>
                                        	<c:forEach var="item" items="${itemBestList_sales }">
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">

                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" ><img src="/Code_Green/resources/item/${item.file1 }" alt="" /></a>
                                                      	  <!-- 장바구니 담을 정보 -->
														<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
														<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
														<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
														<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >
                                                        <input type="hidden" id="item_category_${item.item_idx}" name="item_category_${item.item_idx}" value="${item.item_category}" >                     
                                                        
                                                        
                                                        <ul class="ps-product__actions">
															<li><a data-toggle="tooltip" data-placement="top" title="Add To Cart" onclick="addCart('${item.item_idx}')"><i class="icon-bag2" ></i></a></li>
                                                           <li><a data-toggle="tooltip" data-placement="top" title="Add to Whishlist" onclick="addHeart('${item.item_idx}')"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            <!--  *별점 카운트 하기  -->
                                                            <div class="ps-product__rating">
                                                                <select class="ps-rating" data-read-only="true">
			                                                       <c:if test="${item.score == 0}">
				                                                    	<option value="0"></option>
				                                                    	<option value="2"></option>
				                                                    	<option value="2"></option>
				                                                    	<option value="2"></option>
				                                                    	<option value="2"></option>
				                                                    	<option value="2"></option>
				                                                    </c:if>
			              										 	<c:forEach var="i" begin="1" end="5">
						                                             	<c:choose>
			              										 			<c:when test="${item.score == 0}"></c:when>
						                                             		<c:when test="${i <= item.score}">
						                                             			<option value="1">${i }</option>
						                                             		</c:when>
						                                             		<c:otherwise>
						                                             			<option value="2">${i }</option>
						                                             		</c:otherwise>
						                                             	</c:choose>
						                                             </c:forEach>
                                                                </select><span>${item.board_star_score }</span>
                                                            </div>
                                                            
                                                            <!-- 가격 -->
                                                            <h4 class="ps-product__price">${item.item_price }원</h4>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            <h4 class="ps-product__price">${item.item_price }원</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
                                             </c:forEach>	
				                        <div class="ps-product">
				                        </div>   
				                    </div>

				                </div>
				            </div>
				        </div>
			        </div>
		        </div>
		        
	        </div>
        </div>
       </section>
         <!-- ---------------------------------------------- 상품 목록 끝------------------------------------------------------------------- -->
  
        
      
    </div>
    
        <!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
    	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->
    
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    <div id="back2top"><i class="icon icon-arrow-up"></i></div>
    
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
