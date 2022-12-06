<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

           							<c:forEach var="brand" items="${brandItemList }">
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
                                                      <c:if test="${not empty brand.board_star_score }">
                                                      	<span><i class="fi fi-sr-star"></i>
                                                      	리뷰평점(${brand.board_star_score })</span>
                                                      </c:if>
                                                      <c:if test="${empty brand.board_star_score }">
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
		                             </c:forEach>     
                                   
		<!-- =========================================== 상품리스트 끝=====================================================-->