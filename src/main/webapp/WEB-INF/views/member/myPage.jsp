<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Mypage</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
   crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Black+Han+Sans&family=Mochiy+Pop+One&display=swap" rel="stylesheet">
</head>

<style>
* {
	box-sizing: border-box;
	font-family: 'MICEGothic Bold';
	}

/* benu */
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

.header {
   background-color: #e7f3fad0;
   justify-content: end;
   width: 100%;
   padding: 50px;
}
#headImg{
   position:absolute;
   bottom:210px;
   left:370px;
}

.headWrapper > img{
   width:180px;
   height:180px;
}

.topBtn{
   border:none;
   background-color : transparent;
   color : grey;
   font-size:25px;
   z-index:9999;
}

.line {
   border: none;
   background-color: rgb(102, 154, 209, 0.5);
   margin : auto;
   width: 100%;
   position:relative;
   bottom:9px;
   height: 12px;
   box-shadow: 3px 2px 2px rgb(25, 104, 184);
}

h1 {
   margin: 0;
   font-weight: 600;
   z-index: 9999;
}

/* 프로필사진 영역 */
#profilePic {
   border: 5px solid rgb(25, 104, 184);
   width: 280px;
   height: 280px;
   border-radius: 50%;
   padding: 0;
}
#profilePic > img{
   width: 100%;
}

#profile_image {
   width: 100%;
   height: 100%;
   border-radius: 50%;
   background-color:white;
}

#profilePic:hover {
   transition: 0.8s ease-in;
   transform: scale(1.05);
}

#profilePic:not(:hover) {
   transition: 0.8s ease-out;
}

.profileBox {
   width: auto;
   padding: 35px;
   min-width:550px;
   border-radius : 20px;
   position:relative;
}

.modifyPro {
   margin-top: 30px;
   color: gray;
}
.profileName {
   text-align: center;
   border-bottom: 3px solid navy;
   padding-bottom: 9px;
   margin-bottom: 12px;
   min-width: 350px;
   max-width: 460px;
}

.statusMessage {
   text-align: center;
}

.statusMessage span {
   font-size: 15px;
}

.profileBtn {
   color: black;
   border-color: black;
}

/* body css */
.body {
   justify-content: end;
   width: 100%;
}

h4 {
   margin-top: 15px;
   text-align: center;
}

/* modal 창 영역 */
.modal-dialog{
	max-width:580px;
}
.kokiriImg{
   position:absolute;
   top: 200px;
   right: 440px;
   z-index:1;
}
.kokiriImg > img{
   width:150px;
   height:150px;
}
.modal-content {
   width: 580px;
}

#modal {
   width: 100%;
   height: 150px;
}

#modal label {
   cursor: pointer;
   user-select: none;
}

.modalBtn {
   width: 100%;
   height: 60px;
}

.hobbyWrapper {
   display: flex;
   flex-direction: column;
   justify-content: space-evenly;
   text-align: left;
   padding: 0px;
}

.myMsg {
   justify-content: center;
   align-items: center;
   margin-top: 30px;
}

.myWrite {
   display: flex;
   margin-right: 10px;
   justify-content: end;
}

.wishDelete, .towritePage, .checkMyMsg {
   cursor: pointer;
}

.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #a4a4a4 !important;
    color:#fff;
    border-color: #a4a4a4;
}

.btn-danger, .btn-danger:hover, .btn-danger:active, .btn-danger:visited {
    background-color: #435770 !important;
    color:#fff;
    border-color: #435770;
}

/* card */
.serviceBox {
   color: white;
   background: linear-gradient(#cbc6f5, #978bf3);
   font-family: 'MICEGothic Bold';
   text-align: center;
   padding: 20px;
   width: 80%;
   border-radius: 40px;
   height: 450px;
}

.serviceBox .service-icon {
   font-size: 50px;
   line-height: 80px;
   width: 80px;
   height: 80px;
   margin: 0 auto 20px;
}

.serviceBox .title {
   color: #978bf3;
   background-color: #fff;
   font-size: 25px;
   font-weight: 600;
   text-transform: uppercase;
   padding: 20px 0;
   margin: 0 -20px 15px;
   font-family: 'Mochiy Pop One', sans-serif;
}

.serviceBox .description, a {
   color:#245e4f;
   text-decoration: none;
   font-size: 18px;
   line-height: 22px;
   padding: 8px;
   padding-left:0px;
   align-items: center;
}
.serviceBox a:hover{
   color:#008A65;
}

.serviceBox.color1 {
   background: linear-gradient(#e8f5ed, #e8f5ed);
}

.serviceBox.color1 .title {
   color: #008A65;
   border-right:2px solid #e8f5ed;
   border-left:2px solid #e8f5ed;
}

.serviceBox.color2 {
   background: linear-gradient(#d2e3ec, #d2e3ec);
}

.serviceBox.color2 .title {
   color: #27436d;
   border-right:2px solid #d2e3ec;
   border-left:2px solid #d2e3ec;
}
.serviceBox span {
   font-weight: bold;
}
@media only screen and (max-width: 990px) {
   .serviceBox {
      margin: 0 0 30px;
   }
}

      /* footer */
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

/* 눈누 폰트 */
@font-face {
     font-family: 'MICEGothic Bold';
     src:
         url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
     font-weight: 700;
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
   font-family: 'BMJUA';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

/*쪽지함*/
#msgIcon {
   cursor: pointer;
}

.msgReceive, .msgSend {
   cursor: pointer;
   border: 3px solid #FFE19E;
   border-radius: 5px;
   padding: 4px;
   color : #5B718E;
}

.table-content {
   text-align: center;
}

.msgModal-footer {
   border-top: 0px;
}
.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #a4a4a4 !important;
    color:#fff;
    border-color: #a4a4a4;
}

.btn-danger, .btn-danger:hover, .btn-danger:active, .btn-danger:visited {
    background-color: #435770 !important;
    color:#fff;
    border-color: #435770;
}

/* 보낸사람 닉네임 */
.sendNickname {
	cursor : pointer;
}


</style>

<body>
   <!-- page Benu -->
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
                        <li class="nav-item"><a class="nav-link" href="">자유게시판</a></li>
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
                                 <li><a class="dropdown-item mt-2" href="/login/toLogout">로그아웃</a></li>
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

	<!-- header jsp -->
	<div class="header">
		<div class="row mb-4 text-center justify-content-center">
			<div class="col-auto">
				<h1 style="font-family: 'Mochiy Pop One', sans-serif;">My Profile</h1>
				<div class="line"></div>	
			</div>
			<div class="col-auto d-flex align-items-center">
				<button type="button" class="btn topBtn"><i class="fa-solid fa-pen-to-square"></i></button>
			</div>
		</div>
		<form action="/mem/modifyProfilePic" method="post" id="modifyPicForm"
			enctype="multipart/form-data">
			<div class="row justify-content-center">
				<div class="col-4 d-flex justify-content-center">
					<div id="profilePic">
						<c:choose>
							<c:when test="${empty memberdto.user_image}">
								<img src="/resources/images/profile.jpg" id="profile_image">
							</c:when>
							<c:otherwise>
								<img src="/profile/${memberdto.user_image}" id="profile_image">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-8 profileBox" style="background-color: white;">
					<div class="headWrapper">
						<img src="/resources/images/kokiri.png" id="headImg">
					</div>		
					<div class="profileName">
						<span style="font-size: 20px"> <strong
							style="font-size: 25px; font-family: 'Mochiy Pop One', sans-serif;">${memberdto.user_nickname}</strong>님
						</span>
						<div class="statusMessage mt-2" id="statusMessage">
							<i class="fa-solid fa-quote-left"></i> <span>${memberdto.user_intro}</span>
							<i class="fa-solid fa-quote-right"></i>
						</div>
					</div>
					<table>
						<tbody>
							<tr>
								<td><i class="fa-solid fa-user icon m-2"></i></td>
								<td><span>${memberdto.user_name}</span></td>
							</tr>
							<tr>
								<td><i class="fa-solid fa-cake-candles icon m-2"></i></td>
								<td><span>${date}</span></td>
							</tr>
							<tr>
								<td><i class="fa-solid fa-envelope icon m-2"></i></td>
								<td><span>${memberdto.user_email}</span></td>
							</tr>
						</tbody>
					</table>
						
				</div>
				
				<input type="text" class="d-none" name="${memberdto}" value="${memberdto}">
				
			</div>
			<div class="row">
				<div class="col-md-8 modifyPro text-center" style="display: none;">
					<i class="fa-solid fa-folder-plus ms-5 me-3"></i> 
					<span id="modifyProfilePic" style="cursor: pointer; user-select: none">프로필 사진 변경</span>
				</div>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-8 d-flex justify-content-center">
					<input type="file" class="form-control w-50 mt-2 d-none" id="file"
						name="user_image" accept='image/jpeg,image/gif,image/png'>
				</div>
				<div class="col-md-4 profileBtns justify-content-start"
					style="text-align: start; display: none">
					<c:choose>
						<c:when test="${loginType eq 'general'}">
							<button type="button" class="btn btn-outline-primary profileBtn me-3"
								data-bs-toggle="modal" data-bs-target="#exampleModal2">개인정보
								수정</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-outline-primary profileBtn"
								id="profileModify">개인정보 수정</button>
						</c:otherwise>
					</c:choose>
					<button type="button" class="btn btn-outline-danger profileBtn ms-3"
						id="profileDelete">회원탈퇴</button>
					<input type="text" class="d-none" id="user_delete"
						value="${memberdto.user_delete}"> <input type="text"
						class="d-none" id="user_email" value="${memberdto.user_email}">
				</div>
			</div>
		</form>
	</div>

	<script>
		// 이미지 선택
		  let groupFile = document.getElementById("file");
		  let groupDefaultImg = document.getElementById("profile_image");
		  
		   //사진 타입 
		  function checkFile(obj) {
		    let fileKind = obj.value.lastIndexOf('.');
		    let fileName = obj.value.substring(fileKind+1,obj.length);
		    let fileType = fileName.toLowerCase();
		    
		    if(fileType == "jpg" || fileType == "gif" || fileType == "png" || fileType == "jpeg" || fileType == "bmp"){
		       return true;
		    }else{
		       Swal.fire({
		            icon: 'error',
		            title: '에러',
		            text: '이미지타입의 파일만 가능합니다!',
		       })
		       $("#file").val("");
		         return false;
		    }
		    
		    if(fileType == "bmp"){
		       answer = confirm("BMP 파일은 웹상에서 사용하기엔 적절한 이미지 형식이 아닙니다. /n 사용하시겠습니까?");
		       if(!answer) return false;
		       
		    }
		}
	
		  // 이미지 즉각 변환
		   groupFile.onchange = function () {
		     let result = checkFile(this);
		     if(result) { // 사진 파일 일 떄만 
		        let reader = new FileReader();
		          reader.readAsDataURL(this.files[0]);
		          reader.onload = function (e) {
		             groupDefaultImg.src = e.target.result;
		          }
		     }else { // 사진 파일이 아닐 때
		        groupDefaultImg.src = "/resources/images/profile.jpg";
		     }
		  } 
    	//버튼 나오게하기
    	$(".topBtn").on("click",function(){
         $(".profileBtns").toggle();
         $(".modifyPro").toggle();
        })

        // 사용자가 새로운 프로필을 선택했을때 이미지 띄워주기
        /* document.getElementById("file").onchange = function () {
            let reader = new FileReader();
            reader.readAsDataURL(this.files[0])
            reader.onload = function (e) {
                document.getElementById("profile_image").src = e.target.result;
            }
        } */
        $("#modifyProfilePic").on("click", function () {
            if ($("#modifyProfilePic").text() === '프로필 사진 변경') {
                this.textContent = '저장';
                $("#file").removeClass("d-none");
            } else {
                Swal.fire({
                    title: '정말 변경하시겠습니까?',
                    text: "사진 값 없이 저장하실 경우, 기본 이미지로 변경됩니다.!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '네, 변경할께요.!',
                    cancelButtonText: '아니요, 변경안할께요.'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            '변경 완료!',
                            '프로필 사진을 변경하였습니다.',
                            'success'
                        ).then(function () {
                            this.textContent = '프로필 사진변경';
                            $("#file").addClass("d-none");
                            $("#modifyPicForm").submit();
                        });
                    } else {
                        this.textContent = '프로필 사진변경';
                        $("#file").addClass("d-none");
                        location.reload();
                    }
                })
            }
        })
    </script>
   <!-- 개인정보 수정 모달 -->

   <div class="modal fade" id="exampleModal2" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true"
      style="z-index: 9999;">
      <div class="modal-dialog modal-dialog-centered d-flex justify-content-center">
         <div class="modal-content" style="width: 350px; height: 400px;">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div class="row">
                  <span style="text-align: center;"><strong
                     style="font-size: 20px;">${memberdto.user_nickname}</strong>님
                     회원정보 중 개인정보 수정하기 위해 인증절차가 필요합니다.</span>
               </div>
               <hr style="margin: 20px;">
               <div class="row">
                  <div class="col-5 d-flex justify-content-center"
                     style="align-items: center; padding: 0px;">
                     <label>현재 비밀번호 : </label>
                  </div>
                  <div class="col-7 d-flex justify-content-start">
                     <input type="password" id="password" class="form-control"
                        style="height: 100%; font-family: none;">
                  </div>
                  <script>
                      const test = document.querySelector('#password');
                      console.log(test)
                      test.addEventListener('change', () => {
                          console.log('change')
                      })
                  </script>
                  <div>
                     <button type="button" class="btn btn-secondary mt-3" id="checkPw"
                        style="width: 100%;">확인</button>
                  </div>
                  <div class="mt-3 d-none wrong-check-pw"
                     style="text-align: center;">
                     <span style="color: red; font-size: 0.8rem; margin-left: 8px;">**
                        현재 비밀번호와 일치하지 않습니다. **</span>
                  </div>
                  <div class="mt-3 d-none right-check-pw" id="test"
                     style="text-align: center;">
                     <span style="color: green; font-size: 0.8rem; margin-left: 8px;">**
                        현재 비밀번호와 일치합니다. **</span>
                  </div>
               </div>
            </div>
            <div class="modal-footer" style="display: inline; padding: 0px;">
               <div class="row" style="margin: 0px;">
                  <div class="col-5" style="padding: 0px;">
                     <button type="button" class="btn btn-secondary modalBtn"
                        data-bs-dismiss="modal">취소</button>
                  </div>
                  <div class="col-7" style="padding: 0px;">
                     <button type="button" class="btn btn-primary modalBtn"
                        id="profileModify" disabled>이동</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="container"style="max-width:1620px;">
      <div style="margin:auto;">
         <div class="row body" style="margin:0px;">
            <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center mt-5">
               <div class="serviceBox color1 m-2">
                  <div class="service-icon" style="color:#008A65;">
                     <span><i class="fa fa-globe"></i></span>
                  </div>
                  <h3 class="title">
                     선호지역(최대 3개 선택) <i class="fa-solid fa-pencil ms-3"
                        data-bs-toggle="modal" data-bs-target="#exampleModal1"
                        id="siteModify" style="cursor: pointer;"></i>
                  </h3>
                  <c:forEach items="${siteList}" var="sitedto">
                     <div class="row description" style="color:#245e4f;">
                        <div class="col-3 d-flex justify-content-end">
                           <i class="fa-solid fa-location-dot me-3"></i>
                        </div>
                        <div class="col-7 d-flex justify-content-start">
                           <a href="/user/toUserSelectedGroupList?group_site=${fn:substring(sitedto.area,0,2)}"><span>${sitedto.area}</span></a>
                        </div>
                        <div class="col-2 d-flex justify-content-end"></div>
                     </div>
                  </c:forEach>
               </div>
            </div>
            <!-- modal -->

            <div class="modal fade" id="exampleModal1" tabindex="-1"
               aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog modal-dialog-centered justify-content-center d-flex">
                  <div class="modal-content" style="width: 350px;">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">선호지역(최대 3개선택)</h5>
                        <button type="button" class="btn-close closeBtn" data-bs-dismiss="modal"
                           aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        <div class="col" id="modal">
                           <div class="row" style="height: 100%;">
                              <div class="col-6 hobbyWrapper ps-2">
                                 <input type="text" class="d-none" id="user_email"
                                    value="${memberdto.user_email}">
                                 <div>
                                    <input onclick="CountChecked1(this)" type="checkbox" id="서울"
                                       name="site" class="checkbox me-1" value="서울"> <label
                                       for="서울">서울</label>
                                 </div>
                                 <div>
                                    <input onclick="CountChecked1(this)" type="checkbox" id="인천"
                                       name="site" class="checkbox me-1" value="인천"> <label
                                       for="인천">인천</label>
                                 </div>
                                 <div>
                                    <input onclick="CountChecked1(this)" type="checkbox" id="경기도"
                                       name="site" class="checkbox me-1" value="경기도"> <label
                                       for="경기도">경기도</label>
                                 </div>
                                 <div>
                                    <input onclick="CountChecked1(this)" type="checkbox" id="강원도"
                                       name="site" class="checkbox me-1" value="강원도"> <label
                                       for="강원도">강원도</label>
                                 </div>
                              </div>
                              <div class="col-6 hobbyWrapper">
                                 <div>
                                    <input onclick="CountChecked1(this)" type="checkbox" id="충청도"
                                       name="site" class="checkbox me-1" value="충청도"> <label
                                       for="충청도">충청도</label>
                                 </div>
                                 <div>
                                    <input onclick="CountChecked1(this)" type="checkbox" id="경상도"
                                       name="site" class="checkbox me-1" value="경상도"> <label
                                       for="경상도">경상도</label>
                                 </div>
                                 <div>
                                    <input onclick="CountChecked1(this)" type="checkbox" id="전라도"
                                       name="site" class="checkbox me-1" value="전라도"> <label
                                       for="전라도">전라도</label>
                                 </div>
                                 <div>
                                    <input onclick="CountChecked1(this)" type="checkbox"
                                       id="제주특별자치도" name="site" class="checkbox me-1"
                                       value="제주특별자치도"> <label for="제주특별자치도">제주도</label>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-secondary closeBtn"
                              data-bs-dismiss="modal">닫기</button>
                           <button type="button" class="btn btn-primary" id="saveSiteBtn">저장</button>
                        </div>
                     </div>
                     <script>
                     // 개인정보 수정 enterkey()
                      //검색하는거 enter 키
					  $("#password").on("keyup", function(key) {
					    if (key.keyCode == 13) {
					      $("#checkPw").click();
					    }
					  });
                      var maxCount = 3;
                      var count = 0;
                      function CountChecked1(field) {
                          if (field.checked) {
                              count += 1;
                          } else {
                              count -= 1;
                          }
                          if (count > maxCount) {
                        	  Swal.fire('최대 3개까지 선택 가능해요!!!');
                              field.checked = false;
                              count -= 1;
                          }
                      }
                      // 저장 버튼 눌렀을 때
                      $("#saveSiteBtn").on("click", function () {
                          let checkAccess = $('input[name=site]:checked').val();
                          let user_email = $("#user_email").val();
                          console.log("asdasd : ", checkAccess);
                          let checkBoxArr = [];
                          $("input[name=site]:checked").each(function () {
                              checkBoxArr.push($(this).val());
                          })
                          console.log(checkBoxArr);
                          if(checkBoxArr == ""){
                             Swal.fire('적어도 하나는 선택해주세요!!!')
                          }else{
                           $.ajax({
                               url: "/mem/siteModal?&checkBoxArr=" + checkBoxArr + "&user_email=" + user_email,
                               type: "get",
                               data: { "checkBoxArr[]": checkBoxArr },
                               success: function (data) {
                                   console.log(data);
                                   $(".fade").hide();
                                   location.href = "/mem/myPage";
                               },
                               error: function (e) {
                                   console.log(e);
                               }
                           })
                          }
                      });
                  </script>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center mt-5">
               <div class="serviceBox m-2 color2">
                  <div class="service-icon" style="color: #27436d;">
                     <span><i class="fa-solid fa-thumbs-up"></i></span>
                  </div>
                  <h3 class="title">
                     관심사(최대 3개 선택) <i class="fa-solid fa-pencil ms-3"
                        data-bs-toggle="modal" data-bs-target="#exampleModal"
                        id="hobbyModify" style="cursor: pointer;"></i>
                  </h3>

                  <c:forEach items="${hobbyList}" var="hobbydto">
                     <div class="row description" style="color: #27436d;">
                        <div class="col-3 d-flex justify-content-end">
                           <i class="fa-solid fa-thumbs-up me-3"></i>
                        </div>
                        <div class="col-7 d-flex justify-content-start">
                           <a href="/user/toUserSelectedGroupList?group_category=${hobbydto.hobby}"><span>${hobbydto.hobby}</span></a>
                        </div>
                        <div class="col-2"></div>
                     </div>
                  </c:forEach>
               </div>
               <!-- Modal -->

               <div class="modal fade" id="exampleModal" tabindex="-1"
                  aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">관심사(최대 3개
                              선택)</h5>
                           <button type="button" class="btn-close closeBtn" data-bs-dismiss="modal"
                              aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                           <div class="col" id="modal">
                              <div class="row" style="height: 100%;">
                                 <div class="col-3 hobbyWrapper ps-2">
                                    <input type="text" class="d-none" id="user_email"
                                       value="${memberdto.user_email}">
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="아웃도어/여행" name="hobby" class="checkbox me-1"
                                          value="아웃도어/여행"> <label for="아웃도어/여행">아웃도어/여행</label>
                                    </div>
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="운동/스포츠" name="hobby" class="checkbox me-1"
                                          value="운동/스포츠"> <label for="운동/스포츠">운동/스포츠</label>
                                    </div>
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="외국어/언어" name="hobby" class="checkbox me-1"
                                          value="외국어/언어"> <label for="외국어/언어">외국어/언어</label>
                                    </div>
                                 </div>
                                 <div class="col-3 hobbyWrapper">
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="반려동물" name="hobby" class="checkbox me-1" value="반려동물">
                                       <label for="반려동물">반려동물</label>
                                    </div>
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="음악/악기" name="hobby" class="checkbox me-1" value="음악/악기">
                                       <label for="음악/악기">음악/악기</label>
                                    </div>
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="공예/만들기" name="hobby" class="checkbox me-1"
                                          value="공예/만들기"> <label for="공예/만들기">공예/만들기</label>
                                    </div>
                                 </div>
                                 <div class="col-3 hobbyWrapper">
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="댄스/무용" name="hobby" class="checkbox me-1" value="댄스/무용">
                                       <label for="댄스/무용">댄스/무용</label>
                                    </div>
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="인문학/책/글" name="hobby" class="checkbox me-1"
                                          value="인문학/책/글"> <label for="인문학/책/글">인문학/책/글</label>
                                    </div>
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="사진/영상" name="hobby" class="checkbox me-1" value="사진/영상">
                                       <label for="사진/영상">사진/영상</label>
                                    </div>
                                 </div>
                                 <div class="col-3 hobbyWrapper">
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="게임/오락" name="hobby" class="checkbox me-1" value="게임/오락">
                                       <label for="게임/오락">게임/오락</label>
                                    </div>
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox"
                                          id="요리/제조" name="hobby" class="checkbox me-1" value="요리/제조">
                                       <label for="요리/제조">요리/제조</label>
                                    </div>
                                    <div>
                                       <input onclick="CountChecked(this)" type="checkbox" id="문화/공연/축제" name="hobby"
                                          class="checkbox me-1" value="문화/공연/축제"> <label
                                          for="문화/공연/축제">문화/공연/축제</label>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-secondary closeBtn"
                                 data-bs-dismiss="modal">닫기</button>
                              <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
                           </div>
                        </div>
                        <script>
                        // 닫기 버튼
                        $(".closeBtn").on("click",function(){
                          location.href="/mem/myPage"
                        })
                               	var maxCount = 3;
                               	var count = 0;
                               	
                                   function CountChecked(field) {
                                       if (field.checked) {
                                           count += 1;
                                       } else {
                                           count -= 1;
                                       }
                                       if (count > maxCount) {
                                    	   Swal.fire('최대 3개까지 선택 가능해요!!!');
                                           field.checked = false;
                                           count -= 1;
                                       }
                                   }
                                   // 저장 버튼 눌렀을 때
                                   $("#saveBtn").on("click", function () {
                                       let checkAccess = $('input[name=hobby]:checked').val();
                                       let user_email = $("#user_email").val();

                                       let checkBoxArr = [];
                                       $("input[name=hobby]:checked").each(function () {
                                           checkBoxArr.push($(this).val());
                                       })

                                       if(checkBoxArr == ""){
                                          Swal.fire('적어도 한개는 선택해주세요!!!')
                                       }else{
                                        $.ajax({
                                            url: "/mem/hobbyModal?&checkBoxArr=" + checkBoxArr + "&user_email=" + user_email,
                                            type: "get",
                                            data: { "checkBoxArr[]": checkBoxArr },
                                            success: function (data) {
                                                console.log(data);
                                                $(".fade").hide();
                                                location.href = "/mem/myPage";
                                            },
                                            error: function (e) {
                                                console.log(e);
                                            }
                                        })
                                       }

                                   });
                               </script>
                     </div>
                  </div>
               </div>
            </div>
            <div
               class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center mt-5 d-flex justify-content-center">
               <div class="serviceBox  m-2 color1">
                  <div class="service-icon" style="color: #008A65;">
                     <span><i class="fa-solid fa-people-group"></i></span>
                  </div>
                  <h3 class="title">가입한 모임</h3>
                  <c:if test="${selectGroupList.size() == 0}">
                     <div class="row description" id="myList">
                        <div class="col-3 d-flex justify-content-end"></div>
                        <div class="col-8 d-flex justify-content-start">
                           <span> 가입한 모임이 없습니다.</span>
                        </div>
                        <div class="col-1 d-flex justify-content-start"></div>
                     </div>
                  </c:if>
                  <c:if test="${selectGroupList.size() > 0}">
                     <c:forEach items="${selectGroupList}" var="Groupdto">
                        <c:if test="${Groupdto.access eq '주최자'}">
                           <div class="row description" style="color: #008A65;">
                              <div class="col-3 d-flex justify-content-end"
                                 style="padding: none;">
                                 <i class="fa-solid fa-crown " style="color: gold;"></i>
                              </div>
                              <div class="col-7 d-flex justify-content-start text-start" >
                                 <span style = "word-break:break-all;">
                                 <a href="/group/toGroupDetail?seq_group=${Groupdto.SEQ_GROUP}" style="padding:0px;">${Groupdto.TITLE}</a>
                                 </span>
                              </div>
                              <div class="col-2"></div>
                           </div>
                        </c:if>
                        <c:if test="${Groupdto.access eq '멤버'}">
                           <div class="row description" style="color: #008A65;">
                              <div class="col-3 d-flex justify-content-end">
                                 <i class="fa-solid fa-people-group"></i>
                              </div>
                              <div class="col-7 d-flex justify-content-start text-start">
                                 <span><a
                                    href="/group/toGroupDetail?seq_group=${Groupdto.SEQ_GROUP}" style="padding:0px;">${Groupdto.TITLE}</a></span>
                              </div>
                              <div class="col-2"></div>
                           </div>
                        </c:if>
                     </c:forEach>
                  </c:if>
               </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center mt-5">
               <div class="serviceBox color2 m-2">
                  <div class="service-icon" style="color: #27436d;">
                     <span><i class="fa-solid fa-file-pen"></i></span>
                  </div>
                  <h3 class="title">내가 쓴 글</h3>
                  <c:if test="${selectBoardList.size() == 0}">
                     <div class="row description" id="myList" style="color: #27436d;">
                        <div class="col-3 d-flex justify-content-end"></div>
                        <div class="col-8 d-flex justify-content-start">
                           <span>내가 쓴 글이 없습니다.</span>
                        </div>
                        <div class="col-1 d-flex justify-content-start"></div>
                     </div>
                  </c:if>
                  <c:if test="${selectBoardList.size() > 0}">
                     <c:forEach items="${selectBoardList}" var="boarddto"
                        varStatus="status" begin="0" end="3">
                        <div class="row description" style="color: #27436d;">
                           <div class="col-3 d-flex justify-content-end">
                              <i class="fa-solid fa-pen-nib ms-3"></i>
                           </div>
                           <div class="col-7 d-felx justify-content-start text-start">
                              <span style = "word-break:break-all;">${boarddto.board_title}</span>
                           </div>
                           <div class="col-2 d-felx justify-content-start"></div>
                        </div>
                     </c:forEach>
                     <div class="myWrite mt-3">
                        <span class="towritePage" id="towritePage" style="color: #27436d;">더보기 <i
                           class="fa-solid fa-arrow-right"></i>
                        </span>
                     </div>
                  </c:if>
               </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center mt-5">
               <div class="serviceBox m-2 color1">
                  <div class="service-icon" style="color: #008A65;">
                     <span><i class="fa-solid fa-heart"></i></span>
                  </div>
                  <h3 class="title">희망 모임</h3>
                  <c:if test="${selectWishList.size() == 0}">
                     <div class="row description" id="myList" style="color: #008A65;">
                        <div class="col-3 d-flex justify-content-end"></div>
                        <div class="col-8 d-flex justify-content-start wishContent">
                           <span>찜한 모임이 없습니다.</span>
                        </div>
                        <div class="col-1 d-flex justify-content-start"></div>
                     </div>
                  </c:if>
                  <c:if test="${selectWishList.size() > 0}">
                     <c:forEach items="${selectWishList}" var="wishlistdto" begin="0"
                        end="2">
                        <div class="row description" id="wishBox" style="color: #008A65;">
                           <div class="col-3 d-flex justify-content-end">
                              <i class="fa-solid fa-heart"></i>
                           </div>
                           <div class="col-6 d-flex justify-content-start text-start">
                              <span style = "word-break:break-all;"><a href="/group/toGroupDetail?seq_group=${wishlistdto.SEQ_GROUP}">${wishlistdto.TITLE}</a></span>
                           </div>
                           <div class="col-3 d-flex justify-content-start">
                              <i class="fa-solid fa-trash-can wishDelete"></i> <input
                                 type="text" id="seq_group" class="seq_group d-none"
                                 value="${wishlistdto.SEQ_GROUP}">
                           </div>
                        </div>
                     </c:forEach>
                  </c:if>
               </div>
            </div>
            <script>
                   //console.log($(".wrongCheckpw"))
                   /* 비밀번호 중복확인 */
                   $("#checkPw").on("click", function () {
                       let user_pw = $("#password").val();
                       let user_email = $("#user_email").val();
                       $.ajax({
                           url: "/mem/pwCheck",
                           type: "post",
                           data: { "user_pw": user_pw, "user_email": user_email },
                           dataType: "json",
                           success: function (data) {
                               if (data == 1) {
                                   $(".wrong-check-pw").addClass("d-none");
                                   $(".right-check-pw").removeClass("d-none");
                                   $("#profileModify").attr("disabled", false);
                                   return;
                               } else {
                                   $(".right-check-pw").addClass("d-none");
                                   $(".wrong-check-pw").removeClass("d-none");
                                   $("#profileModify").attr("disabled", true);
                               }
                           },
                           error: function (e) {
                               console.log(e);
                           }
                       })
                   })
                   $("#profileModify").on("click", function () {
                       let user_email = $("#user_email").val();
                       location.href = "/mem/profileModifyPage?user_email=" + user_email;
                   })
                   console.log(${selectWishList.size()});
                   /* 희망 모임 삭제 */
                   $(".wishDelete").on("click", function () {
                       let seq_group = $(this).next().val();
                       let parent = $(this).parent().parent();
                       console.log(parent.length)
                       Swal.fire({
                           title: '정말 삭제하시겠습니까?',
                           text: "다시 복구 할수 없습니다.!",
                           icon: 'warning',
                           showCancelButton: true,
                           confirmButtonColor: '#3085d6',
                           cancelButtonColor: '#d33',
                           confirmButtonText: 'Yes, delete it!'
                       }).then((result) => {
                           if (result.isConfirmed) {
                               Swal.fire(
                                   '삭제 완료!',
                                   '희망 모임을 삭제하였습니다.',
                                   'success'
                               ).then(function () {
                                     $.ajax({
                                       url: "/mem/wishDelete",
                                       type: "post",
                                       data: {
                                           "seq_group": seq_group
                                       },
                                       success: function (data) {
                                           location.href="/mem/myPage"
                                       },
                                       error: function (e) {
                                           console.log(e);
                                       }
                                   })  
                               });
                           }
                       })
                   })
               </script>
            <div class="col-lg-4 col-md-6 col-sm-12 d-flex justify-content-center mt-5">
               <div class="serviceBox m-2 color2">
                  <div class="service-icon" style="color: #27436d;">
                     <span><i class="fa-solid fa-envelope"></i></span>
                  </div>
                  <h3 class="title">쪽지함</h3>
                  <div class="d-flex myMsg" style="color: #27436d;">
                     <span class="checkMyMsg" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">내 쪽지 관리하기 <i
                        class="fa-solid fa-arrow-right"></i></span>
                  </div>
               </div>
            </div>
      <!-- Modal -->
         <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
            data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-lg justify-content-center modal-dialog modal-dialog-scrollable modal-dialog-centered">
               <div class="modal-content">
                  <div class="modal-header"  style="background-color:#FFFEE9; border-bottom:2px solid #FFE19E;">
                     <span id="staticBackdropLabel" style="font-size: 16px;">
                     <img style = "width:35px;" src = "/resources/images/mail.png">
                     </span>
                     <span class="ms-2" id="msgTitle">쪽지함보기</span>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="moveSite();"
                        aria-label="Close"></button>
                  </div>
                  <!-- 답장 (보낸사람 클릭시 활성화 -->
					<div class="d-none" id="msgForm" style="padding: 14px;">
						<div class="row">
							<div class="col-md-12">
								<div>
									<i class="fa-solid fa-envelope"></i><span class="ms-2">받는
										사람</span>
								</div>
								<input type="text" class="form-control mt-2"
									id="user_receive" readonly>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-md-12">
								<div>
									<i class="fa-solid fa-comment"></i><span class="ms-2">답장
										내용</span>
								</div>
								<textarea class="form-control mt-2" id="msgContent" rows="3"
									style="resize: none;"></textarea>
							</div>
						</div>
					</div>
                  <div class="row mt-2" id="msgSelect">
                     <div class="col-md-12 d-flex">
                        <div class="msgReceive d-flex justify-content-center ms-2" style="background-color:#FFECC2">
                           <span class="receiveBtn"><i class="fa-solid fa-check"></i></span><span
                              class="ms-1">받은 쪽지함</span>
                        </div>
                        <div class="msgSend d-flex justify-content-center"
                           style="margin-left: 10px;">
                           <span class="sendBtn d-none"><i
                              class="fa-solid fa-check"></i></span><span class="ms-1">보낸 쪽지함</span>
                        </div>
                     </div>
                  </div>
                  <div class="modal-body">
                     <table class="table table-content">
                        <thead>
                           <tr>
                              <th class="col-2">삭제</th>
                              <th class="col-2 table-head">보낸사람</th>
                              <th scope="col">내용</th>
                              <th scope="col">날짜</th>
                           </tr>
                        </thead>
                           <tbody class="tbody-content">
                              <c:if test="${rmsgList.size() == 0 }">
                                 <tr>
                                    <td colspan="4">쪽지가 없습니다.</td>
                                 </tr>
                              </c:if>
                              <c:if test="${rmsgList.size() != 0 }">
                                 <c:forEach items="${rmsgList}" var="dto">
                                    <tr>
                                       <td scope="row"><input type="checkbox"
                                          value="${dto.seq_message}" name="seq_message"></td>
                                       <td class="sendNickname" style="cursor : pointer;">${dto.user_send}</td>
                                       <td>${dto.msgContent}</td>
                                       <td>${dto.date}</td>
                                    </tr>
                                 </c:forEach>
                              </c:if>
                           </tbody>
                        </table>
                     </div>
                     <div class="modal-footer msgModal-footer"  style="background-color:#FFFEE9; border-top:2px solid #FFE19E;">
                        <button type="button" class="btn btn-primary ms-2" id="closeBtn" onclick ="moveSite();"
                           data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger ms-2" id="deleteBtn">삭제</button>
                        <button type="button" class="btn btn-danger ms-2 d-none" id="replyBtn">답장</button>
                        <input type="text" value="${memberdto.user_nickname}" id="myId"
                           hidden>
                     </div>
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
	
    /* 내가쓴글로 이동 */
    $("#towritePage").on("click", function () {
        let user_email = $("#user_email").val();
        const curPage = 1;
        location.href = "/mem/myWrite?&user_email=" + user_email + "?&curPage=" + curPage;
    });

    /* 회원 탈퇴 */
    $("#profileDelete").on("click", function () {
        let user_delete = $("#user_delete").val();
        let user_email = $("#user_email").val();
        Swal.fire({
            title: '정말 회원 탈퇴하시겠습니까?',
            text: "회원 탈퇴시 다시 로그인할 수 없습니다.!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '탈퇴 완료!',
                    '회원탈퇴가 성공적으로 이루어졌습니다.',
                    'success'
                ).then(function () {
                    $.ajax({
                        url: "/mem/profileDelete?user_email=" + user_email,
                        type: "get",
                        success: function (data) {
                        	location.href = "/login/toLogout";
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    })
                });
            }
        })
    })

    // 보낸 쪽지 클릭시 체크되면서 테이블 보여주기
    $('.msgSend').on("click", function () {
        $('.receiveBtn').addClass('d-none');
        $('.msgReceive').css("background-color", "#FFF");
        $('.msgSend').css("background-color", "#FFECC2");
        $('.sendBtn').removeClass('d-none');
        let myId = $("#myId").val();
        $.ajax({
            url: "/user/sendMsg?user_send=" + myId,
            type: "get",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $(".tbody-content").empty();
                $(".table-head").text("받는사람");
                if (data.length != 0) {
                    for (let dto of data) {
                        let tr = $("<tr>");
                        let td = $("<td>");
                        let input = document.createElement("input");
                        input.setAttribute('type', 'checkbox');
                        input.setAttribute('value', dto.seq_message);
                        input.setAttribute('name', 'seq_message');
                        let td1 = td.append(input);
                        let td2 = $("<td>").html(dto.user_receive);
                        let td3 = $("<td>").html(dto.msgContent);
                        let td4 = $("<td>").html(dto.date);
                        tr.append(td1, td2, td3, td4);
                        $(".tbody-content").append(tr);
                    }
                }else{
                   let tr = $("<tr>");
                   let td = $('<td colspan=4>');
                   td.append("쪽지가 없습니다.");
                   tr.append(td);
                   $(".tbody-content").append(tr);
                }
            }, error: function (e) {
                console.log(e);
            }
        })
    })
    // 받은 쪽지 클릭시 체크되면서 테이블 보여주기
    $('.msgReceive').on("click", function () {
        $('.sendBtn').addClass('d-none');
        $('.receiveBtn').removeClass('d-none');
        $('.msgSend').css("background-color", "#FFF");
        $('.msgReceive').css("background-color", "#FFECC2");

        let myId = $("#myId").val();
        $.ajax({
            url: "/user/receiveMsg?user_receive=" + myId,
            type: "get",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $(".tbody-content").empty();
                $(".table-head").text("보낸사람");
                if (data.length != 0) {
                    for (let dto of data) {
                        let tr = $("<tr>");
                        let td = $("<td>");
                        let input = document.createElement("input");
                        input.setAttribute('type', 'checkbox');
                        input.setAttribute('value', dto.seq_message);
                        input.setAttribute('name', 'seq_message');
                        let td1 = td.append(input);
                        let td2 = $("<td>").html(dto.user_send);
                        td2.addClass("sendNickname");
                        let td3 = $("<td>").html(dto.msgContent);
                        let td4 = $("<td>").html(dto.date);
                        tr.append(td1, td2, td3, td4);
                        $(".tbody-content").append(tr);
                    }
                }else{
                   let tr = $("<tr>");
                   let td = $('<td colspan=4>');
                   td.append("쪽지가 없습니다.");
                   tr.append(td);
                   $(".tbody-content").append(tr);
                }
            }, error: function (e) {
                console.log(e);
            }
        })
    })

    // 보낸 메세지 삭제
    $("#deleteBtn").on("click", function () {
        let checkBoxArr = [];
        $("input[name=seq_message]:checked").each(function () {
            checkBoxArr.push($(this).val());
        })
        var jsonData = {
            "message": JSON.stringify(checkBoxArr)
        };
        var jsonString = JSON.stringify(jsonData);
        $.ajax({
            url: "/user/deleteMsg",
            headers: { 'Content-Type': 'application/json' },
            type: "post",
            data: jsonString,
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    text: '완료되었습니다.',
                })
                setTimeout(function () {
                    window.location.href = "";
                }, 1000);
            }, error: function (e) {
                console.log(e);
            }
        })
    })

    $("#closeBtn").on("click", function () {
        window.close();
    })

    // 쪽지 답자
    $(".table").on("click",".sendNickname",function() {
    	let user_receive = $(this).text(); // 답장 받는 사람 닉네임
    	$("#user_receive").val(user_receive); // 답장 받는 사람 닉네임 넣어주기
    	$("#msgSelect").addClass("d-none"); // 받은 쪽지함, 보낸 쪽지함 안보이게
    	$(".table-content").addClass("d-none"); // 쪽지 테이블 안보이게
    	$("#msgForm").removeClass("d-none"); // 답장 form 보이게
    	$("#msgTitle").html("답장 보내기") // 쪽지함보기 -> 답장 보내기
    	$("#deleteBtn").addClass("d-none"); // 삭제 버튼 안보이게
    	$("#replyBtn").removeClass("d-none"); // 답장 버튼 보이게
    })

    // 답장 버튼 눌렀을 떄
    $("#replyBtn").on("click",function() {

    	// 내용 비었을 떄
    	if($("#msgContent").val() == "") {
            Swal.fire('내용을 입력해주세요');
            return;
         }

         let user_receive = $("#user_receive").val(); // 받는 사람 닉네임
         let msgContent = $("#msgContent").val(); // 쪽지 내용
         $.ajax ({
            url : "/user/insertMessage",
            type : "post",
          data : {"user_receive" : user_receive, "msgContent" : msgContent},
          dataType : "text",
          success : function(data) {
             if(data == "success") { // 성공시
            	 Swal.fire('답장 완료');
            	// 1 초있다가 페이지 로드
					setTimeout(function() {
						window.location.href = "";
					},700);

             }else {
            	 Swal.fire({
					  icon: 'error',
					  title: '에러가 발생했네요..',
					  text: '관리자에게 문의해주세여!',
					});
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


</script>
</body>

</html>