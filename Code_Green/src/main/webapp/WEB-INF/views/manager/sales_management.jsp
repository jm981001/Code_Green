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
    <title>매출관리 페이지</title>
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
                    <h3>정산페이지</h3>
                </div>
                
               <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
   
                
                <div class="ps-section__header">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="products" method="get">
                            <div class="ps-form__left">
                                <div class="form-group">
                                    </div>
                                    </div>
                                <div class="form-group">
                                </div>
                                    
                            <div class="ps-form__right">
                            </div>
                        </form>
                    </div>
                    
                    <br>
                    <div class="ps-section__search">
              
                    </div>
                </div>
                <div class="ps-section__content">
                    <div class="table-responsive">
                        <table class="table ps-table">
                        <thead>
                        <tr>
                        <td><strong>총 매출</strong></td>
                        
                        <td><fmt:formatNumber value="${orderTotal.brandtotal  }" pattern="#,###원" /><small class="asc"></i><span></span></small></td>
                        
                        <td><strong>수수료</strong></td>
                        <td><fmt:formatNumber value="${commission}" pattern="#,###원" /><small class="asc"></i><span></span></small></td>
                       <tr>
                      
                       <td><strong>순수익</strong></td>
                        <td><fmt:formatNumber value="${Brand_net}" pattern="#,###원" /><small class="asc"></i><span></span></small></td>
                     </tr>
                     <tr>
                        </tr>
                        </thead>
                        </table>
                        </div>
            
            
                    <table class="table ps-table">
<!--                      <thead> -->
                    				 <br>

                                        <tr>
                                            <td>매출기간</td>
                                            <td>금액</td>
                                       
                                    </thead>
                                    <tbody>
                     
                     <h4>한달매출</h4>
                           <c:forEach var="salesMonth" items="${salesMonth }">
                               <tr>
                                 <td>${salesMonth.salesMonth }</td>  
                                 <td>${salesMonth.sum }원</td>  
                                      </tr>
                           </c:forEach>
               </table>
                    <table class="table ps-table">
                    	        <br>

                                        <tr>
                                            <td>매출기간</td>
                                            <td>금액</td>
                                       
                                    </thead>
                                    <tbody>
                     <h4>하루 매출</h4>
                           <c:forEach var="salesday" items="${salesday }">
                               <tr>
                                 <td>${salesday.salesday }</td>  
                                 <td>${salesday.sum }원</td>  
                                      </tr>
                           </c:forEach>
               </table>         
               
                    <table class="table ps-table">
                    	 <br>

                                        <tr>
                                            <td>매출기간</td>
                                            <td></td>
                                            <td></td>
                                            <td>금액</td>
                                       
                                    </thead>
                                    <tbody>
                     <h4>일주일 매출</h4>
                           <c:forEach var="salesWeek" items="${salesWeek }">
                               <tr>
                                 <td>${salesWeek.start }</td>
                                 <td> ~~~ </td>
<!--                                  <td>부터</td> -->
                                 <td>${salesWeek.end }</td> 
<!--                                  <td>까지</td> -->
                                 
<%--                                  <td>${salesWeek.salesWeek }</td>   --%>
                                 <td>${salesWeek.sum }원</td>  
                                      </tr>
                           </c:forEach>
               </table>         
  
                      

</div>
</main>
    <script src="/Code_Green/resources/plugins_manager/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>