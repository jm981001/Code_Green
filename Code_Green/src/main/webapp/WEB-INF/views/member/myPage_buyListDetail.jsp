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
    
<style type="text/css">
    	#orderCancel{
			margin-top: 50px;
		    background: #5fa30f;
		    border: none;
		    border-radius: 39px;
		    color: white;
		    width: 100px;
		    height: 34px;
    	}
    	
    	#orderInfo_table{
    		border: none;
    		width: 100%;
    		margin-bottom: 30px;
    	}
    	
    	#orderInfo_table th{
    		font-weight: bold;
    		padding-top: 10px;
    	}
</style>
<script type="text/javascript">
	function myOrderCancel() {
	    let cancelAuth = confirm('주문 취소 하시겠습니까? 취소하면 복구할 수 없는 점 참고 바랍니다.');
	    if(cancelAuth){
	       if('${orderList.sell_cancel_status}' == '취소요청') {
	          alert('이미 취소한 주문입니다.');
	       } else {
	          $.ajax({
	             type : 'POST',
	             url : 'payment_cancel',
	             data: {
	                sell_idx : ${orderList.sell_idx }
	             }
	          });
	          alert('주문취소 완료되었습니다.\n관리자에게 취소요청이 되었습니다.');
	       }
	    }
	 }
</script>    
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

 <!-- ==========주문정보=========================================================================================================     -->                          
                    <div class="col-lg-8">
                        <div class="ps-section__right">
                            <div class="ps-section--account-setting">
                                <div class="ps-section__header">
                                    <h3>주문상세내역</h3>
                                </div>
                                <div class = "orderInfo_table">
	                                <table id="orderInfo_table">
	                                	<tr>
	                                		<th>주문번호</th>
	                                		<th>주문날짜</th>
	                                	</tr>
	                                	<tr>
	                                		<td>${orderList.sell_order_number }</td>
	                                		<fmt:parseDate var="dateString" value="${orderList.sell_date }" pattern="yyyy-MM-dd HH:mm:ss" />
	                                		<td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd HH:mm:ss" /></td>
	                                	</tr>
	                                	<tr>
	                                		<th>주문상태</th>
	                                		<th>결제방법</th>
	                                	</tr>
	                                	<tr>
	                                		<td>${orderList.sell_status}</td>
	                                		<td>${orderList.sell_pay_type}</td>
	                                	</tr>
	                                	<tr>
	                                		<th>받는사람</th>
	                                		<th>연락처</th>
	                                	</tr>
	                                	<tr>
	                                		<td>${orderList.sell_receiver}</td>
	                                		<td>${orderList.sell_phone}</td>
	                                	</tr>
	                               		<tr>
	                                		<th colspan="2">배송지</th>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="2">${orderList.sell_address}</td>
	                                	</tr>
	                               		<tr>
	                                		<th colspan="2" style="color:#b3b3b3;">취소요청</th>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="2">
		                                		<c:if test="${not empty orderList.sell_cancel_status}">
		                                		${orderList.sell_cancel_status}
		                                		</c:if>
		                                		<c:if test="${empty orderList.sell_cancel_status}">-</c:if>
	                                		</td>
	                                	</tr>
	                                </table>
                                </div>
                                    <div class="table-responsive">
                                        <table class="table ps-table">
                                            <thead>
                                                <tr>
                                                    <th>주문상품</th>
                                                    <th>금액</th>
                                                    <th>수량</th>
                                                    <th>총 금액</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach var="orderDetailList" items="${orderDetailList }">
                                                <tr>
                                                    <td>
                                                        <div class="ps-product--cart">
                                                            <div class="ps-product__thumbnail">
                                                            <a href="ItemDetail.bo?item_idx=${orderDetailList.item_idx}&manager_brandname=${orderDetailList.manager_brandname}&item_category=${itemList.item_category}"><img src="/Code_Green/resources/item/${orderDetailList.file1 }"></a></div>
                                                            <div class="ps-product__content">
                                                            <a href="ItemDetail.bo?item_idx=${orderDetailList.item_idx}&manager_brandname=${orderDetailList.manager_brandname}&item_category=${orderDetailList.item_category}">${orderDetailList.item_name }</a>
                                                                <p><strong>${orderDetailList.manager_brandname }</strong></p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    
                                                    <td><span><fmt:formatNumber value="${orderDetailList.item_price }" pattern="#,###"/>원</span></td>
                                                    <td>${orderDetailList.sell_amount }</td>
                                                    <td><span><fmt:formatNumber value="${orderDetailList.item_price * orderDetailList.sell_amount }" pattern="#,###"/>원</span></td>
                                                </tr>
                                                </c:forEach>
                                                <!-- 총금액 및 배송비 출력 칸  -->
                                                <tr>
                                                	<td colspan="4">배송비 = <fmt:formatNumber value="${shipping_fee }" pattern="#,###"/>원</td>
                                                </tr>
                                                <tr>
                                                	<td colspan="4">적립금사용 = <fmt:formatNumber value="${orderList.sell_usecoin }" pattern="#,###"/>원</td>
                                                </tr>
                                                <tr>
                                               		<td colspan="4">
                                               		주문금액 <fmt:formatNumber value="${item_total_price }" pattern="#,###"/>원 
                                               		+ 배송비 <fmt:formatNumber value="${shipping_fee }" pattern="#,###"/>원   
                                               		- 적립금 <fmt:formatNumber value="${orderList.sell_usecoin }" pattern="#,###"/>원 
                                               		= 총 <fmt:formatNumber value="${orderList.sell_total_price }" pattern="#,###"/>원</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div align="right">
                                       	 	<button id="orderCancel"  onclick="myOrderCancel()">주문취소</button>
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