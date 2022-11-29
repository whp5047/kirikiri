<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>개인정보 수정</title>
<style>
/* 눈누 폰트 */
@font-face {
   font-family: 'MICEGothic Bold';
   src:
       url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
   font-weight: 700;
   font-style: normal;
}
* {
	box-sizing: border-box;
	font-family: 'MICEGothic Bold';
}

body {
	background-color: #d2e3ec;
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
.border-bottom {
	background-color: white;
}

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

/* 바디*/
.signupBox {
	margin-top: 100px;
	width: 1000px;
	height: auto;
	border: 1px solid d2e3ec;
	text-align: center;
	margin: auto;
	background-color: #d2e3ec;
}

#userInfoBox {
	padding-top: 3px;
	margin-top: 100px;
	width: 93%;
	margin: auto;
	border: 1px solid d2e3ec;
	background-color: white;
}

#userInfoBox>.row:first-child>img {
	margin-top: 20px;
}

#userInfoBox>.row:last-child {
	padding-bottom: 40px;
}

#userInfoBox-profile {
	padding-top: 10px;
	width: 93%;
	margin: auto;
	border: 1px solid d2e3ec;
	background-color: white;
	display: none;
}

#introMessage {
	height: 100%;
	width: 100%;
	resize: none;
}

#p_img {
	width: 150px;
	height: 150px;
}

#profile_img {
	margin: auto;
	margin-bottom: 30px;
	width: 60%;
	border: 1px solid black;
}

.profile_imgContainer {
	width: 150px;
	height: 150px;
	border: 1px solid lightblue;
	border-radius: 50%;
	text-align: center;
	overflow: hidden;
	margin: auto;
}

#introMessage {
	height: 100%;
	width: 100%;
	display: inline;
}

.col-3 {
	display: inline;
}

.form-control {
	width: 98%;
}

.form-control[readonly] {
	background-color: white;
}

.hobby {
	width: 7%;
	height: 40%;
}

label {
	margin: 5px;
	align-self : center;
}

button {
	margin: 30px;
	margin-bottom: 70px;
	width: 14%;
	height: 30%;
}

.row:not(#menu .row) {
   margin-top: 10px;
}

span {
	color: white;
	font-size: 0.05rem;
}

input {
	margin: 5px;
}
.swal2-styled{
	padding:0px;
}
/* 회원단계 1*/
#signup-1 {
	color: #030087;
	text-shadow: 1px 1px 2px darkblue;
}

.circelLine-text-left {
	color: #030087;
	text-shadow: 1px 2px 2px darkblue;
}

.circelLine-text-right {
	margin-left: 15px;
}

p {
	margin-top: 10px;
}

#nicknameCheck, #emailCheck, #idCheck, #phoneCheck {
	width: 80%;
	margin: 0px;
	padding: 0px;
	height: 90%;
}

#email-id, #email-domain {
	display: inline;
	width: 43%;
	padding-left: 0px;
}

#phone2, #phone3, #phone1 {
	margin-left: 5px;
	display: inline;
	width: 30%;
}

#singupBackBtn, #completeBtn {
	display: none;
}

.hobbyBox .col:last-child {
	text-align: left;
}

.bthday {
	display: inline-block;
	text-align: left;
	width: 20%;
}

h1 {
	margin-top: 30px;
}

      /*풋터 영역*/
      .footer-imgBox img{
         max-width: 100%;
      }
      
      .footerWrapper{
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
         text-align:center;
      }
      .footer-imgBox {
         height: 100%;
         text-align:center;
      }
</style>
</head>
<script>
	$(document).ready(function() {
		$("#singupBackBtn").click(function() {
			$("#signup-1").css("text-shadow", "1px 2px 2px darkblue");
			$(".circelLine-text-left").css({
				"color" : "#030087",
				"text-shadow" : "1px 2px 2px darkblue"
			});
			$("#signup-2").css("text-shadow", "none");
			$("#circelLine-text-middle").css({
				"color" : "white",
				"text-shadow" : "none"
			});
			$("#backPageBtn").show();
			$("#nextBtn").show();
			$("#userInfoBox").show();
			$("#userInfoBox-profile").hide();
			$("#singupBackBtn").hide();
			$("#completeBtn").hide();
		})

		$("#nextBtn").click(function() {
			$("#signup-1").css("text-shadow", "none");
			$(".circelLine-text-left").css({
				"color" : "white",
				"text-shadow" : "none"
			});
			$("#signup-2").css("text-shadow", "1px 2px 2px darkblue");
			$("#circelLine-text-middle").css({
				"color" : "#030087",
				"text-shadow" : "1px 2px 2px darkblue"
			});
			$("#backPageBtn").hide();
			$("#nextBtn").hide();
			$("#userInfoBox").hide();
			$("#userInfoBox-profile").show();
			$("#singupBackBtn").show();
			$("#completeBtn").show();
		})

	})
</script>
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
							<a class="navbar-brand mb-2 mb-lg-0" href="#">
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
								<li class="nav-item"><a class="nav-link" href=" ">자유게시판</a></li>
								<c:choose>
									<c:when test="${empty loginSession}">
										<li class="nav-item"><a class="nav-link" href=" ">로그인</a></li>
										<li class="nav-item"><a class="nav-link" href=" ">회원가입</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link" href=" ">마이페이지</a></li>
										<li class="nav-item"><a class="nav-link" href=" ">로그아웃</a></li>
									</c:otherwise>
								</c:choose>


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
							<li class="nav-item"><a class="nav-link mx-2" href="">자유
									게시판</a></li>
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
	<!--바디-->
	<div class="container signupBox">
		<div class="row">
			<div class="col">
				<h1>내 정보 수정</h1>
			</div>
		</div>
		<!-- info 영역-->
		<form action="/mem/profileModify" method="post" id="profileModifyForm">
			<div id="userInfoBox">
				<div class="row p-3">
				</div>
				<div class="row">
					<div class="col-md-3">
						<p id="nameTitle">이름</p>
					</div>
					<div class="col-md-7">
						<input type="text" id="name" name="user_name" class="form-control" value="${memberdto.user_name}" readonly>
						<div style="text-align:start;">
							<span class="d-none" id="nameText" style="color:red; font-size:0.8rem; margin-left:8px;">** 이름은 수정할 수 없습니다. **</span>					
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>닉네임</p>
					</div>
					<div class="col-md-5">
						<input type="text" id="nickname" name="user_nickname"
							class="form-control user_nickname" value="${memberdto.user_nickname}" placeholder="닉네임은 12자까지 가능합니다" maxlength="12">
					</div>
					<div class="col-md-2">
						<button type="button" class="btn btn-secondary" id="nicknameCheck" disabled>중복확인</button>
					</div>
					<input type="text" class="checkNickname d-none" value="${memberdto.user_nickname}">
					<div class="col-2"></div>
				</div>
				<script>
					/* 실시간으로 검색후 중복확인 버튼 disabled 속성 제거 */
					const checked = {
						nickname: false,
						phone: false
					}
					let nickname;
					$("#nickname").on("input",function(){
						nickname= $(this).val();
						if($(".checkNickname").val() !== nickname){
							$("#nicknameCheck").attr("disabled",false);
						}else{
							$("#nicknameCheck").attr("disabled",true);
						}
					})
						$(".user_nickname").change(function(){
		         $("#nickname-col").empty();
		         let nicknameRegex = /^[0-9a-zA-Z가-힣]{2,12}$/;
		         let nicknameRegex2 = /^[0-9]{2,12}$/;
		         let nicknameRegex3 = /^((l){2,12}|(i){2,12}){2,12}$/;
		         let nicknameRegex4 = /^(l|i|1)*$/;

		         if(!nicknameRegex.test($("#user_nickname").val())){
		            invalidNickname();
		                 return;
		                 
		         }else if (nicknameRegex2.test($("#user_nickname").val())){
		            invalidNickname();
		            return;
		            
		         }else if (nicknameRegex3.test($("#user_nickname").val())){
		            invalidNickname();
		            return;
		            
		         }else if (nicknameRegex4.test($("#user_nickname").val())){
		            invalidNickname();
		            return;
		                  
		             }
		         
		         
		      });
					/* 중복확인 */
					$("#nicknameCheck").on("click",function(){
						let user_nickname = $("#nickname").val();
						let nicknameRegex = /^[0-9a-zA-Z가-힣]{2,12}$/;
						let nicknameRegex2 = /^[0-9]{2,12}$/;
				        let nicknameRegex3 = /^((l){2,12}|(i){2,12}){2,12}$/;
				        let nicknameRegex4 = /^(l|i|1)*$/;

						if(!nicknameRegex.test(user_nickname) || nicknameRegex2.test(user_nickname) || nicknameRegex3.test(user_nickname) || nicknameRegex4.test(user_nickname)){
							Swal.fire({
								  icon: 'error',
								  title: 'Oops...',
								  text: '형식에 맞지 않은 닉네임입니다.',
								})
						}else{
							$.ajax({
								url:"/mem/nicknameCheck",
								type:"post",
								dataType:"json",
								data:{"user_nickname": user_nickname},
								success:function(data){
									console.log("data : ",data);
									if(data == 1){
										Swal.fire({
										  title: '중복된 닉네임입니다.',
										  showClass: {
										    popup: 'animate__animated animate__fadeInDown'
										  },
										  hideClass: {
										    popup: 'animate__animated animate__fadeOutUp'
										  }
										})
									}else if(data == 0){
										Swal.fire({
											  title: '사용 가능한 닉네임입니다.',
											  text: "이 닉네임으로 바꾸시겠습니까?",
											  icon: 'warning',
											  showCancelButton: true,
											  confirmButtonColor: '#3085d6',
											  cancelButtonColor: '#d33',
											  confirmButtonText: '변경!',
											  cancelButtonText: '취소!'
											}).then((result) => {
											  if (result.isConfirmed) {
												checked.nickname = true;
											    Swal.fire(
											      '완료!',
											      '닉네임이 변경되었습니다.',
											    )
											  } else {
												  $("#nickname").val($(".checkNickname").val());
											  }
											})
										}
								},
								error:function(e){
									console.log(e);
								}
							})
						}
					})
				</script>
				<div class="row">					
					<div class="col-md-3">
						<p>생년월일</p>
					</div>
					<div class="col-md-8 d-flex justify-content-start">
						<input type="text" name="year" class="form-control bthday" maxlength="4" value="${date.get(0)}" style="width:140px;" readonly>
						<label for="year">년</label> 
						<input type="text" name="month" class="form-control bthday" maxlength="2" value="${date.get(1)}" style="width:130px;" readonly>
						<label for="month">월</label> 
						<input type="text" name="day" class="form-control bthday" maxlength="2" value="${date.get(2)}" style="width:130px;" readonly>
						<label for="day">일</label> 
						<input type="text" id="user_bd" name="user_bd" class="form-control d-none" value="${memberdto.user_bd}">
						
						<div style="text-align:start;">
							<span class="d-none" id="birthText" style="color:red; font-size:0.8rem; margin-left:8px;">** 생년월일은 수정할 수 없습니다. **</span>					
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
				
				<c:if test="${loginType eq 'general'}">
               <div class="row">
                  <div class="col-md-3">
                     <p>비밀번호</p>
                  </div>
                  <div class="col-md-7" style="text-align: left;">
                     <input type="password" id="password" name="user_pw" class="form-control" style="font-family:none;">
                     <span class="d-none" id="wrong-password-regex" style="color:red; font-size:0.8rem; margin-left:8px;">** 비밀번호의 형식에 맞지 않습니다. **</span>
                     <ul class="desc" style="font-size: 0.8rem; padding: 10px">
                        <li>영문, 숫자, 특수문자를 혼합하여 최소 8자리 이상 20자리 이하로 설정해 주세요.</li>
                        <li>기타 일반 정보 등으로부터 추측이 용이한 비밀번호는 피해주세요.</li>
                        <li>타사 서비스에서 사용하는 비밀번호와 동일한 비밀번호를 사용하지 마십시오.</li>
                        <li>번호를 바꾸시려면 중복확인은 필수 항목입니다.</li>
                     </ul>
                  </div>
                  <div class="col-2"></div>
               </div>      
               <div class="row">
                  <div class="col-md-3">
                     <p>비밀번호 확인</p>
                  </div>
                  <div class="col-md-7" style="text-align: left;">
                     <input type="password" id="password-check" class="form-control" style="font-family:none;">
                     <span class="d-none" id="wrong-password-check" style="color:red; font-size:0.8rem; margin-left:8px;">** 비밀번호와 맞지 않습니다. **</span>
                     <span class="d-none" id="right-password-check" style="color:green; font-size:0.8rem; margin-left:8px;">** 비밀번호와 일치합니다. **</span>
                  </div>
                  <div class="col-2"></div>
               </div>               
            </c:if> 
            
            <c:if test="${loginType ne 'general'}">
               <div class="row d-none">
                  <div class="col-md-3">
                     <p>비밀번호</p>
                  </div>
                  <div class="col-md-7" style="text-align: left;">
                     <input type="password" id="password" name="user_pw" class="form-control" style="font-family:none;" disabled>
                     <span class="d-none" id="wrong-password-regex" style="color:red; font-size:0.8rem; margin-left:8px;">** 비밀번호의 형식에 맞지 않습니다. **</span>
                        <span style="color:red; font-size: 0.8rem; padding: 10px">** 소셜로 로그인하시면 비밀번호 수정이 안됩니다 ** </span>
                  </div>
                  <div class="col-2"></div>
               </div>
               <div class="row d-none">
                  <div class="col-md-3">
                     <p>비밀번호 확인</p>
                  </div>
                  <div class="col-md-7" style="text-align: left;">
                     <input type="password" id="password-check" class="form-control d-none" style="font-family:none;" disabled>
                     <span class="d-none" id="wrong-password-check" style="color:red; font-size:0.8rem; margin-left:8px;">** 비밀번호와 맞지 않습니다. **</span>
                     <span class="d-none" id="right-password-check" style="color:green; font-size:0.8rem; margin-left:8px;">** 비밀번호와 일치합니다. **</span>
                  </div>
                  <div class="col-2"></div>
               </div>                        
            </c:if> 
            <input type="text" class='d-none' value="${memberdto.user_pw}" name="data_password">
				<div class="row">
					<div class="col-md-3">
						<p>이메일</p>
					</div>
					<div class="col-md-7">
						<input type="text" id="email-id" class="form-control email"
							style="text-align: center; width:100%;" value="${memberdto.user_email}" readonly>
						<input type="text" id="email-domain" name="user_email"
							class="form-control d-none" value="${memberdto.user_email}"
							readonly>
						<div style="text-align:start;">
							<span class="d-none" id="emailText" style="color:red; font-size:0.8rem; margin-left:8px;">** 이메일은 수정할 수 없습니다. **</span>					
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<p>휴대전화</p>
					</div>
					<div class="col-md-5">
						<select id="phone1" class="form-select">
							<option selected>${phone.get(0)}</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> 
						<input type="text" id="phone2" class="form-control" style="text-align:center;" maxlength="4" value="${phone.get(1)}" > 
						<input type="text" id="phone3" class="form-control" style="text-align:center;"  maxlength="4"  value="${phone.get(2)}" >
						<input type="text" class="checkPhone1 d-none" value="${phone.get(0)}" >
						<input type="text" class="checkPhone2 d-none" value="${phone.get(1)}" >
						<input type="text" class="checkPhone3 d-none" value="${phone.get(2)}" >
						<input type="text" class="checkPhone d-none" value="${memberdto.user_phone}">
						<input type="text" class="d-none" name="user_phone">
					</div>
					<div class="col-md-2">
						<button type="button" class="btn btn-secondary" id="phoneCheck" disabled>중복확인</button>
					</div>
					<div class="col-md-2"></div>
				</div>
				<script>
				/* 비밀번호 regex 실행 후 span 뿌려주기 */
				let passwordRegex = /^$|^[a-z0-9!@#$]{8,20}$/;
				
				const test = document.querySelector('#password');
	            console.log(test)
	            test.addEventListener('change', (e) => {
	            	let password = e.target.value;
	                console.log(e.target.value);
	                if(!passwordRegex.test(password)){
	                	$("#wrong-password-regex").removeClass("d-none");
	                }else if(passwordRegex.test(password)){
	                	$("#wrong-password-regex").addClass("d-none");
	                }
	            })
				
				/* phone 실시간으로 검색후 중복확인 버튼 disabled 속성 제거 */
				let phone1 = $(".checkPhone1").val();
				$("#phone1").on("input",function(){
					phone1 = $(this).val();
					console.log(phone1)
					if($(".phone1Check").val() !== phone1){
						$("#phoneCheck").attr("disabled",false);
					}else{
						$("#phoneCheck").attr("disabled",true);
					}
				})
				
				let phone2 = $(".checkPhone2").val();
				$("#phone2").on("input",function(){
					phone2 = $(this).val();
					console.log(phone2)
					if($(".phone2Check").val() !== phone2){
						$("#phoneCheck").attr("disabled",false);
					}else{
						$("#phoneCheck").attr("disabled",true);
					} 
				})
				
				let phone3 = $(".checkPhone3").val();;
				$("#phone3").on("input",function(){
					phone3 = $(this).val();
					if($(".phone3Check").val() !== phone3){
						$("#phoneCheck").attr("disabled",false);
					}else{
						$("#phoneCheck").attr("disabled",true);
					} 
				})
				
				/* phone 중복확인 */
					let user_phone;
					$("#phoneCheck").on("click",function(){
						user_phone = phone1 + phone2 + phone3;
						console.log(user_phone);
						$.ajax({
							url:"/mem/phoneCheck",
							type:"post",
							dataType:"json",
							data:{"user_phone": user_phone},
							success:function(data){
								console.log("data : ",data);
								if(data == 1){
									Swal.fire({
									  title: '중복된 번호입니다.',
									  showClass: {
									    popup: 'animate__animated animate__fadeInDown'
									  },
									  hideClass: {
									    popup: 'animate__animated animate__fadeOutUp'
									  }
									})
								}else if(data == 0){
									Swal.fire({
										  title: '사용 가능한 번호입니다.',
										  text: "이 번호로 바꾸시겠습니까?",
										  icon: 'warning',
										  showCancelButton: true,
										  confirmButtonColor: '#3085d6',
										  cancelButtonColor: '#d33',
										  confirmButtonText: '변경!',
										  cancelButtonText: '취소!'
										}).then((result) => {
										  if (result.isConfirmed) {
											  checked.phone = true;
										    Swal.fire(
										      '완료!',
										      '번호가 변경되었습니다.',
										    )
										  } else {
											  $("#phone1").val($(".checkPhone1").val());
											  $("#phone2").val($(".checkPhone2").val());
											  $("#phone3").val($(".checkPhone3").val());
										  }
										})
									}
							},
							error:function(e){
								console.log(e);
							}
						})
					})
				</script>
				<div class="row justify-content-center">
					<div class="col-md-3">
						<p id="genderTitle">성별</p>
					</div>
					<div class="col-md-7">
						<input type="text" id="gender" name="user_gender"
							class="form-control gender" style="text-align: center;"
							value="${memberdto.user_gender}" readonly>
						<div style="text-align:start;">
							<span class="d-none" id="genderText" style="color:red; font-size:0.8rem; margin-left:8px;">** 성별은 수정할 수 없습니다. **</span>					
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row justify-content-center mt-3">
					<div class="col-md-3">
						<p style="margin-top: 50px;">자기소개</p>
					</div>
					<div class="col-md-7" style="height: 120px;">
						<textarea class="form-control" name="user_intro" id="introMessage" maxlength="29">${memberdto.user_intro}</textarea>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row">
					<div class="col-3"></div>
					<div class="col-7" id="user_intro_cnt">
						0/30
					</div>
				<div class="col-2"></div>
			</div>
			</div>
			<div class="row">
				<div class="col">
					<button type="button" id="backPageBtn" class="btn btn-secondary">취소</button>
					<button type="button" id="submitBtn" class="btn btn-primary">확인</button>
				</div>
			</div>
		</form>
		<script>
		if($("#introMessage").val()!=""){
			$('#user_intro_cnt').html($("#introMessage").val().length + '/30');
			
		}
		
		$('#introMessage').keyup(function (e){
	 		  const top = $('#user_intro').prop('scrollHeight');
	          $('#introMessage').scrollTop(top);
	          var content = $(this).val();
	          if($(this).val().length > 29) {
	           $(this).val($(this).val().substring(0, 30));
	          }
	          $('#user_intro_cnt').html(content.length + '/30');
	      });
		
		/* 취소버튼 */
		$("#backPageBtn").on("click",function(){
			location.href="/mem/myPage";
		})
		
		/* readonly 되있는거 눌렀을 때 */
		$("#name").on("click",function(){
			$("#nameText").removeClass("d-none");
		})
		$(".bthday").on("click",function(){
			$("#birthText").removeClass("d-none");
		})
		$(".email").on("click",function(){
			$("#emailText").removeClass("d-none");
		})
		$("#gender").on("click",function(){
			$("#genderText").removeClass("d-none");
		})
		
		/* 실시간 textarea */
		let intro;
		$("#introMessage").on("input",function(){
			intro = $(this).val();
		})
		
		function formSweetAlert(title, target) {
			Swal.fire({
				  title,
				  showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  hideClass: {
				    popup: 'animate__animated animate__fadeOutUp'
				  }
				}).then(() => {
					setTimeout(() => {
						target.focus();
						window.scrollTo({ top:250, behavior: "smooth" });
					}, 100);
				})
		}
		
		/* 수정 완료 버튼 눌렀을 때 */
		$("#submitBtn").on("click", function() {
			let nickname = $("#nickname").val();
			let checkNickname = $(".checkNickname").val();
			let password = $("#password").val();
			let passwordRegex = /^$|^[a-z0-9!@#$]{8,20}$/;
			let checkPhone = $(".checkPhone").val();
			let checkPw = $("#check-pw").val();
			let phone1 = $(".checkPhone1").val();
			let phone2 = $(".checkPhone2").val();
			let phone3 = $(".checkPhone3").val();
			user_phone = phone1 + phone2 + phone3;
			console.log("adasdas : ",checkPhone)
			
			/* 빈 값 일때 */
			if(phone2 == ''){
				formSweetAlert('번호는 필수 입력항목입니다.', $('#phone2'));
				return;
			}else if(phone3 == ''){
				formSweetAlert('번호는 필수 입력항목입니다.', $('#phone3'));
				return;
			}
			
			/* intro 영역 */
			if(intro == ''){
				$("#introMessage").val(' ');
			}
			
			/* 빈 값 일때 */
			if(nickname === ''){
				formSweetAlert('닉네임은 필수 입력항목입니다.', $('#nickname'));
				return;
			}
			
			/* 중복확인 안했을 때 */
			if (nickname !== checkNickname && !checked.nickname) {
				formSweetAlert('중복확인을 해주세요.', $('#nickname'));
				return;
			}
			console.log(checked.phone);
			console.log("user_phone: ", user_phone);
			console.log("checkPhone: ", checkPhone);
			if(user_phone !== checkPhone && checked.phone == false){
				formSweetAlert('중복확인을 해주세요.', $('#phone2'));
				return;
			}
			
			// 비밀번호 확인
			
			if(password == $("#password-check").val()){
				$("#wrong-password-check").addClass("d-none");
				$("#right-password-check").removeClass("d-none");
			}else{
				$("#right-password-check").addClass("d-none");
				$("#wrong-password-check").removeClass("d-none");
				formSweetAlert('비밀번호 확인이랑 일치하지 않습니다.',$("password-check"));
				return;
			}
			
			/* 비밀번호 Regex */
			if(!passwordRegex.test(password)){
				formSweetAlert('형식에 맞지 않은 비밀번호입니다.', $('#password'));
				return;
			}
			
			$('input[name=user_phone]').attr('value',user_phone);
			$("#profileModifyForm").submit();
		})
		</script>
		<div id="userInfoBox-profile">
			<div class="row">
				<div class="col-3">
					<p style="margin-top: 10px;">직업</p>
				</div>
				<div class="col-8" style="text-align: left;">
					<input type="radio" class="job" id="student" name="job"><label
						for="student">학생</label> <input type="radio" class="job"
						id="employee" name="job"><label for="employee">회사원</label>
					<input type="radio" class="job" id="unemployed" name="job"><label
						for="unemployed">무직</label> <input type="radio" class="job"
						id="selectJob" name="job"><label for="selectJob">기타</label>
				</div>
				<div class="col-1"></div>
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
</html>