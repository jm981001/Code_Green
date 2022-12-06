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
		var packing = '${products.item_packing}';
        var category = '${products.item_category}'; 
        var status = '${products.item_status}'; 
        
		$("#packing").val(packing).prop("selected", true);
		$("#category").val(category).prop("selected", true);	
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
                <form action="product_modifyPro.bo?item_idx=${products.item_idx}" method="post"enctype="multipart/form-data" id="sub_form">
                	<input type="hidden" name="file1" value="${products.file1}">  
	                <input type="hidden" name="file2" value="${products.file2}">  
                    <div class="ps-form__content">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                <figure class="ps-block--form-box">
                                    <figcaption>기본정보</figcaption>

                                        <div class="form-group">
                                            <label>상품명<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" id="item_name" name="item_name"value="${products.item_name}" />
                                        </div>
                                        <div class="form-group">
                                            <label>정상가격<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" id="item_price" name="item_price"value="${products.item_price}" />
                                        </div>
									
 										<div class="form-group">
                                            <label>할인가격<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text" id="item_sale" name="item_sale"value="${products.item_sale}"value="0" />
                                        </div>                                             
                                        <div class="form-group">
                                            <label>포장상태<sup>*</sup>
                                            </label>
                                           
                                   <div class="form-group">
                                    <select id="packing" name="item_packing" class="ps-select" >
                                        <option value="포장상태">포장상태</option>
                                        <option value="냉장">냉장</option>
                                        <option value="냉동">냉동</option>
                                        <option value="실온">실온</option>
                                    </select>
                                </div>
                                 </div>
<!--                                  </div> -->
                                         <div class="form-group">
                                            <label>상품카테고리<sup>*</sup>
                                            </label>
                                            
                                     <div class="form-group">
                                    <select id="category" name="item_category" class="ps-select" >
                                        <option value="상품카테고리">상품카테고리</option>
                                        <option value="특가상품">특가상품</option>
                                        <option value="과일/채소">과일/채소</option>
                                        <option value="유제품/음료">유제품/음료</option>
                                        <option value="냉동/간편 식품">냉동/간편 식품</option>
                                        <option value="해산물">해산물</option>
                                        <option value="간식류">간식류</option>
                                    </select>
                                </div>
                                </div>
   
                                </figure>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                <figure class="ps-block--form-box">
                                    <figcaption>상품 이미지</figcaption>
                                    <div class="ps-block__content">
                                        <div class="form-group">
                                         <div class="form-group--nest">
                                             <label>상품 썸네일<sup>*</sup></label>
                                          </div>  
	                                         <td colspan="2"><input type="file" id="파일선택1" name="file_1">기존파일 : ${products.file1 }</td>
                                         <div class="form-group--nest">
                                          <label>상품 상세이미지<sup>*</sup></label>
                                          </div>
                                            <td colspan="2"><input type="file" id="파일선택2" name="file_2">기존파일 : ${products.file2 }</td>
                                        </div>
                                        <div class="form-group">
                                            <label>상품 설명<sup>*</sup></label>
                                            <input class="form-control" type="text"name="item_info" value="${products.item_info }" />
                                        </div>
                                    </div>
                                </figure>
                                <figure class="ps-block--form-box">
                                    <figcaption>재고</figcaption>
                                    <div class="ps-block__content">
                                      
                                        <div class="form-group form-group--select">
                                            <label>재고상태
                                            </label>
                                            <div class="form-group__content">
                                            
                                                <select id="status" name="item_status" class="ps-select" >
                                                    <option value="재고상태">재고상태</option>
                                                    <option value="재입고">재입고</option>
                                                    <option value="품절">품절</option>
                                                    <option value="판매중">판매중</option>
                                                </select>
                                            </div>
                                        </div>
                                            <div class="form-group">
                                            <label>재고수량<sup>*</sup>
                                            </label>
                                            <input class="form-control" type="text"name="item_stock" value="${products.item_stock }"/>
                                        </div>
                                    </div>
                                </figure>
                               
                            </div>
                        </div>
                    </div>
                   <div class="ps-form__submit text-center	">
                    <button class="ps-btn"type="submit"value="수정">상품수정</button>

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
    
