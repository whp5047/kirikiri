package com.kiri.webChat;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;

import com.kiri.dto.Group_ChatDTO;
import com.kiri.service.Group_ChatService;

@ServerEndpoint(value="/chat/{seq_group}", configurator=WSConfig.class)
public class ChatEndPoint {
      // ws의 Session은 HttpSession과 다름.
      private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
      private String user_nickname;
      private String user_email;
      private static List<String> nickList = new ArrayList<String>();
      private Group_ChatService service = SpringContext.getApplicationContext().getBean(Group_ChatService.class);
      private static Map<String, Integer> seqMap = new HashMap<>();

      // 클라이언트가 웹소켓 통신에 대한 요청을 처음 보낸 때를 캐치하는 메서드(처음 접속한 순간 = 웹소켓 통신 스트링이 열린 순간)
      // 클라이언트의 웹소켓 첫 접속이 이뤄진 순간 자동으로 실행되는 메서드
      @OnOpen // 지금 접속한 클라이언트의 session 값을 매개변수 받음.
      public void onOpen(Session session, EndpointConfig config, @PathParam("seq_group") int seq_group) {
         //원래 이거
         String user_nickname = (String)config.getUserProperties().get("user_nickname");
         user_email = (String)config.getUserProperties().get("user_email");
         System.out.println("접속한 사용자 : "+ user_nickname);
          // 멤버필드로 셋팅해두기(onMessage메서드에서 사용가능하게끔)
         this.user_nickname = user_nickname;

         String session_id = session.getId();
         seqMap.put(session_id, seq_group); //seq_group session아이디 마다 저장
         System.out.println("sesssion아이디 : " + session_id);
         System.out.println(seqMap.toString());
         
         System.out.println("접속됨");
         clients.add(session); // 멤버필드 list에 새로 접속한 클라이언트 세션 추가
         nickList.add(this.user_nickname+"/"+seq_group);
         
         JSONObject objStatus = new JSONObject();
         objStatus.put("status", "open");
         objStatus.put("openNickname", nickList);
         System.out.println(objStatus.toString());
         
         try {
            for(Session client : clients) {
               System.out.println(client);
               client.getBasicRemote().sendText(objStatus.toString());
            }
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
      
      // 클라이언트가 웹소켓을 통해 서버와 연결되어있는 동안 send라는 함수를 사용했을 때 실행되는 메서드
      @OnMessage
      public void onMessage(Session session, String message, @PathParam("seq_group") int seq_group) {// message 변수에 클라이언트가 전송한 메세지 담김
         System.out.println("메세지 발신자 : " + this.user_nickname);
         System.out.println("message : "+message);
         
         // Jackson이 가지고 있는 JsonObject 클래스를 이용해 user_nickname, message를 json형태로 변환
         JSONObject obj = new JSONObject();
         obj.put("user_nickname", this.user_nickname);
         obj.put("message", message);
         System.out.println(obj.toString());
         
         try{
            service.insert(new Group_ChatDTO(0, seq_group, this.user_email, this.user_nickname, message, null));
         }catch(Exception e) {
            e.printStackTrace();
            // 만약 db에 데이터 저장이 정상적으로 이뤄지지 않으면 다른 사용자들에게 메세지를 전송하는 작업 또한 하지 않도록 메서드의 흐름 종료 -> return
            return;
         }
      
         try {
            // 여러명이 메세지를 주고받는 상황
            // 여러명이 메세지를 주고받는 상황(clients 리스트를 참조해 for문을 돌리는 도중에 접속이 끊기는 경우)
            // concurrentModificationException 발생할 수 있음(동시성 오류)
            
            // 만약 아래의 for문을 수행하는 도중 clients 를 참조하는 다를 작업이 생긴다면
            // 이 for문을 모두 수행할때까지 다른 작업은 대기하게끔 만드는 작업.
            synchronized(clients) {
               for(Session client : clients) {
                  int client_seq = seqMap.get(client.getId());
                  if((session != client)&&(client_seq==seq_group)) { //나에게 메세지 다시 보내지 않음.
                     //접속된 모든 클라이언트들에게 메세지 보내기
                     //getBasicRemote() 앤드포인트+클라이언트 사이의 스트림 주소값을 알아낼 수 있는 메서드
                     client.getBasicRemote().sendText(obj.toString());
                  }
               }
            }
         } catch(Exception e) {
            e.printStackTrace();
         }
         
      }
      
      @OnClose // 연결이 끊어지면 이 어노테이션 붙은 메서드가 실행됨
      public void onClose(Session session, @PathParam("seq_group") int seq_group) { //지금 연결이 끊기는 세션값

         
         
         //client 에서 지금 연결을 끊은 클라이언트의 session 삭제
         clients.remove(session);
         System.out.println("클라이언트의 접속이 끊어졌습니다.");
         seqMap.remove(session.getId());
         System.out.println("지웠음" + seqMap.toString());
         
         JSONObject objStatus = new JSONObject();
         objStatus.put("close", "close");
         
         for(int i=0; i<nickList.size(); i++) {
            if(nickList.get(i).equals(this.user_nickname+"/"+seq_group)) {
               System.out.println("지금 나가는 애"+this.user_nickname);
               nickList.remove(i);
            }
         }
         objStatus.put("closeNickname", nickList);
         System.out.println(objStatus.toString());
         
         try {
            for(Session client : clients) {
               System.out.println(client);
               client.getBasicRemote().sendText(objStatus.toString());
            }
         }catch(Exception e) {
            e.printStackTrace();
         }
         
      }
}