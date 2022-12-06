<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>상품수정페이지-베지터틀</title>
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


	
	function selectedOption(){
// 		debugger;
	
        var status = '${sell_status}'; 
        
		$("#status").val(status).prop("selected", true);
	}
	
	$(document).ready(function (){
		selectedOption();
	});


</script>


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
                    <h3>상품 수정</h3>
                    <p></p>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-new-item">
  		<form class="ps-form--search-bar" action="order_detail?id=${sessionScope.sId}"  method="get"name="detailForm">
                
                    <div class="ps-form__content">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                <figure class="ps-block--form-box">
                                    <figcaption>기본정보</figcaption>

                                        <div class="form-group">
                                            <label>주문번호<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" id="sell_order_number" name="sell_order_number"value="${orderInfo.sell_order_number}" />
                                        </div>
                                        <div class="form-group">
                                            <label>주문상품<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" id="item_name" name="item_name"value="${orderInfo.item_name }" />
                                        </div>
									
 										<div class="form-group">
                                            <label>총금액<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" id="sell_total_price" name="sell_total_price"value="${orderInfo.sell_total_price}"/>
                                        </div>                                             
                                  <div class="form-group">
                                            <label>결제여부<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" id="sell_pay_status" name="sell_pay_status"value="${orderInfo.sell_pay_status}"/>
                                        </div>   
                                          <div class="form-group">
                                            <label>결제일<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" id="sell_pay_date" name="sell_pay_date"value="${orderInfo.sell_pay_date}"/>
                                        </div>   
                       
                                <figure class="ps-block--form-box">
                                    <figcaption>주문</figcaption>
                                    <div class="ps-block__content">
                                      
                                        <div class="form-group form-group--select">
                                            <label>주문상태
                                            </label>
                                            <div class="form-group__content">
                                            
                                                <select id= "status" name="sell_status" class="ps-select"  >
                                                    <option value="재고상태">주문상태</option>
                                                    <option value="주문완료">주문완료</option>
                                                    <option value="배송준비중">배송준비중</option>
                                                    <option value="배송완료">배송완료</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                               
                            </div>
                        </div>
                    </div>
                   <div class="ps-form__submit text-center	">
                    <button class="ps-btn"type="submit"value="수정">주문상태변경</button>

                    </div>
                </form>
            </section>
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
    