<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 일정</title>
<!-- kakaoMap -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fef0f2eae29928e7e7027600e1cf8f7d&libraries=services"></script>
<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<!--bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<style>
/* 폰트 */
@font-face {
	font-family: 'MICEGothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'MICEGothic';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}

/*카카오맵 마크업*/
.customoverlay {
	position: relative;
	bottom: 85px;
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
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #87ceea;
	background: #87ceea
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
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

body {
	background-color: #f6f7f9;
	-ms-overflow-style: none; /*스크롤바 안보이게*/
}

::-webkit-scrollbar {
	display: none;
}

* {
	box-sizing: border-box;
	font-family : 'MICEGothic Bold';
}

/* header */
header {
	font-family: 'MICEGothic Bold';
	background-color: white;
}

/* header 반응형 */
@media ( max-width : 768px) {
	#navLogo {
		display: none;
	}
	#myPageIcon {
		display: none;
	}
	#cartIcon {
		display: none;
	}
	#menu {
		display: none;
	}
}

/* header */
#navLogo {
	width: 150px;
	height: 100px;
}

#logoImgs {
	width: 100%;
	height: 100%;
}

@media ( min-width : 768px) {
	#navibar {
		display: none;
	}
}

/* header 반응형 끝 */
#logoImg {
	width: 50%;
}

/* 네비바 드롭다운 */
.dropdown-toggle:hover {
	color: #83bf7b;
	border-color: aliceblue;
}

.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
	font-weight: bold;
}

a {
	text-decoration: none;
	color: black;
}

/* 캘린더 */
.fc-event {
	margin-top: 5px;
	cursor: grabbing;
}

.fc-event-title {
	cursor: grabbing;
}

#external-events {
	padding-top: 1%;
}

input[type="text"] {
	width: 80% !important;
	margin-top: 20px;
}

.chtingCalForm {
	width: 50%;
}

input[type="text"] {
	text-align: center;
	width: 90% !important;
	margin-top: 20px;
}

#searchLocation {
	cursor: pointer;
}

#calendar {
	width: 80%;
	height: 88%;
	float: left;
}

/* 시간 설정*/
.groupDefaultTimeContainer, .timeContainer {
	height: 40px;
	border-radius: 6px;
	border: 1px solid rgb(206, 212, 218);
}

.defaultTime {
	color: black;
}

#hour-picker, #min-picker {
	background-color: #0096ff;
	width: 300px;
	display: none;
	border-radius: 10px;
}

#defaultHour, #defaultMin, .item, .item2 {
	cursor: pointer;
}

.timeNum {
	transform: scale(1.0);
	transition: transform .5s;
	font-size: 14px;
	color: #fff;
}

.timeNum:hover {
	color: black;
	opacity: 1;
	transform: scale(1.2, 1.2);
}

/* footer */
.footer-imgBox img {
	max-width: 100%;
}

.footerWrapper {
	background-color: white;
	font-family: "MICEGothic Bold";
	font-size: 15px;
}

.footerBox {
	height: 0px;
}

footer.footer {
	padding-top: 2rem;
	padding-bottom: 2rem;
}

.footer a {
	text-decoration: none;
	color: black;
	font-weight: 40px;
	font-weight: bold;
}

.footer-imgBox>img {
	height: 100%;
	text-align: center;
}

.footer-imgBox {
	height: 100%;
	text-align: center;
}

/* 캘린더 드래그 이벤트 안보이게 */
.fc-event-time {
	display: none;
}

/* 취소 */
.btn-secondary, .btn-secondary:hover, .btn-secondary:active,
	.btn-secondary:visited {
	background-color: #a4a4a4 !important;
	color: #fff;
	border-color: #a4a4a4;
}

/* 저장 */
.btn-success, .btn-success:hover, .btn-success:active, .btn-success:visited
	{
	background-color: #2551a8 !important;
	color: #fff;
	border-color: #2551a8;
}

/* 삭제 */
.btn-danger, .btn-danger:hover, .btn-danger:active, .btn-danger:visited
	{
	background-color: #2551a8 !important;
	color: #fff;
	border-color: #2551a8;
}

/* 수정 */
.btn-warning, .btn-warning:hover, .btn-warning:active, .btn-warning:visited
	{
	background-color: #96c93d !important;
	color: #fff;
	border-color: #96c93d;
}
</style>
</head>
<body>
	<!--네비바-->
   <header class="mb-3 border-bottom" style="box-shadow: 2px 1px 6px 1px #bfbfbf;">
      <div class="container">
         <!-- 접혔을 때 nav -->
         <nav id="navibar" class="navbar navbar-expand-md navbar-light"
            aria-label="Main navigation">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-10">
                     <a class="navbar-brand mb-2 mb-lg-0" href="/">
                        <div class="title-box">
                           <img id="logoImg" src="/resources/images/kiri.jpg">
                        </div>
                     </a>
                  </div>
                  <!-- toggle button -->
                  <div class="col-2 d-flex align-items-center">
                     <button class="navbar-toggler" type="button"
                        data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                     </button>
                  </div>
                  <!-- 메뉴 -->
                  <div class="collapse navbar-collapse justify-content-end"
                     id="navbarNavDropdown">
                     <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/board/toBoard">자유게시판</a></li>
                        <c:if test="${empty loginSession}">
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogin">로그인</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/signup/toSignupAgree">회원가입</a></li>
                        </c:if>
                        <c:if
                           test="${not empty loginSession && loginSession.user_email eq 'admin'}">
                           <li class="nav-item"><a class="nav-link"
                              href="/mem/myPage">마이페이지</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/admin/toAdmin">관리자페이지 이동</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogout">로그아웃</a></li>
                        </c:if>
                        <c:if
                           test="${not empty loginSession && loginSession.user_email ne 'admin'}">
                           <li class="nav-item"><a class="nav-link"
                              href="/mem/myPage">마이페이지</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogout">로그아웃</a></li>
                        </c:if>
                     </ul>
                  </div>
               </div>

            </div>
         </nav>
         <!-- 펼쳐졌을 때 nav -->
         <nav id="menu" class="navbar navbar-expand-md w-100 navbar-light"
            aria-label="Main navigation">
            <div class="row w-100 align-items-center">
               <div class="col-5 d-flex justify-content-center">
                  <ul class="navbar-nav mb-2 mb-lg-0">
                     <li class="nav-item"><a class="nav-link mx-2"
                        href="/board/toBoard" style="font-size:18px;">자유 게시판</a></li>
                  </ul>
               </div>

               <!-- logo -->
               <div class="col-2">
                  <a href="/" id="navLogo" class="mb-2 mb-lg-0"> <img
                     id="logoImgs" src="/resources/images/kiri.jpg">

                  </a>
               </div>

               <div class="col-5">
                  <div class="row align-items-center justify-content-center">
                     <div class="col-auto">
                        <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                           <c:if test="${empty loginSession}">
                              <li class="nav-item"><a class="nav-link"
                                 href="/login/toLogin">로그인</a></li>
                              <li class="nav-item"><a class="nav-link"
                                 href="/signup/toSignupAgree">회원가입</a></li>
                           </c:if>
                        </ul>
                     </div>
                     <div class="col-auto user">
               <c:if test = "${not empty loginSession && loginSession.user_email eq 'admin'}">
                         <div class="dropdown text-end">
                           <a href="/" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                           <img src="/resources/images/profile.jpg" alt="mdo" width="32" height="32" class="rounded-circle">
                           </a>
                           <ul class="dropdown-menu text-small"
                              aria-labelledby="dropdownUser1">
                              <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                              <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a></li>
                              <li><hr class="dropdown-divider"></li>
                              <li><a class="dropdown-item" href="/admin/toAdmin">관리자 페이지이동</a></li>
                              <li><a class="dropdown-item" href="/login/toLogout">로그아웃</a></li>
                           </ul>
                        </div>
                     </c:if>
                        <c:if
                           test="${not empty loginSession && loginSession.user_email ne 'admin'}">
                           <div class="dropdown text-end">
                              <a href="/"
                                 class="d-block link-dark text-decoration-none dropdown-toggle"
                                 id="dropdownUser1" data-bs-toggle="dropdown"
                                 aria-expanded="false"> 
                                 <c:if test="${loginSession.user_image eq null}">
                                    <img src="/resources/images/profile.jpg" alt="mdo" width="40" height="40" class="rounded-circle">
                                 </c:if>
                                 <c:if test="${loginSession.user_image ne null}">
                                    <img src="/profile/${loginSession.user_image }" alt="mdo" width="40" height="40" class="rounded-circle">
                                 </c:if>
                              </a>
                              <ul class="dropdown-menu text-small"
                                 aria-labelledby="dropdownUser1">
                                 <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                                 <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a>
                                 </li>
                                 <li>
                                    <hr class="dropdown-divider" style="margin:0px;">
                                 </li>
                                  <c:if test="${loginType ne 'kakao'}">
                                      <li><a class="dropdown-item mt-2" href="/login/toLogout">로그아웃</a></li>
                                  </c:if>
                                 <c:if test="${loginType eq 'kakao'}">
                                    <li><a class="dropdown-item mt-2" href="${kakaoLogout}">로그아웃</a></li>
                                 </c:if>
                              </ul>
                           </div>
                        </c:if>
                     </div>
                  </div>
               </div>
            </div>
         </nav>
      </div>
   </header>

	<!-- 캘린더 -->
	<div id="wrapper" class="container-fluid mb-5">
		<!-- Main -->
		<div id="main" class="row my-2 d-flex justify-content-center pb-5">
			<div class="inner col-md-8 col-12">
				<!-- Banner -->
				<section
					class="row d-flex justify-content-end gy-4 gx-md-5 mb-md-5 mt-md-2">
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header text-center">
									<h5 class="modal-title" id="ModalLabel">일정을 추가하세요!</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close" onclick="moveSite();"></button>
								</div>
								<div class="modal-body">
									<form id="calForm" name="calForm" action="/calForm"
										method="post">
										<div class="form-floating mb-3 partyCal"
											style="margin-left: 10%;">
											<input type="text" class="form-control" id="title"
												name="title" maxlength='30' placeholder="최대 30자까지 가능합니다"> <label for="partyTitle">제목</label>
										</div>
										<div class="form-floating mb-3 partyCal"
											style="margin-left: 10%;">
											<input type="text" class="form-control" id="showDate"
												name="showDate" disabled> <label for="partyDate">모임날짜</label>
											<input type="text" name="start" id="start" hidden>
											<input type="text" name="end" id="end" hidden>
										</div>
										<div
											class="mb-3 partyCal d-flex flex-column timeContainer"
											style="margin-left: 10%; margin-right: 10%; height: 56px; width: 376px;">
											<div class="mt-1" style="color: #8793a1; font-size : 13px; margin-left:11px;">시간</div>
											<div class="defaultTime text-center">
												<span class="me-2" id="defaultHour">00</span>:<span
													class="ms-2" id="defaultMin">00</span>
											</div>
										</div>
										<div
											class="mb-3 partyCal d-flex flex-column groupDefaultTimeContainer"
											style="margin-left: 10%; margin-right: 10%; height: 56px; width: 376px; background-color: rgb(233, 236, 239);">
											<div class="mt-1" style="color: #8793a1; font-size : 13px; margin-left:11px;">시간</div>
											<div class="gDefaultTime text-center"></div>
										</div>
										<input type="text" name="group_time" class="d-none" id="hiddenGroupDefaultTime" >
										<!--시간 선택-->
										<div id="hour-picker" class="p-4 mt-2"
											style="margin-left: 10%; margin-right: 10%; width: 376px;">
											<div class="row pb-2">
												<div class="col-2">
													<span class="item timeNum">00</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">01</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">02</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">03</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">04</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">05</span>
												</div>
											</div>
											<div class="row pb-2">
												<div class="col-2">
													<span class="item timeNum">06</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">07</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">08</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">09</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">10</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">11</span>
												</div>
											</div>
											<div class="row pb-2">
												<div class="col-2">
													<span class="item timeNum">12</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">13</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">14</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">15</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">16</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">17</span>
												</div>
											</div>
											<div class="row">
												<div class="col-2">
													<span class="item timeNum">18</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">19</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">20</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">21</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">22</span>
												</div>
												<div class="col-2">
													<span class="item timeNum">23</span>
												</div>
											</div>
										</div>
										<!--분 선택-->
										<div id="min-picker" class="p-4 mt-2"
											style="margin-left: 10%; margin-right: 10%; width: 376px;">
											<div class="row">
												<div class="col-3 text-center">
													<span class="item2 timeNum">00</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">05</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">10</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">15</span>
												</div>
											</div>
											<div class="row">
												<div class="col-3 text-center">
													<span class="item2 timeNum">20</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">25</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">30</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">35</span>
												</div>
											</div>
											<div class="row">
												<div class="col-3 text-center">
													<span class="item2 timeNum">40</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">45</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">50</span>
												</div>
												<div class="col-3 text-center">
													<span class="item2 timeNum">55</span>
												</div>
											</div>
										</div>
										<!-- 시간 넘기기 input  -->
										<input type="text" id="hourInput" value="00" name="hour"
											hidden> <input type="text" id="minInput" value="00"
											name="min" hidden>
										<div class="form-floating mb-3 partyCal"
											style="margin-left: 10%;">
											<input type="text" class="form-control" id="gcal_content" placeholder="최대 30자까지 가능합니다"
												name="gcal_content" maxlength='30'> <label for="partyContent">내용</label>
										</div>
										<div class="form-floating mb-3 partyCal"
											style="margin-left: 10%;">
											<input type="text" class="form-control keyword"
												id="partyLocation" placeholder="장소 검색"> <label
												for="partyLocation" id="placeholderForSearch">&#128270;
												장소를 입력하시고 엔터키를 눌러주세요!</label>
										</div>

										<div style="display: flex; justify-content: center">
											<input class="chtingCal" type="hidden" type="text">
										</div>
										<!-- 카카오맵 기본 좌표 kh 당산 -->
										<input type="hidden" name="xcoord" id="xcoord"
											value="126.896761296215" /> <input type="hidden"
											name="ycoord" id="ycoord" value="37.5339071790577" /> <input
											type="hidden" name="placeName" id="placeName" value="강남" />
										<input type="hidden" name="seq_group_cal" id="seq_group_cal"
											value="" />
									</form>
									<div style="margin-left: 10%; margin-right: 10%;">
										<div id="map" style="width: 378px; height: 300px;"></div>
									</div>
								</div>
								<div class="modal-footer" id="buttonDiv">
									<button type="button" class="btn btn-secondary"onclick="moveSite()">취소</button>
									<button type="button" class="btn btn-success " id="calSubmit">저장</button>
									<button type="button" class="btn btn-danger" id="calDelete">삭제</button>
									<button type="button" class="btn btn-warning" id="calModify">수정</button>
									<button type="button" class="btn btn-warning d-none" id="calModifySubmit">수정 완료</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Calendar 일정 생성기-->
					<div class="" id='external-events'>
					</div>
					<!--캘린더 자체 생성-->
					<div class="col-md-12 col-auto flex-fill" id='calendar'
						style="min-width: initial; min-height: 60vh;"></div>
					<!-- Calendar end -->
				</section>
			</div>
		</div>
	</div>

	<!-- Footer-->
   <div class="footerWrapper mt-5" style="border-top:1px solid #e0e3e8;">
      <div class="container">
         <footer class="footer">
            <div class="row">
               <div class="col-lg-3 footer-imgBox">
                  <img src="/resources/images/kirilogo.png" alt="오류가 발생했습니다." />
               </div>
               <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                  <ul class="list-inline mb-2">
                     <li class="list-inline-item"><a href="/board/toBoard?pageNum=1&amount=10&keyword=&type=&category=공지">공지사항</a></li>
                     <li class="list-inline-item">⋅</li>
                     <c:choose>
                        <c:when test="${not empty loginSession}">
                           <li class="list-inline-item"><a href="/mem/myPage">마이페이지</a></li>
                           <li class="list-inline-item">⋅</li>
                           <c:if test="${loginType ne 'kakao'}">
                              <li class="list-inline-item"><a href="/login/toLogout">로그아웃</a></li>
                           </c:if>
                           <c:if test="${loginType eq 'kakao'}">
                              <li class="list-inline-item"><a href="${kakaoLogout}">로그아웃</a></li>
                           </c:if>
                        </c:when>
                        <c:otherwise>
                           <li class="list-inline-item"><a
                              href="/signup/toSignupAgree">회원가입</a></li>
                           <li class="list-inline-item">⋅</li>
                           <li class="list-inline-item"><a href="/login/toLogin">로그인</a></li>
                        </c:otherwise>
                     </c:choose>
                     <li class="list-inline-item">⋅</li>
                     <li class="list-inline-item">
                        <c:choose>
                           <c:when test="${not empty loginSession}">
                              <a href="/group/toCreateGroup">모임 만들기</a>
                           </c:when>
                           <c:otherwise>
                              <a href="/login/toLogin">모임 만들기</a>
                           </c:otherwise>
                        </c:choose>
                     </li>
                     <li class="list-inline-item">⋅</li>
                     <li class="list-inline-item"><a href="/privacy"
                        style="color: red; font-weight: bold;">개인정보처리방침</a></li>
                  </ul>
                  <p class="text-muted small mb-4 mb-lg-0">끼리끼리(주) 대표 : 이호준 |
                     개인정보관리책임자 : 김영완 | 사업자등록번호 : 22-02-22</p>
                  <p class="text-muted small mb-4 mb-lg-0">주소 : 서울특별시 영등포구 선유동2로
                     57 이레빌딩</p>
                  <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
                     2022. All Rights Reserved.</p>
               </div>
               <div class="col-lg-3 h-100 text-center text-lg-start my-auto">
                  <ul class="list-inline mb-0">
                     <li class="list-inline-item me-4"><a
                        href="https://ko-kr.facebook.com"><i
                           class="bi-facebook fs-3"></i></a></li>
                     <li class="list-inline-item me-4"><a
                        href="https://twitter.com/?lang=ko"><i
                           class="bi-twitter fs-3"></i></a></li>
                     <li class="list-inline-item"><a
                        href="https://www.instagram.com/"><i
                           class="bi-instagram fs-3"></i></a></li>
                  </ul>
               </div>
            </div>
         </footer>
      </div>
   </div>
  
	<script>
		// 다시 홈으로 돌아오는 함수
		let moveSite = function() {
			window.location.href = "";
		}
	
		// 일정 추가 모달
		var calendarModal = new bootstrap.Modal(document.getElementById('exampleModal'));
		$(document).ready(function() {

			// 드래그 박스 취득
			let containerEl = document.getElementById('external-events');
			let Calendar = FullCalendar.Calendar;
			let Draggable = FullCalendar.Draggable;
			
			// 현재 시퀀스 그룹 번호
			let seq_group = ${seq_group};

			// 설정하기
			new Draggable(containerEl, {
				itemSelector : '.fc-event',
				eventData : function(eventEl) {
					return {
						title : eventEl.innerText
					};
				}
			});

			// calendar element 취득
			var calendarEl = $('#calendar')[0];
			
			// full-calendar 생성하기
			var calendar = new FullCalendar.Calendar(calendarEl, {
				// 해더에 표시할 툴바(기본설정)
				headerToolbar : {
					left : 'today',
					center : 'title',
					right : 'prev,next'
				},
				initialView : 'dayGridMonth',
				locale : 'ko', // 한국어 설정
				editable : true, // 수정 가능
				droppable : true, // 드래그 가능
				draggable : true,
				selectable : true, // 빈 공간 클릭 허용
				events : [ 
					$.ajax({
						url : '/cal/calList',
						type : 'get',
						contentType : "application/json; charset:UTF-8",
						data: {"seq_group" : seq_group},
						success : function(response) {
						for (i = 0; i < response.length; i++) {
							calendar.addEvent({
								title : response[i].group_time + " " + response[i].title,
								start : response[i].start, // 시작 날짜 
								end : response[i].end, // 끝 날짜 
								seq_group_cal : response[i].seq_group_cal // 번호도 생성 해줘야 가져올 수 있음
							})
						}
					},
					error : function(e) {
						Swal.fire({
							  icon: 'error',
							  title: '에러가 발생했네요..',
							  text: '관리자에게 문의해주세여!',
							});
					}
				}) ],

				// 날짜 클릭시 혹은 드래그
				select: function (info) {
					// 마지막 날짜 설정 (현재날짜에서 +1이 되어서)
					let endDate = info.endStr;
					endDate = endDate.replace(/-/g, ""); // 현재 날짜(String -> -빼기)
					endDate = (Number(endDate)) - 1;
					endDate = endDate.toString();
					endDate = endDate.slice(0,4) + '-' + endDate.slice(4, 6) + '-' + endDate.slice(6,8);

					// 시작 끝 날짜 삽입(보여주기 식)
					$("#showDate").val(info.startStr + " ~ " + endDate);
					
					// 초기화 작업
					$("#ycoord").val('37.5339071790577'); // 위도
					$("#xcoord").val('126.896761296215'); // 경도
					$("#title").val(''); // 제목
					$("#gcal_content").val(''); // 내용
					$("#partyLocation").val(''); // 위치명
					$("#start").val(info.startStr); // 시작 날짜 넣어주기 
					$("#end").val(info.endStr); // 끝 날짜 넣어주기 
					$(".groupDefaultTimeContainer").addClass("d-none"); // 디폴트 시간 
					
					
					if($("calDelete").hasClass("d-none") === false) {
						// 삭제 버튼 안보이게 
						$("#calDelete").addClass("d-none");
						// 저장 버튼 보이게
						$("#calSubmit").removeClass("d-none");
						// 수정 버튼 안보이게 
						$("#calModify").addClass("d-none"); 
					}

					// 모달 보여주기 
					calendarModal.show();
					// 기존 맵 지우기
					$('#map').empty()
					// 모달 띄워준 뒤에 맵이 생성되야 함 
					makeMap();
					// 캘린더 랜더링
					calendar.render();
				},
					
				// 일정 옮겼을 때 
				eventDrop:function(events) {
					console.log(events);
					let seq_group = ${seq_group}; // 현재 모임의 일정 번호
					let seq_group_cal = events.event.extendedProps.seq_group_cal; // 클릭한 일정의 번호 
					let year = (events.event._instance.range.start.getFullYear()); //옮긴 달력의 날짜
	                let month = events.event._instance.range.start.getMonth() + 1; //옮긴 달력의 날짜
	                let day = events.event._instance.range.start.getDate(); //옮긴 달력의 날짜
	                let start = year + "-" + month + "-" + day; // 변경된 날짜
	                let modifyDays = events.delta.days; // 기존의 일정으로 부터 바뀐 날짜
	                
					 $.ajax ({
						url : "/cal/calMove",
						type: 'get',
						data : {"start" : start, "seq_group_cal" : seq_group_cal, "seq_group" : seq_group, "modifyDays" : modifyDays},
						success : function(data) {
							if(data === "success") {
								Swal.fire({
									  position: 'center',
									  icon: 'success',
									  title: '일정이 수정되었습니다!',
									  showConfirmButton: false,
									  timer: 1300
									})
							}
						},
						error : function(e) {
							Swal.fire({
								  icon: 'error',
								  title: '에러가 발생했네요..',
								  text: '관리자에게 문의해주세여!',
								})
						}
					}) 
				},
				
				// 일정 클릭시
				eventClick : function(info) {
					let seq_group_cal =""; // 초기화 
					let seq_group = ${seq_group}; // 현재 모임의 번호
					seq_group_cal = info.event.extendedProps.seq_group_cal; // extendedProps는 event 함수에서 존재하는 값만 사용 가능 -> 클릭했을 때 해당 seq_group_cal을 찾아줌
					
					
					// 시간 안보이게 
					$(".timeContainer").addClass("d-none");
					
					if(seq_group_cal === undefined) { // 값이 undefined 면 
						$("#calSubmit").addClass("d-none");

						// 삭제 버튼 보이게
						$("#calDelete").removeClass("d-none");
						
						calendarModal.show();
						makeMap();
					}else {

						// 클릭했을 때 번호가 있을 때
							$.ajax({
								url : "/cal/calDetail",
								type : "get",
								data : {"seq_group_cal" : seq_group_cal, "seq_group" : seq_group},
								dataType : "json",
								success : function(data) {
									// 마지막 날짜 설정 (현재날짜에서 +1이 되어서)
									let endDate = data[0].end;
									endDate = endDate.replace(/-/g, ""); // 현재 날짜(String -> -빼기)
									endDate = endDate.substr(0, 8); // 날짜만 가져오기 00:00:00 빼기
									endDate = (Number(endDate)) - 1;
									endDate = endDate.toString();
									endDate = endDate.slice(0,4) + '-' + endDate.slice(4, 6) + '-' + endDate.slice(6,8);

									// 받아온 값들을 input에 셋팅
									$("#title").val(data[0].title); // 일정 제목 
									$("#showDate").val(data[0].start + " ~ " + endDate); // 일정 날짜
									$("#gcal_content").val(data[0].gcal_content); // 일정 내용 
									$("#partyLocation").val(data[0].gcal_place); // 일정 위치 
									$("#ycoord").val(data[0].gcal_latitude);
									$("#xcoord").val(data[0].gcal_longitude);
									$(".gDefaultTime").text(data[0].group_time); // 일정 시간 넣어두기
									$("#hiddenGroupDefaultTime").val(data[0].group_time);// 일정 시간 넣어두기 
									$(".groupDefaultTimeContainer").removeClass("d-none"); // 디폴트 시간 
									
									// seq_group_cal을 modal에 넣어준다 
									$("#seq_group_cal").val(seq_group_cal);
									
									if($("calSubmit").hasClass("d-none") === false) {
										//저장 버튼 안보이게 
										$("#calSubmit").addClass("d-none");

										// 삭제 버튼 보이게
										$("#calDelete").removeClass("d-none");
									}
									calendarModal.show(); // 모달 보여주기 
									makeMap(data[0].gcal_place); // 지도 생성
									
								},
								error : function(e) {	
									// 초기화 작업
									$("#ycoord").val('37.566826'); // 위도
									$("#xcoord").val('126.9786567'); // 경도
									$("#gcal_content").val(''); // 내용
									$("#partyLocation").val(''); // 위치명
									$("#title").val('');
									$("#start").val('');
									
									Swal.fire({
										  icon: 'error',
										  title: '에러가 발생했네요..',
										  text: '관리자에게 문의해주세여!',
										})
								}
							});
							
					}
					
				},

			});

			// 캘린더 랜더링
			calendar.render();
		});

		
		// 지도 검색 엔터 이벤트
		$(".keyword").keyup(function(e){
			if(e.keyCode == 13) {
				let keyword = $(".keyword").val();
				// 지도 찾기 호출
				searchMap(keyword);
			} 
		})
		
		// 이벤트 발생
		const searchPlace = function() {
			let keyword = $(".keyword").val();
			searchMap(keyword);
		}
		
		
	/* 	// 카카오맵 api
		$(".searchBtn").on("click", function() {
			let keyword = $(".keyword").val();
			// 지도 찾기 호출
			searchMap(keyword);
		}) */

		

		// 일정 저장
		$("#calSubmit").on("click", function() {
			let seq_group = ${seq_group}; // 현재 모임 번호 
			let title = $("#title").val(); //  일정 제목 
			let start = $("#start").val(); // 모임 날짜 시작 
			let end = $("#end").val(); // 모임 날짜 끝 
			let gcal_content = $("#gcal_content").val(); // 일정 내용
			let gcal_longitude = $("#xcoord").val(); // 일정 경도
			let gcal_latitude = $("#ycoord").val(); // 일정 위도 
			let gcal_place = $("#partyLocation").val(); // 일정 위치
			let hour = $("#hourInput").val(); // 시간 
			let min = $("#minInput").val(); // 분 
			let group_time = hour + ":" + min; // 전체 시간

			if(title == "") {
				Swal.fire('제목을 입력해주세요');
				return;
			}else if(gcal_content == "") {
				Swal.fire('내용을 입력해주세요');
				return;
			}else if(gcal_place == "") {
				Swal.fire('장소를 검색해주세요');
				return;
			}else {
				 $.ajax({
					url : "/cal/calInsert",
					type : "post",
					data : {
						"seq_group" : seq_group,
						"title" : title,
						"start" : start,
						"end" : end,
						"gcal_content" : gcal_content,
						"gcal_longitude" : gcal_longitude,
						"gcal_latitude" : gcal_latitude,
						"gcal_place" : gcal_place,
						"group_time" : group_time
					},
					success : function(data) {
						// 일정 추가되었다고 알림 
						Swal.fire({
							position : 'center',
							icon : 'success',
							title :'일정이 등록되었습니다',
							showConfirmButton : false,
							timer : 900
						})
						// 모달창 안보이게 
						calendarModal.hide();
						
						// 1 초있다가 페이지 로드
						setTimeout(function() {
							window.location.href = "";
						},1000);
						
					},
					error : function(e) {
						Swal.fire({
							  icon: 'error',
							  title: '에러가 발생했네요..',
							  text: '관리자에게 문의해주세여!',
							})
					}
				})  
			} 
		})
		
		// 일정 삭제
		$("#calDelete").on("click",function() {
			let seq_group_cal = $("#seq_group_cal").val(); // 일정 번호
			Swal.fire({
				  title: '일정을 정말 삭제하시겠습니까?',
				  text: "삭제 후, 일정을 다시 만드셔야 합니다",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네, 삭제할래요!',
				  cancelButtonText: '아니요!',
				}).then((result) => {
				  if (result.isConfirmed) { // 삭제에서 yes를 누르다면
					  $.ajax ({
						  url : "/cal/calDelete",
					  	  data : {"seq_group_cal" : seq_group_cal},
					  	  dataType : "text",
					  	  success : function(data) {
					  		  if(data === "success") { // 삭제 성공시
					  			// 모달창 안보이게 
								calendarModal.hide();
					  			
					  		  	Swal.fire(
									      '삭제되었습니다!',
									      '일정을 다시 확인해주세여',
									      'success'
									 )
								// 0.9 초있다가 페이지 로드
								setTimeout(function() {
									window.location.href = "";
								},1000);
								
								
					  		  }else { // 삭제 실패시
					  			Swal.fire({
									  icon: 'error',
									  title: '에러가 발생했네요..',
									  text: '관리자에게 문의해주세여!',
									})
					  		  }
					  			
					  	  },
					  	  error : function(e) {
					  		Swal.fire({
								  icon: 'error',
								  title: '에러가 발생했네요..',
								  text: '관리자에게 문의해주세여!',
								})
					  	  }
					  })
					 
				  }
				})
		})
		
		// 일정 수정
		$("#calModify").on("click",function() {
			$("#calModifySubmit").removeClass("d-none"); // 수정 제출 보이게
			$("#calModify").addClass("d-none"); // 수정 버튼 안보이게 
			let group_time = $(".gDefaultTime").text();
			$("#defaultHour").html(group_time.substr(0,2)); // 시간 div 창에 넣어주기  
			$("#defaultMin").html(group_time.substr(3,5));  // 분 div 창에 넣어주기 
			$(".groupDefaultTimeContainer").addClass("d-none"); // 그룹 디폴트 타임 선택 박스 안보이게 
			$(".timeContainer").removeClass("d-none");  // 기존 타임 선택 박스 보이게
			
		})
		
		// 일정 수정 버튼 클릭시 
		$("#calModifySubmit").on("click",function() {
			let seq_group_cal = $("#seq_group_cal").val(); // 일정 번호
			let seq_group = ${seq_group}; // 현재 모임 번호 
			let title = $("#title").val(); //  일정 제목 
			let start = $("#start").val(); // 모임 날짜 시작 
			let end = $("#end").val(); // 모임 날짜 끝 
			let gcal_content = $("#gcal_content").val(); // 일정 내용
			let gcal_longitude = $("#xcoord").val(); // 일정 경도
			let gcal_latitude = $("#ycoord").val(); // 일정 위도 
			let gcal_place = $("#partyLocation").val(); // 일정 위치
			
			let hour = $("#hourInput").val(); // 시간 
			let min = $("#minInput").val(); // 분 
			let modifyTime = hour+":"+min; // 바뀐 시간 */
			let group_time = $("#hiddenGroupDefaultTime").val() // 기존 시간
			
			if(title == "") {
				Swal.fire('제목을 입력해주세요');
				return;
			}else if(gcal_content == "") {
				Swal.fire('내용을 입력해주세요');
				return;
			}else if(gcal_place == "") {
				Swal.fire('장소를 검색해주세요');
				return;
			}else {
				 $.ajax({
					url : "/cal/calModify",
					type : "post",
					dataType : "json",
					data : {
						"seq_group_cal" : seq_group_cal,
						"seq_group" : seq_group,
						"title" : title,
						"start" : start,
						"end" : end,
						"gcal_content" : gcal_content,
						"gcal_longitude" : gcal_longitude,
						"gcal_latitude" : gcal_latitude,
						"gcal_place" : gcal_place,
						"group_time" : group_time,
						"modifyTime" : modifyTime
					},
					success : function(data) {
						if(data >= 1) {
							Swal.fire('일정 내용 수정 완료!');
							setTimeout(function() {
                                window.location.href = "";
                           },800);
						}	
					},
					error : function(e) {
						Swal.fire({
							  icon: 'error',
							  title: '에러가 발생했네요..',
							  text: '관리자에게 문의해주세여!',
							})
					}
				})  
			}
		})
		
		
		// 지도 찾기 함수
		const makeMap = function(defaultVal = "끼리끼리") {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center : new kakao.maps.LatLng($('#ycoord').val(), $('#xcoord').val()), // 지도의 중심좌표
				level : 3// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커 또한 모달창이 띄워지고 난 뒤에 다시 생성해야 하므로 setTimeout 걸어줌
			setTimeout(function() {
				var imageSrc = '/resources/images/mapElephant.png', // 마커이미지의 주소입니다
			    imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(27, 60)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					markerPosition = new kakao.maps.LatLng($('#ycoord').val(), $('#xcoord').val());//마커가 표시될 위치입니다 

				//마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position : markerPosition,
					image: markerImage // 마커이미지 설정
				});

				//마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				//마커에 표시될 텍스트 
	        	var iwContent = '<div class="customoverlay">' +
	            '  <a target="_blank">' +
	            '  <span class="title">'+ defaultVal +'</span>' +
	            '  </a>' +
	            '</div>';
	        		
	        	 // 커스텀 오버레이가 표시될 위치입니다
	            var position = new kakao.maps.LatLng($('#ycoord').val(), $('#xcoord').val());
	            
	         	// 커스텀 오버레이를 생성합니다
	            var overlay  = new kakao.maps.CustomOverlay({
	                map: map,
	                position: position,
	                content: iwContent,
	                yAnchor: 1
	            });
	         
	            overlay.setMap(map,marker);
			},100);
			
			// 모달을 열었을 때보다 늦게 코드가 실행되게 해야한다 그래야 api가 적용됨
			setTimeout(function() {
				map.relayout();
				map.setCenter(new kakao.maps.LatLng($('#ycoord').val(), $('#xcoord').val()));
			}, 200);
		}

		// 검색 했을 때 메서드
		function searchMap(keyword) {

			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			 var infowindow = new kakao.maps.InfoWindow({
				zIndex : 1
			}); 
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center : new kakao.maps.LatLng($('#ycoord').val(), $('#xcoord')
						.val()), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(keyword, placesSearchCB);

			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					// LatLngBounds 객체에 좌표를 추가합니다
					var bounds = new kakao.maps.LatLngBounds();
					for (var i = 0; i < data.length; i++) {
						displayMarker(data[i]);
						bounds.extend(new kakao.maps.LatLng(data[i].y,
								data[i].x));
					}
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);
				}else {
					Swal.fire({
	                    icon: 'error',
	                    title: '장소검색 실패!',
	                    text: '검색하신 키워드에 대한 정보가 없습니다',
	                    footer: 'ex) KH 당산'
	                })
				}
			}
			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
				// 마커를 생성하고 지도에 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : new kakao.maps.LatLng(place.y, place.x)
				});

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker,'click',function() {// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
									infowindow.setContent('<div style="padding:5px;font-size:12px;">'+ place.place_name+'</div>');
									infowindow.open(map, marker);
									$('#xcoord').val(place.x); // 경도 
									$('#ycoord').val(place.y); // 위도 
									$("#partyLocation").val(place.place_name); // 마커로 찍은 장소를 input에 넣어주기
									
									// swal 라이브러리 이용
									Swal.fire({
										position : 'center',
										icon : 'success',
										title : place.place_name
												+ '로 모임 장소를 선택했습니다.',
										showConfirmButton : false,
										timer : 1500
									})
								});
			}
		}
		

		// 00 클릭시(시간)
	    $("#defaultHour").on("click",function() {
	      $("#hour-picker").toggle(400);
	    })
	
	    // 시간 선택시
	    $(".item").on("click",function() {
	      $("#defaultHour").html($(this).html()); // 시간 선택
	      $("#hourInput").val($(this).html()); // 안보이는 input에 시간 넣기 
	      $("#hour-picker").toggle(400);
	    })
	
	    // 00 클릭시(분)
	    $("#defaultMin").on("click",function() {
	      $("#min-picker").toggle(400);
	    })
	
	    // 분 선택시
	    $(".item2").on("click",function() {
	      $("#defaultMin").html($(this).html()); // 분 선택
	      $("#minInput").val($(this).html()); // 안보이는 input에 시간 넣기 
	      $("#min-picker").toggle(400);
	    })

	</script>
</body>
</html>