<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- summernote -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <!-- swal -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="sweetalert2.min.js"></script>
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
<meta charset="UTF-8">
<title>글 수정 페이지</title>
    <style>
    	/* header */
		header {
		   font-family: 'MICEGothic Bold';
		}
		
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
		
		#logoImg {
		   width: 50%;
		}
		/* header 반응형 끝 */
		
		
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
        
    	/* contents 영역 */
    	.note-group-image-url{
    		display: none;
    	}
    	#modifyWrapper:not(textarea){
    		font-family: 'InfinitySans-RegularA1';
    	}
    	
        #head{
            background-color: #d2e3ec;
            height: 100px;
            border-top-left-radius: 80px;
            border-top-right-radius: 80px;
            border: 3px solid black;
        }
        label {
            margin-top: 5px;
        }
        
        #bottom{
        	background-color: #d2e3ec;
            height: 100px;
            border-bottom-left-radius: 80px;
            border-bottom-right-radius: 80px;
            border: 3px solid black;
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
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        @font-face {
		    font-family: 'InfinitySans-RegularA1';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		@font-face {
			font-family: '양진체';
			src:
				url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		/* summernote에 추가할 눈누 */
		@font-face {
		    font-family: 'EarlyFontDiary';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EarlyFontDiary.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		.note-editor .dropdown-toggle::after {
            display: none;
        }
		
	</style>
</head>
<body>
	<!--네비바-->
	<header class="mb-3 border-bottom"
		style="box-shadow: 2px 1px 6px 1px #bfbfbf;">
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
								href="/board/toBoard" style="font-size: 18px;">자유 게시판</a></li>
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
								<c:if
									test="${not empty loginSession && loginSession.user_email eq 'admin'}">
									<div class="dropdown text-end">
										<a href="/"
											class="d-block link-dark text-decoration-none dropdown-toggle"
											id="dropdownUser1" data-bs-toggle="dropdown"
											aria-expanded="false"> <img
											src="/resources/images/profile.jpg" alt="mdo" width="32"
											height="32" class="rounded-circle">
										</a>
										<ul class="dropdown-menu text-small"
											aria-labelledby="dropdownUser1">
											<li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
											<li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a></li>
											<li><hr class="dropdown-divider"></li>
											<li><a class="dropdown-item" href="/admin/toAdmin">관리자
													페이지이동</a></li>
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
											aria-expanded="false"> <c:if
												test="${loginSession.user_image eq null}">
												<img src="/resources/images/profile.jpg" alt="mdo"
													width="40" height="40" class="rounded-circle">
											</c:if> <c:if test="${loginSession.user_image ne null}">
												<img src="/profile/${loginSession.user_image }" alt="mdo"
													width="40" height="40" class="rounded-circle">
											</c:if>
										</a>
										<ul class="dropdown-menu text-small"
											aria-labelledby="dropdownUser1">
											<li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
											<li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a>
											</li>
											<li>
												<hr class="dropdown-divider" style="margin: 0px;">
											</li>
											<c:if test="${loginType ne 'kakao'}">
												<li><a class="dropdown-item mt-2"
													href="/login/toLogout">로그아웃</a></li>
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

	<div class="container" id="modifyWrapper" style="width: 70%;">
		<div id="head" class="row text-center align-items-center my-5">
			<h1>게시글 수정</h1>
		</div>
        <form id="modifyForm" action="/board/modify" method="post">
        	
        	<div class="d-none">
        		<input type="text" id="seq_board" name="seq_board" value="${modMap.boardDTO.seq_board}">
        	</div>
	        <div class="row mt-4 text-center">
	            <div class="col-1">
	                <label class="form-label fs-5">분류</label>
	            </div>
	            <div class="col-2">
	                <c:choose>
	            		<%-- 관리자 계정이라면 공지 쓰기 --%>
	            		<c:when test="${loginType eq 'admin'}">
	            			<select name="board_category" class="form-select selectBox" aria-label="유형" disabled>
			                    <option value="default">선택</option>
			                    <option value="공지" <c:out value="${modMap.boardDTO.board_category eq '공지' ? 'selected' : ''}"/>>공지</option>
			                    <option value="수다" <c:out value="${modMap.boardDTO.board_category eq '수다' ? 'selected' : ''}"/>>수다</option>
			                    <option value="일상" <c:out value="${modMap.boardDTO.board_category eq '일상' ? 'selected' : ''}"/>>일상</option>
			                    <option value="기타" <c:out value="${modMap.boardDTO.board_category eq '기타' ? 'selected' : ''}"/>>기타</option>
			                </select>
	            		</c:when>
	            		<c:otherwise>
	            			<select name="board_category" class="form-select selectBox" aria-label="유형" disabled>
			                    <option value="default">선택</option>
			                    <option value="수다" <c:out value="${modMap.boardDTO.board_category eq '수다' ? 'selected' : ''}"/>>수다</option>
			                    <option value="일상" <c:out value="${modMap.boardDTO.board_category eq '일상' ? 'selected' : ''}"/>>일상</option>
			                    <option value="후기" <c:out value="${modMap.boardDTO.board_category eq '후기' ? 'selected' : ''}"/>>후기</option>
			                    <option value="기타" <c:out value="${modMap.boardDTO.board_category eq '기타' ? 'selected' : ''}"/>>기타</option>
			                </select>
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            <div class="col-1">
	                <label class="form-label fs-5">제목</label>
	            </div>
	            <div class="col-8">
	                <input type="text" id="title" name="board_title" class="form-control" placeholder="제목을 입력하세요. (최대 18자)" value="${modMap.boardDTO.board_title}" maxlength="18">
	            </div>
	        </div>
			
	        <div class="row mt-4">
				<textarea id="summernote" name="board_content">${modMap.boardDTO.board_content}</textarea>
	        </div>
	        <sup>(<span id="nowByte">0</span>/2500bytes)</sup>
	        
	        <div class="row my-4 justify-content-center align-items-center" id="bottom">
	            <div class="col-auto">
	                <button type="button" id="cancelBtn" class="btn btn-light">취소</button>
	            </div>
	            <div class="col-auto">
	                <button type="button" id="submitBtn" class="btn" style="background-color: #e6f6ff;">수정 완료</button>
	            </div>
	        </div>
        </form>
        <form id="infoForm" method="get">
			<input type="hidden" id="seq_board" name="seq_board" value="${modMap.boardDTO.seq_board}">
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="type" value="${cri.type}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
		</form>
        
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
		/* summernote */
		$(document).ready(function() {
			var fontList = ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','EarlyFontDiary', '맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'];
			$('#summernote').summernote({
				  height: 450, // 에디터 높이
				  minHeight: 300, // 최소 높이
				  maxHeight: 550, // 최대 높이
				  focus: true, // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR", // 한글 설정
				  placeholder: '최대 2500byte까지 작성 가능합니다.', //placeholder 설정
				  toolbar: [
						// [groupName, [list of button]]
						['fontname', ['fontname']], // 글꼴
						['fontsize', ['fontsize']], // 글자 크기
						// 굵기, 기울임꼴, 밑줄, 취소선, 서식 지우기
					    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
					 	// 글자 색
					    ['color', ['forecolor', 'color']],
					 	// 그림첨부, 링크만들기, 동영상첨부
					    ['insert',['picture', 'link', 'video']],
					    // 글머리, 번호매기기, 문단정렬
					    ['para', ['ul', 'ol', 'paragraph']],
					    // 줄간격
					    ['height', ['height']],
						// 표 만들기
					    ['table', ['table']],
					 	// 코드보기, 확대해서보기, 도움말
					    ['view', ['codeview', 'help']]
				  ],
				  // 추가한 글꼴
				  fontNames: fontList,
				  // 추가한 폰트 사이즈
				  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				  fontNamesIgnoreCheck: fontList,
				  callbacks: {
					  onImageUpload : function(files, editor, welEditable){
						  // 파일 업로드(다중 업로드를 위해 반복문 사용)
						  for (var i = files.length - 1; i >= 0; i--) {
							  uploadSummernoteImageFile(files[i], this);
						  }
					  }, onKeyup : function(e){
							fn_checkByte(this); // 글자수 바이트 체크
						}, onKeydown : function(e){
							fn_checkByte(this); // 글자수 바이트 체크
						}
				  }
			});
			
			// 주기적으로 감지할 대상 요소 선정
			let target = document.querySelector(".note-editable");
			
			// DOM의 어떤 부분을 감시할지를 옵션 설정
			let config = { 
				childList: true, // 자식노드 추가/제거 감지
				subtree : true, // 대상 노드의 자식 뿐만 아니라 손자 이후로 모두 감시
			};
			
			// 옵저버 인스턴스 생성, 콜백함수 설정
			let observer = new MutationObserver(function(mutationList){ // 타겟에 변화가 일어나면 콜백함수를 실행하게 된다.
				//console.log(mutationList);
				for(let mutation of mutationList){
					if(mutation.removedNodes.length == 1){
						if(mutation.removedNodes[0].src != null) {
							let img = mutation.removedNodes[0].src;
							//console.log(img);
							let src = decodeURIComponent(img.replace("http://192.168.20.21/boardFile/", ""));
							//console.log(src);
							$.ajax({
								url : "/board/delImg"
								, type : "post"
								, data : {"src" : src}
								, success : function(data){
									console.log(data);
								}, error : function(e){
									console.log(e);
								}
							})
						}
					}
				}
			}); 

			// 감지 시작
			observer.observe(target, config);
		});
		
		//textarea 바이트 수 체크하는 함수
		function fn_checkByte(obj){
			const maxByte = 2500; //최대 100바이트
			const text_val = obj.value; //입력한 문자
			const text_len = text_val.length; //입력한 문자수
			let totalByte=0;
		
			for(let i=0; i<text_len; i++){
				const each_char = text_val.charAt(i);
				const uni_char = escape(each_char); //유니코드 형식으로 변환
				if(uni_char.length>4){
					// 한글 : 2Byte
					totalByte += 2;
				}else{
					// 영문,숫자,특수문자 : 1Byte
					totalByte += 1;
				}
			}
			if(totalByte>maxByte){
				document.getElementById("nowByte").innerText = totalByte;
				document.getElementById("nowByte").style.color = "red";
			}else{
				document.getElementById("nowByte").innerText = totalByte;
				document.getElementById("nowByte").style.color = "green";
			}
		}
		
		let newImg = new Array();
		// summernote 이미지 업로드 function
		function uploadSummernoteImageFile(file, editor){
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data
				, type : "POST"
				, enctype: "multipart/form-data"
				, url : "/board/summernoteImg"
				, contentType : false
				, processData : false
				, success : function(data){
					$(editor).summernote("editor.insertImage", data.url);
					newImg.push(data.url.replace("/boardFile/", ""));
				}, error : function(e){
					console.log(e);
				}
			});
		}
		
		
		// 작성 완료 버튼
		$("#submitBtn").on("click", function(){
			if($("#nowByte").html() >= 2500){
				alert("최대 바이트 허용 수를 초과하여 글을 등록할 수 없습니다.");
				return;
			}
			
			if($("#title").val() === ""){
				Swal.fire({
					icon: 'warning'
					, title: 'Oops...'
					, text: '게시글 제목이 없어요. 제목을 작성해 주세요!'
				})
				$("#title").focus();
				return;
			}
			if($("#summernote").summernote("isEmpty")){
				Swal.fire({
					icon: 'warning'
					, title: 'Oops...'
					, text: '게시글에 내용이 없어요. 내용을 작성해 보세요!'
				})
				return;
			}
			if($(".selectBox").val() === "default"){
				Swal.fire({
					icon: 'warning'
					, title: 'Oops...'
					, text: '게시글 분류를 선택하셔야 합니다!'
				})
				return;
			}
			
			/* let content = $("#summernote").summernote("code");
			let regImg = /(<img[^>]+src\s*=\s*[\"']?([^>\"']+)[\"']?[^>]*>)/g;
			let src;
			while(regImg.test(content)){
				src = RegExp.$2.replace("/boardFile/", "");
				newImg.push(src);
			}
			console.log(newImg);
			console.log(newImg.length); */
			
			if(newImg.length !== 0){
				for(let i = 0; i < newImg.length; i++){
					let inputImg = $("<input>").attr({
						"type" : "hidden"
						, "class" : "imgs"
						, "name" : "imgs[]"
						, "value" : newImg[i]
					});
					$("#modifyForm").append(inputImg);
				};
			}
			
			Swal.fire({
				icon: 'success'
				, title: '게시글 수정 완료!'
				, showConfirmButton: true
			}).then((result) =>{
				if(result.isConfirmed){
					$("#modifyForm").submit();
				}
			});
		});
		
		// 취소 버튼
		$("#cancelBtn").on("click", function(){
			location.href = "/board/toDetailView?seq_board="+${modMap.boardDTO.seq_board};
		})
		
	</script>
</body>
</html>