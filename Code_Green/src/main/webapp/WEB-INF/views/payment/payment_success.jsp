<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!-- headers-->
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
    <title>주문 완료 - 베지터틀</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/style_payment.css">
   	<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
   	<style type="text/css">
   		
   		#cardOrderBtn{
   			width: 870px;
   			margin-top: 100px;
   		}
   		
   	</style>
   
    <script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"> </script>
    
    <!-- 결제 api 관련 js-->
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    <script type="text/javascript">
   		var jbRandom = Math.random();
    
       <!-- 결제 api -->
       var IMP = window.IMP; 
       IMP.init("imp82131734"); 
   
       function requestPay() {
           IMP.request_pay({
        	   pg : 'kcp',
               pay_method : 'card',
               merchant_uid: "${orderList.sell_order_number }" + jbRandom, // 주문번호?결제번호? 중복되면 결제안됨 ! 결제 할때마다 다른 번호 넣어야함
               name : '베지터틀 상품',
               amount : ${orderList.sell_total_price },
               buyer_email : '${orderList.member_email }',
               buyer_name : '${orderList.sell_receiver }',
               buyer_tel : '${orderList.sell_phone }',
               buyer_addr : '${orderList.sell_address }',
               buyer_postcode : '${orderList.sell_postcode }'
           }, function (rsp) { // callback
               if (rsp.success) {
                   alert("결제가 완료되었습니다.");
                   location.href = "payment_success_card_thanks?member_id=${sessionScope.sId}";
                   $.ajax({
                          url: "payment_success_card",
                          type: "POST",
                          data: {
                             sell_idx : ${orderList.sell_idx}
                          },
                          success: function(){
                             alert("결제가 성공되었습니다.");
                          },
                          fail: function () {
                             alert("결제가 실패되었습니다.");
                          }
                       });
               } else {
                   alert("결제가 완료되지 않았습니다.");
                   history.back();
               }
           });
       }
       
    </script>
</head>

<body>

   <jsp:include page="../inc/top.jsp"></jsp:include>
   
    <main class="ps-page--my-account">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li>주문 완료</li>
                </ul>
            </div>
        </div>
         <div class="col-lg-8" style="margin: 150px 200px;">
         	<div class="ps-block--payment-success"> 
                    <h3>주문이 완료 되었습니다 !</h3>
                    <p>베지터틀을 이용해 주셔서 감사합니다. <br>자세한 주문 내역을 확인하시려면<a href="myBuyList.my"> 마이 페이지</a>에서 확인 하실 수 있습니다.</p><br>
                    <h4 style="color: #669900"><img src="/Code_Green/resources/img/turtleturtle.png" width="25px" height="25px"/> 카드 결제는 화면 하단 'PAY' 버튼을 클릭해주세요</h4>
         	</div>
             <div class="ps-section__right">
                 <div class="ps-section--account-setting">
                     <div class="ps-section__header" style="margin-top: 80px;">
                         <h3><strong>주문 번호 ${orderList.sell_order_number }</strong></h3>
                     </div>
                     <div class="ps-section__content">
                         <div class="row">
                             <div class="col-md-4 col-12">
                                 <figure class="ps-block--invoice">
                                     <div class="ps-block__content">
                                         <p>주문자 : ${orderList.sell_receiver }</p>
                                         <p>주소 : ${orderList.sell_postcode} / ${orderList.sell_address }</p>
                                         <p>휴대폰 번호 : ${orderList.sell_phone }</p>
                                     </div>
                                 </figure>
                             </div>
                             <div class="col-md-4 col-12">
                                 <figure class="ps-block--invoice">
                                     <div class="ps-block__content">
                                         <p>전체 상품 금액 : ${item_total_price }원</p>
                                         <p>배송비 : + ${shipping_fee }원</p>
                                         <p>사용한 적립금 : - ${orderList.sell_usecoin }원</p>
                                     </div>
                                 </figure>
                             </div>
                             <div class="col-md-4 col-12">
                                 <figure class="ps-block--invoice">
                                     <div class="ps-block__content">
                                         <p  style="color: #669900"><strong>결제 금액 : ${orderList.sell_total_price }원</strong></p>
                                         <p>지불 방법 : ${orderList.sell_pay_type }</p>
                                     </div>
                                 </figure>
                             </div>
                         </div>
                         <div class="table-responsive">
                             <table class="table ps-table" style="margin-top: 30px;">
                                 <thead>
                                     <tr>
                                         <th><strong>상품</strong></th>
                                         <th><strong>금액</strong></th>
                                         <th><strong>수량</strong></th>
                                         <th><strong>상품 금액</strong></th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                   <c:forEach var="orderDetailList" items="${orderDetailList }">
                                     <tr>
                                         <td>
                                             <div class="ps-product--cart">
                                                 <div class="ps-product__thumbnail"><img src="/Code_Green/resources/item/${orderDetailList.file1 }"></div>
                                                 <div class="ps-product__content" style="text-align: left;">${orderDetailList.item_name }
                                                     <p>판매자 :<strong> ${orderDetailList.manager_brandname }</strong></p>
                                                 </div>
                                             </div>
                                         </td>
                                         <td><span>${orderDetailList.item_price }원</span></td>
                                         <td><span>${orderDetailList.sell_amount }개</span></td>
                                         <td><span><fmt:formatNumber value="${orderDetailList.item_price * orderDetailList.sell_amount}"/>원</span></td>
                                     </tr>
                                   </c:forEach>  
                                 </tbody>
                             </table>
                         </div>
                     </div>
                 </div>
             </div>
             <input type="button" class="ps-btn ps-btn--fullwidth" id="cardOrderBtn" value="PAY" onclick="requestPay()">
         </div>
    </main>
   
   	<jsp:include page="../inc/footer.jsp"></jsp:include>
   
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
    <!-- custom s/Code_Green/resourcesipts-->
    <script src="/Code_Green/resources/js/main.js"></script>

</html>