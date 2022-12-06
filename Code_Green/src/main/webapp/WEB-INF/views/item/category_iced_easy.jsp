<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
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
	<title>냉동 식품 / 간편 식품 - 베지터틀</title>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/autopart.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/vendor.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
    
    <style type="text/css">
    	#cheapIcedEasyList{
     		display: none; 
    	}
    	#expensiveIcedEasyList{
    		display: none;
    	}
    	#reviewIcedEasyList{
    		display: none;
    	}
    </style>
    
    <script type="text/javascript">
    
    	window.onload = function(){
    		
    		$('#sort').val('${sort}')
    		sortItemList($('#sort').val());
    	}	
    
    	var sortItemList = function(value) {
    		
    		var aLinks = $('.pageLink');
    		for(var i=0; i<aLinks.length; i++){
	    		var str = aLinks[i].href.split('sort=')[0] + 'sort=';
	    		aLinks[i].href = str + value;
    		}
    		
    		if(value == "newDate"){
    			$('#icedEasyList').show();
    			$('#reviewIcedEasyList').hide(); 
	        	$('#cheapIcedEasyList').hide();
	    		$('#expensiveIcedEasyList').hide();
    		} else if(value == "review") {
	        	$('#icedEasyList').hide();
	    		$('#reviewIcedEasyList').show();  
	    		$('#cheapIcedEasyList').hide();
	    		$('#expensiveIcedEasyList').hide();
    		} else if(value == "cheap"){
	    		$('#icedEasyList').hide();
	    		$('#reviewIcedEasyList').hide();  
	        	$('#cheapIcedEasyList').show();
	    		$('#expensiveIcedEasyList').hide();
	    	} else {
	        	$('#icedEasyList').hide();
	    		$('#reviewIcedEasyList').hide(); 
	    		$('#cheapIcedEasyList').hide();
	    		$('#expensiveIcedEasyList').show();
			}
    	};
    	
    </script>
    
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
</head>
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    
    
    <div class="ps-page--single ps-page--vendor">
        <section class="ps-store-list">
            <div class="container">
                
                
                <div class="ps-section__wrapper">
                    <div class="ps-section__left">
                        <aside class="widget widget--vendor">
                            <h3 class="widget-title">카테고리</h3>
                            <ul class="menu--dropdown">
                                <li><a href="category_all">전체 상품</a> </li>
                                <li><a href="category_sale">특가 상품</a> </li>
                                <li><a href="category_fruit_vegi">과일 / 채소</a> </li>
                                <li><a href="category_dairy_drink">유제품 / 음료</a></li>
                                <li><a href="category_iced_easy">냉동 식품 / 간편 식품</a></li>
                                <li><a href="category_fish">해산물 </a></li>
                                <li><a href="category_snack">간식류</a></li>
                            </ul>
                        </aside>
                    </div>
                    <div class="ps-section__right">
						<div id="category_h3">
							<h2>냉동 식품 / 간편 식품</h2>
						</div>                    

						 <nav class="ps-store-link" >
                        	<section id="buttonArea">
							<!-- 검색 기능 구현을 위한 form 태그 -->
								<form action="category_iced_easy" method="get">
									<select name="searchType">
										<option value="item_name">상품명</option>
										<option value="brand_name">상호명</option>
									</select>
									<input type="text" name="keyword">
									<input type="submit" value="검색" id="typeSearch">
								</form>
							</section>
                            <select name="sortType" id="sort" class="form-select" aria-label="Default select example" onchange="sortItemList(this.value)">
							  <option value="newDate">신상품순</option>
							  <option value="review">후기 많은순</option>
							  <option value="cheap">낮은 가격순</option>
							  <option value="expensive">높은 가격순</option>
							</select>
                        </nav>
							
						
                        <div class="ps-shopping ps-tab-root" id="icedEasyList">
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="item" items="${itemList }">
<%--                                         		<c:forEach var="image" items="${imageList }"> --%>
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" >
                                                    		<img src="/Code_Green/resources/item/${item.file1 }" alt="" />
                                                    	</a>
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
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
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
                                                            <p class="ps-product__price sale">${item.item_price }원 </p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            <p class="ps-product__price sale">${item.item_price }원</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
												                                     
                                           </c:forEach>      	
                                        </div>
                                    </div>
                           		</div>
                          	</div>
                         </div> 
                         
<!-- --------------------------------------후기 많은순 (후기 많은순 페이징 필요)----------------------------------------------------- -->
                                   
                        <div class="ps-shopping ps-tab-root" id="reviewIcedEasyList">
                             <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="item" items="${reviewItemList }">
<%--                                         		<c:forEach var="image" items="${imageList }"> --%>
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" >
                                                    		<img src="/Code_Green/resources/item/${item.file1 }" alt="" />
                                                    	</a>
                                                    	<!-- 장바구니 담을 정보 -->
														<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
														<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
														<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
														<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >

                                                        <ul class="ps-product__actions">
                                                        	
                                                        	<!-- 장바구니 및 찜 -->
															<li><a data-toggle="tooltip" data-placement="top" title="Add To Cart" onclick="addCart('${item.item_idx}')"><i class="icon-bag2" ></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
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
                                                            <p class="ps-product__price sale">${item.item_price }원 </p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            <p class="ps-product__price sale">${item.item_price }원</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
												                                     
                                           </c:forEach>      	
                                        </div>
                                    </div>
                           		</div>
                          	</div>
                         </div> 
                          
<!-- --------------------------------------낮은 가격순 (낮은 가격순 페이징 필요)----------------------------------------------------- -->
                                   
                        <div class="ps-shopping ps-tab-root" id="cheapIcedEasyList">
                             <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="item" items="${cheapItemList }">
<%--                                         		<c:forEach var="image" items="${imageList }"> --%>
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" >
                                                    		<img src="/Code_Green/resources/item/${item.file1 }" alt="" />
                                                    	</a>
                                                    	<!-- 장바구니 담을 정보 -->
														<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
														<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
														<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
														<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >

                                                        <ul class="ps-product__actions">
                                                        	
                                                        	<!-- 장바구니 및 찜 -->
															<li><a data-toggle="tooltip" data-placement="top" title="Add To Cart" onclick="addCart('${item.item_idx}')"><i class="icon-bag2" ></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
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
                                                            <p class="ps-product__price sale">${item.item_price }원 </p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            <p class="ps-product__price sale">${item.item_price }원</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
												                                     
                                           </c:forEach>      	
                                        </div>
                                    </div>
                           		</div>
                          	</div>
                         </div> 
                             
<!-- -------------------------------------높은 가격순 (높은 가격순 페이징 필요)----------------------------------------------------- -->
                                   
                        <div class="ps-shopping ps-tab-root" id="expensiveIcedEasyList">
                             <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-shopping-product">
                                        <div class="row">
                                        
                                        	<!-- 반복문 시작 -->
                                        	<c:forEach var="item" items="${expensiveItemList }">
<%--                                         		<c:forEach var="image" items="${imageList }"> --%>
                                        	<!-- 상품 1개당 시작 -->
                                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                <div class="ps-product">
                                                    <div class="ps-product__thumbnail">
                                                    	
                                                    	<!-- 상품 이미지 -->
                                                    	<a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}" >
                                                    		<img src="/Code_Green/resources/item/${item.file1 }" alt="" />
                                                    	</a>
                                                    	<!-- 장바구니 담을 정보 -->
														<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
														<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
														<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
														<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >

                                                        <ul class="ps-product__actions">
                                                        	
                                                        	<!-- 장바구니 및 찜 -->
															<li><a data-toggle="tooltip" data-placement="top" title="Add To Cart" onclick="addCart('${item.item_idx}')"><i class="icon-bag2" ></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="top" title="Add to Whishlist"><i class="icon-heart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <!-- 브랜드명 및 상품명 -->
                                                    <!-- 
                                                    * 브랜드명은 서브쿼리 사용하여 불러오기
                                                     -->
                                                    <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.manager_brandname }</a>
                                                        <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            
                                                            <!-- 별점 -->
                                                            <!-- 
                                                            *별점 카운트 하기
                                                             -->
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
                                                            <p class="ps-product__price sale">${item.item_price }원 </p>
                                                        </div>
                                                        <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                                            <p class="ps-product__price sale">${item.item_price }원</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 상품 1개당 끝 -->
												                                     
                                           </c:forEach>      	
                                        </div>
                                    </div>
                           		</div>
                          	</div>
                         </div> 
                                      

                   
                             <!-- 페이징 버튼들 시작 -->
		   		 			<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
		                    <div class="ps-pagination">
		                        <ul class="pagination">
		                           
		                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a class="pageLink" href="category_iced_easy?pageNum=${pageInfo.pageNum - 1}&searchType=${searchType }&keyword=${keyword}&sort=${sort}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
		                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
		                            	<c:choose>
		                            		<c:when test="${i eq pageInfo.pageNum }"><li class="active"><a class="pageLink" href="#">${i }</a></li></c:when>
		                            		<c:otherwise><li><a class="pageLink" href="category_iced_easy?pageNum=${i }&searchType=${searchType }&keyword=${keyword}&sort=${sort}">${i }</a></li></c:otherwise>
		                            	</c:choose>
		                            </c:forEach>
		                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a class="pageLink" href="category_iced_easy?pageNum=${pageInfo.pageNum + 1}&searchType=${searchType }&keyword=${keyword}&sort=${sort}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
		                        </ul>
		                    </div>
		                    <!-- 페이징 버튼들 끝 -->
                                
           				 </div>
		              </div>
		           </div>
			 	</section>
			</div>

	
	
	    <!-- 푸터 삽입 -->
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<!-- 푸터 삽입 -->
   
    
    
   
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