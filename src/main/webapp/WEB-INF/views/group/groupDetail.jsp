<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap" rel="stylesheet" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js" crossorigin="anonymous"></script>
<!--차트 js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>모임 상세</title>
<style>
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

@font-face {
	font-family: 'Katuri';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/Katuri.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'InfinitySans-RegularA1';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
          font-family: 'EarlyFontDiary';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EarlyFontDiary.woff2') format('woff2');
          font-weight: normal;
          font-style: normal;
      }


* {
	box-sizing: border-box;
}

body {
	background-color: #ffffff;
}

/* header */
header {
	font-family: 'MICEGothic Bold';
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

.groupHeaderInfo {
	height: 480px;
}

/* body menu */
.groupImgBox {
	background-color: #fafafa;
	width: 100%;
	height: 80%;
	border-radius: 10px;
	border-bottom-right-radius: 0px;
	border-bottom-left-radius: 0px;
	border: 1px solid #e0e3e8;
}

.groupImgBox img {
	height: 100%;
	width: 100%;
	border-radius: 10px;
	border-bottom-right-radius: 0px;
	border-bottom-left-radius: 0px;
}

.groupTitleTextBox {
	width: 100%;
	height: 20%;
	background-color: #fff;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border: 1px solid #e0e3e8;
	border-top: 0px;
	word-break: break-all;
}

.groupActiveBtnBox {
	width: 740px;
	height: 60px;
}

a:link {
	color: grey;
	text-decoration: none;
}

a:visited {
	color: grey;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

a:active {
	color: grey;
	text-decoration: none;
}

.groupInfoSumTitle {
	word-break: break-all;
}

.infoSumLogo {
	width: 20px;
}

.groupInfo {
	width: 600px;
	word-break: break-all;
}

.hostImg {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: #fafafa;
}

.hostImg img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}

.covidCautionBox {
	padding: 12px;
	border-radius: 10px;
}

.memberInfo {
	background-color: red;
	width: 400px;
	overflow: auto;
}

.groupActiveBtn, .groupInfoBtn {
	cursor: pointer;
}

.groupContent {
	box-sizing: content-box;
	word-wrap: break-word;
}

.groupInfo img {
	width: 100%;
	height: 400px;
}

/* 모달 프로필  */
.modalProfileImage {
	width: 100px;
	height: 100px;
	background-color: #ebe1c8;
	border-radius: 50%;
}

.modalProfileImage img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}

.modalProfileName, .modalProfileGender {
	padding: 10px;
	border-bottom: 1px solid #eaeceb;
}

#msgIcon {
	cursor: pointer;
}

.memberProfileContainer:hover {
	cursor: pointer
}

#siren_icon {
	cursor: pointer;
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

.uselessBox {
	height: 40px;
}

/* 새로 시작 */
.infoSumLogo i {
	color: #6f767c;
}

#groupTitleHeader {
	height: 400px;
	border-radius: 10px;
	margin-bottom: 10px;
	word-break: break-all;
	border: 1px solid #e0e3e8;
	position: fixed;
	width: 480px;
	background-color: #fafafa;
}

#hiddenGroupInfo {
	display: none;
}

@media ( max-width : 768px ) {
	#groupTitleHeader {
		height: 390px;
		width: 458px;
		display: none;
	}
	#hiddenGroupInfo {
		display: block;
	}
	.groupControllBtn {
		width: 100%;
	}
}

#groupTitleBottom {
	border-radius: 10px;
	word-break: break-all;
}

.groupTitleHeaderImgBox {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: #fff;
}

.groupTitleHeaderImgBox img {
	width: 100%;
	height: 100%;
	border-radius: 50%;
}

.categoryContainer {
	height: 66px;
}

@media ( max-width : 768px ) {
	.categoryContainer {
		height: 110px;
	}
	.joinContainer {
		display: flex;
		justify-content: center;
	}
}

.categoryText:hover {
	color: black;
	border-bottom: 5px solid;
	black;
}

/*모임신청, 모임탈퇴 버튼*/
.btn-primary {
	color: #fff;
	background-color: #fc3049;
	border-color: #fff;
}

.btn-primary:hover {
	color: #fff;
	background-color: #f75266;
	border-color: #f75266;
}

.btn-check:focus+.btn-primary, .btn-primary:focus {
	color: #fff;
	background-color: #f75266;
	border-color: #f75266;
	box-shadow: 0 0 0 0.25rem rgb(218 222 229/ 50%);
}

.btn-check:focus+.btn, .btn:focus {
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgb(218 222 229/ 50%);
}

.btn-check:focus+.btn-primary, .btn-primary:focus {
	color: #fff;
	background-color: #f75266;
	border-color: #b5a8a8;
	box-shadow: 0 0 0 0.25rem rgb(218 222 229/ 50%);
}

.btn-check:focus+.btn, .btn:focus {
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgb(218 222 229/ 50%);
}

/* 신고하기 */
.btn-danger, .btn-danger:hover, .btn-danger:active, .btn-danger:visited
	{
	background-color: #2551a8 !important;
	color: #fff;
	border-color: #2551a8;
}

/* 카트 우측 코끼리 */
.defaultKokiri {
	position: relative;
	left: 0%;
	bottom: 80px;
	width: 40px;
	height: 40px;
	background-color: white;
}

.btn-secondary, .btn-secondary:hover, .btn-secondary:active,
	.btn-secondary:visited {
	background-color: #a4a4a4 !important;
	color: #fff;
	border-color: #a4a4a4;
}

.btn-success, .btn-success:hover, .btn-success:active, .btn-success:visited
	{
	background-color: #f36f31 !important;
	color: #fff;
	border-color: #f36f31;
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

	<!--body-->
	<div class="container">
		<!--body-headline-->
		<div class="row">
			<div class="groupHeaderInfo col-sm-12 col-md-7 mt-4">
				<div class="groupImgBox d-flex justify-content-center">
          			<c:choose>
						<c:when test="${tbl_group_dto.sys_name ne null}">
							<img src="/group_profile/${tbl_group_dto.sys_name}"
								id="profile_image">
						</c:when>
						<c:otherwise>
							<img src="/resources/images/메인사진2(배경).png" id="profile_image">
						</c:otherwise>
					</c:choose>
        	</div>
        <div class="groupTitleTextBox d-flex align-items-center">
        	<div class="container">
			    <div class="row d-flex">
			      <div class="col-10 d-flex">
			        <div class="ms-3" style="font-size : 22px;">
			        <span><strong>[${tbl_group_dto.group_site}]</strong></span>
			        <strong>${tbl_group_dto.group_title}</strong>
			        </div>
			      </div>
			      <div class="col-2 d-flex">
			        <button type=" button" class="" id="wishListBtn" style="border:0; outline:0; background-color : #fff; font-size :24px;"><i class="fa-regular fa-heart"></i></button>
			        <button type=" button" class="d-none" id="wishCancelBtn" style="border:0; outline:0; color:red; background-color : #fff; font-size :24px;"><i class="fa-solid fa-heart"></i></button>
			      </div>
			    </div>
			 </div>
  		</div>
			</div>
      <!-- 우측 카드-->
			<div class="col-sm-12 col-md-5 mt-4">
          <div class="row" style="padding:34px; padding-top: 0px;" stlye="position : relative;">
            <!--호스트 프로필-->
            <div class="col-md-12 col-sm-12" id="groupTitleHeader">
              <div class="d-flex align-items-center mt-" style="height: 32%; border-bottom: 1px solid #ebeff0;; padding: 4px;">
                <div class="groupTitleHeaderImgBox">
					<c:choose>
						<c:when test="${mapList.TableJoinDTO[0].user_image ne null}">
							<img src="/profile/${mapList.TableJoinDTO[0].user_image}"
								id="profile_image">
						</c:when>
						<c:otherwise>
							<img src="/resources/images/profile.jpg" id="profile_image" class="kokiriImg">
						</c:otherwise>
					</c:choose>
                </div>
                <div class="hostInfo d-flex flex-column ms-4" style="font-family:InfinitySans-RegularA1;">
                  <div>${memberList[0].user_nickname}</div>
                  <div style="font-size: 16px;">안녕하세요? 모임 주최자 ${memberList[0].user_nickname}입니다! </div>
                </div>
                <div class="defaultKokiri">
                	<img src="/resources/images/kokiri.png" style="width:60px; height:60px;">
                </div>
              </div>
              <!--위치 카테고리 회원 찜 -->
              <div class="d-flex flex-column justify-content-center" style="padding: 4px; font-family:InfinitySans-RegularA1;" >
                <div class="groupInfoSum mt-3" style="font-size: 16px;">
                  <div class="row">
                    <div class="col-12 d-flex">
                      <div class="infoSumLogo">
                        <i class="fa-solid fa-location-dot"></i>
                      </div>
                      <div class="infoSumContent ms-2">
                        위치 : ${tbl_group_dto.group_site}, 대한민국
                      </div>
                    </div>
                  </div>
                </div>
                <div class="groupInfoSum mt-3" style="font-size: 16px;">
                  <div class="row">
                    <div class="col-12 d-flex">
                      <div class="infoSumLogo">
                        <i class="fa-solid fa-tags"></i>
                      </div>
                      <div class="infoSumContent ms-2">
                        카테고리 : ${tbl_group_dto.group_category}
                      </div>
                    </div>
                  </div>
                </div>
                <div class="groupInfoSum mt-3" style="font-size: 16px;">
                  <div class="row">
                    <div class="col-12 d-flex">
                      <div class="infoSumLogo">
                        <i class="fa-solid fa-user-group"></i>
                      </div>
                      <div class="infoSumContent ms-2">
                        회원 :  ${fn:length(memberList)}명 / ${tbl_group_dto.group_people}명
                      </div>
                    </div>
                  </div>
                </div>
                <div class="groupInfoSum mt-3" style="font-size: 16px;">
                  <div class="row">
                    <div class="col-12 d-flex">
                      <div class="infoSumLogo">
                        <i class="fa-solid fa-heart"></i>
                      </div>
                      <div class="infoSumContent ms-2">
                        찜 : ${fn:length(wishList)}
                      </div>
                    </div>
                  </div>
                </div>
                <!--버튼 디브-->
                <div class="mt-3" style="border-top: 1px solid #e0e3e8;;">
                  <div class="d-flex align-items-center justify-content-center mt-3 joinContainer">
                    <button type=" button" class="btn btn-primary ms-2 d-none mt-2 groupControllBtn" style="width:90%;"
                      id="quitGroupBtn">모임 탈퇴하기</button>
                    <button type=" button" class="btn btn-primary ms-2 mt-2 groupControllBtn" style="width:90%;"
                      id="joinGroupBtn">모임 가입하기</button>
                  </div>
                </div>

              </div>
            </div>

            <div class="row mt-2" id="hiddenGroupInfo">
              <div class="col-md-3 d-flex align-items-center">
                <div style="width:26px;"><i class="fa-solid fa-location-dot"></i></div>
                <div>위치 : 대한민국</div>
              </div>
              <div class="col-md-3 mt-1 d-flex align-items-center">
                <div style="width:26px;"><i class="fa-solid fa-tags"></i></div>
                <div>카테고리 : ${tbl_group_dto.group_category}</div>
              </div>
              <div class="col-md-3 mt-1 d-flex align-items-center">
                <div style="width:26px;"><i class="fa-solid fa-user-group"></i></div>
                <div>회원 : ${fn:length(memberList)}명 / ${tbl_group_dto.group_people}명</div>
              </div>
              <div class="col-md-3 mt-1 d-flex align-items-center">
                <div style="width:26px;"><i class="fa-solid fa-heart"></i></div>
                <div>찜 : ${fn:length(wishList)}</div>
              </div>
              <!--버튼 디브-->
              <div class="mt-3" style="border-top: 1px solid #e0e3e8;;">
                <div class="d-flex align-items-center justify-content-center mt-3 joinContainer">
                  <button type=" button" class="btn btn-primary ms-2 d-none" style="width:90%;"
                    id="quitGroupBtn">모임 탈퇴하기</button>
                  <button type=" button" class="btn btn-primary ms-2" style="width:90%;"
                    id="joinGroupBtn">모임 가입하기</button>
                </div>
              </div>
            </div>
          </div>
			 </div>
		</div>
	</div>
	<!--버튼 클릭-->
	<div class="mt-4 categoryContainer" style="font-family:InfinitySans-RegularA1;">
		<div class="container">
			<!-- 이용 -->
			<div class="row mt-2">
				<div class="col-sm-12 col-md-7 d-flex justify-content-center mt-1">
					<div class="groupActiveBtnBox d-flex justify-content-evenly align-items-center " style="color:grey; font-size:18px; border-bottom: 2px solid #e0e3e8;">
						<div class="groupInfoBtn categoryText groupDetailInfo">상세정보</div>
            			<div class="groupInfoBtn categoryText groupCautionInfo">주의사항</div>
            			<div class="groupInfoBtn categoryText groupMemInfo">멤버소개</div>
						<div class="groupActiveBtn categoryText">게시판</div>
						<div class="groupActiveBtn categoryText">일정</div>
						<div class="groupActiveBtn categoryText">채팅</div>
						<div class="groupActiveBtn groupManageBtn d-none categoryText">
							<a href="/group/toGroupMember?seq_group=${tbl_group_dto.seq_group}">모임관리</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!--상세 정보-->
	<div>
		<div class="container" style="font-family:InfinitySans-RegularA1;">
			<div class="row">
				<div class="col-md-7 d-flex justify-content-center">
					<!--상세 정보 내용-->
					<div class="groupInfo mt-4" style="width:100%;">
            			<span style=" font-size: 30px; background: linear-gradient(to top, #FFE400 20%, transparent 30%)">상세정보</span>
						<div class="groupContent mt-4" style="font-family: initial;">${tbl_group_dto.group_info}</div>
					</div>
				</div>
        <!--주의사항-->
        <div class="row mt-2">
          <div class="col-md-7 mt-3 cautionContainer" style="border-top: 1px solid #e0e3e8;">
            <div class="mt-3">
              <span style=" font-size: 30px; background: linear-gradient(to top, #FFE400 20%, transparent 30%)">주의사항</span>
                <div class="mt-3">
                  <h7> <i class="fa-solid fa-message"></i> <span class="ms-2">주최자
                    전달 메세지</span> </i></h7>
                </div>
                <div class="mt-1 ms-3">
                  <i class="fa-solid fa-check"></i> 인종, 언어, 성별 차별을 금지합니다.
                </div>
                <div class="mt-1 ms-3">
                  <i class="fa-solid fa-check"></i> 다른 모임 비방을 금지합니다.
                </div>
                <div class="mt-1 ms-3">
                  <i class="fa-solid fa-check"></i> 모임 분란 행위는 모임에서 탈퇴됩니다.
                </div>
                <div class="mt-1 ms-3">
                  <i class="fa-solid fa-check"></i> 연락이 지속적으로 안될시, 강제로 모임에서 탈퇴됩니다.
                </div>
                <div class="uselessBox"></div>
            </div>
          </div>
        </div>

        <!--멤버소개-->
        <div class="row mt-2">
          <div class="col-md-7" style="border-top: 1px solid #e0e3e8;">
            <div class="mt-3">
              <span style=" font-size: 30px; background: linear-gradient(to top, #FFE400 20%, transparent 30%)">멤버소개</span>
              <div class="groupMemberrInfo">
                <!-- 멤버 -->
                <div class="mt-4 d-flex">
                  <div class="d-flex align-items-end" style="font-size: 16px;">
                    멤버(<span class="memberCntSpan"></span>)명
                  </div>
                </div>
                <div class="row mt-2">
                  <c:forEach items="${mapList.TableJoinDTO}" var="list" begin="0"
                    end="${fn:length(memberList)}">
                    <div class="col-3 col-md-3 mt-1 memberProfileContainer">
                      <span class="d-none">${list.user_email}</span>
                      <div class="hostImg">
                        <c:choose>
                          <c:when test="${list.user_image ne null}">
                            <img src="/profile/${list.user_image}"
                              id="profile_image">
                          </c:when>
                          <c:otherwise>
                            <img src="/resources/images/profile.jpg" id="profile_image">
                          </c:otherwise>
                        </c:choose>
                      </div>
                      <div class="d-flex justify-content-center" style="width:100px;">${list.user_nickname}</div>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>
        </div>

				<!-- Profile Modal -->
				<div class="modal fade profileModal" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="justify-content-center modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">회원 프로필</h5>
								<h5 class="modal-title msg-title d-none" id="exampleModalLabel">쪽지 보내기</h5>
								<h5 class="modal-title report-title d-none" id="exampleModalLabel">신고하기</h5>
								<button type="button" class="btn-close" id="closeXmark"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 모임 프로필 -->
								<div class="row" id="profileTotalInfo">
									<div class="col-md-4 d-flex flex-column align-items-center">
										<div class="modalProfileImage">
											<img src="/resources/images/profile.jpg"
												id="memberProfileImg">
										</div>
										<div class="mt-2" style="font-size: 12px;">
											<span id="msgIcon"><i class="fa-solid fa-envelope"></i>&nbsp;쪽지보내기</span>
										</div>
									</div>
									<div class="col-md-8 modalProfileInfo">
										<div class="modalProfileName">
											<div class="mt-1" style="font-size: 20px;">
												<span id="profileName"></span>(<span id="profileNickname"></span>)
												<span id = "siren_icon"><img src = "/resources/images/group/siren_icon.png"></span>
											</div>
											<div class="mt-1" style="font-size: 14px;">회원</div>
										</div>
										<div class="modalProfileGender d-flex"
											style="font-size: 14px;">
											<div>
												<i class="fa-solid fa-location-dot"></i><span class="ms-1">지역
													: </span><span id="profileLocation"></span>
											</div>
											<div class="ms-3">
												<i class="fa-solid fa-mars-and-venus"></i><span class="ms-1">성별
													: </span><span id="profileGender"></span>
											</div>
										</div>
										<div class="modalProfileIntro" style="padding: 10px;">
											<div id="profileIntro"></div>
										</div>
									</div>
								</div>

								<!-- 쪽지보내기 버튼 클릭시 활성화 -->
								<div class="d-none" id="msgForm">
									<div class="row">
										<div class="col-md-12">
											<div>
												<i class="fa-solid fa-envelope"></i><span class="ms-2">받는
													사람</span>(<span id="receiverName"></span>)
											</div>
											<input type="text" class="form-control mt-2"
												id="user_receive" readonly>
										</div>
									</div>
									<div class="row mt-2">
										<div class="col-md-12">
											<div>
												<i class="fa-solid fa-comment"></i><span class="ms-2">쪽지
													내용</span>
											</div>
											<textarea class="form-control mt-2" id="msgContent" rows="3"
												style="resize: none;"></textarea>
										</div>
									</div>
								</div>
						<!-- 신고아이콘 클릭시 활성화 -->
                        <div class="d-none" id="reportForm">
                           <div class="row">
                              <div class="col-md-12">
                                 <div>
                                    <i class="fa-solid fa-envelope"></i><span class="ms-2">신고자</span>(<span id="reportName"></span>)
                                 </div>
                                 <input type="text" class="form-control mt-2"
                                    id="report_receive" readonly>
                              </div>
                           </div>
                           <div class="row mt-2">
                              <div class="col-md-12">
                                 <div>
                                    <i class="fa-solid fa-comment"></i><span class="ms-2">신고이유</span>
                                 </div>
                                 <textarea class="form-control mt-2" id="reportContent" rows="3"
                                    style="resize: none;"></textarea>
                              </div>
                           </div>
                        </div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal" id="closeBtn">Close</button>
								<button type="button" class="btn btn-success d-none closeXmark"
									id="sendMsgBtn">쪽지 보내기</button>
								<button type="button" class="btn btn-danger d-none closeXmark"
									id="reportBtn">신고하기</button>
							</div>
							<input type = "text" value="" id = "send_email" class = "d-none">
							<input type = "text" value="" id = "receive_email" class = "d-none">
							</div>
						</div>
					</div>
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
            <li class="list-inline-item"><a href="/board/toBoard">공지사항</a></li>
            <li class="list-inline-item">⋅</li>
            <c:choose>
               <c:when test="${not empty loginSession}">
                  <li class="list-inline-item"><a href="/mem/myPage">마이페이지</a></li>
                  <li class="list-inline-item">⋅</li>
                  <li class="list-inline-item"><a href="/login/toLogout">로그아웃</a></li>
               </c:when>
               <c:otherwise>
                  <li class="list-inline-item"><a href="/signup/toSignupAgree">회원가입</a></li>
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
            <p class="text-muted small mb-4 mb-lg-0">
              끼리끼리(주) 대표 : 이호준 | 개인정보관리책임자 : 김영완 |
              사업자등록번호 : 22-02-22
            </p>
            <p class="text-muted small mb-4 mb-lg-0">
              주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩
            </p>
            <p class="text-muted small mb-4 mb-lg-0">
              &copy; Your Website 2022. All Rights Reserved.
            </p>
          </div>
          <div class="col-lg-3 h-100 text-center text-lg-start my-auto">
            <ul class="list-inline mb-0">
            <li class="list-inline-item me-4"><a
               href="https://ko-kr.facebook.com"><i class="bi-facebook fs-3"></i></a></li>
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
	// width 사이즈 감지
	  window.onresize = function(){
	    let widthSize = document.documentElement.clientWidth;
	    console.log(widthSize);
	      if(widthSize >1200  && widthSize <= 1900 ) {
	        $(window).scroll(function(){
	         $("#groupTitleHeader").css("margin-top",Math.max(-154,0-$(this).scrollTop()));
	      });
	      }else if(widthSize > 1000 && widthSize <= 1200) {
	        $("#groupTitleHeader").css("margin-top",Math.max(-180,0-$(this).scrollTop()));
	      }
	      else if(widthSize >768 && widthSize <= 1000 ){
	        $("#groupTitleHeader").css("margin-top",Math.max(-220,0-$(this).scrollTop()));
	      }
	  }

	// 특정위치로 이동, 색상 변경
	$(".categoryText").on("click",function(e) {
		let selectedWord = $(this).html();
		console.log(selectedWord);
		if(selectedWord == "상세정보") {
			var offset = $(".groupInfo").offset(); //해당 위치 반환
			$("html, body").animate({scrollTop: offset.top},400);
		}else if(selectedWord == "주의사항") {
			var offset = $(".cautionContainer").offset(); //해당 위치 반환
			$("html, body").animate({scrollTop: offset.top},400);
		}else if(selectedWord == "멤버소개") {
			var offset = $(".groupMemberrInfo").offset(); //해당 위치 반환
			$("html, body").animate({scrollTop: offset.top},400);
		}

	})

    let realMemberCnt = ${fn:length(memberList)}; // 주최자를 제외한 멤버수
    $(".memberCntSpan").text(realMemberCnt); // 주최자를 제외한 멤버수

    let seq_group = "${tbl_group_dto.seq_group}"; // 현재 모임 번호
    let loginSession_id = "${loginSession_id}"; // 현재 로그인 세션 아이디
    let loginSession_nickName = "${loginSession_nickName}"// 현재 로그인 세션 닉네임
    let hostEmail = "${memberList[0].user_email}"; // 주최자 아이디
   	let totalGroupCntById = "${totalGroupCntById}"; // 현재 로그인된 아이디의 모임 가입수

     //해당 모임 멤버 프로필 보기
    $(".memberProfileContainer").on("click",function() {
        let findUserEmail = $(this).find('span').html(); // 공백이 포함되서 나옴
        let user_email = findUserEmail.trim(); // 공백을 없앰
          // $("#user_receive").val(user_email); //

        $.ajax ({
           url : "/group/selectMemberProfile",
           type : "post",
           data : {"user_email" : user_email},
           dataType : "json",
           success : function(data) {
              // 회원의 사진이 있을 때만 넣기
              if(data.profileList[0].user_image != null) {
                 document.getElementById("memberProfileImg").src = "/profile/"+data.profileList[0].user_image;
              }else if(data.profileList[0].user_image == null) {
            	  document.getElementById("memberProfileImg").src= "/resources/images/profile.jpg"
              }
              
              
              $("#profileName").text(data.profileList[0].user_name); // 해당 회원 이름 모달값으로 넣어주기
              $("#profileNickname").text(data.profileList[0].user_nickname); // 해당 회원 닉네임 모달값으로 넣어주기
              $("#profileLocation").text(data.siteList[0].area); // 해당 회원 선호 지역 모달값으로 넣어주기
              $("#profileGender").text(data.profileList[0].user_gender); // 해당 회원 성별 모달값으로 넣어주기
              $("#profileIntro").text(data.profileList[0].user_intro); // 해당 회원 소개글 모달값으로 넣어주기
              $('.profileModal').modal('show'); // 성공했을때만 모달열리게
              $("#receiverName").text(data.profileList[0].user_name) // 해당 회원 이름 메세지 받는 사람에 넣어주기
              $("#reportName").text('${loginSession.user_name}'); // 해당 회원 이름 신고자에 넣어주기
              $("#user_receive").val(data.profileList[0].user_nickname); // 쪽지 보내기 -> 받는사람 닉네임 넣어주기
              $("#report_receive").val(data.profileList[0].user_nickname); // 신고하기 -> 신고자 닉네임 넣어주기


              $("#receive_email").val(data.profileList[0].user_email); // 신고하기 -> 신고자 이메일 넣어주기
           },
           error : function(e) {
        	   Swal.fire({
					  icon: 'error',
					  title: '에러가 발생했네요..',
					  text: '관리자에게 문의해주세여!',
					});
           }
        })
      })

      // 쪽지보내기 아이콘 클릭시
      $("#msgIcon").on("click",function() {
         // 로그인 세션이 없을 때
         if(loginSession_id == "youHaveToLogin" || loginSession_nickName == "youHaveToLogin") {
        	Swal.fire('로그인 후 이용가능합니다');
            return;
         }
          $("#profileTotalInfo").addClass("d-none"); // 프로필 내용 안보이게
          $(".modal-title").addClass("d-none"); // 회원프로필 타이틀 안보이게
          $(".msg-title").removeClass("d-none"); // 쪽지보내기 타이틀 보이게
          $("#msgForm").removeClass("d-none"); // 쪽지 양식 Form 보이게
          $("#sendMsgBtn").removeClass("d-none"); // 쪽지 보내기 버튼 보이게
        })

     //쪽지보내기 버튼 클릭
        $("#sendMsgBtn").on("click",function() {
           if($("#msgContent").val() == "") {
              Swal.fire('내용을 입력해주세요');
              return;
           }

           let user_receive = $("#user_receive").val(); // 받는 사람 닉네임
           let msgContent = $("#msgContent").val(); // 쪽지 내용
           $.ajax ({
              url : "/user/insertMessage",
              type : "post",
            data : {"user_receive" : user_receive, "msgContent" : msgContent, "user_send" : loginSession_nickName},
            dataType : "text",
            success : function(data) {
               if(data == "success") {
                  Swal.fire('쪽지 보내기 성공');
                  $('.profileModal').modal('hide'); // 쪽지 보내기 성공시 모달 닫기
                $("#msgContent").val('');
               }else {
                  Swal.fire('쪽지 보내기 실패');
               }
            },
            error : function(e) {
            	Swal.fire({
					  icon: 'error',
					  title: '에러가 발생했네요..',
					  text: '관리자에게 문의해주세여!',
					});
            }
           })
            $("#profileTotalInfo").removeClass("d-none"); // 프로필 내용 보이게
            $("#msgForm").addClass("d-none"); // 쪽지 양식 Form 안보이게
            $("#sendMsgBtn").addClass("d-none"); // 쪽지 보내기 버튼 안보이게
        })

    // close 버튼 클릭시
       $("#closeBtn,#closeXmark").on("click",function() {
          $("#profileTotalInfo").removeClass("d-none"); // 프로필 내용 보이게
          $(".modal-title").removeClass("d-none"); // 회원프로필 타이틀 보이게
          $(".msg-title").addClass("d-none"); // 쪽지보내기 타이틀 안보이게
          $(".report-title").addClass("d-none"); // 신고하기 타이틀 안보이게
          $("#msgForm").addClass("d-none"); // 쪽지 양식 Form 안보이게
          $("#sendMsgBtn").addClass("d-none"); // 쪽지 보내기 버튼 안보이게
          $("#reportForm").addClass("d-none"); // 신고 양식 Form 안보이게
          $("#reportBtn").addClass("d-none"); // 신고하기 버튼 안보이게
       })

    $(document).ready(function() {
       // 해당 세션 id와 주최자가 같으면 모임 관리 페이지 보이게
       if(loginSession_id == hostEmail) {
          $(".groupManageBtn").removeClass("d-none");
       }

       // 현재 세션 id가 그룹멤버에 있으면 게시판,일정, 채팅 활동가능
       $(".groupActiveBtn").on("click",function() {
          let memberList = new Array(); // 빈 배열 생성
            <c:forEach items="${memberList}" var="dto">
                 memberList.push("${dto.user_email}");
            </c:forEach>
            for (let i = 0; i < memberList.length; i++) {
                if(memberList[i] === loginSession_id) {
                   // 그룹 활동 버튼
                   let activeText = this.innerHTML;
                   if(activeText == "게시판"){
                      location.href = "/Gboard/toBoard?seq_group="+seq_group;
                   }else if(activeText == "일정") {
                      location.href = "/cal/toGroupCalendar?seq_group="+seq_group;
                   }else if(activeText == "채팅") {
                	   let url="/group/toChat?seq_group="+seq_group;
                	   let name = "PopupWin";
                	   let option = "width=600,height=600,left=600, top=200";
                	   window.open(url, name, option);
                   }
                   return;

                }
            }
             Swal.fire('모임 회원만 가능합니다');
       })

        // 세션이 모임에 가입되어 있으면 모임 탈퇴하기, 가입 안되어있으면 모입 가입하기
       // 멤버 리스트 체크 -> 모임 가입하기인지 모임 탈퇴인지 판별
       let memberList = new Array(); // 빈 배열 생성
        <c:forEach items="${memberList}" var="dto">
             memberList.push("${dto.user_email}");
        </c:forEach>
        for (let i = 0; i < memberList.length; i++) {
            if(memberList[i] == loginSession_id) {
               $("#joinGroupBtn").addClass("d-none"); // 가입 버튼 안보이게
               $("#quitGroupBtn").removeClass("d-none"); // 모임 탈퇴버튼 보이게

               // 그룹 활동 버튼
            }
        }

       // 찜하기 판별 -> 찜 명단에 있으면 찜취소 있으면 찜하기
       let wishList = new Array();
       <c:forEach items="${wishList}" var="dto">
            wishList.push("${dto.user_email}");
       </c:forEach>
       for (let i = 0; i < wishList.length; i++) {
           if(wishList[i] == loginSession_id) { // 찜한 목록과 세션의 아이디
              $("#wishListBtn").addClass("d-none");
               $("#wishCancelBtn").removeClass("d-none");
           }
       }

    })
         // 모임 탈퇴
         $("#quitGroupBtn").on("click",function() {
            if(hostEmail == loginSession_id) {
               location.href = "/group/toGroupMember?seq_group="+seq_group;
            }else {
               Swal.fire({
                 title: '정말 모임에서 떠나시겠습니까?',
                 text: "그 동안의 모임 기록들이 다 사라집니다.",
                 icon: 'warning',
                 showCancelButton: true,
                 confirmButtonColor: '#3085d6',
                 cancelButtonColor: '#d33',
                 cancelButtonText: '아니요!',
                 confirmButtonText: '네 떠날게요!'
               }).then((result) => {
                 if (result.isConfirmed) {

                    $.ajax({
                       url : "/group/quitGroupMember",
                       type : "post",
                       data : {"seq_group" : seq_group ,"user_email" : loginSession_id},
                         success : function(data) {

                            if(data == "success") {
                             Swal.fire(
                                 '모임에서 탈퇴하였습니다',
                                 '그 동안 감사했습니다!',
                                 'success'
                               )
                              setTimeout(function() {
                                  window.location.href = "";
                             },800);
                            }else {
                               alert("모임 탈퇴 실패");
                            }
                         },
                         error : function(e) {
                        	 Swal.fire({
   							  icon: 'error',
   							  title: '에러가 발생했네요..',
   							  text: '관리자에게 문의해주세여!',
   							});
                         }
                    })

                 }
               })
            }
         })
      // 모임 가입
      $("#joinGroupBtn").on("click",function(){
         // 만약에 현재 로그인 세션이 없다면
         if(loginSession_id == "youHaveToLogin" || loginSession_nickName == "youHaveToLogin") {
            Swal.fire('회원가입을 하시고 이용해주세요');
            return;
         }

         // 현재 아이디의 모임가입한 수가 3개가 넘으면 모임 가입 금지
         if(totalGroupCntById >= 3) {
            Swal.fire('모임은 최대 3개만 가입가능합니다');
             return;
         }
         let curMemberCnt = ${fn:length(memberList)}; // 현재 멤버수 jstl memberList 길이
         let totalMemberCnt = ${tbl_group_dto.group_people}; // 수용가능 멤버수
         if(curMemberCnt < totalMemberCnt) { // 현재 멤버수 < 수용 멤버수

            // 가입 신청한 명단에 현재 id 세션이 있는지 판별
            let applyList = new Array();
              <c:forEach items="${applyList}" var="dto">
                   applyList.push("${dto.user_email}");
              </c:forEach>
              for (let i = 0; i < applyList.length; i++) {
                  if(applyList[i] == loginSession_id) { // 가입 대기
                     Swal.fire(
                             '가입 대기중',
                             '호스트가 확인중에 있습니다!',
                             'question'
                           )
                     return;
                  }
              }
              // 가입 신청한 명단에 현재 id 세션이 없으면 실행
            $.ajax({
               url : "/group/applyGroupMember",
               type: "post",
               data : {"seq_group" : seq_group,"user_email" : loginSession_id},
               success : function(data) {
                      if(data == "success") {
                    	  console.log("hello");
                        Swal.fire(
                        '모임가입 신청 완료!',
                        '호스트가 승인을 할 때까지 기다려주세요!',
                        'success'
                     )
                     // 1 초있다가 페이지 로드
                     setTimeout(function() {
                        window.location.href = "";
                     },1000);
                      }
                   },
                   error : function(e) {
                	   Swal.fire({
							  icon: 'error',
							  title: '에러가 발생했네요..',
							  text: '관리자에게 문의해주세여!',
							});
                   }
            })
         }else {
            Swal.fire({
                  icon: 'error',
                  title: 'Oops...',
                  text: '모임 정원이 가득찼습니다!',
                });
         }
      })

      // 찜하기
      $("#wishListBtn").on("click",function() {
         // 만약에 현재 로그인 세션이 없다면
         if(loginSession_id == "youHaveToLogin" || loginSession_nickName == "youHaveToLogin") {
            Swal.fire('회원가입을 하시고 이용해주세요');
            return;
         }
         $.ajax({
            url : "/group/insertWishList",
            type : "post",
            data : {"seq_group" : seq_group, "user_email" : loginSession_id},
            success : function(data) {
               if(data == "success") {
                  Swal.fire('찜 완료');
                  $("#wishListBtn").addClass("d-none"); // 찜한 즉시 wishList 버튼 사라지게
                     $("#wishCancelBtn").removeClass("d-none"); // 찜한 취소한 즉시 wishList 버튼 보이게
                     setTimeout(function() {
                     window.location.href = "";
                  },500);
               }
            },error : function(e) {
            	Swal.fire({
					  icon: 'error',
					  title: '에러가 발생했네요..',
					  text: '관리자에게 문의해주세여!',
					});
            }
         })
      })

      // 찜하기 취소
      $("#wishCancelBtn").on("click",function() {
         $.ajax({
            url : "/group/deletetWishList",
            type : "post",
            data : {"seq_group" : seq_group, "user_email" : loginSession_id},
            success : function(data) {
               if(data == "success") {
                  Swal.fire('찜 취소');
                  $("#wishListBtn").removeClass("d-none"); // 찜한 즉시 wishList 버튼 사라지게
                     $("#wishCancelBtn").addClass("d-none"); // 찜한 취소한 즉시 wishList 버튼 보이게
                     setTimeout(function() {
                     window.location.href = "";
                  },500);
               }
            },
            error : function(e) {
            	Swal.fire({
					  icon: 'error',
					  title: '에러가 발생했네요..',
					  text: '관리자에게 문의해주세여!',
					});
            }
         })
      })

      // 그룹 설명 사진 크기 조절
      $(".groupContent p img").attr('style', "width:100%; height:440px;");

 // 신고하기 아이콘 클릭시 모달창 신고하는걸로 바꾸기
    $("#siren_icon").on("click", function(){
         // 로그인 세션이 없을 때
         if(loginSession_id == "youHaveToLogin" || loginSession_nickName == "youHaveToLogin") {
        	 Swal.fire('로그인 후 이용가능합니다');
            return;
         }
          $("#profileTotalInfo").addClass("d-none"); // 프로필 내용 안보이게
          $(".modal-title").addClass("d-none"); // 회원프로필 타이틀 안보이게
          $(".report-title").removeClass("d-none"); // 신고하기 타이틀 보이게
          $("#reportForm").removeClass("d-none"); // 신고 양식 Form 보이게
          $("#reportBtn").removeClass("d-none"); // 쪽지 보내기 버튼 보이게
    })

    //신고하기 버튼 클릭
         $("#reportBtn").on("click",function() {
            if($("#reportContent").val() == "") {
               Swal.fire('내용을 입력해주세요');
               return;
            }
            let receive_email = $("#receive_email").val(); // 받는 사람 이메일
            let report_receive = $("#report_receive").val(); // 받는 사람 닉네임
            let reportContent = $("#reportContent").val(); // 쪽지 내용
            console.log("신고당하는 사람 닉네임 : " + report_receive);
            console.log("신고당하는 사람 이메일 : " + receive_email);
            console.log("신고 내용 : " + reportContent);
            console.log("신고 하는사람 닉네임 : " + loginSession_nickName);
            console.log("신고 하는사람 이메일 : " + loginSession_id);
          Swal.fire({
             title: '정말 신고하시겠습니까?',
             text: "유저 신고는 신중히 부탁드립니다.",
             icon: 'warning',
             showCancelButton: true,
             confirmButtonColor: '#3085d6',
             cancelButtonColor: '#d33',
             confirmButtonText: '신고하기'
          }).then((result) => {
             if (result.isConfirmed) {
             $.ajax ({
                  url : "/user/insertreport",
                   type : "post",
                   data : {"send_email" : loginSession_id, "receive_email" : receive_email,"report_send" : loginSession_nickName, "report_receive" : report_receive, "report_reason" : reportContent},
                   dataType : "text",
                   success : function(data) {
                      if(data == "success") {
                         Swal.fire('신고하기 성공');
                         $('.profileModal').modal('hide'); // 신고 성공시 모달 닫기
                       $("#reportContent").val('');
                      }else if(data == "noMore") {
                    	  Swal.fire('이미 해당 인원을 신고하였습니다');
                      }
                      else {
                         Swal.fire('신고하기 실패');
                      }
                   },
                   error : function(e) {
                      Swal.fire({
                        icon: 'error',
                        title: '에러가 발생했네요..',
                        text: '관리자에게 문의해주세여!',
                      });
                   }
                  })
             }
             $("#profileTotalInfo").removeClass("d-none"); // 프로필 내용 보이게
             $("#reportForm").addClass("d-none"); // 신고 양식 Form 안보이게
             $("#reportBtn").addClass("d-none"); // 신고하기 버튼 안보이게
         })
         })

    </script>
</body>
</html>