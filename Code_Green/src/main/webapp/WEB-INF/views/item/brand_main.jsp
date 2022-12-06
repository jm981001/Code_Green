<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
	<title>브랜드별 - 베지터틀</title>
	<script src="/Code_Green/resources/plugins/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/autopart.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/vendor.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<style>
	.heart_icon_brand_m {
		width: 25px;
	    height: 25px;
	    position: absolute;
	    top: 19px;
	    left: 233px;
	}

	#heart_icon_brand_b {
		width: 25px;
	    height: 25px;
	    position: absolute;
	    top: 19px;
	    left: 233px;
	}

	.brandlist-ul {
		display: grid;
	    grid-template-columns: repeat(4, 180px);
	    gap: 20px 130px;
	    overflow: hidden;
	    margin-bottom: 40px;
	    padding: 30px 40px;
	    border: 1px solid rgb(226, 226, 226);
	    line-height: 20px;
	    justify-items: center;
	}
	
	.brandlist-li {
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	
	#brandlist-header {
		height: 30px;
		margin-top: 30px;
		margin-bottom: 50px;
	    font-weight: 500;
	    font-size: 28px;
	    color: rgb(51, 51, 51);
	    line-height: 35px;
	    letter-spacing: -1px;
	    display: center;
	    border: none;
	    padding-left: 40%;
	    background-color: transparent;
	}
	
	.ps-block__user-avatar img {
		border-radius: 100%;
	}
	
	.ps-section__left .brand_info {
		margin: 40px 0px 40px 0px;
	}
	
	.append_here{
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    justify-content: space-around;
	    padding-bottom: 10px;
	
	}
	
	.ps-product .ps-product__rating span{
		font-size: 80%;
		margin-left: 0px;
	}
	
	#followInfo {
		text-align: center;
		margin-top: 20px;
		margin-bottom: 15px;
	}
</style>
<script>
	let pageNum = 1;
	let checkArray = "";
	let ordering = "";
	
	// 입점브랜드 목록 토글버튼 
	function togglefun(text){
		var target = document.querySelector('#listlist');
		if(this.value==='입점브랜드 ▲'){
			target.style.display = 'none';
			this.value = '입점브랜드 ▼';
		} else {
			target.style.display = 'block';
			this.value = '입점브랜드 ▲';
		}
	}
	
	
	function twoWay(ordering){
		if(checkArray==''||checkArray==null){
			goWholeList(ordering);
		}else {
			getList(ordering);
		}
	}
	
	
	$(function(){
		goWholeList(ordering);
		
		// 브랜드이름 체크박스 이벤트
		$('input[type=checkbox]').click(function() {
			if($(this).is(":checked")){
				checkArray += $(this).attr('id')+"/";
			} else {
				checkArray = checkArray.replace($(this).attr('id')+"/", '');
			}
			
			getList();
			console.log(checkArray);
		});
	});
	
	// 멀티체크나 정렬카테고리 들고 갈 함수
	function getList(ordering){
			console.log("getList()정렬: " + ordering); 
			console.log("getList()checkArray : " + checkArray);
			$.ajax({
				url:"ListListing.br",
				type:"get",
				data:{ 
					brandsIndex: checkArray,
					ordering: ordering
				},
				success:function(data){
					$(".append_here").html(data);  
				}
			})
		}
	
	
	// 브랜드별 전체브랜드 아이템 출력 
	function goWholeList(ordering){
		ordering = ordering;
		$.ajax({
			url:"GetWholeItemList.br",
			type:"get",
			data:{ 
				ordering : ordering
			},
			success:function(data){
				$(".append_here").html(data);
			}
		});
		
	}

	// 브랜드별 개별브랜드 아이템 출력 
	function goBrandList(manager_idx,ordering){
		$.ajax({
			url:"GetBrandItemList.br?manager_idx=" + manager_idx,
			type:"get",
			data: {
				ordering : ordering
			},
			success:function(data){
				$(".ps-section__wrapper").html(data);
			}
		});
	};

	// 팔로우 버튼 클릭시 회원비회원 구분 & 브랜드 구분
	function followCheck(manager_idx){
		console.log("팔로우버튼클릭 브랜드번호 : " + manager_idx);
		
		if(${sessionScope.sId == null}){
			alert("로그인 후 사용가능합니다!");
			
		}else if(manager_idx == '0'){
			alert("원하는 브랜드를 상단박스에서 선택해주세요!");
			
		}else {
			$.ajax({
				url:"followBrandCheck.me",
				type:"post",
				data:{
					manager_idx : manager_idx,
					member_idx : '${sessionScope.sIdx}'
				},
				success: function(result){
					if(result>1){
						$("#heart_icon_brand_b img").prop("src", "/Code_Green/resources/img/forzero/eheart.png");
						$("#fStatus").html("Follow");
						alert("팔로우가 취소되었습니다.");
						goBrandList(manager_idx);
					} else {
						console.log($("#fStatus").val());
						$("#heart_icon_brand_b img").prop("src", "/Code_Green/resources/img/forzero/fheart.png");
						$("#fStatus").html("Unfollow");
						alert("팔로우했습니다!");
						goBrandList(manager_idx);			
					}
				}
			})
		}
	};
	

	
// ================================= 찜하니/장바구니 기능 ===================================
	function addHeart(item_idx) {
		if(${not empty sessionScope.sCode || empty sessionScope.sIdx}){
			alert("관리자는 사용할 수 없는 기능입니다 :)");
		} else {
		   member_idx = '${sessionScope.sIdx}';
		   let manager_brandname = $("#manager_brandname_"+item_idx).val();
		   let item_category = $("#item_category_"+item_idx).val();
		   $.ajax({
		      type : 'get',
		      url : 'addHeart',
		      data: {
		         'item_idx'       : item_idx,
		         'member_idx'      : member_idx,
		         'member_id'      : '${sessionScope.sId}',
		         'manager_brandname'   : manager_brandname,
		         'item_category' :item_category
		      },
		      success : function (data) {
		         alert(data)
		      }
		   });
		}
	}
		
	  function addCart(item_idx) {
		  if(${not empty sessionScope.sCode || empty sessionScope.sIdx}){
			  alert("관리자는 사용할 수 없는 기능입니다 :)");
			} else {
			  member_idx = '${sessionScope.sIdx}';
		      let cart_total = $("#cart_total_"+item_idx).val();
		      let item_name = $("#item_name_"+item_idx).val();
		      let manager_brandname = $("#manager_brandname_"+item_idx).val();
		      let file1 = $("#file1_"+item_idx).val();
		      
		      $.ajax({
		         type : 'get',
		         url : 'addCart',
		         data: {
		            'rf_item_idx'       : item_idx,
		            'rf_member_idx'      : member_idx,
		            'cart_amount'      : 1,
		            'cart_total'      : cart_total,
		            'item_name'         : item_name,
		            'manager_brandname'   : manager_brandname,
		            'file1'            : file1,
		         },
		         success : function (data) {
		            alert('장바구니에 담았습니다.')
		         }
		      });
			}
	   }

</script>
<body>
    
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
    
    <div class="ps-page--single ps-page--vendor">
 <!-- ============================================================ 브랜드리스트 박스공간 시작 ====================================================================== -->         
        <section class="ps-store-list">
            <div class="container">
              <input type="button" id="brandlist-header" value="입점브랜드 목록 ▼" onclick="togglefun(this.value)">
              <div id="listlist">
              	<ul class="brandlist-ul">
             		<li class="brandlist-li">
             			<a href="BrandMain.br"><strong>전체보기</strong></a>
             		</li>
               		<c:forEach var="brand" items="${brandList }">
             		<li class="brandlist-li">
             			<a href="javascript:void(0);" onclick="goBrandList('${brand.manager_idx}')">${brand.manager_brandname }</a>
             		</li>
             		</c:forEach>
              	</ul>
              </div>
<!-- ============================================================ 브랜드리스트 박스공간 끝 ====================================================================== -->         
             <div class="ps-section__wrapper">
             <div class="ps-section__left">
                  <aside class="widget widget--vendor">
                    <h3 class="widget-title" id="brandNameBar">브랜드별 상품</h3>
                      <div class="brandfollowbtn">
                         <a class="ps-block__inquiry" href="javascript:void(0);" onclick="followCheck(0); return false;">Follow</a>
                         <img src="/Code_Green/resources/img/forzero/eheart.png" class="heart_icon_brand_m">
                      </div>
                      <div class="ps-block__user" >
		                 <div class="ps-block__user-avatar">
		                 <!-- 브랜드별 로고띄우기 -->
	                     	<img src="<%=request.getContextPath() %>/resources/img/turtle-icon.png">
		                       <div class="brand_info">
                           		브랜드별 상품을<br>편리하게 둘러보세요!<br><br>
                           		<small>상단의 원하는 브랜드명을 선택하거나,<br>
                           		하단의 원하는 브랜드만 <br>선택하여 보실 수 있습니다:)</small>
		                        </div>
		                   </div>
		              </div>
<!-- =========================================== 브랜드별 리스트 사이드바 시작 ======================================================== -->
					  <aside class="widget widget_shop">
		                <h4 class="widget-title">BY BRANDS</h4>
		                <figure class="ps-custom-scrollbar" data-height="250">
		                  <c:forEach var="brand" items="${brandList }" >
		                  <!-- 브랜드 체크박스 시작 -->
		                    <div class="ps-checkbox">
		                        <input class="form-control" type="checkbox" id="${brand.manager_idx}" name="brandsIndex" value="${brand.manager_idx}"/>
		                        <label for="${brand.manager_idx }">${brand.manager_brandname } 
		                        <c:choose>
		                        	<c:when test="${not empty brand.brand_itemCnt }">
		                        	(${brand.brand_itemCnt })</label>
		                        	</c:when>
		                        	<c:otherwise>(0)</label></c:otherwise>
		                     	</c:choose>
		                    </div>
		                   <!-- 브랜드 체크박스 끝 -->
		                   </c:forEach>
		                </figure>
					</aside>
<!-- =========================================== 브랜드별 리스트 사이드바 끝======================================================== -->	
                 </aside>
             </div>
         	 <div class="ps-section__right">
          	 <!-- 상품리스트 헤더  -->
                <div class="ps-shopping ps-tab-root">
                   <div class="ps-shopping__header">
                      <p><strong> 전체상품 </strong></p>
                       <div id="orderbylist">
                         <a href="javascript:void(0);" onclick="twoWay('recent')">최근순</a>  |  
                         <a href="javascript:void(0);" onclick="twoWay('lowest_price')">낮은가격순</a> | 
                 	   	   <a href="javascript:void(0);" onclick="twoWay('highest_price')">높은가격순</a>
                       </div>
                   </div>
		           <div class="ps-tabs">
		              <div class="ps-tab active" id="tab-1">
		                 <div class="ps-shopping-product">
		                    <div class="row">
	                           <div class="append_here"></div>
	                        </div>
		                 </div>
		              </div>
		           </div>
                 </div>
               </div>
            </div>
         </div>
       </section>
	</div>
    
    
    <!-- 푸터 삽입 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- 푸터 삽입 -->
   
    
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
    <script src="/Code_Green/resources/js/main.js"></script>
</body>
</html>