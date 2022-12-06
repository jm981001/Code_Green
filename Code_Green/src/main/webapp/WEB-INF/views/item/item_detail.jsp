<%@page import="com.itwillbs.Code_Green.vo.Qna_PageInfo"%>
<%@page import="com.itwillbs.Code_Green.vo.ItemVO"%>
<%@page import="com.itwillbs.Code_Green.vo.MemberVO"%>
<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
    <title>[${item.manager_brandname }]${item.item_name }-베지터틀</title>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>  
<!--   아코디언게시판 -->
  <style type="text/css">  
    table {
  	  width:100%;
  	  height:100% ;
  	  border-color: #e1e1e1;
    }  
    table thead tr th{
		font-weight: 500;
		color: #000;
		border-top: none;
		border-left: none;
		border-right: none;
		text-align: center;
		padding: 15px 15px 15px 15px;
    }  
    
    table tbody tr td  {
	    font-weight: 500;
	    color: #000;
	    border-top: none;
	    border-left: none;
	    border-right: none;
	    text-align: center;
		padding: 15px 15px 15px 15px;
	   
	    
	}  
	
    .hide {
   	 display:none;
    }  
    .show {
   	 display:table-row;
    }  
    .item td {
   	 cursor:pointer;
   	 background-color: #FAFAFA;
    }  
    
    .heart_icon_brand_m {
		width: 30px;
	    height: 30px;
	    top: 19px;
	    left: 233px;
	}

	.heart_icon_brand_b {
		width: 30px;
	    height: 30px;
	    top: 19px;
	    left: 233px;
	}
   </style>  
   
 	<style type="text/css">
    	#goodList{
     		display: none; 
    	}
    	#bestList{
    		display: none;
    	}
    	#worstList{
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
    		
    		if(value == "worst"){
    			$('#itemList').hide();
    			$('#goodList').hide(); 
	        	$('#bestList').hide();
	    		$('#worstList').show();
    		} else if(value == "good") {
	    		$('#itemList').hide();
	    		$('#goodList').show();  
	        	$('#bestList').hide();
	    		$('#worstList').hide();
    		} else if(value == "best"){
	    		$('#itemList').hide();
	    		$('#goodList').hide(); 
	        	$('#bestList').show();
	    		$('#worstList').hide();
	    	} else {
	    		$('#itemList').show(); 
	    		$('#goodList').hide();
	        	$('#bestList').hide();
	    		$('#worstList').hide();
			}
    	};
    	
    </script>  
	<script type="text/javascript">
		$(function(){
			$(":button").click(function(){
				
				if(${sessionScope.sId == null}){
					alert("로그인 후 사용가능합니다!");
					return history.back();
				}
			});
		});	
		$(function(){$("#aa").click(function(){if(${sessionScope.sId == null}){alert("로그인 후 사용가능합니다!");}});});	
		$(function(){$("#cartBtn").click(function(){if(${sessionScope.sId == null}){alert("로그인 후 사용가능합니다!");}});});
		$(function(){$("#relB").click(function(){if(${sessionScope.sId == null}){alert("로그인 후 사용가능합니다!");}});});
		$(function(){$("#sameB").click(function(){if(${sessionScope.sId == null}){alert("로그인 후 사용가능합니다!");}});});
	</script>
	
	<script type="text/javascript">
	
	
	
// 	추천기능
	$(function(){
			// 추천버튼 클릭시(추천 추가 또는 추천 제거)
			drawHeart();		
			wish_count();
			// 이벤트
			$("#wishBtn").click(heartAjax);
			
	});
	
	function drawHeart(){
		let data = ${checkWish1};
		$('#aa').html("<img src='/Code_Green/resources/img/heart"+data+".png' class='heart_icon_brand_b'>");
		
	}
	
	function heartAjax (){
		if(${sessionScope.sId == null || not empty sessionScope.sCode || empty sessionScope.sIdx}){
			$('#aa').html("<img src='/Code_Green/resources/img/heart2.png' class='heart_icon_brand_b'>");
		} else {
			
			$.ajax({
				url: "WishList.bo",
				type: "GET",
				data: {
					member_id: '${sessionScope.sId}',
					item_idx: ${item.item_idx},
					pageNum: ${pageInfo.pageNum},
					manager_brandname: '${item.manager_brandname}',
					item_category: '${item.item_category}'
					
				},
				success: function(data){
					$('#aa').html("<img src='/Code_Green/resources/img/heart" + data + ".png' class='heart_icon_brand_b'>");
					wish_count();
					
					
				},
			})
		}	
	}
	
//		// 게시글 추천수
	function wish_count(){
		$.ajax({
			url: "WishCount.bo",
			type: "POST",
			data:{
				item_idx: ${item.item_idx}
			},
			success: function(count){
				$(".wish_count").html(count);
			},
		})
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
	$(document).ready(function(){
		$('#cartBtn').click(function() {
			$.ajax({
				type : 'get',
				url : 'addCart',
				data: {
					rf_item_idx: ${item.item_idx},
					rf_member_idx: ${sessionScope.sIdx},
					cart_amount: $("#quan").val(),
					cart_total: '${item.item_price }',
					item_name: '${item.item_name}',
					manager_brandname: '${item.manager_brandname }',
					file1: '${item.file1 }'
				},
				success : function (cartCount) {
					alert('장바구니에 담았습니다.')
					$('#cartCount i').html(cartCount);
				}
				
			});
		});
	});
	
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
<style>
	select {
		width: 130px; padding: .5em .5em; border: 1px solid #999; font-family: inherit;  
		background: url('/Code_Green/resources/img/arrow.jpg') no-repeat 95% 50%; border-radius: 5px; 
		-webkit-appearance: none; -moz-appearance: none;appearance: none;
		  float: right; padding-bottom: 3px; font-size: 1em;
	}
	select::-ms-expand {
	        display: none;
	    }
</style>
<body>
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    <!-- 바디시작 -->
    <div class="ps-page--product">
        <div class="ps-container">
            <div class="ps-page__container">
                <div class="ps-page__left">
                    <div class="ps-product--detail ps-product--fullwidth">
                        <div class="ps-product__header">
                            <div class="ps-product__thumbnail" data-vertical="true">
                                <figure>
                                    <div class="ps-wrapper">
<!--                                         <div class="ps-product__gallery" data-arrow="true"> -->
                                            <div class="item"><a href="/Code_Green/resources/item/${item.file1 } "><img  src="/Code_Green/resources/item/${item.file1 } " style="width: 500px; height: 500px;"></a></div>
<!--                                         </div> -->
                                    </div>
                                </figure>
                            </div>
                            <div class="ps-product__info">
                                <h1  class="ps-product__price">${item.item_name }</h1>
                                <p>${item.item_info }</p>
                                <h4 class="ps-product__price">${item.item_price }원</h4>
                                <div class="ps-product__meta">
<!--                                     <p>Brand:<a href="shop-default.html">Son</a></p> -->
                                    <div class="ps-product__rating" >
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
                                        </select><span>(${item.count } review)</span>
                                    </div>
                                </div>
                                
                                
                                <div class="ps-product__desc">
                                <br>
                                    <ul class="ps-list--dot">
                                        <li>판매자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.manager_brandname }</li><br>
                                        <li>포장타입 &nbsp; ${item.item_packing }</li><br>
                                        <li>카테고리 &nbsp; ${item.item_category }</li><br>
                                        <li>재고량 &nbsp;&nbsp;&nbsp;&nbsp; ${item.item_stock }개</li><br>
                                    </ul>
								<br>
										
										
                                </div>
                                <div class="ps-product__shopping">
                                    <figure>
                                        <figcaption>상품선택</figcaption>
                                        <div class="form-group--number">
                                            <button class="up"><i class="fa fa-plus"></i></button>
                                            <button class="down"><i class="fa fa-minus"></i></button>
                                            <input class="form-control" type="text" placeholder="1" id="quan" min="1" value="1">
                                        </div>
                                    </figure>
                                    
                                    <a class="ps-btn ps-btn--black" id="cartBtn">Add to cart</a>
                                        <div class="ps-product__actions" id="wishBtn"><span id='aa'></span><span class="wish_count"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="ps-product__content ps-tab-root">
                            <ul class="ps-tab-list">
                                <li class="active"><a href="#tab-1">상품설명</a></li>
                                <li><a href="#tab-2">상세정보</a></li>
                                <li><a href="#tab-3">후기 ${listCount}</a></li><!--tab-3-1은 작성폼 -->
                                <li><a href="#tab-4">문의 ${Qna_listCount }</a></li> <!--tab-4-1은 작성폼 -->
                            </ul>
                            <div class="ps-tabs">
                            
                            
 <!-- ==========상품설명=========================================================================================================     -->                          
                                <div class="ps-tab active" id="tab-1">
                                    <div class="ps-document" align="center">
                                    <a href="/Code_Green/resources/item/${item.file2 } "><img  src="/Code_Green/resources/item/${item.file2} " alt=""></a>
                                    </div>
                                </div>

<!-- ==========상세정보=========================================================================================================     -->                                 
                                <div class="ps-tab" id="tab-2">
                                    <div class="table-responsive">
                                        <table class="table table-bordered ps-table ps-table--specification">
                                            <tbody>
                                                <tr>
                                                    <td>상품의 유형</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                    <td>생산자 및 소재지</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                </tr>
                                                <tr>
                                                    <td>제조연월일,유통기한 또는 품질유지기간</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                    <td>포장단위별용량, 수량</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                </tr>
                                                <tr>
                                                    <td>원재료명 및 함량</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                    <td>영양성분(식품위생법에 따른 영양성분 표시대상에 한함)</td>
                                                    <td>상품설명 및 상품이미지 참조</td>
                                                </tr>
                                                <tr>
                                                    <td>유전자변형식품에 해당하는 경우 표시</td>
                                                    <td>해당사항 없음</td>
                                                    <td>영유아 또는 체중조절식품에 해당하는경우</td>
                                                    <td>해당사항 없음</td>
                                                </tr>
                                                <tr>
                                                    <td>수입식품에 해당하는경우"식품위생법에 따른 수입신고를 필함" 의 문구</td>
                                                    <td>식품위생법에 따른 수입신고를 필함</td>
                                                    <td>소비자 상담관련 전화번호</td>
                                                    <td>베지터틀 고객센터(803-0909)</td>
                                                </tr>
                                              
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
 <!-- ==========상세정보 끝 =========================================================================================================     -->   
 
	
	
    <script type="text/javascript">
		function best(item_idx, board_idx ,item_category, manager_brandname, sId){
			location.href='ReviewBest.bo?item_idx=${item.item_idx }&board_idx='+board_idx+'&item_category=${param.item_category}&manager_brandname=${param.manager_brandname }&member_id=${sessionScope.sId }';
		}
	</script>   
 <!-- ==========상품후기 목록=========================================================================================================     -->                                 
                     
                                <div class="ps-tab" id="tab-3">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-5 col-md-12 col-sm-12 col-12 ">
                                            <div class="ps-block--average-rating">
                                                <div class="ps-block__header">

                                                    <h3>${item.board_star_score }</h3>
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
		                                                    <c:when test="${item.score == 0}">
		                                                    
		                                                    </c:when>
                                                    		<c:when test="${i <= item.score}">
                                                    			<option value="1">${i }</option>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			<option value="2">${i }</option>
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    
                                                    </c:forEach>
                                                    </select><span>${item.count } review</span>
                                                </div>
                                                <div class="ps-block__star"><span>5 Star</span>
                                                    <div class="ps-progress" data-value="${item.star5 }"><span></span></div><span>${item.star5 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>4 Star</span>
                                                    <div class="ps-progress" data-value="${item.star4 }"><span></span></div><span>${item.star4 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>3 Star</span>
                                                    <div class="ps-progress" data-value="${item.star3 }"><span></span></div><span>${item.star3 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>2 Star</span>
                                                    <div class="ps-progress" data-value="${item.star2 }"><span></span></div><span>${item.star2 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>1 Star</span>
                                                    <div class="ps-progress" data-value="${item.star1 }"><span></span></div><span>${item.star1 }%</span>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-8">
                                            <form class="ps-form--review" action=""  method="get"  >
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.</p>
													<select name="sortType" id="sort" class="form-select" aria-label="Default select example" onchange="sortItemList(this.value)">
													  <option value="new">최근 등록순</option>
													  <option value="best">추천 많은순</option>
													  <option value="good">별점 높은순</option>
													  <option value="worst">별점 낮은순</option>
													</select>
												<table border="1" class="recruit" >
												        <colgroup>  
												            <col width="70%">  
												            <col width="10%">  
												            <col width="10%">  
												            <col width="10%">  
												        </colgroup>  
												        <thead align="center">  
												            <tr class="" >  
												                <th scope="col">제목</th>  
												                <th scope="col">작성자</th>  
												                <th scope="col">작성일</th>  
												                <th scope="col">추천</th>  
												            </tr>  
												        </thead>
												  </table>
												  

												  
												  
<!-------------------------------------------리뷰) 최근등록순 정렬------------------------------------------->
												  <table border="1" class="recruit" id="itemList">
													<c:if test="${empty itemList }">
		                                            	<tr><td colspan="3">따끈따끈한 첫 후기를 기다리고있어요.</td></tr>
		                                            </c:if>
												        <c:forEach var="board" items="${itemList }">
													        <tbody>  
													            <tr class="item">  
													                <td width="70%">${board.board_subject }
 																		<div class="ps-product" style="float:left;">
				                                                            <div class="ps-product__rating" style="float:left;">
				                                                                <select class="ps-rating" data-read-only="true">
								                                                    <c:if test="${board.board_star_score == 0}">
								                                                    	<option value="0"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    </c:if>
								                                                    
								                                                    <c:forEach var="i" begin="1" end="5">
								                                                    	<c:choose>
										                                                    <c:when test="${board.board_star_score == 0}"></c:when>
								                                                    		<c:when test="${i <= board.board_star_score}">
								                                                    			<option value="1">${i }</option>
								                                                    		</c:when>
								                                                    		<c:otherwise>
								                                                    			<option value="2">${i }</option>
								                                                    		</c:otherwise>
								                                                    	</c:choose>
								                                                    
								                                                    </c:forEach>
				                                                                </select>
				                                                            </div>
			                                                            </div>
									                                </td>
													                <td width="10%">${board.board_id }</td>  
													                <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
													                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td> 
													                <td width="10%">${board.best_count }</td>  
													            </tr>  
													            <tr class="hide" >  
													                <td colspan="5">  
													                	<br><br>
													                     <img  src="/Code_Green/resources/commUpload/${board.file1}" style="width:400px; height:400px;" onerror="this.style.display='none'">
													                     <img  src="/Code_Green/resources/commUpload/${board.file2}" style="width:400px; height:400px;" onerror="this.style.display='none'">
																			<br><br><br>${board.board_content }<br><br><br>
																			
																		<div align="right">
																		    <input type="button"  class="ps-btn-best_jm"  onclick="best('${item.item_idx }','${board.board_idx }','${param.item_category}','${param.manager_brandname }','${sessionScope.sId }')">${board.best_count }
<%-- 																		    <input type="button"  class="ps-btn-best_jm"  class="best" onclick="location.href='ReviewBest.bo?item_idx=${item.item_idx }&board_idx=${board.board_idx }&item_category=${param.item_category}&manager_brandname=${param.manager_brandname }&member_id=${sessionScope.sId }'">${board.best_count } --%>
																		    <c:if test="${board.board_id eq sessionScope.sId || board.board_id eq 'admin' }">
																				<input type="button" value="수정" onclick="location.href='ReviewModify.bo?item_idx=${item.item_idx }&board_idx=${board.board_idx }&item_category=${param.item_category}&manager_brandname=${param.manager_brandname }&file1=${board.file1 }&file2=${board.file2 }'">
																				<input type="button" value="삭제" onclick="confirmDelete('${board.board_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 	</c:if>
																		 </div>
	 
													                </td>  
													            </tr>  
													        </tbody>  
												        </c:forEach>
												    </table>  

<!-------------------------------------------리뷰) 별점 높은 순 정렬------------------------------------------->												    
											<table border="1" class="recruit" id="goodList">
													<c:if test="${empty goodList }">
		                                            	<tr><td colspan="3">따끈따끈한 첫 후기를 기다리고있어요.</td></tr>
		                                            </c:if>
												        <c:forEach var="board" items="${goodList }">
													        <tbody>  
													            <tr class="item">  
													                <td width="70%">${board.board_subject }
 																		<div class="ps-product" style="float:left;">
				                                                            <div class="ps-product__rating" style="float:left;">
				                                                                <select class="ps-rating" data-read-only="true">
								                                                    <c:if test="${board.board_star_score == 0}">
								                                                    	<option value="0"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    </c:if>
								                                                    
								                                                    <c:forEach var="i" begin="1" end="5">
								                                                    	<c:choose>
										                                                    <c:when test="${board.board_star_score == 0}"></c:when>
								                                                    		<c:when test="${i <= board.board_star_score}">
								                                                    			<option value="1">${i }</option>
								                                                    		</c:when>
								                                                    		<c:otherwise>
								                                                    			<option value="2">${i }</option>
								                                                    		</c:otherwise>
								                                                    	</c:choose>
								                                                    
								                                                    </c:forEach>
				                                                                </select>
				                                                            </div>
			                                                            </div>
									                                </td>
													                <td width="10%">${board.board_id }</td>  
													                <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
													                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>
													                <td width="10%">${board.best_count }</td>  
													            </tr>  
													            <tr class="hide" >  
													                <td colspan="5">  
													                	 <br><br>
													                     <img  src="/Code_Green/resources/commUpload/${board.file1}" style="width:400px; height:400px;" onerror="this.style.display='none'">
													                     <img  src="/Code_Green/resources/commUpload/${board.file2}" style="width:400px; height:400px;" onerror="this.style.display='none'">
																			<br><br><br>${board.board_content }<br><br><br>
																			
																		 <div align="right">
																		  <input type="button"  class="ps-btn-best_jm"  onclick="best('${item.item_idx }','${board.board_idx }','${param.item_category}','${param.manager_brandname }','${sessionScope.sId }')">${board.best_count }
																		    <c:if test="${board.board_id eq sessionScope.sId || board.board_id eq 'admin' }">
																				<input type="button" value="수정" onclick="location.href='ReviewModify.bo?board_idx=${param.board_idx }'">
																				<input type="button" value="삭제" onclick="confirmDelete('${board.board_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 	</c:if>
																		 </div>
													                </td>  
													            </tr>  
													        </tbody>  
												        </c:forEach>
												    </table>  
												    
<!-------------------------------------------리뷰) 추천 많은 순 정렬------------------------------------------->
												  <table border="1" class="recruit" id="bestList">
												  	<c:if test="${empty bestList }">
		                                            	<tr><td colspan="3">따끈따끈한 첫 후기를 기다리고있어요.</td></tr>
		                                            </c:if>
												        <c:forEach var="board" items="${bestList }">
													        <tbody>  
													            <tr class="item">  
													                <td width="70%">${board.board_subject }
																		 <div class="ps-product" style="float:left;">
				                                                            <div class="ps-product__rating" style="float:left;">
				                                                                <select class="ps-rating" data-read-only="true">
								                                                    <c:if test="${board.board_star_score == 0}">
								                                                    	<option value="0"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    </c:if>
								                                                    
								                                                    <c:forEach var="i" begin="1" end="5">
								                                                    	<c:choose>
										                                                    <c:when test="${board.board_star_score == 0}"></c:when>
								                                                    		<c:when test="${i <= board.board_star_score}">
								                                                    			<option value="1">${i }</option>
								                                                    		</c:when>
								                                                    		<c:otherwise>
								                                                    			<option value="2">${i }</option>
								                                                    		</c:otherwise>
								                                                    	</c:choose>
								                                                    
								                                                    </c:forEach>
				                                                                </select>
				                                                            </div>
			                                                            </div>
									                                </td>
													                <td width="10%">${board.board_id }</td>  
													                <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
													                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>  
													                <td width="10%">${board.best_count }</td>  
													            </tr>  
													            <tr class="hide" >  
													                <td colspan="5">  
													                	 <br><br>
													                     <img  src="/Code_Green/resources/commUpload/${board.file1}" style="width:400px; height:400px;" onerror="this.style.display='none'">
													                     <img  src="/Code_Green/resources/commUpload/${board.file2}" style="width:400px; height:400px;" onerror="this.style.display='none'">
																		 <br><br><br>${board.board_content }<br><br><br>
																			
																		<div align="right">
																		 <input type="button"  class="ps-btn-best_jm"  onclick="best('${item.item_idx }','${board.board_idx }','${param.item_category}','${param.manager_brandname }','${sessionScope.sId }')">${board.best_count }
																		    <c:if test="${board.board_id eq sessionScope.sId || board.board_id eq 'admin' }">
																				<input type="button" value="수정" onclick="location.href='ReviewModify.bo?board_idx=${param.board_idx }'">
																				<input type="button" value="삭제" onclick="confirmDelete('${board.board_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 	</c:if>
																		 </div>
													                </td>  
													            </tr>  
													        </tbody>  
												        </c:forEach>
												    </table>  			
												    									    
<!-------------------------------------------리뷰) 별점 낮은순 정렬------------------------------------------->
												  <table border="1" class="recruit" id="worstList">
												  	<c:if test="${empty worstList }">
		                                            	<tr><td colspan="3">따끈따끈한 첫 후기를 기다리고있어요.</td></tr>
		                                            </c:if>
												        <c:forEach var="board" items="${worstList }">
													        <tbody>  
													            <tr class="item">  
													                <td width="70%">${board.board_subject }
 																		<div class="ps-product" style="float:left;">
				                                                            <div class="ps-product__rating" style="float:left;">
				                                                                <select class="ps-rating" data-read-only="true">
								                                                    <c:if test="${board.board_star_score == 0}">
								                                                    	<option value="0"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    	<option value="2"></option>
								                                                    </c:if>
								                                                    
								                                                    <c:forEach var="i" begin="1" end="5">
								                                                    	<c:choose>
										                                                    <c:when test="${board.board_star_score == 0}"></c:when>
								                                                    		<c:when test="${i <= board.board_star_score}">
								                                                    			<option value="1">${i }</option>
								                                                    		</c:when>
								                                                    		<c:otherwise>
								                                                    			<option value="2">${i }</option>
								                                                    		</c:otherwise>
								                                                    	</c:choose>
								                                                    
								                                                    </c:forEach>
				                                                                </select>
				                                                            </div>
			                                                            </div>
									                                </td>
													                <td width="10%">${board.board_id }</td>  
													                <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
													                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>
													                <td width="10%">${board.best_count }</td>  
													            </tr>  
													            <tr class="hide" >  
													                <td colspan="5">
													                	 <br><br>  
													                     <img  src="/Code_Green/resources/commUpload/${board.file1}" style="width:400px; height:400px;" onerror="this.style.display='none'">
													                     <img  src="/Code_Green/resources/commUpload/${board.file2}" style="width:400px; height:400px;" onerror="this.style.display='none'">
																		 <br><br><br>${board.board_content }<br><br>
																			
																		<div align="right">
																		 <input type="button"  class="ps-btn-best_jm"  onclick="best('${item.item_idx }','${board.board_idx }','${param.item_category}','${param.manager_brandname }','${sessionScope.sId }')">${board.best_count }
																		    <c:if test="${board.board_id eq sessionScope.sId || board.board_id eq 'admin' }">
																				<input type="button" value="수정" onclick="location.href='ReviewModify.bo?board_idx=${param.board_idx }'">
																				<input type="button" value="삭제" onclick="confirmDelete('${board.board_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																		 	</c:if>
																		 </div>
													                </td>  
													            </tr>  
													        </tbody>  
												        </c:forEach>
												    </table>  												    
<!-------------------------------------------게시판 끝------------------------------------------->


												    <script type="text/javascript">
														function confirmDelete(board_idx) {
															// confirm() 함수를 사용하여 "삭제하시겠습니까?" 메세지로 확인받아 result 변수에 저장 후
															// result 변수값이 true 일 경우 MemberDelete.me 서블릿 주소 요청(파라미터로 id 전달)
															let result = confirm("삭제하시겠습니까?");
															
															if(result) {
																location.href="ReviewDelete.bo?board_idx=" + board_idx+"&item_idx=" + ${item.item_idx};
															}
														}
													</script>
												    <script type="text/javascript">  
												        $(function(){  
												            var article = (".recruit .show");  
												            $(".recruit .item  td").click(function() {  
												                var myArticle =$(this).parents().next("tr");  
												                if($(myArticle).hasClass('hide')) {  
												                    $(article).removeClass('show').addClass('hide');  
												                    $(myArticle).removeClass('hide').addClass('show');  
												                }  
												                else {  
												                    $(myArticle).addClass('hide').removeClass('show');  
												                }  
												            });  
												        });  
												    </script>  
												    <br>
												    
				                                        <!-- 페이징 버튼들 시작 -->
								                   <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
								                    <div class="ps-pagination">
								                        <ul class="pagination">
								                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a class="pageLink" href='ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum-1}&Qna_pageNum=${Qna_pageInfo.qna_pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}&sort=${sort}"' ><%}%>Prev<i class="icon-chevron-left"></i></a></li>
								                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a class="pageLink" href='ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum+1}&Qna_pageNum=${Qna_pageInfo.qna_pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}&sort=${sort}"' ><%}%>Next<i class="icon-chevron-right"></i></a></li>
								                        </ul>
								                    </div><br>
								                    <!-- 페이징 버튼들 끝 -->
				                                    
													<!--리뷰작성 버튼 -->
												   <c:if test="${reviewBtn ne 0 }">
												   
												   <div align="right">
							                            <ul class="ps-tab-list" >
							                            <li>※작성 가능한 리뷰 개수는 ${reviewBtn }개입니다.</li>
							                                <li ><a href="#tab-3-1" class="ps-btn" style="color: white ">리뷰작성</a></li>
							                            
							                            </ul>
						                            </div> 
						                            </c:if>
						                            <!--리뷰작성 버튼 끝 -->
                                            </form>
                                        </div>
                                    </div>
                                </div>          

<!-- ==========상품후기 끝================================================================================== -->                           
                            
                                
<!-- ==========상품후기 작성=========================================================================================================     -->                                 

                                <div class="ps-tab" id="tab-3-1">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-5 col-md-12 col-sm-12 col-12 ">
                                            <div class="ps-block--average-rating">
                                                <div class="ps-block__header">
                                                    <h3>${item.board_star_score }</h3>
                                                    <select class="ps-rating" data-read-only="true">
                                                    <c:forEach var="i" begin="1" end="5">
                                                    
                                                    	<c:choose>
                                                    		<c:when test="${i <= item.score}">
                                                    			<option value="1">${i }</option>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			<option value="2">${i }</option>
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    
                                                    </c:forEach>
                                                    </select><span>${item.count } review</span>
                                                </div>
                                                <div class="ps-block__star"><span>5 Star</span>
                                                    <div class="ps-progress" data-value="${item.star5 }"><span></span></div><span>${item.star5 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>4 Star</span>
                                                    <div class="ps-progress" data-value="${item.star4 }"><span></span></div><span>${item.star4 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>3 Star</span>
                                                    <div class="ps-progress" data-value="${item.star3 }"><span></span></div><span>${item.star3 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>2 Star</span>
                                                    <div class="ps-progress" data-value="${item.star2 }"><span></span></div><span>${item.star2 }%</span>
                                                </div>
                                                <div class="ps-block__star"><span>1 Star</span>
                                                    <div class="ps-progress" data-value="${item.star1 }"><span></span></div><span>${item.star1 }%</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-8 col-lg-7 col-md-12 col-sm-12 col-12 ">
                                            <form class="ps-form--review" action="ReviewWritePro.bo" method="post" name="reviewForm" enctype="multipart/form-data">
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 베지터틀 내 1:1 문의에 남겨주세요.</p>
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
                                                	<input type="hidden" name="item_idx" value="${item.item_idx}" />
                                                	<input type="hidden" name="item_category" value="${item.item_category}" />
                                                	<input type="hidden" name="manager_brandname" value="${item.manager_brandname}" />
                                                	<input type="hidden" id="pageNum" name="pageNum" value="${param.pageNum }" />
                                                    <textarea class="form-control" id="board_subject" name="board_subject" rows="1" placeholder="상품후기를 남겨주세요" required="required"></textarea>
                                                    <textarea class="form-control" id="board_content" name="board_content" rows="6" placeholder="상품후기를 남겨주시면 적립금 1000원을 드립니다." required="required"></textarea>
                                                </div>
                                                <div align="right">
	                                                <div class="form-group submit">
	                                                     <input type="file" name="file_1" id="file_1">
	                                                     <input type="file" name="file_2" id="file_2">
	                                                    <button class="ps-btn" type="submit">Submit Review</button>
	                                                </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                
 <!-- ==========상품후기 작성 끝=========================================================================================================     -->  
                                      
 <!-- ==========상품문의 목록  시작=========================================================================================================     --> 

 
 							  <div class="ps-tab" id="tab-4">
<!--                                     <div class="table-responsive"> -->
                       				
                       				  	<div class="col-lg-15">
                                            <form class="ps-form--review" method="get">
                                                <h4>PRODUCT REVIEW</h4>
                                                <p>
	                                                <sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
													<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 베지터틀 내 1:1 문의에 남겨주세요.
												</p>
<!-- 													<table cellspacing="0" border="1" class="recruit" > -->
													<table border="1" class="recruit" >
													        <colgroup>  
													            <col width="63%">  
													            <col width="10%">  
													            <col width="10%">  
													            <col width="10%">  
													        </colgroup>  
													        <thead align="center">  
													            <tr class="" >  
<!-- 													                <th scope="col">번호</th>   -->
													                <th scope="col">제목</th>  
													                <th scope="col">작성자</th>  
													                <th scope="col">작성일</th>  
													                <th scope="col">답변상태</th>  
													            </tr>  
													        </thead>  
													        
													        
													        <c:forEach var="qna" items="${qnaList }">
														        <tbody>  
														        <tr class="item">  
																<c:if test="${qna.qna_pass eq 'Y'}" >
																	<c:choose>
																	
														                <c:when test="${qna.qna_id eq sessionScope.sId || sessionScope.sId eq 'admin' || sessionScope.sId  eq qna.manager_id}">
														       				<td>${qna.qna_subject }</td>  
															                <td>${qna.qna_id }</td>  
																            <fmt:parseDate var="dateString" value="${qna.qna_date }" pattern="yyyyMMdd" />
															                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td> 
															                <td>${qna.qna_category }</td>  
														                    
														                </c:when>
														                <c:otherwise>
														                	<td><img src="/Code_Green/resources/img/잠금.png"  style="width: 15px"/> 비밀글은 작성자와 관리자만 볼 수 있습니다.</td>
														                	<td>***</td>
																			<fmt:parseDate var="dateString" value="${qna.qna_date }" pattern="yyyyMMdd" />
															                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td> 
														                	<td>${qna.qna_category }</td></c:otherwise>
														            </c:choose>
																</c:if>
														            
																<c:if test="${qna.qna_pass eq 'N' || qna.qna_pass eq null || qna.qna_pass eq '' }" >
																		<td>${qna.qna_subject }</td>  
														                <td>${qna.qna_id }</td>  
															            <fmt:parseDate var="dateString" value="${qna.qna_date }" pattern="yyyyMMdd" />
														                <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td> 
														                <td>${qna.qna_category }</td>  
														        </c:if>					            
												            </tr>  
												            
												            
												            <tr class="hide">  
															<c:if test="${qna.qna_pass eq 'Y'}" >
															<c:choose>
															
												                <c:when test="${qna.qna_id eq sessionScope.sId || sessionScope.sId eq 'admin' || sessionScope.sId  eq qna.manager_id}">
												       				 <td colspan="4"><br>
													            		${qna.qna_content }
													            		<br><br><br>
												            			<c:if test="${qna.qna_answer ne 'N' }" >
													            		${qna.qna_answer }
													            		</c:if>
												            			<c:if test="${qna.qna_answer eq 'N' }" >
													            		답변 대기중입니다.
													            		</c:if>
													                    <br><br><br>
													                  <div align="right"><br><br>
													                  <c:if test="${qna.qna_id eq sessionScope.sId || qna.qna_id eq 'admin' }">
																			<input type="button" value="수정" onclick="location.href='QnaModify.bo?item_idx=${item.item_idx }&qna_idx=${qna.qna_idx }&item_category=${param.item_category}&manager_brandname=${param.manager_brandname }'">
																			<input type="button" value="삭제" onclick="qnaDelete('${qna.qna_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																	  </c:if>
																	 </div>
													                </td>    
												                </c:when>
												                <c:otherwise>
												                	 <td colspan="4"><br><br><br> 비밀글은 작성자와 관리자만 볼 수 있습니다.<br><br><br></td>
												                </c:otherwise>
												            </c:choose>
														</c:if>
														            
														<c:if test="${qna.qna_pass eq 'N' || qna.qna_pass eq null || qna.qna_pass eq '' }" >
												                <td colspan="4"><br>
												            		${qna.qna_content }
												            		<br><br><br>
												            			<c:if test="${qna.qna_answer ne 'N' }" >
													            		${qna.qna_answer }
													            		</c:if>
												            			<c:if test="${qna.qna_answer eq 'N' }" >
													            		답변 대기중입니다.
													            		</c:if>
													            		
												                    <br><br><br>
												                  <div align="right"><br><br>
												                  <c:if test="${qna.qna_id eq sessionScope.sId || qna.qna_id eq 'admin' }">
																		<input type="button" value="수정" onclick="location.href='QnaModify.bo?item_idx=${item.item_idx }&qna_idx=${qna.qna_idx }&item_category=${param.item_category}&manager_brandname=${param.manager_brandname }'">
																		<input type="button" value="삭제" onclick="qnaDelete('${qna.qna_idx}&item_category=${param.item_category}&manager_brandname=${param.manager_brandname}')">
																  </c:if>
																 </div>
												                </td>  
												        </c:if>					            
																
											            </tr>  
											        </tbody>  
										        </c:forEach>
										    </table>  
									    <br>
												    
								     	     <!-- 페이징 버튼들 시작 -->
				                  	<%Qna_PageInfo Qna_pageInfo = (Qna_PageInfo)request.getAttribute("Qna_pageInfo"); %>
				                    <div class="ps-pagination">
				                        <ul class="pagination">
				                            <li><%if(Qna_pageInfo.getQna_pageNum() > Qna_pageInfo.getQna_startPage()) {%><a href="javascript:changeQnaPageDown() "><%}%>Prev<i class="icon-chevron-left"></i></a></li>
				                            <li><%if(Qna_pageInfo.getQna_pageNum() < Qna_pageInfo.getQna_maxPage()) {%><a href="javascript:changeQnaPageUp()"><%}%>Next<i class="icon-chevron-right"></i></a></li>
				                        	
				                            <%--  <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="BoardList.bo?board_idx=${board.board_idx} "><%}%>Next<i class="icon-chevron-right"></i></a></li> --%>
				                        </ul>
				                    </div>
				                    <script type="text/javascript">
										   function changeQnaPageUp() {
										      location.href = "ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&Qna_pageNum="+${Qna_pageInfo.qna_pageNum+1}+"&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}&sort=${sort}";
										   }
								           function changeQnaPageDown() {
								              location.href = "ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&Qna_pageNum="+${Qna_pageInfo.qna_pageNum-1}+"&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}&sort=${sort}";
								           }
								                    	
								    </script>
				                  
								    <!-- 페이징 버튼들 끝 -->
								    
								    <!-- 문의작성 버튼 -->
								   
								   <div align="right">
									   <c:if test="${sessionScope.sIdx ne null}">
				                            <ul class="ps-tab-list" >
				                                <li ><a href="#tab-4-1" class="ps-btn" style="color: white ">문의작성</a></li>
				                            </ul>
				                        </c:if>
		                            </div> 
		                            <!-- 문의작성 버튼 끝 -->
                                        </form>
                                    </div>
							</div>
  								<script type="text/javascript">
									function qnaDelete(qna_idx) {
										let result = confirm("삭제하시겠습니까잉?");
										
										if(result) {
											location.href="QnaDelete.bo?qna_idx=" + qna_idx+"&item_idx=" + ${item.item_idx};
										}
									}
								</script>
 <!-- ==========상품문의 목록 끝=========================================================================================================     -->   
  
  
  
  
  <!-- ==========상품문의 작성  시작=========================================================================================================     --> 
  							  <div class="ps-tab" id="tab-4-1">
                                    <div class="row">
                                        <div class="col-xl-10 col-lg-7 col-md-12 col-sm-12 col-12 ">
                                            <form class="ps-form--review" action="QnaWritePro.bo" method="post" name="QnaForm">
                                                
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 베지터틀 내 1:1 문의에 남겨주세요.</p>
                                                <div class="form-group">
                                                	<input type="hidden" name="qna_id" value="${sessionScope.sId}" />
                                                	<input type="hidden" name="item_idx" value="${item.item_idx}" />
                                                	<input type="hidden" name="item_category" value="${item.item_category}" />
                                                	<input type="hidden" name="manager_brandname" value="${item.manager_brandname}" />
                                                	<input type="hidden" id="pageNum" name="pageNum" value="${param.pageNum }" />
                                                    <textarea class="form-control" id="qna_subject" name="qna_subject" rows="1" placeholder="상품문의 작성 전 확인해주세요 "></textarea>
                                                    <textarea class="form-control" id="qna_content" name="qna_content" rows="15" cols="60" placeholder=
"* 답변은 영업일 기준 2~3일 소요됩니다
* 해당 게시판의 성격과 다른 글은 사전동이 없이 담당 게시판으로 이동될 수 있습니다.
* 배송관련, 주문(취소, 교환, 환불) 관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.
제품
* 제품 상세정보 : 영양성분 및 함량, 용량, 보관 및 취급 방법 등 제품 정보는 상세이미지, 또는 상세정보에서
확인가능합니다
주문취소
* 배송 단계별로 주문취소 방법이 상이합니다. 
* [입금확인] 단계 : [베지터틀> 주문내역 상세페이지] 에서 직접 취소 가능
* [입금확인] 이후 단계 : 고객센터로 문의
* 주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.
배송
* 주문 완료 후 변경은 불가능합니다.
* 배송일 배송시간 지정은 불가능합니다.
* 전화번호, 이메일, 주소, 계좌번호등의 상세 개인정보가 문의 내용에 
저장되지 않도록 주의해 주시기 바랍니다"></textarea>
                                                </div>
                                                <div align="right">
	                                                <div class="form-group submit">
                                                	비밀글<input type="checkbox" id="qna_pass" name="qna_pass" value="Y" />
	                                                    <button class="ps-btn" type="submit">Submit Review</button>
	                                                </div>
	                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
  <!-- ==========상품문의 작성 끝=========================================================================================================     -->   
                           
                            </div>
                        </div>
                    </div>
                </div>
                
<!--======================오른쪽 Same Brand=====================================================  -->
                <div class="ps-page__right">
                        <h3> Same Brand</h3>
                        <div class="widget__content">
						 <c:forEach var="item" items="${sameBrand }">
						 <!-- 장바구니 담을 정보 -->
						<input type="hidden" id="cart_total_${item.item_idx}" name="cart_total_${item.item_idx}" value="${item.item_price}">
						<input type="hidden" id="item_name_${item.item_idx}" name="item_name_${item.item_idx}" value="${item.item_name}" >
						<input type="hidden" id="item_file1_${item.item_idx}" name="item_file1_${item.item_idx}" value="${item.file1}" >
						<input type="hidden" id="manager_brandname_${item.item_idx}" name="manager_brandname_${item.item_idx}" value="${item.manager_brandname}" >
                        <input type="hidden" id="item_category_${item.item_idx}" name="item_category_${item.item_idx}" value="${item.item_category}" >                     
                        
                         <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}"><img  src="/Code_Green/resources/item/${item.file1 } " alt=""></a>
                                <ul class="ps-product__actions">
                                    <li><a data-toggle="tooltip" data-placement="top" title="Add To Cart" onclick="addCart('${item.item_idx}')"><i class="icon-bag2" ></i></a></li>
									<li><a data-toggle="tooltip" data-placement="top" title="Add to Whishlist" onclick="addHeart('${item.item_idx}')"><i class="icon-heart"></i></a></li>                               
                                </ul>
                            </div>
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">${item.manager_brandname }</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
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
                                   <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                     <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                            </div>
                        </div>
                       </c:forEach>
                        </div>
                </div>
            </div>
            
            
            
<!-- ===================================================================================================================     -->
<!--             연관상품 -->
            <div class="ps-section--default">
                <div class="ps-section__header">
                    <h3>Related products</h3>
                </div>
                <div class="ps-section__content">
                    <div class="ps-carousel--nav owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="2500" data-owl-gap="30" data-owl-nav="true" data-owl-dots="true" data-owl-item="6" data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-item-xl="5" data-owl-duration="1000" data-owl-mousedrag="on">
                       
                       <c:forEach var="item" items="${itemList6 }">
                       
                        <div class="ps-product">
                            <div class="ps-product__thumbnail"><a href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}"><img  src="/Code_Green/resources/item/${item.file1 } " alt=""></a>
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
                            <div class="ps-product__container"><a class="ps-product__vendor" href="#">${item.manager_brandname }</a>
                                <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
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
                                   <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${item.item_idx}&pageNum=${pageInfo.pageNum}&manager_brandname=${item.manager_brandname}&item_category=${item.item_category}">${item.item_name }</a>
                                     <h4 class="ps-product__price">${item.item_price }원</h4>
                                </div>
                            </div>
                        </div>
                       </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    
     
        <!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
    	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->
    </div>
    
    
    
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
    <script src="/Code_Green/resources/js/quantity.js"></script>
</body>
</html>