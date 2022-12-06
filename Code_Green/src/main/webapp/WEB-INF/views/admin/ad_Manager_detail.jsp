<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>기업상세정보조회 - 베지터틀</title>
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
/*     body { */
/*       min-height: 100vh; */

/*       background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); */
/*       background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); */
/*       background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); */
/*       background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); */
/*       background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */
/*     } */

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
    
   
	#btn1{
		display: none;
	}
  </style>
  
<script type="text/javascript">

window.onload = function(){
	let auth = '${manager.manager_adminauth }';

	if(auth === "N") {
		document.getElementById("btn1").style.display = "block";
	}	
}

function confirmAuth(id) {

	let result = confirm("가입을 승인하시겠습니까?");
	
	if(result) {
		location.href="ad_AdminAuth?manager_id=" + id;
	}
	alert("승인이 완료되었습니다");
	history.go(0);
}

function list(auth){

	if(auth == "N") {
		location.href="ad_Manager_auth";
	} else {
		location.href="ad_Manager_manage";
	}
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
                    <h3>기업관리</h3>
                    <p>Business Management</p>
                </div>
                <div class="header__center">
                </div>
                <div class="header__right"><a class="header__site-link" onclick="list('${manager.manager_adminauth }')"><span>목록으로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            
<!--    상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회-->
<!--    상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회 상세정보조회-->
            
            <section class="ps-items-listing">
                
                <div class="ps-section__content">
                    <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                            </thead>
                            <tbody>
                               
			    <div class="container">
			    <div class="input-form-backgroud row">
			      <div class="input-form col-md-12 mx-auto">
			        <h4 class="mb-3">상세정보조회</h4>
			        <form class="validation-form" novalidate >
			        
			        <div class="row">
			          
			          <div class="col-md-6 mb-3">
			              <label for="name">브랜드명</label>
			              <input type="text" class="form-control" id="brandname" name="brandname" value="${manager.manager_brandname }" readonly="readonly">
			            </div>
			            
			            <div class="col-md-6 mb-3">
			              <label for="name">가입승인여부</label>
			              <input type="text" class="form-control" id="auth" value="${manager.manager_adminauth }" readonly="readonly">
			            </div>
			         </div>
			<!--아래 사업자번호 -->
			         <div class="mb-3">
			            <label for="email">사업자 번호</label>
			            <input type="text" class="form-control" id="storecode" value="${manager.manager_storecode }" readonly="readonly">
			          </div>
			<!--아래 기업정보 -->
			         <div class="mb-3">
			            <label for="email">기업정보</label>
			            <input type="text" class="form-control" id="storecode" value="${manager.manager_info }" readonly="readonly">
			          </div>
			<!-- 이름 -->
			         <div class="mb-3">
			            <label for="email">이름</label>
			            <input type="text" class="form-control" id="name" value="${manager.manager_name }" readonly="readonly">
			          </div> 
			<!-- 아디,비번 -->
			          <div class="row">
			          
			          <div class="col-md-6 mb-3">
			              <label for="name">아이디</label>
			              <input type="text" class="form-control" id="id" value="${manager.manager_id }" readonly="readonly">
			            </div>
			            
			            <div class="col-md-6 mb-3">
			              <label for="name">비밀번호</label>
			              <input type="text" class="form-control" id="passwd" placeholder="접근이 불가합니다" readonly="readonly">
			            </div>
		 	<!-- 전화번호,이메일,주소 -->    
			            <div class="col-md-6 mb-3">
			              <label for="name">전화번호</label>
			              <input type="tel" class="form-control" id="phone" value="${manager.manager_phone }" readonly="readonly">
			            </div>
			            <div class="col-md-6 mb-3">
			              <label for="nickname">이메일</label>
			              <input type="text" class="form-control" id="email" value="${manager.manager_email }" readonly="readonly">
			            </div>
			          </div>
			
			          <div class="mb-3">
			            <label for="address">주소</label>
			            <input type="text" class="form-control" id="address" value="${manager.manager_postcode }" readonly="readonly">
			          </div>
						
			          <div class="mb-3">
			            <label for="address2">상세주소<span class="text-muted">&nbsp;</span></label>
			            <input type="text" class="form-control" id="address2" value="${manager.manager_address }" readonly="readonly">
			          </div>
			          
			          <button id="btn1" name="auth" onclick="confirmAuth('${manager.manager_id }')" class="btn btn-primary btn-lg btn-block" type="button" >가입승인하기</button>

			        </form>
			      </div>
			    </div>
			    <footer class="my-3 text-center text-small">
			      <p class="mb-1">&copy; 2021 YD</p>
			    </footer>
			  </div>
			  
			  
			                                  
                                   
                            </tbody>
                        </table>
                    </div>
                </div>

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