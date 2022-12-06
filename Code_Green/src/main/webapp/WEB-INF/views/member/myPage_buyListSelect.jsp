<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
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
    <script src="/Code_Green/resources/plugins/jquery.min.js"></script>
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
	.options_area{
		display: flex;
	    flex-direction: row;
	    justify-content: flex-end;
	    align-items: flex-start;
	}
	
	.dateDiv {
		float: right;
	
	}

	#dateSet{
		border: 1px solid gray;
		border-radius: 20px;
		color: black;
		font-size: 75%;
		font-weight: bold;
		background-color: transparent;
		margin-right: 10px;
		margin-left: 10px;
		margin-bottom: 10px;
		padding: 3px 15px;
	}	    
</style>
<script>
	$(function(){
		$("#dateSet").click(function(){
			let status = document.querySelector(".dateDiv").style.display;
			if(status == 'none'){
				$(".dateDiv").show();
			} else {
				$(".dateDiv").hide();
			}
			
		});
	});
	
	function searchByDate(period){
		$.ajax({
			url:"myBuyListbyMonth.my",
			type:"get",
			data:{ period : period },
			success: function(data){
				$(".table_buyList").html(data);
			}
		});
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

 <!-- ==========주문정보=========================================================================================================     -->                          
                    <div class="col-lg-8">
                        <div class="ps-section__right">
                           <h3 style="display:inline;">주문내역</h3>
                           &nbsp;&nbsp; 최대 지난 1년간의 주문내역을 확인할 수 있어요<br>
                           <div class="options_area">
								<select name="searchDate" onchange="searchByDate(this.value)" required >    
									<option value="">기간조회</option>    
									<option value="3">3개월</option>    
									<option value="6">6개월</option>    
									<option value="9">9개월</option>    
								</select>
								<input type="button" name="searchDateSet" id="dateSet" value="+상세조회">
							</div>
								<div class="dateDiv" style="display: block;">
									<form action="myBuyListbySelect.my"  id="dates">
										<input type="date" name="date1" value="${date1}" required="required"> - <input type="date" name="date2" value="${date2}" required="required">
										<input type="submit" id="dateSet" value="검색" >
										<input type="reset" id="dateSet" value="초기화" >
									</form>
								</div>
							<div class="ps-section--account-setting">
                                <div class="table-responsive">
                                	<div class="table_buyList">
				                      <table class="table ps-table">
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
				                          <tbody>
				                          <c:if test="${empty buyList }">
				                          	<td colspan="6">최근주문내역이 없습니다.</td>
				                          </c:if>
				                              <c:forEach var="buyList" items="${buyList }">
				                              <tr>
				                              	<fmt:parseDate var="dateString" value="${buyList.sell_date }" pattern="yyyy-MM-dd HH:mm:ss" />
				        						<td>
				        							<span><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd HH:mm:ss" /></span>
				        						</td>
				                                <td>
			                                      <div class="ps-product--cart">
			                                        <div class="ps-product__content"><a href="myBuyListDetail.my?sell_order_number=${buyList.sell_order_number }">${buyList.sell_order_number }</a></div>
			                                      </div>
				                                </td>
				                                <td>${buyList.sell_amount }건</td>
				                                <td>${buyList.sell_pay_type }</td>
				                                <td><fmt:formatNumber value="${buyList.sell_total_price }" pattern="#,###"/>원</td>
				                                <td>${buyList.sell_status }</td>
				                              </tr>
				                              </c:forEach>
				                          </tbody>
				                      </table>
                      
						             <!-- 페이징 버튼들 시작 -->
									 	<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
									       <div class="ps-pagination">
									           <ul class="pagination">
									               <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="myBuyList.my?pageNum=${pageInfo.pageNum - 1}&period=&date1=${date1}&date2=${date2}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
									               <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
									               	<c:choose>
									               		<c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="javascript:void(0);">${i }</a></li></c:when>
									               		<c:otherwise><li><a href="myBuyList.my?pageNum=${i }&period=&date1=${date1}&date2=${date2}">${i }</a></li></c:otherwise>
									               	</c:choose>
									               </c:forEach>
									               <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="myBuyList.my?pageNum=${pageInfo.pageNum + 1}&period=&date1=${date1}&date2=${date2}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
									           </ul>
									       </div>
						      		 <!-- 페이징 버튼들 끝 -->  
			                         	</div>
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
    
    <div id="back2top"><i class="icon icon-arrow-up"></i></div>
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    
   
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
    <script src="/Code_Green/resources/js/main.js"></script>
</body>
</html>