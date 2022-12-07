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
<title>내 브랜드 정보수정 -베지터틀</title>
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
                    <h3>내브랜드 정보</h3>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard ps-items-listing">
                <div class="ps-section__left">
                    <section class="ps-card">
                        <div class="ps-card__header">
                            <h4>${brandInfo.manager_id }님의 페이지</h4>
                            <hr>
                            <br>
                          <div class="card" style="width: 25rem;">
						  <img src="/Code_Green/resources/img/brand_logo/${brandInfo.manager_original_file }" alt="${brandInfo.manager_original_file }" />
<%-- 						  <img src="/Code_Green/resources/img/brand_logo/${brandInfo.manager_realfile }" alt="${brandInfo.manager_realfile }" /> --%>
						  <div class="card-body">
						    <p class="card-text">${brandInfo.manager_realfile }</p>
                          </div>
                        </div>
                 </div>
                        <div class="ps-card__content">
                            	<form action="brand_mypage_modifyPro.bo" method="post" name="brand_mypage_modify" enctype="multipart/form-data">
                          		<input type="hidden" name="manager_realfile" value="${brandInfo.manager_realfile }" />
								<input type="hidden" name="manager_original_file" value="${brandInfo.manager_original_file }" />
				               
				                	<input type="file" class="파일선택" name="file">
                                
                                <div class="row">	
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업번호</label>
                                            <input type="text"class="form-control" id="manager_idx"name="manager_idx"value="${brandInfo.manager_idx}"readonly="readonly"/>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>가입날짜</label>
                                            <input type="text"class="form-control" id="manager_date"name="manager_date"value="${brandInfo.manager_date}"readonly="readonly"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>대표이름</label>
                                            <input type="text" class="form-control" id="manager_name" name="manager_name"value="${brandInfo.manager_name}"required="required" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>브랜드이름</label>
                                            <input type="text" class="form-control" id="manager_brandname"name="manager_brandname" value="${brandInfo.manager_brandname}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업아이디</label>
                                            <input type="text" class="form-control" id="manager_id"name="manager_id"value="${brandInfo.manager_id }" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업비밀번호</label>
                                            <input type="text"class="form-control" id="manager_pass" name="manager_pass"value="${brandInfo.manager_pass}"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>사업자번호</label>
                                            <input type="text" class="form-control" id="manager_storecode"name="manager_storecode" value="${brandInfo.manager_storecode}" />
                                        </div>
                                    </div>
                                
                                  <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업 전화번호 </label>
                                             <input type="text"class="form-control" id="manager_phone"name="manager_phone" value="${brandInfo.manager_phone }" />
                                        </div>
                                    </div>
                                
                                  <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>기업이메일</label>
                                            <input type="text"class="form-control" id="manager_email" name="manager_email"value="${brandInfo.manager_email }" />
                                        </div>
                                    </div>
                                     <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>기업 우편번호</label>
                                            <input type="button" onclick="execDaumPostcode()" name="adressBtn" id="adressBtn" value="주소찾기">
                                            <input type="text" class="form-control" id="manager_postcode"name="manager_postcode" value="${brandInfo.manager_postcode }" />
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>기업 주소 </label>
                                            <input type="text"class="form-control" id="manager_address" name="manager_address"value="${brandInfo.manager_address }" />
                                        </div>
                                    </div>
                                       <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>기업 상세정보 </label>
                                            <input type="text"class="form-control" id="manager_info" name="manager_info"value="${brandInfo.manager_info }"/>
                                        </div>
									</div>
								</div>
                                <div class="ps-form__submit text-center	">
                                    <button class="ps-btn success" type="submit"id="submitBtn">수정하기</button>
                                    <button class="ps-btn ps-btn--gray mr-3"onclick="history.back()">취소</button>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
                <div class="ps-section__right"></div>
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
    <!-- custom code-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
    <!-- 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
// $(document).ready(function(){
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            document.getElementById("manager_postcode").value = data.zonecode;
	            document.getElementById("manager_address").value = data.roadAddress;
	        }
	    }).open();
	}
// });	
</script>
	
</body>

</html>