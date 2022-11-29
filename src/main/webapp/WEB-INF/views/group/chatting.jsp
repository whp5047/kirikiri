<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채팅</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
	crossorigin="anonymous"></script>
<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<style>
* {
	box-sizing: border-box;
	font-family: 'Bazzi';
	font-size: 15px;
}

/* 눈누 폰트 */
@font-face {
	font-family: 'KOTRAHOPE';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Bazzi';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/Bazzi.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.chatting {
	border: 2px solid darkgrey;
	height: 590px;
	border-radius: 10px;
}

.title {
	border-bottom: 2px solid darkgrey;
	height: 10%;
	background-color: #d2e3ec;
	border-start-start-radius: 10px;
	border-start-end-radius: 10px;
}

.contentBox {
	height: 90%;
}

.users {
	border-right: 2px solid darkgrey;
	height: 100%;
	background-color: rgb(246, 246, 246);
}

.users>p {
	font-size: 16px;
	text-align: center;
	padding-top: 8px;
	color: darkolivegreen;
	border-bottom: 2px solid darkolivegreen;
	font-family: 'KOTRAHOPE';
}

.userTable {
	height: 40px;
}

.userTable td {
	color: darkgrey;
}

.profile {
	border-radius: 50%;
	background-color: white;
	width: 25px;
	height: 25px;
}

#profile_img {
	width: 25px;
	height: 25px;
	border-radius: 50%;
}

.offline {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background-color: orange;
	margin-bottom: 50%;
}

.online {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background-color: green;
	margin-bottom: 50%;
}

.contentBox {
	font-size: 15px;
}

.chatBox {
	height: 100%;
}

.messages {
	height: 90%;
	overflow-y: scroll;
	-ms-overflow-style: none;
	padding-bottom: 10px;
}

.messages::-webkit-scrollbar {
	display: none;
}

#time {
	color: darkgray;
	font-size: 13px;
}

.mymsg {
	margin-top: 20px;
	overflow: hidden;
	margin-left: 35%;
	word-break: break-all;
}

.othermsg {
	margin-top: 20px;
	margin-right: 35%;
	word-break: break-all;
}

.mymsg .msgBox {
	width: fit-content;
	height: fit-content;
	background-color: #fce2ef;
	padding: 10px;
	border-radius: 13px;
	float: right;
}

.mymsg .timename {
	float: right;
	margin-left: 60%;
	width: 100%;
	text-align: end;
}

.othermsg .msgBox {
	width: fit-content;
	height: fit-content;
	background-color: #d6ede0;
	padding: 10px;
	border-radius: 13px;
}

.inputmsg {
	border-top: 1px solid gray;
}

.chatBox {
	z-index: 99;
	position: relative;
}

.emojiBox {
	position: absolute;
	z-index: 2;
	width: 250px;
	height: 350px;
	border: 1px solid gainsboro;
	right: 8px;
	bottom: 50px;
	background-color: white;
	overflow-y: scroll;
	display: none;
}

.emojiBox::-webkit-scrollbar {
	display: none;
}

.emojiImg {
	width: 70px;
	margin: 7px;
}

.selectBtn {
	border-top: none;
	border-bottom: none;
	border-right: 2px solid gainsboro;
	border-left: 2px solid gainsboro;
	background-color: transparent;
	padding: 2px;
	margin: 0;
	border-radius: 5px;
}

hr {
	margin-top: 0;
}

#swal2-title {
	font-size: 16px;
}
</style>
</head>
<body>
	<div class="container chatting">
		<input type="text" class="d-none" id="nickname"
			value="${user_nickname }"> <input type="text" class="d-none"
			id="seq_group" value="${seq_group }">
		<div class="row title text-center pt-1">
			<div class="col-12">
				<span
					style="font-size: 32px; color: navy; font-family: 'KOTRAHOPE';">${tgList[0].group_title}</span>
				<span style="font-size: 30px; font-family: 'KOTRAHOPE';">&nbsp;채팅</span>
			</div>
		</div>
		<div class="row contentBox">
			<div class="col-3 users" id="users">
				<p>대화상대 목록(${nickList.size()})</p>
				<table>
					<tbody class="users_tbody" id="users_tbody">
						<c:forEach items="${nickList }" var="user" varStatus="status">
							<tr class="userTable">
								<td>
									<div class="profile me-2">
										<c:if test="${profileList[status.index] eq null}">
											<img src="/resources/images/profile.jpg" id="profile_img">
										</c:if>
										<c:if test="${profileList[status.index] ne null}">
											<img src="/profile/${profileList[status.index]}"
												id="profile_img">
										</c:if>
									</div>
								</td>
								<td>${user.user_nickname}</td>
								<td><div class="offline ms-1"></div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-9 chatBox">
				<div class="messages">
					<c:forEach items="${gcList }" var="gcList">
						<c:choose>
							<c:when test="${user_nickname eq gcList.user_nickname}">
								<div class="mymsg">
									<div class="timename">
										<span id="time">${gcList.sendDate } &nbsp</span> <span>${gcList.user_nickname }</span>
									</div>
									<div style="clear: both;"></div>
									<c:set var="str" value="${gcList.message }" />
									<c:if test="${fn:contains(str, '/resources/')}">
										<div class="msgBox">
											<span><img style="pointer-events: none;"
												class="emojiImg" src="${gcList.message }"></span>
										</div>
									</c:if>
									<c:if test="${not fn:contains(str, '/resources/')}">
										<div class="msgBox">
											<span>${gcList.message }</span>
										</div>
									</c:if>
								</div>
								<div style="clear: both;"></div>
							</c:when>
							<c:otherwise>
								<div class="othermsg">
									<div class="timename">
										<span>${gcList.user_nickname } &nbsp</span> <span id="time">${gcList.sendDate }</span>
									</div>
									<c:set var="str" value="${gcList.message }" />
									<c:if test="${fn:contains(str, '/resources/')}">
										<div class="msgBox">
											<span><img style="pointer-events: none;"
												class="emojiImg" src="${gcList.message }"></span>
										</div>
									</c:if>
									<c:if test="${not fn:contains(str, '/resources/')}">
										<div class="msgBox">
											<span>${gcList.message }</span>
										</div>
									</c:if>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="emojiBox">
					<div class="row">
						<div class="col-2 pe-0">
							<button type="button" id="rupi" class="selectBtn">
								<img src="/resources/images/루피아이콘.png"
									style="width: 25px; border-radius: 5px;">
							</button>
						</div>
						<div class="col-2 ps-0">
							<button type="button" id="ogu" class="selectBtn">
								<img src="/resources/images/아기오구아이콘.png"
									style="width: 25px; height: 25px;">
							</button>
						</div>
						<div class="col-10"></div>
					</div>
					<hr>
					<div class="rupi">
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피1.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피2.png">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피3.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피4.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피5.png">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피6.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피7.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피8.png">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피9.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피10.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피11.png">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피12.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피13.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/루피14.png">
							</div>
						</div>
						<div class="col-10"></div>
					</div>
					<div class="ogu">
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구1.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구2.png">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구3.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구4.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구5.png">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구6.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구7.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구8.png">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구9.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구10.png">
							</div>
							<div class="col-sm-4">
								<img class="emojiImg" src="/resources/images/emoticon/오구11.png">
							</div>
						</div>
					</div>
				</div>
				<div
					class="inputmsg d-flex justify-content-center align-items-center">
					<input type="text" id="message" class="form-control w-75 mt-2"
						autofocus>
					<button type="button"
						class="btn btn-outline-primary d-flex align-items-center mt-2 ms-4 h-75"
						id="send">send</button>
					<button type="button"
						class="btn d-flex align-items-center emoticon ms-3 mt-2">
						<i class="fa-regular fa-face-smile"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<script>
      // home.jsp 페이지가 로드됐을 때 바로 WebSocket 접속이 이뤄져 스트림이 생성되고
      // 그 후 작성하여 보낸 메세지가 요청이 되거나, 다른 접속자가 보낸 메세지를 응답받을 수 있게 만듦.
      // 웹소켓 객체 생성할때 반드시 서버의 ip 주소값은 실제 ip 주소를 이용
      // 포트번호 다르면 :포트번호/chat 39.120.220.2:11111
      var seq_group = $("#seq_group").val();
      let ws = new WebSocket("ws://192.168.20.21/chat/"+seq_group);
      let nickname = $("#nickname").val();
      //이모티콘 나오게 하기
         $(".emoticon").click(function(){
            $(".emojiBox").fadeToggle();
            $(".ogu").css("display","none");
            $("#rupi").css("box-shadow","2px 2px 2px 2px skyblue");
            $("#ogu").css("box-shadow", "none");
            $("#ogu").click(function(){
               $("#rupi").css("box-shadow", "none");
               $(".ogu").css("display","block");
               $(".rupi").css("display","none");
               $("#ogu").css("box-shadow","2px 2px 2px 2px skyblue");
            })
            $("#rupi").click(function(){
               $("#ogu").css("box-shadow", "none");
               $("#rupi").css("box-shadow", "2px 2px 2px 2px skyblue");
               $(".rupi").css("display","block");
               $(".ogu").css("display","none");
            })
            if($("#message").click(function(){
               $(".messages").css("zIndex", "1");
               $(".emojiBox").css("display", "none");
            }))
            $(".rupi").css("display","block");
         })
      
      $(".emojiImg").on("click", function () {
         console.log($(".emojiImg"));
           sendEmoji($(this));
           $(".emojiBox").css("display", "none");
      })
      
      $(".messages").on("click", function(){
         $(".messages").css("zIndex", "1");
         $(".emojiBox").css("display", "none");
         $(".rupi").css("display","block");
      })

      //nickList 배열로 만들기
      let nickList = new Array();
      <c:forEach items="${nickList }" var="user">
         nickList.push("${user.user_nickname}");
      </c:forEach>

      ws.onerror = function(event){
           console.log(event);
      }
      
      window.onload=function(){
         $("#send").click(function(){
            sendChat();
         })
         $("#message").keypress(function(e){
            if(e.keyCode == 13) {
               sendChat();
            }
         })
         
         let openNick = new Array();
         let nick = new Array();
         let seq = new Array();
         // endpoint로부터 전송된 메세지 받기
         // endpoint에서 sendText() 메서드를 실행하면 onmessage 이벤트가 trigger 됨.
         ws.onmessage = function(message){
            // 넘어 온 json처럼 생긴 문자열을 실제 json형(객체)으로 변환
            let msg = JSON.parse(message.data);
            if(msg.status=="open"){       //누가 들어왔을때
            	openNick = [];
            	nick = [];
                seq = [];
            	for(let i=0; i<msg.openNickname.length; i++){
            		nick.push(msg.openNickname[i].split("/")[0]);
            		seq.push(msg.openNickname[i].split("/")[1]);
            	}
                console.log(nick +" : "+seq);
                for(let i=0; i<nick.length;i++){
                	if(seq[i]==seq_group){
                		openNick.push(nick[i]);
                	}
                }
                console.log("지금 들어온 사람들 닉네임: "+openNick);
                let intersection = nickList.filter(x => openNick.includes(x));
                /* if(seq[msg.openNickname.length-1]==seq_group){
                	if(intersection.length!=openNick.length){
                		alert("누군가의 닉네임이 변경되었어요! 새로고침을 해보세요!");
	                	Swal.fire({
                    		  position: 'top-end',
                    		  icon: 'info',
                    		  title: '누군가의 닉네임이 변경되었어요! 새로고침을 해보세요!',
                    		  showConfirmButton: false,
                    		  timer: 3000
                    	}) 
                    }
                } */
                for(let i=0; i<intersection.length; i++){
                    for(let j=0; j<nickList.length; j++){
                           if(intersection[i]==nickList[j]){
                              $(".users_tbody").children("tr").eq(j).children("td").eq(1).css("color","black");
                              $(".users_tbody").children("tr").eq(j).children("td").eq(2).children().attr("class","online ms-1");
                           }
                    }
                 }
            }else if(msg.close=="close"){ //누가 나갔을 때
               console.log("클로즈 실행됨");
               openNick = [];
               nick = [];
               seq = [];
           		for(let i=0; i<msg.closeNickname.length; i++){
	           		nick.push(msg.closeNickname[i].split("/")[0]);
	           		seq.push(msg.closeNickname[i].split("/")[1]);
	           	}
               console.log(nick +" : "+seq);
               for(let i=0; i<nick.length;i++){
               		if(seq[i]==seq_group){
               			openNick.push(nick[i]);
               		}
               }
               let intersection = nickList.filter(x => openNick.includes(x));
               for(let i=0; i<intersection.length; i++){
                  for(let j=0; j<nickList.length; j++){
                     $(".users_tbody").children("tr").eq(j).children("td").eq(1).css("color","darkgray");
                     $(".users_tbody").children("tr").eq(j).children("td").eq(2).children().attr("class","offline ms-1");
                     if(intersection[i]==nickList[j]){
                        $(".users_tbody").children("tr").eq(j).children("td").eq(1).css("color","black");
                        $(".users_tbody").children("tr").eq(j).children("td").eq(2).children().attr("class","online ms-1");
                     }
                  }
               }
            }else{ //그외 메세지 주고 받을때
               let strArr = msg.message.split("/");
               if(strArr[1]=="resources" && strArr[2]=="images" && strArr[3]=="emoticon"){
                  otherEmoji(msg); //이모티콘받기
               }else{
                   findWord(msg);
               }
               $(".messages").scrollTop($(".messages")[0].scrollHeight);
            } 
         }
         $(".messages").scrollTop($(".messages")[0].scrollHeight);
      }
      
      //배경 바꿨다 돌아오기
      function changeBack(url){
         $(".messages").css({"background-image":"url("+url+")", "background-size": "100% 120%"});
         setTimeout(function() {
            $(".messages").css("background-image","none");
         }, 1500);
         
      }
      //예약어찾기 - 보낼때
      function sendWord(msg){
         var exp_wow = /우와/;
         var exp_hi = /안녕/;
         var exp_hot = /더워/;
         
         var word1 = msg.search(exp_wow);
         var word2 = msg.search(exp_hi);
         var word3 = msg.search(exp_hot);
         if(word1!=-1){
            changeBack("/resources/images/background/우와.gif");
         }else if(word2!=-1){
            changeBack("/resources/images/background/안녕.gif");
         }else if(word3!=-1){
            changeBack("/resources/images/background/더워.gif");
         }
      }
      //예약어찾기 -받을때
      function findWord(msg){
         var exp_wow = /우와/;
         var exp_hi = /안녕/;
         var exp_hot = /더워/;
         
         var word1 = msg.message.search(exp_wow);
         var word2 = msg.message.search(exp_hi);
         var word3 = msg.message.search(exp_hot);
         if(word1==-1&&word2==-1&&word3==-1){
            otherChat(msg);
         }else if(word1!=-1){
            changeBack("/resources/images/background/우와.gif");
            otherChat(msg);
         }else if(word2!=-1){
            changeBack("/resources/images/background/안녕.gif");
            otherChat(msg);
         }else if(word3!=-1){
            changeBack("/resources/images/background/더워.gif");
            otherChat(msg);
         }
      }
      
      //server 시간
      function serverTime(){
         // 1. 현재 시간(Locale)
         const curr = new Date();

         // 2. UTC 시간 계산
         const utc = curr.getTime() + (curr.getTimezoneOffset() * 60 * 1000);

         // 3. UTC to KST (UTC + 9시간)
         const KR_TIME_DIFF = 9 * 60 * 60 * 1000;
         const kr_curr = new Date(utc + (KR_TIME_DIFF));
         const kr_time = kr_curr.toString();
         var hour = kr_time.substr(16,2);
         var min = kr_time.substr(19,2);
         var ampm = null;
         if(hour<=12){
            if(hour==0){
               ampm = '오전 12:' + min; 
            }else{
               ampm = '오전 ' + kr_time.substr(16,5);
            }
         } else{
            ampm = '오후 ' + (hour-12) + ":" + min;
         }
         
          return "&nbsp" + ampm + "&nbsp";
      }
      
      //이모티콘 보내는 함수
      function sendEmoji(imgCls){
         let url = 'http://192.168.20.21/';
         let emojiSrc = $(imgCls).prop("src").indexOf(url)+url.length-1; // /resources 시작하는 index번호
         let realSrc = $(imgCls).prop("src").slice(emojiSrc);
         console.log(realSrc);
         let emoji = "<img style='pointer-events : none;' class='emojiImg' src = '" + realSrc + "'>";
         console.log(emoji);
         ws.send(realSrc); // 서버의 endpoint에 메세지를 보내는 함수
         
         let div_clear = $("<div>").css("clear", "both");
         
         let span1 = $("<span>").attr("id", "time").html(serverTime());
         let span2 = $("<span>").html(nickname); 
         let div_tn = $("<div>").attr("class", "timename");
         div_tn.append(span1, span2);
         
         let div_msgB = $("<div>").attr("class", "msgBox");
         let span = $("<span>").html(emoji);
         div_msgB.append(span);
         let div_mymsg = $("<div>").attr("class", "mymsg");
         div_mymsg.append(div_tn, div_msgB);
         $(".messages").append(div_mymsg, div_clear);
         
         $(".messages").scrollTop($(".messages")[0].scrollHeight);

         
      }

      //채팅 보내는 함수
      function sendChat(){
         let message = $("#message").val();
         sendWord(message);
         if(message != ""){ // message가 빈값이 아닐때만 전송
            $("#message").val(""); //입력창 비우기
            ws.send(message); // 서버의 endpoint에 메세지를 보내는 함수
            
            let div_clear = $("<div>").css("clear", "both");
            
            let span1 = $("<span>").attr("id", "time").html(serverTime());
            let span2 = $("<span>").html(nickname); 
            let div_tn = $("<div>").attr("class", "timename");      
            div_tn.append(span1, span2);

            let div_msgB = $("<div>").attr("class", "msgBox");
            let span = $("<span>").html(message);
            div_msgB.append(span);
            let div_mymsg = $("<div>").attr("class", "mymsg");
            div_mymsg.append(div_tn, div_msgB);
            //
            $(".messages").append(div_mymsg, div_clear);
            
            $(".messages").scrollTop($(".messages")[0].scrollHeight);

         }
      }
      
      //이모티콘 받는 함수
      function otherEmoji(msg){
         let span1 = $("<span>").attr("id", "time").html(serverTime());
         let span2 = $("<span>").html(msg.user_nickname); 
         let div_tn = $("<div>").attr("class", "timename");
         div_tn.append(span2, span1);
         
         let div_msgB = $("<div>").attr("class", "msgBox");
         let span = $("<span>").html("<img style='pointer-events : none;' class='emojiImg' src = '" + msg.message + "'>");
         div_msgB.append(span);
         let div_othermsg = $("<div>").attr("class", "othermsg");
         div_othermsg.append(div_tn, div_msgB);
         $(".messages").append(div_othermsg);
      }
      
      //메세지 받는 함수
      function otherChat(msg){
         let span1 = $("<span>").attr("id", "time").html(serverTime());
         let span2 = $("<span>").html(msg.user_nickname); 
         let div_tn = $("<div>").attr("class", "timename");
         div_tn.append(span2, span1);
         
         let div_msgB = $("<div>").attr("class", "msgBox");
         let span = $("<span>").html(msg.message);
         div_msgB.append(span);
         let div_othermsg = $("<div>").attr("class", "othermsg");
         div_othermsg.append(div_tn, div_msgB);
         $(".messages").append(div_othermsg);
      }
      
   </script>
</body>
</html>