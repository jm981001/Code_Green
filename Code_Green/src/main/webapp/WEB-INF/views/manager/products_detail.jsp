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
    <title>상품상세페이지-베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">

 <script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"> </script>
    <script type="text/javascript">
       function product_delete(value) {
            
          let delete_confirm = confirm('삭제하시겠습니까? 삭제하면 복구가 불가능합니다.');
          
          if(delete_confirm){
             $.ajax({
               url: "product_delete",
               type: "GET",
               data: {
                  item_idx: value
               },
               success: function(){
                  alert("삭제가 완료되었습니다.");
                  location.href = "products";
               },
               fail: function () {
                  alert("삭제가 실패되었습니다. 다시 시도해 주세요.");
               }
            });
          } 
      }
    </script>
</head>




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
                    <h3>상품조회</h3>
                </div>

                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>

 		<div class="ps-main__wrapper">
  		<div class="header__center">
  		<form class="ps-form--search-bar" action="products_detail?id=${sessionScope.sId}"  method="get"name="detailForm">
 
       <table class="table ps-table">
              
                    <h2>상품상세보기</h2>
                    <hr>
                       <thead>
                                <tr>
                                	<th>상품번호</th>
                                	<th>상품명</th>
                                    <th>상품소개</th>
                                   	<th>재고</th>
                                    <th>가격</th>
                                     <th>상품분류</th>
                                     <th>포장분류</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                <tr>
                                	<td>${ItemInfo.item_idx }</td>
                                	<td>${ItemInfo.item_name }</td>
                                    <td>${ItemInfo.item_info }</td>
                                    <td>${ItemInfo.item_stock }</td>
                                    <td>${ItemInfo.item_price }</td>
                                    <td>${ItemInfo.item_category }</td>
                                    <td>${ItemInfo.item_packing }</td>
                                    <td>${ItemInfo.item_date}</td>
                                 </tr> 

                    </tbody>
                    </table>
                    </form>
					</div>
					</div>       
                                	

                                	
 				
           <table class="item_image"id="itemImage">
         		<div class="ps-form__submit text-center">

                            
                         <a href= "product_modify?item_idx=${ItemInfo.item_idx}"> <button class="ps-btn success"type="submit">상품수정</button></a>
                         <button class="ps-btn success"type="submit"onclick="product_delete(${ItemInfo.item_idx })">삭제</button>
                          <button class="ps-btn ps-btn--gray mr-3"onclick="history.back()">취소</button>


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