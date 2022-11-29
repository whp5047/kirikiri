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
	font-family: 'MICEGothic Bold';
}

body, html {
	height: 1100px;
}

.container {
	max-width: -webkit-fill-available;
	height: 100%;
	padding: 0px;
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
	font-family: 'MICEGothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

/*사이드바*/
.sidebar {
	float: left;
	width: 15%;
	height: 1100px;
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

.logoHome span {
   color: white;
   font-size: x-large;
   font-weight: 80px;
}

#logoImg {
	width: 70%;
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

@media ( max-width : 991px ) {
	.sidebar {
		height: 2100px;
	}
	body {
		height: 2100px;
	}
}

@media ( max-width : 760px ) {
	.sidebar {
		height: 2400px;
	}
	body {
		height: 2400px;
	}
}


/*네비바*/
.navbar {
	float: right;
	height: 104px;
	width: 85%;
	background-color: #fff /* #e1e7f7; */;
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
	width: 90%;
	height: 80%;
	margin: 0 auto;
}

/* 카드 아이콘*/
.col-auto i {
	color: gray;
}

/*카카오 맵*/
.customoverlay {
	position: relative;
	bottom: 50px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #111;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: 500;
	overflow: hidden;
	background: #84c9e8;
	background: #84c9e8
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: 500;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 18px;
	height: 10px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
</style>
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<ul class="p-2">
				<li class="logoHome sidemenu"><a href="/admin/toAdmin"> <img
						src="/resources/images/adminLogo.png" id="logoImg"><br>
						<span>끼리끼리</span>
				</a></li>
				<li class="sidemenu"><a href="/admin/toMember?curPage=1"> <i
						class="fa-solid fa-users-rectangle"></i><br> <span>회원
							관리</span>
				</a></li>
				<li class="sidemenu"><a href="/admin/toBoard?curPage=1"> <i
						class="fa-solid fa-table"></i><br> <span>게시물 관리</span>
				</a></li>
				<li class="sidemenu"><a href="/admin/toGroupAdmin?curPage=1">
						<i class="fa-solid fa-house-user"></i><br> <span>모임 관리</span>
				</a></li>
			</ul>
		</div>

		<!-- 네비바 -->
		<div class="navbar">
			<div class="userName">| &nbsp&nbsp admin</div>
			<div class="user">
				<img src="/resources/images/해삐루피.png" id="user_img">
			</div>
			<div class="logOut">
				<i class="logout fa-solid fa-arrow-right-from-bracket"></i>
			</div>
		</div>

		<!-- 컨텐츠영역 -->
		<div class="contents" style="background-color: #f6f7f9;">
			<!-- 카드 -->
			<div class="row mt-2">
				<div class="col-xl-3 col-md-3 mb-4">
					<div class="card shadow h-100 py-2"
						style="border-left: 4px solid #f8696d;">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-uppercase mb-1"
										style="color: #f8696d;">회원수</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${cntMember}명</div>
								</div>
								<div class="col-auto">
									<i class="fa-solid fa-user-group fa-2x"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-3 mb-4">
					<div class="card border-left-success shadow h-100 py-2"
						style="border-left: 4px solid #fa588a;">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-uppercase mb-1"
										style="color: #fa588a;">모임수</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${cntGroupCnt}개</div>
								</div>
								<div class="col-auto">
									<i class="fa-solid fa-people-roof fa-2x"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-3 mb-4">
					<div class="card border-left-success shadow h-100 py-2"
						style="border-left: 4px solid #a74cf1;">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-uppercase mb-1"
										style="color: #a74cf1;">게시글 수</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${totalBoardCnt}개</div>
								</div>
								<div class="col-auto">
									<i class="fa-solid fa-clipboard fa-2x"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Pending Requests Card Example -->
				<div class="col-xl-3 col-md-3 mb-4">
					<div class="card border-left-warning shadow h-100 py-2"
						style="border-left: 4px solid #7774e7;">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-uppercase mb-1"
										style="color: #7774e7;">일정수</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">${cntGroupCal}개</div>
								</div>
								<div class="col-auto">
									<i class="fa-solid fa-calendar fa-2x"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 차트 -->
			<div class="row">
				<div class="col-lg-7">
					<div class="card shadow mb-4">
						<div class="card-header py-2 d-flex align-items-center">
							<h6 class="m-0 font-weight-bold text-primary">지역별 선호도 수</h6>
						</div>
						<div class="chart-container" style="padding: 10px;">
							<canvas id="bar-chartcanvas" width="500" height="180"></canvas>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="card-header py-2">
							<h6 class="m-0 font-weight-bold text-primary">모임 장소</h6>
						</div>
						<div id="map" style="width: 100%; height: 380px;"></div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="card shadow mb-4">
						<div class="card-header py-2">
							<h6 class="m-0 font-weight-bold text-primary">일주일 동안 로그 기록</h6>
						</div>
						<div class="chart-container" style="padding: 10px;">
							<canvas id="line-chartcanvas" width="500" height="256"></canvas>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="card-header py-2">
							<h6 class="m-0 font-weight-bold text-primary">모임별 일정수</h6>
						</div>
						<div style="height: 360px;"
							class="d-flex justify-content-center align-items-center mt-3">
							<canvas id="donutChart1"
								style="height: 200; width: 500"></canvas>
						</div>
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
            	if (result.isDenied) {
            		Swal.fire({
                	      icon:'success',
                	      title: '메인화면으로 이동합니다!',
                	      html: ' <b></b>' + '초뒤에 페이지가 이동됩니다.',
                	      timer: 1000,
                	      timerProgressBar: true,
                	      didOpen: () => {
                	        Swal.showLoading()
                	        const b = Swal.getHtmlContainer().querySelector('b')
                	        timerInterval = setInterval(() => {
                	          b.textContent = (Swal.getTimerLeft()/1000).toFixed(0)
                	        }, 100)
                	      },
                	      willClose: () => {
                	        clearInterval(timerInterval)
                	      }
                	    })
                	     setTimeout(function() {
                	    	 	location.href = "/login/toLogout";
                             },1200);
                	 
                }
            
            })
        })

        $(document).ready(function() {

            // 카카오맵
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
              mapOption = {
               center: new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
               level: 14 // 지도의 확대 레벨
              };
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 마커 이미지 생성
            var imageSrc = '/resources/images/mapElephant.png'; // 마커이미지 주소
            imageSize = new kakao.maps.Size(34, 36);  // 마커이미지의 크기
            imageOption = {offset: new kakao.maps.Point(17, 36)}; // 마커의 좌표와 일치시킬 이미지 안에서의 좌표설정

            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
            var markerTmp; // 마커
            var customOverlay; // 오버레이
            var contentStr; // 마커 텍스트

            console.log(${jsonLocationList});
          
        	   for(let i = 0; i < ${jsonLocationList}.length; i++) {
               	markerTmp = new daum.maps.Marker({
             	        position: new daum.maps.LatLng(${jsonLocationList}[i].gcal_latitude,${jsonLocationList}[i].gcal_longitude),
             	        image: markerImage,
             	        map:map
             		});

               	contentStr = "<div class='customoverlay'><a target='_blank'><span class='title'>"+ ${jsonLocationList}[i].group_title +"</span></a></div>"; // 지도 마크업 타이틀

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

        	  // 바 그래프(로그인 방식)
        	  makeBar();
        	  // 도넛 그래프(모임 일정 수)
        	  makeCircle();
        	  // 라인 그래프 (당일 로그인 수)
        	  makeLine();

        });

    	// charjs(지역별 그룹수,Bar 차트)
        const makeBar = function() {

        	// 선호지역 리스트
            let cntPreLocationList = new Array(); // 빈 배열 생성
            <c:forEach items="${cntPreLocationList}" var="dto">
           	 	cntPreLocationList.push("${dto.count}");
            </c:forEach>
          var ctx = $("#bar-chartcanvas");

          var data = {
          labels: ["서울","인천","경기도","강원도","충청도","경상도","전라도","제주도"],
          datasets: [
            {
              label: "회원의 선호지역",
              data: cntPreLocationList,
              backgroundColor: [
                  'rgba(255, 173, 173)',
                  'rgba(255, 214, 165)',
                  'rgba(253, 255, 182)',
                  'rgba(202, 255, 191)',
                  'rgba(155, 246, 255)',
                  'rgba(160, 196, 255)',
                  'rgba(189, 178, 255)',
                  'rgba(255, 198, 255)',
                  'rgba(247, 247, 237)',
                ],
              borderColor: [
                  'rgba(255, 173, 173, 0.2)',
                  'rgba(255, 214, 165, 0.2)',
                  'rgba(253, 255, 182, 0.2)',
                  'rgba(202, 255, 191, 0.2)',
                  'rgba(155, 246, 255, 0.2)',
                  'rgba(160, 196, 255, 0.2)',
                  'rgba(189, 178, 255, 0.2)',
                  'rgba(255, 198, 255, 0.2)',
                  'rgba(247, 247, 237, 0.2)',
                ],
              fill: false,
              barPercentage: 0.8,
              barThickness: 10,
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
          },
        };

        //create Chart class object
        var chart = new Chart(ctx, {
            type: "bar",
            data: data,
            options: options
          });
        }

   		// chartjs(모임별-일정갯수,도넛차트)
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

                var ctx = $('#donutChart1');
                var donutChart1 = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: groupTitleList,
                        datasets: [{
                            data: groupCalCnt,
                            backgroundColor: randomColList,  //차트컬러
                            hoverBorderColor: "rgba(234, 236, 244, 1)",
                            cutout: "80%",
                            pointStyle:'Rounded',
                            pointRadius: 1,
                        }],
                    },
                    options: {
                    	responsive : false,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                               display: false,
                            }
                         },
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            borderColor: '#dddfeb',
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            caretPadding: 10,
                        }

                    }
                });
    	}

    	// charjs(로그그래프, Line차트)
        const makeLine = function() {
        	// 로그인 날짜 리스트
       	 	let loginTimeList = new Array(); // 빈 배열 생성
           	<c:forEach items="${cntLoginLogList}" var="dto">
           		loginTimeList.push("${dto.login_time}");
           	</c:forEach>

           // 로그인 로그 리스트
           let loginLogList = new Array(); // 빈 배열 생성
           <c:forEach items="${cntLoginLogList}" var="dto">
           		loginLogList.push("${dto.loginCnt}");
           </c:forEach>



          var ctx = $("#line-chartcanvas");

          var data = {
          labels: loginTimeList,
          datasets: [
            {
              label: "일별 로그인 로그",
              data: loginLogList,
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
    </script>
</body>

</html>