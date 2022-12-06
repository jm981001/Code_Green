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
    <title>브랜드관리자페이지-베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
<!-- 차트 API -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   

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
                    <h3>매출현황</h3>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard">
                <div class="ps-section__left">
                    <div class="row">
                        <div class="col-md-11">
                        
                        
                        <canvas id="myChart" width="800" height="400"></canvas>
                        

                        </div>
                        
<!-- 도넛차트 도넛차트 도넛차트 도넛차트 도넛차트 도넛차트-->
               <br>
                    </div>
                    <div class="ps-card">
                        <div class="ps-card__header">
                        <br>
                            <h4><a class="header__site-link" href="sales_main?manager_id=${sessionScope.sId }">베스트상품</a></h4>
                        </div>
                        <div class="ps-card__content">
                            <div class="table-responsive">
                                <table class="table ps-table">
                                    <thead>
                                        <tr>
                                            <th>Top</th>
                                            <th>상품명</th>
                                            <th>후기</th>
                                            <th>좋아요</th>
                                            <th>평점</th>
                                            <th>판매수량</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="top" items="${top3 }">
                                        <tr>
                                            <td>${top.ranking }위</td>
                                            <td><strong>${top.item_name}</strong></td>
                                            <td><a href=""><strong>${top.review}개</strong></a></td>
                                            <td><span><strong>${top.heart}개</strong></span></td>
                                            <td><strong>${top.board_star_score}점</strong></td>
                                            <td><span><strong>${top.count}개</strong></span></td>
                                        </tr>
                                        </c:forEach>
                                        
                                       
                                        
                                        
<!--   위는 브랜드별 매출 순위   위는 브랜드별 매출 순위    위는 브랜드별 매출 순위  위는 브랜드별 매출 순위 -->
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
               <div class="ps-section__right">
                    <section class="ps-card ps-card--statics">
                       <div class="ps-card__content">
                           <div class="ps-block--stat yellow">
                                <div class="ps-block__left"><span><i class="icon-percent-circle"></i></span></div>
                                <div class="ps-block__content">
                                    <p>총매출</p>
                                    <h4><fmt:formatNumber value="${orderTotal.brandtotal }" pattern="#,###" /><small class="asc"><span></span></small></h4>

                                </div>
                            </div>
                            <div class="ps-block--stat pink">
                                <div class="ps-block__left"><span><i class="icon-cart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>총주문수</p>
                                     <h4>${orderTotal.orderCount }<small class="asc"></small></h4>
                                </div>
                            </div>
                            <div class="ps-block--stat green">
                                <div class="ps-block__left"><span><i class="icon-heart"></i></span></div>
                                <div class="ps-block__content">
                                    <p>팔로우 수 </p>
                                    <h4>${follow }<small class="desc"><span></span></small></h4>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
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
    <script src="/Code_Green/resources/js/chart.js"></script>
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
       
       var dayTotal = new Array();
       var days = new Array();
       
       $.ajax({
          url:"brandChart?manager_id=${sessionScope.sId }",
          type:"GET",
          dataType:"json",
          success:function(data){
             
             
//              let str = JSON.stringify(data);
//              let parse = JSON.parse(str)
//              console.log(str);
//              alert(str);
             
             
             for(let dt of data){
                dayTotal.push(dt.dayTotal);
                days.push(dt.days);
                
             }
             
             
             new Chart(document.getElementById('myChart'), {
                 // ①차트의 종류(String)
                 type: 'line',
                 // ②차트의 데이터(Object)
                 data: {
                     // ③x축에 들어갈 이름들(Array)
                     labels: days,
                     // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                     datasets: [{
                         // ⑤dataset의 이름(String)
                         label: '# 일주일 차트',
                         // ⑥dataset값(Array)
                         data: dayTotal,
                         // ⑦dataset의 배경색(rgba값을 String으로 표현)
//                          backgroundColor: 'rgba(255, 99, 132, 0.2)',
                         backgroundColor: 'rgba(202, 161, 211, 0.2)',
                         // ⑧dataset의 선 색(rgba값을 String으로 표현)
//                          borderColor: 'rgba(255, 99, 132, 1)',
                         borderColor: 'rgba(202, 161, 211, 1)',
                         
                         // ⑨dataset의 선 두께(Number)
                         borderWidth: 1
                     }]
                 },
                 // ⑩차트의 설정(Object)
                 options: {
                     // ⑪축에 관한 설정(Object)
                     scales: {
                         // ⑫y축에 대한 설정(Object)
                         y: {
                             // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
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