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
    <title>관리자 페이지 - 베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
<!-- 차트 API -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   
</head>
<body>

	<!-- 세션 아이디가 null 일 경우 메인페이지로 돌려보내기 -->
	<c:if test="${sessionScope.sId eq null or sessionScope.sId ne'admin'}">
		<script>
			alert("잘못된 접근입니다!");
			location.href = "./";
		</script>
	</c:if>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="/Code_Green/resources/img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
<!-- top.jsp -->
    
    <jsp:include page="../inc/ad_menu.jsp"></jsp:include>
    

        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>매출현황</h3>
                    <p>Sales Status</p>
                </div>
                <div class="header__center">

                </div>
                <div class="header__right"><a class="header__site-link" href="main"><span>메인페이지로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard">
                <div class="ps-section__left">
                    <div class="row">
                        <div class="col-md-11">
                        <canvas id="myChart" width="800" height="400"></canvas>
                        </div>
                    </div>
                    <div class="ps-card">
                        <div class="ps-card__header">
                        <br>
                            <h4>브랜드별 매출 순위</h4>
                        </div>
                        <div class="ps-card__content">
                            <div class="table-responsive">
                                <table class="table ps-table">
                                    <thead>
                                        <tr>
<!--                                             <th>Top</th> -->
                                            <th>브랜드명</th>
                                            <th>매출</th>
                                            <th>팔로워</th>
                                            <th>주문건수</th>
                                            <th>판매수량</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="top" items="${topSale }">
                                        <tr>
<%--                                             <td>${top.ranking }위</td> --%>
                                            <td><strong>${top.manager_brandname }</strong></td>
                                            <td><a href="order-detail.html"><strong><fmt:formatNumber value="${top.brandtotal }" pattern="#,###원"/></strong></a></td>
                                            <td><span class="ps-badge success">${top.brand_follower }명</span>
                                            </td>
                                            <td><span>${top.orderCount }건</span>
                                            </td>
                                            <td><strong>${top.sellCount }건</strong></td>
                                            <td>

                                            </td>
                                        </tr>
                                        </c:forEach>
                                        
                                       
                                        
                                        
<!--   위는 브랜드별 매출 순위   위는 브랜드별 매출 순위    위는 브랜드별 매출 순위  위는 브랜드별 매출 순위 -->
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ps-card__footer"><a class="ps-card__morelink" href="ad_more_Ranking">순위 더 알아보기<i class="icon icon-chevron-right"></i></a></div>
                    </div>
                </div>
                <div class="ps-section__right">
                    <section class="ps-card ps-card--statics">
                        <div class="ps-card__header">
                            <h4>Total</h4>
                            <div class="ps-card__sortby">

                            </div>
                        </div>
                        <div class="ps-card__content">
                            <div class="ps-block--stat yellow">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>총매출</p>
                                    <h4><fmt:formatNumber value="${sellTotal.total }" pattern="#,###원" /><small class="asc"></small></h4>
                                </div>
                            </div>
                            <div class="ps-block--stat green">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>순수익</p>
                                    <h4><fmt:formatNumber value="${sellTotal.net }" pattern="#,###원" /><small class="desc"></small></h4>
                                </div>
                            </div>
                            <div class="ps-block--stat pink">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>총주문수</p>
                                    <h4>${sellCount }<small class="asc"></small></h4>
                                </div>
                            </div>
                            <div class="ps-block--stat green">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>환불/취소 건</p>
                                    <h4>${cancelSell }<small class="desc"></small></h4>
                                </div>
                            </div>
                        </div>
                    </section>

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
    <script src="/Code_Green/resources/js/chart.js"></script>
    <!-- custom code-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
    
<!-- 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API -->
<!-- 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API -->
<!-- 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API 차트API -->
    
    <script type="text/javascript">
// 차트를 그럴 영역을 dom요소로 가져온다.

$(document).ready(function(){
	getGraph();
	
});

function getGraph(){
	
	var brandtotal = new Array();
	var brandname = new Array();
	
	$.ajax({
		url:"drawChart",
		type:"GET",
		dataType:"json",
		success:function(data){
			
			
// 			let str = JSON.stringify(data);
// 			let parse = JSON.parse(str)
// 			console.log(str);
// 			alert(str);
			
			
			for(let dt of data){
				brandtotal.push(dt.brandtotal);
				brandname.push(dt.manager_brandname);
				
			}
			

			
			new Chart(document.getElementById('myChart'), {
			    type: 'bar',
			    data: {
			        labels: brandname,
			        datasets: [{
			            label: '# 브랜드별 차트',
			            data: brandtotal,
			            backgroundColor: 'rgba(209, 978, 13, 0.2)',
			            borderColor: 'rgba(205, 150, 13, 1)',
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            y: {
			                beginAtZero: true
			            }
			        }
			    }
			});
				
		}
		
		});//ajax
			
	}//getGraph


</script>
</body>

</html>