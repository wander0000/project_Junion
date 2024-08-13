<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SNS 채팅 페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SNSChatStyle.css">
	<!-- import font-awesome, line-awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
	<!-- import pretendard font -->
	<link rel="stylesheet" as="style" crossorigin
		href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
	<!-- import js -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script> -->
</head>


<body>
    <div class="snsContainer">
        <%@ include file="sns_nav.jsp" %>
        <div class="snsContent">
            <%@ include file="sns_header.jsp" %> 
            <main>
                ${login_email}
                <div id="chat-room">
                    <div id="messages">
                        <!-- 메시지 목록이 여기 출력됩니다. -->
                    </div>
                    <div class="sendMessage">
                        <input type="text" id="message-input" placeholder="메시지를 입력하세요"/>
                        <button id="send-button">전송</button>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>


<script>
    // SockJS 라이브러리를 사용하여 서버와 웹소켓 연결을 설정
    var socket = new SockJS('/ws');
    var stompClient = Stomp.over(socket);
    // var roomId = new URLSearchParams(window.location.search).get('chatRoom_id');
    var senderId = "${login_email}";
    var receiverId = "jisu@gmail.com";// 테스트용 이메일

    console.log("@# socket=>"+socket)
    console.log("@# stompClient=>"+stompClient)

    $(document).ready(function() {
        loadMessages();

        // STOMP 클라이언트를 사용하여 서버에 연결
        // 연결이 성공적으로 이루어지면 콜백 함수가 호출
        stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);
            // STOMP 클라이언트를 사용하여 특정 주제(/sub/public)를 구독
            // 이 주제에서 메시지를 받을 때마다 콜백 함수가 호출됨
            stompClient.subscribe('/sub/public', function (chatMessage) {
                console.log("@# stompClient=>"+stompClient);
                console.log("@# JSON.parse(chatMessage.body)=>"+JSON.parse(chatMessage.body));
                showMessage(JSON.parse(chatMessage.body));
            });
        });

        document.getElementById('send-button').addEventListener('click', function () {
            var messageInput = document.getElementById('message-input');
            var messageContent = messageInput.value.trim();

            console.log("@# 메시지 입력=>"+messageContent);
            
            // if (messageContent && stompClient) {
            if (messageContent) {
                var chatMessage = {
                    sender_id: senderId,  // 발신자 ID
                    receiver_id: receiverId, // 수신자 ID
                    // roomId: roomId,    // 채팅방 ID
                    chatRoom_id: 1,    // 채팅방 ID
                    message: messageContent
                };
                console.log("@# chatMessage=>"+chatMessage);

                stompClient.send("/pub/chat.sendMessage", {}, JSON.stringify(chatMessage));
                // stompClient.send("/chat.sendMessage", {}, JSON.stringify(chatMessage));
                console.log("@# stompClient=>"+stompClient);
                messageInput.value = '';
            }
        });

        document.getElementById('message-input').addEventListener('keydown', function(event) {
            if (event.key === 'Enter' && !event.shiftKey) {  // Shift 키가 눌리지 않고 Enter 키가 눌린 경우
                event.preventDefault();  // 기본 이벤트(여기서는 줄바꿈)를 방지
                var messageContent = this.value.trim();  // 입력 필드의 내용을 가져옴

                if (messageContent) {  // 메시지 내용이 비어있지 않은 경우
                    var chatMessage = {
                        sender_id: senderId,  // 발신자 ID
                        receiver_id: receiverId,  // 수신자 ID
                        // roomId: roomId,    // 채팅방 ID
                        chatRoom_id: 1,  // 채팅방 ID, 실제 사용 시 변수 사용 가능
                        message: messageContent
                    };

                    stompClient.send("/pub/chat.sendMessage", {}, JSON.stringify(chatMessage));  // 메시지 전송
                    this.value = '';  // 입력 필드 초기화
                }
            }
        });
    });

    function loadMessages() {
        console.log("@# loadMessages=>"+loadMessages);
        // if (roomId) {
        if (1) {
            $.ajax({
                // url: '/api/messages/room/' + roomId,
                url: '/api/messages/room/' + 1,
                method: 'GET',
                success: function(messages) {
                    $('#messages').empty();
                    messages.forEach(function(message) {
                        showMessage(message);
                    });
                }
            });
        }
    }

    function showMessage(message) {
        var messageElement = document.createElement('div');
        messageElement.classList.add('message');

        console.log("@# 메시지 출력");
        console.log("@# message.sender_id=>"+message.sender_id);
        console.log("@# senderId=>"+senderId);

        // 보낸 사람과 받은 사람에 따라 메시지 스타일 변경
        if (message.sender_id === senderId) {  // 발신자가 현재 사용자인 경우
            messageElement.classList.add('sent');
        } else {
            messageElement.classList.add('received');
        }

        messageElement.innerHTML = message.message;
        document.getElementById('messages').appendChild(messageElement);
        scrollBottom();
    }

    function scrollBottom() {
        var messagesContainer = document.getElementById('messages');
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

</script>


</html>