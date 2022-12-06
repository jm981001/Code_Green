<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
    <link href="favicon.png" rel="icon">
    <title>주문관리-베지터틀</title>
     <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
</head>
<body>
<header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
     <jsp:include page="../inc/manager_menu.jsp"></jsp:include>
    
 
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>주문조회</h3>
                </div>
               <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>

 		<div class="ps-main__wrapper">
  		<div class="header__center">
  		<form class="ps-form--search-bar" action="order_detail?id=${sessionScope.sId}"  method="get"name="detailForm">

       <table class="table ps-table">
              
                    <h2>주문상세보기</h2>
                    <hr>
                       <thead>
                       <br>
                                <tr>
                                    <th>주문번호</th>
                                    <th>회원번호</th>
                                    <th>주문상품</th>
                                    <th>상품가격</th>
                                    <th>주문수량</th>
                                    <th>총금액</th>
                                    <th>주문상태</th>
                                    <th>주문날짜</th>
                                    <th>결제여부</th>
                                    <th>결제일</th>
                                    <th>상품브랜드</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
					<c:forEach var="orderInfo" items="${orderInfo }">
						    <tr>
						     <td>${orderInfo.sell_order_number}</td>
						     <td>${orderInfo.rf_member_idx}</td>
						     <td>${orderInfo.item_name }</td>
						     <td>${orderInfo.item_price}</td>
						     <td>${orderInfo.sell_amount}</td>
						     <td>${orderInfo.sell_total_price}</td>
						     <td>${orderInfo.sell_status}</td>
						     <td>${orderInfo.sell_date }</td>
						     <td>${orderInfo.sell_pay_status}</td>
						     <td>${orderInfo.sell_pay_date}</td>
						     <td>${orderInfo.manager_brandname}</td>
						         <td>
                                   <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                   <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="qnaboard_delete?qna_idx=${order.qna_idx }">삭제</a></div>
                                   </div>
                                 </td>
						    </tr>     
					</c:forEach>
						</tbody>
						</table>
             
                    </div>
                </div>
         		<div class="ps-form__submit text-center">

                         <button class="ps-btn success"type="submit"onclick="order_modify=${orderInfo.item_idx }">주문상태변경</button>
                          <button class="ps-btn ps-btn--gray mr-3"onclick="history.back()">취소</button>
                    </div>
                    </div>
    </main>
    <script src="/Code_Green/resources/plugins_manager/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <!-- custom c/Code_Green/resourcese-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>