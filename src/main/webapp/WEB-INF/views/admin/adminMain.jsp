<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js" crossorigin="anonymous"></script>
<!--알림창-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<!-- kakaoMap -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef0f2eae29928e7e7027600e1cf8f7d&libraries=services"></script>
<!-- chartjs -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<style>
* {
   box-sizing: border-box;
   font-family: 'OTWelcomeRA';
}

.container{
   max-width: -webkit-fill-available;
}

/* 눈누 폰트 */
@font-face {
   font-family: 'BMJUA';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

@font-face {
   font-family: 'OTWelcomeRA';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

/*사이드바*/
.sidebar {
   float: left;
   width: 15%;
   height: 960px;
   background-color: #4e78f5;
}

.sidebar span {
   font-family: 'BMJUA';
}

.sidebar li {
   list-style: none;
   border-bottom: 3px solid rgba(255, 255, 255, 0.63);
   text-align: center;
}

.sidebar a:hover {
   color: white;
}

.logoHome {
   height: 100px;
}

.logoHome span {
   color: white;
   font-size: x-large;
   font-weight: 80px;
}

#logoImg {
   width: 80px;
}

i {
   margin-top: 15px;
   margin-bottom: 15px;
}

a {
   text-decoration: none;
   font-size: larger;
   color: rgba(255, 255, 255, 0.683);
}

/*네비바*/
.navbar {
   float: right;
   height: 104px;
   width: 85%;
   background-color: #fff/* #e1e7f7; */;
   position: relative;
}

.user {
   border-radius: 50%;
   width: 50px;
   height: 50px;
   position: absolute;
   right: 20px;
   background-color: white;
   border: 1px solid gainsboro;
}

.userName {
   position: absolute;
   right: 80px;
}

#user_img {
   border-radius: 50%;
   width: 50px;
   height: 50px;
}

.logOut {
   position: absolute;
   right: 19px;
   top: 28px;
   border-radius: 50%;
   width: 50px;
   height: 50px;
   background-color: gray;
   display: none;
}

.logout {
   position: absolute;
   top: -7px;
   right: 8px;
   font-size: xx-large;
   color: white;
}

/*content*/
.contents {
   background-color: rgb(224, 230, 243);
   width: 100%;
   height: 100%;
}


.chart-container {
  width: 100%;
  height: 400px;
  margin: 0 auto;
}



/*카카오 맵*/
.customoverlay {position:relative;bottom:50px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#111;text-align:center;border-radius:6px;font-size:14px;font-weight:500;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:500;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:18px;height:10px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

</style>
</head>
<body>
   <div class="container">
      <div class="sidebar">
         <ul class="p-2">
            <li class="logoHome"><a href="/admin/toAdmin"> <img
                  src="/resources/images/adminLogo.png" id="logoImg"><br>
                  <span>끼리끼리</span>
            </a></li>
            <li class="sidemenu"><a href="/admin/toMember?curPage=1"> <i
                  class="fa-solid fa-users-rectangle"></i><br> <span>회원
                     관리</span>
            </a></li>
            <li class="sidemenu"><a href="#"> <i
                  class="fa-solid fa-table"></i><br> <span>게시물 관리</span>
            </a></li>
            <li class="sidemenu"><a href="/admin/toGroupAdmin?curPage=1"> <i
                  class="fa-solid fa-house-user"></i><br> <span>모임 관리</span>
            </a></li>
         </ul>
      </div>
      <div class="navbar">
         <div class="userName">| &nbsp&nbsp admin</div>
         <div class="user">
            <img src="/resources/images/해삐루피.png" id="user_img">
         </div>
         <div class="logOut">
            <i class="logout fa-solid fa-arrow-right-from-bracket"></i>
         </div>
      </div>
      <div class="contents" style="background-color : #f6f7f9;">
         <!-- 카드 -->
         <div class="row mt-2">
           <!-- Earnings (Monthly) Card Example -->
           <div class="col-xl-3 col-md-3 mb-4">
               <div class="card border-left-primary shadow h-100 py-2">
                   <div class="card-body">
                       <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                               <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                   맴버수</div>
                               <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                           </div>
                           <div class="col-auto">
                             <i class="fa-solid fa-user-group fa-2x"></i>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
           <!-- Earnings (Annual) Card Example -->
           <div class="col-xl-3 col-md-3 mb-4">
               <div class="card border-left-success shadow h-100 py-2">
                   <div class="card-body">
                       <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                               <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                   모임수</div>
                               <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                           </div>
                           <div class="col-auto">
                               <i class="fas fa-dollar-sign fa-2x"></i>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
           <!-- Earnings (Annual) Card Example -->
           <div class="col-xl-3 col-md-3 mb-4">
             <div class="card border-left-success shadow h-100 py-2">
                 <div class="card-body">
                     <div class="row no-gutters align-items-center">
                         <div class="col mr-2">
                             <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                 게시글 수</div>
                             <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                         </div>
                         <div class="col-auto">
                             <i class="fa-solid fa-people-roof fa-2x"></i>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
           <!-- Pending Requests Card Example -->
           <div class="col-xl-3 col-md-3 mb-4">
               <div class="card border-left-warning shadow h-100 py-2">
                   <div class="card-body">
                       <div class="row no-gutters align-items-center">
                           <div class="col mr-2">
                               <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                   Pending Requests</div>
                               <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                           </div>
                           <div class="col-auto">
                               <i class="fas fa-comments fa-2x text-gray-300"></i>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
         </div>
         
         <!-- 라인 그래프 -->
         <div class="row">
            <div class="col-sm-12 col-md-7 mt-1">
               <div class="chart-container">
                    <canvas id="line-chartcanvas"></canvas>
                  </div>
            </div>
            <div class="col-sm-12 col-md-5 mt-1"></div>
         </div>
         
         <!-- 카카오맵 -->
         <div class="row mt-3">
            <div class="col-sm-12 col-md-7" style="background-color : #fff;">
               <div id="map" style="width:100%; height:400px;"></div>
            </div>
            <div class="col-sm-12 col-md-5" style="background-color : #fff;">
               <div style="position: relative; width:100%; height:400px;" class="d-flex justify-content-center">
                    <canvas id="myChart"></canvas>
               </div>
            </div>
         </div>
         

      </div>
   </div>
   <script>
   

       //로그아웃 부분
        $(".user").mouseenter(function () {
            $(".logOut").css({ "display": "block", "z-index": "99" });
        })
        $(".user").mouseleave(function () {
            $(".logOut").css("display", "none");
        })
        $(".logOut").click(function () {
            Swal.fire({
                title: '정말 로그아웃 하시겠습니까?',
                showConfirmButton: false,
                showDenyButton: true,
                showCancelButton: true,
                denyButtonText: `로그아웃`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isDenied) {
                    Swal.fire('로그아웃 성공', '', 'info')
                }
            })
        })
        
        $(document).ready(function() {
            // 카카오맵 
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
              mapOption = { 
               center: new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
               level: 13 // 지도의 확대 레벨
              };
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 마커 이미지 생성
            var imageSrc = '/resources/images/mapElephant.png'; // 마커이미지 주소
            imageSize = new kakao.maps.Size(34, 36);  // 마커이미지의 크기
            imageOption = {offset: new kakao.maps.Point(17, 36)}; // 마커의 좌표와 일치시킬 이미지 안에서의 좌표설정
            
            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
            
            var markerTmp;      // 마커
            var customOverlay;  // 오버레이
            var contentStr; // 마커 텍스트
            
            for(let i = 0; i < ${jsonLocationList}.length; i++) {
               markerTmp = new daum.maps.Marker({
                     position: new daum.maps.LatLng(${jsonLocationList}[i].gcal_latitude,${jsonLocationList}[i].gcal_longitude),
                     image: markerImage,
                     map:map
                });
               
               contentStr = "<div class='customoverlay'><a target='_blank'><span class='title'>"+ ${jsonLocationList}[i].group_title +"</span></a></div>";
                
                 customOverlay = new kakao.maps.CustomOverlay({
                     map: map,
                     position: new daum.maps.LatLng(${jsonLocationList}[i].gcal_latitude,${jsonLocationList}[i].gcal_longitude),
                     content: contentStr,
                     yAnchor: 1 
                 });
            }
            
              // 지도 타입 변경 컨트롤을 생성한다
             var mapTypeControl = new kakao.maps.MapTypeControl();
             // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
             map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);    
             // 지도에 확대 축소 컨트롤을 생성한다
             var zoomControl = new kakao.maps.ZoomControl();
             // 지도의 우측에 확대 축소 컨트롤을 추가한다
             map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
             
             // 라인 그래프(로그인 방식)
             makeLine();
             // 도넛 그래프(모임 일정 수)
             makeCircle();
             
  
        });
        
       // charjs(Line 차트)
        const makeLine = function() {
          var ctx = $("#line-chartcanvas");

        var data = {
          labels: ["07/25", "07/26", "07/27", "07/28", "07/29"],
          datasets: [
            {
              label: "네이버 로그인",
              data: [10, 50, 25, 70, 40],
              backgroundColor: "#18ce60",
              borderColor: "#18ce60",
              fill: false,
              lineTension: 0,
              radius: 5
            },
            {
              label: "카카오 로그인",
              data: [20, 35, 40, 60, 50],
              backgroundColor: "#f7d501",
              borderColor: "#f7d501",
              fill: false,
              lineTension: 0,
              radius: 5
            },
            {
              label: "끼리끼리 로그인",
              data: [30, 50, 30, 20, 80],
              backgroundColor: "#4e78f5",
              borderColor: "#4e78f5",
              fill: false,
              lineTension: 0,
              radius: 5
            }
          ]
        };

        //options
        var options = {
          responsive: true,
          title: {
            display: true,
            position: "top",
            text: "Line Graph",
            fontSize: 18,
            fontColor: "#111"
          },
          legend: {
            display: true,
            position: "bottom",
            labels: {
              fontColor: "#333",
              fontSize: 16
            }
          }
        };

        //create Chart class object
        var chart = new Chart(ctx, {
            type: "line",
            data: data,
            options: options
          });
        }
       
         // chartjs(도넛 차트)
       const makeCircle = function() {
 
           // 그룹 리스트 
              let groupTitleList = new Array(); // 빈 배열 생성
              <c:forEach items="${cntGroupCalList}" var="dto">
                 groupTitleList.push("${dto.group_title}");
              </c:forEach>
            
             // 해당 그룹의 일정 수 
             let groupCalCnt = new Array(); // 빈 배열 생성
              <c:forEach items="${cntGroupCalList}" var="dto">
                 groupCalCnt.push("${dto.group_cal_cnt}");
              </c:forEach>
         
           // 랜덤 색상
              let randomColList = new Array();
                for(let i = 0; i < groupTitleList.length; i++) {
                  let randomColor = "#" + Math.floor(Math.random() * 16777215).toString(16);
                  randomColList.push(randomColor);
                }

                var ctx = $('#myChart');
                var myChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: groupTitleList,
                        datasets: [{
                            data: groupCalCnt,
                            backgroundColor: randomColList,  //차트컬러
                            hoverBorderColor: "rgba(234, 236, 244, 1)",
                        }],
                    },
                    options: {
                        maintainAspectRatio: false,
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            borderColor: '#dddfeb',
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            caretPadding: 10,
                        },
                        legend: {
                            display: false
                        },
                        cutoutPercentage: 80,
                    },
                });
                
       }
       
       
       
       
       
       
       
        
    </script>
</body>

</html>