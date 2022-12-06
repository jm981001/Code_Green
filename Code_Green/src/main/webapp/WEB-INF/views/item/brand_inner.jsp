<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
              <div class="ps-section__left">
                  <aside class="widget widget--vendor">
                           
                            <h3 class="widget-title" id="brandNameBar">${ brandDetail.manager_brandname}</h3>
                           	<c:if test="${not empty sessionScope.sId && sessionScope.sId ne 'admin' && empty sessionScope.sCode}">
                            <div class="brandfollowbtn">
	                            <a class="ps-block__inquiry" href="javascript:void(0);" onclick="followCheck(${brandDetail.manager_idx});"><span id="fStatus">${followCheckRevertResult}</span></a>
	                            <img src="/Code_Green/resources/img/forzero/${heartStatus}" id="heart_icon_brand_b">
                            </div>
                            </c:if>
                            <div class="ps-block__user" >
		                     	<div class="ps-block__user-avatar">
		                     	<!-- 브랜드별 로고띄우기 -->
	                     		   <img src="<%=request.getContextPath() %>/resources/img/brand_logo/${ brandDetail.manager_original_file}" width="250px" height="200px">
		                           		<div id="followInfo">
		                           		<c:choose>
			                           		<c:when test="${ brandDetail.brand_follower gt 0}"> 
			                           		<small>지금 이 브랜드를<br>
			                           			${brandDetail.brand_follower}명이 팔로하고 있습니다!</small>
			                           		</c:when>
			                           		<c:when test="${brandDetail.brand_follower eq 0 || empty brandDetail.brand_follower}">
				                           		<small>아직 아무도 팔로하고있지 않습니다!<br>
				                           		첫 단골이 되어보세요:) </small>
			                           		</c:when>
		                           		</c:choose>
			                           	</div>
			                           <div class="brand_info">
			                           		${ brandDetail.manager_info}<br>
			                           </div>
		                    	</div>
		                    </div>
<!-- =========================================== 사이드바 시작 ======================================================== -->
<!-- =========================================== 사이드바 끝======================================================== -->	
                 </aside>
             </div>
         	 <div class="ps-section__right">
           
           
          <!-- 상품리스트 헤더  -->
               <div class="ps-shopping ps-tab-root">
                   <div class="ps-shopping__header">
                      <p>총<strong> ${brandDetail.brand_itemCnt } </strong> 개의 상품 </p>
                      <div id="orderbylist">
	                      <a href="javascript:void(0);" onclick="goBrandList(${brandDetail.manager_idx},'recent')">최근순</a>  |
	                      <a href="javascript:void(0);" onclick="goBrandList(${brandDetail.manager_idx},'lowest_price')">낮은가격순</a> | 
	                      <a href="javascript:void(0);" onclick="goBrandList(${brandDetail.manager_idx},'highest_price')">높은가격순</a>
                      </div>
                   </div>
<!-- =========================================== 상품리스트 시작=====================================================-->
<!-- ===================================== 상품 1개당 ================================================== --> 
                    <div class="ps-tabs">
                        <div class="ps-tab active" id="tab-1">
                            <div class="ps-shopping-product">
                                <div class="row">
           						<c:forEach var="brand" items="${brandItemList }">
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                        <div class="ps-product">
                                            <div class="ps-product__thumbnail">
                                            <a href="ItemDetail.bo?item_idx=${brand.item_idx}&manager_brandname=${brand.manager_brandname}&item_category=${brand.item_category}" ><img src="/Code_Green/resources/item/${brand.file1 }"/></a>
	                                            <input type="hidden" id="cart_total_${brand.item_idx}" name="cart_total_${brand.item_idx}" value="${brand.item_price}">
	                                          	<input type="hidden" id="item_name_${brand.item_idx}" name="item_name_${brand.item_idx}" value="${brand.item_name}" >
	                                          	<input type="hidden" id="item_file1_${brand.item_idx}" name="item_file1_${brand.item_idx}" value="${brand.file1}" >
	                                          	<input type="hidden" id="manager_brandname_${brand.item_idx}" name="manager_brandname_${brand.item_idx}" value="${brand.manager_brandname}" >
	                                            <input type="hidden" id="item_category_${brand.item_idx}" name="item_category_${brand.item_idx}" value="${brand.item_category}" >                     
                                            <ul class="ps-product__actions">
	                                             <li><a data-toggle="tooltip" data-placement="top" title="Add To Cart" onclick="addCart('${brand.item_idx}')"><i class="icon-bag2" ></i></a></li>
	                                             <li><a data-toggle="tooltip" data-placement="top" title="Add to Whishlist" onclick="addHeart('${brand.item_idx}')"><i class="icon-heart"></i></a></li>
                                            </ul>
                                            </div>
                                            <div class="ps-product__container"><a class="ps-product__vendor" href="ItemDetail.bo?item_idx=${brand.item_idx}&manager_brandname=${brand.manager_brandname}&item_category=${brand.item_category}">${brand.manager_brandname }</a>
                                               <div class="ps-product__content"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${brand.item_idx}&manager_brandname=${brand.manager_brandname}&item_category=${brand.item_category}">${brand.item_name }</a>
                                                    <div class="ps-product__rating">
                                                    <c:if test="${not empty brand.board_star_score}">
                                                      	<span><i class="fi fi-sr-star"></i>
                                                      	리뷰평점(${brand.board_star_score })</span>
                                                      </c:if>
                                                      <c:if test="${empty brand.board_star_score}">
                                                      	<span><i class="fi fi-sr-star"></i>
                                                      	리뷰평점(후기없음)</span>
                                                      </c:if>
                                                    </div>
                                                  <h4 class="ps-product__price">${brand.item_price }원</h4>
                                                </div>
                                                <div class="ps-product__content hover"><a class="ps-product__title" href="ItemDetail.bo?item_idx=${brand.item_idx}&manager_brandname=${brand.manager_brandname}&item_category=${brand.item_category}">${brand.item_name }</a>
                                                <h4 class="ps-product__price">${brand.item_price }원</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               	</c:forEach>     
                                </div>
                            </div>
                		</div>
             		</div>
           		 </div>
			</div>
<!-- =========================================== 상품리스트 끝=====================================================-->