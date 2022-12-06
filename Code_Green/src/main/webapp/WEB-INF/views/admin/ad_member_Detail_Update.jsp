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
    <title>화원정보수정 - 베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
    
    
    
    <style>


    .input-form {
      max-width: 680px;

      margin-top: 10px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>

<script type="text/javascript">
	function back() {
		// confirm() 함수를 사용하여 "삭제하시겠습니까?" 메세지로 확인받아 result 변수에 저장 후
		// result 변수값이 true 일 경우 MemberDelete.me 서블릿 주소 요청(파라미터로 id 전달)
		history.back();
	}
</script>    
</head>
<body>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="/Code_Green/resources/img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
	<jsp:include page="../inc/ad_menu.jsp"></jsp:include>
	
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>회원 관리</h3>
                    <p>Membership Management</p>
                </div>
                <div class="header__center">
                </div>
                <div class="header__right"><a class="header__site-link" href="ad_member_Manage"><span>목록으로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
  
                <div class="ps-section__content">
                    <div class="table-responsive">
                        <table class="table ps-table">

         
                           
<!--  회원상세정보 조회		회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회-->                           
<!--  회원상세정보 조회		회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회-->
                               
			    <div class="container">
			    <div class="input-form-backgroud row">
			      <div class="input-form col-md-12 mx-auto">
			        <h4 class="mb-3">상세정보수정</h4>
			        <form class="validation-form" novalidate action="ad_member_Detail_UpdatePro" method="post">
			        
			          
			<!-- 이름 -->
			         <div class="mb-3">
			            <label for="email">이름</label>
			            <input type="text" class="form-control" id="name" name="newName" value="${member.member_name }">
			          </div> 
			        
			<!-- 아디,비번 -->
			          <div class="row">
			          
			          <div class="col-md-6 mb-3">
			              <label for="name">아이디</label>
			              <input type="text" class="form-control" id="id" name="id" value="${member.member_id }" readonly="readonly">
			            </div>
			            
			            <div class="col-md-6 mb-3">
			              <label for="name">비밀번호</label>
			              <input type="text" class="form-control" id="passwd" placeholder="접근이 불가합니다" readonly="readonly">
			            </div>
			            
			            
			          
			            <div class="col-md-6 mb-3">
			              <label for="name">전화번호</label>
			              <input type="tel" class="form-control" id="name" value="${member.member_phone }" readonly="readonly">
			            </div>
			            <div class="col-md-6 mb-3">
			              <label for="nickname">이메일</label>
			              <input type="text" class="form-control" id="nickname" value="${member.member_email }" readonly="readonly">
			            </div>
			          </div>
			
			          <div class="mb-3">
			            <label for="address">주소</label>
			            <input type="text" class="form-control" id="address" value="${member.member_postcode }" readonly="readonly">
			          </div>
			
<!-- 			      		 <button class="btn btn-primary btn-lg btn-block" type="button">주소 검색(이건 수정시에 근데 이것도 수정하남?)</button> -->
<!-- 						<div><input type="button" class="btn btn-primary btn-lg btn-block" value="와랄라" ></div> -->
						
						
			          <div class="mb-3">
			            <label for="address2">상세주소<span class="text-muted">&nbsp;</span></label>
			            <input type="text" class="form-control" id="address2" value="${member.member_address }" readonly="readonly">
			          </div>
			
			          
			          <hr class="mb-4">
			          
			          <div class="mb-4"></div>
			          <button class="btn btn-primary btn-lg btn-block" type="submit">등록</button>
			        </form>
			      </div>
			    </div>
			    <footer class="my-3 text-center text-small">
			      <p class="mb-1">&copy; 2021 YD</p>
			    </footer>
			  </div>
			  
<!--  회원상세정보 조회		회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회-->
<!--  회원상세정보 조회		회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회	회원상세정보 조회-->
  
                                  
                                   
<!--                             </tbody> -->
                        </table>
                    </div>
                </div>
<!--                 <div class="ps-section__footer"> -->
<!--                     <p>Show 10 in 30 items.</p> -->
<!--                     <ul class="pagination"> -->
<!--                         <li><a href="#"><i class="icon icon-chevron-left"></i></a></li> -->
<!--                         <li class="active"><a href="#">1</a></li> -->
<!--                         <li><a href="#">2</a></li> -->
<!--                         <li><a href="#">3</a></li> -->
<!--                         <li><a href="#"><i class="icon-chevron-right"></i></a></li> -->
<!--                     </ul> -->
<!--                 </div> -->
            </section>
        </div>
    </main>
    
    <script src="/Code_Green/resources/plugins_admin/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <!-- custom code-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>