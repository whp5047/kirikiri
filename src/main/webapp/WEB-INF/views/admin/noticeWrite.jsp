<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- summernote -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>공지 작성</title>
<style>

/* contents 영역 */
.note-group-image-url {
	display: none;
}

#writeWrapper:not(textarea) {
	font-family: 'InfinitySans-RegularA1';
}

#head {
	background-color: #d2e3ec;
	height: 100px;
	border-top-left-radius: 80px;
	border-top-right-radius: 80px;
	border: 3px solid black;
}

label {
	margin-top: 5px;
}

#bottom {
	background-color: #d2e3ec;
	height: 100px;
	border-bottom-left-radius: 80px;
	border-bottom-right-radius: 80px;
	border: 3px solid black;
}


/* 눈누 폰트 */
@font-face {
	font-family: 'MICEGothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
		format('woff2');
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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EarlyFontDiary.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.note-editor .dropdown-toggle::after {
	display: none;
}
</style>
</head>
<body>

	<div class="container" id="writeWrapper" style="width: 70%;">
		<div id="head" class="row text-center align-items-center my-5">
			<h1>공지 쓰기</h1>
		</div>

		<form id="noticeForm" action="/board/noticeWrite" method="post">
			<div id="writeDiv">

				<div class="row mt-4 text-center">
					<div class="col-1">
						<label class="form-label fs-5">분류</label>
					</div>
					<div class="col-2">
						<c:choose>
							<%-- 관리자 계정이라면 공지 쓰기 --%>
							<c:when test="${loginType eq 'admin'}">
								<select name="board_category" class="form-select selectBox"
									aria-label="유형">
									<option selected value="공지">공지</option>
								</select>
							</c:when>
						</c:choose>

					</div>
					<div class="col-1">
						<label class="form-label fs-5">제목</label>
					</div>
					<div class="col-8">
						<input type="text" id="title" name="board_title"
							class="form-control" placeholder="제목을 입력하세요. (최대 18자)"
							maxlength="18">
					</div>
				</div>

				<div class="row mt-4">
					<textarea id="summernote" name="board_content"></textarea>
					<sup>(<span id="nowByte">0</span>/2500bytes)</sup>
				</div>

			</div>

			<div class="row my-4 justify-content-center align-items-center"
				id="bottom">
				<div class="col-auto">
					<button type="button" id="cancelBtn" class="btn btn-light">취소</button>
				</div>
				<div class="col-auto">
					<button type="button" id="submitBtn" class="btn"
						style="background-color: #e6f6ff;">작성 완료</button>
				</div>
			</div>
		</form>
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
				  placeholder: '최대 2500byte자까지 작성 가능합니다.', //placeholder 설정
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
					  },onKeydown: function(e) {
		                  fn_checkByte(this); // 글자수 바이트 체크
		                },
		            	onKeyup: function(e) {
		                 fn_checkByte(this); // 글자수 바이트 체크
		             },
					  
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
							//console.log("img" + img);
							//console.log("src : " + src);
							let src = decodeURIComponent(img.replace("http://192.168.20.21/boardFile/", ""));
							console.log(src);
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
				}, error : function(e){
					console.log(e);
				}
			});
		}
		
		let imgArr = new Array();
		// 작성 완료 버튼
		$("#submitBtn").on("click", function(){
			let groupInfoByteCnt = $("#nowByte").html();
			
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
			
			if(groupInfoByteCnt >= 2500) {
		        Swal.fire('모임 내용은 2500byte를 넘어갈 수 없습니다.');
		        return;
		     }
			
			let content = $("#summernote").summernote("code");
			let regImg = /(<img[^>]+src\s*=\s*[\"']?([^>\"']+)[\"']?[^>]*>)/g;
			let src;
			while(regImg.test(content)){
				src = RegExp.$2.replace("/boardFile/", "");
				imgArr.push(src);
			}
			console.log(imgArr);
			console.log(imgArr.length);
			
			if(imgArr.length !== 0){
				for(let i = 0; i < imgArr.length; i++){
					let inputImg = $("<input>").attr({
						"type" : "hidden"
						, "class" : "imgs"
						, "name" : "imgs[]"
						, "value" : imgArr[i]
					});
					$("#noticeForm").append(inputImg);
				};
			}
			
			Swal.fire({
				icon: 'success'
				, title: '게시글을 등록하겠습니다!'
				, showConfirmButton: true
			}).then((result) =>{
				if(result.isConfirmed){
					let data = $("#noticeForm").serialize();
					console.log(data);
					$.ajax({
						url : "/board/noticeWrite"
						, type : "post"
						, data : data
						, success : function(data){
							if(data == "success"){
								opener.call("msg");
								window.close();
							}
						}
					})
					
				}
			})
		});
		
		// 취소 버튼
		$("#cancelBtn").on("click", function(){
			location.href = "/board/toBoard";
		})
		
		
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
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>