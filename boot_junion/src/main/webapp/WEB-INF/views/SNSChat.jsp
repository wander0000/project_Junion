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
            <div class="chatMain">
                <div class="chatContent" data-user-email="${receiver_id}">
                    <!-- <div class="left"> -->
                        <div class="UserImage">
                            <ul>
                                <!-- <img src="images/people.svg" alt="#" class="img"> -->
                            </ul>
                        </div>
                    <!-- </div> -->
                    <div class="nameBox">
                        <h3>${receiverName}</h3>
                    </div>
                </div>
                <div id="chat-room">
                    <div id="messages">
                        <!-- 메시지 목록이 여기 출력됩니다. -->
                    </div>
                    <div class="sendMessage">
                        <input type="text" id="message-input" placeholder="메시지를 입력하세요"/>
                        <button id="send-button">전송</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>


<script>
    // SockJS 라이브러리를 사용하여 서버와 웹소켓 연결을 설정
    var socket = new SockJS('/ws');
    var stompClient = Stomp.over(socket);
    // var roomId = new URLSearchParams(window.location.search).get('chatRoom_id');
    var roomId = "${roomNum}";
    var senderId = "${login_email}";
    var receiverId = "${receiver_id}";

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
                    chatRoom_id: roomId,    // 채팅방 ID
                    // chatRoom_id: 1,    // 채팅방 ID
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
                        chatRoom_id: roomId,    // 채팅방 ID
                        // chatRoom_id: 1,  // 채팅방 ID, 실제 사용 시 변수 사용 가능
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
        if (roomId) {
        // if (1) {
            $.ajax({
                url: '/api/messages/room/' + roomId,
                // url: '/api/messages/room/' + 1,
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

    /*
    function showMessage(message) {
        var messageElement = document.createElement('div');
        messageElement.classList.add('message');

        // var timestampSpan = document.createElement('div');
        // timestampSpan.classList.add('message-time');
        // timestampSpan.textContent = timeAgo(new Date(message.timestamp));

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
    */

    /*
    // 채팅 입력시간 계산하는 메소드
    // BY 나성엽
    function timeAgo(date) {
        const MINUTE = 60;
        const HOUR = MINUTE * 60;
        const DAY = HOUR * 24;
        const WEEK = DAY * 7;
        const MONTH = DAY * 30;
        const YEAR = DAY * 365;

        const seconds = Math.floor((new Date() - date) / 1000);
        let interval = seconds / YEAR;

        if (interval > 1) {
            return Math.floor(interval) + "년 전";
        }
        interval = seconds / MONTH;
        if (interval > 1) {
            return Math.floor(interval) + "개월 전";
        }
        interval = seconds / WEEK;
        if (interval > 1) {
            return Math.floor(interval) + "주 전";
        }
        interval = seconds / DAY;
        if (interval > 1) {
            return Math.floor(interval) + "일 전";
        }
        interval = seconds / HOUR;
        if (interval > 1) {
            return Math.floor(interval) + "시간 전";
        }
        interval = seconds / MINUTE;
        if (interval > 1) {
            return Math.floor(interval) + "분 전";
        }
        return "방금";
    }
    */

    /*
    function showMessage(message) {
        var messageElement = document.createElement('div');
        messageElement.classList.add('message', message.sender_id === senderId ? 'sent' : 'received');

        var messageContent = document.createElement('div');
        messageContent.classList.add('message-content');
        messageContent.textContent = message.message;
        
        // 메시지 입력 시간
        var timestampSpan = document.createElement('div');
        timestampSpan.classList.add('message-time');
        timestampSpan.textContent = timeAgo(new Date(message.timestamp));

        if (message.sender_id === senderId){
            messageElement.appendChild(timestampSpan);
            messageElement.appendChild(messageContent);
        } else {
            messageElement.appendChild(messageContent);
            messageElement.appendChild(timestampSpan);
        }

        document.getElementById('messages').appendChild(messageElement);
        scrollBottom();
    }
    */


    var lastTimestamp = null; // 이전 메시지의 시간을 저장할 전역 변수

    function showMessage(message) {
        var currentTimestamp = timeAgo(new Date(message.timestamp)); // 현재 메시지의 시간 계산

        var messageElement = document.createElement('div');
        messageElement.classList.add('message', message.sender_id === senderId ? 'sent' : 'received');

        var messageContent = document.createElement('div');
        messageContent.classList.add('message-content');
        messageContent.textContent = message.message;
        
        var timestampSpan = document.createElement('div');
        timestampSpan.classList.add('message-time');
        timestampSpan.textContent = currentTimestamp;

        // 새로운 타임스탬프 추가
        timestampSpan.setAttribute('data-timestamp', message.timestamp);

        if (message.sender_id === senderId){
            if (currentTimestamp === lastTimestamp) { // 이전 메시지와 시간이 같다면
                var lastMessageTime = document.querySelector('.message:last-child .message-time');
                if (lastMessageTime) lastMessageTime.style.display = 'none'; // 이전 메시지의 시간을 숨김
            }
            else {
                var lastMessage = document.querySelector('.message:last-child');
                if (lastMessage) lastMessage.classList.add('time-visible'); // 시간이 표시되는 메시지에 클래스 추가
            }
            messageElement.appendChild(timestampSpan);
            messageElement.appendChild(messageContent);
        } else {
            if (currentTimestamp === lastTimestamp) { // 이전 메시지와 시간이 같다면
                var lastMessageTime = document.querySelector('.message:last-child .message-time');
                if (lastMessageTime) lastMessageTime.style.display = 'none'; // 이전 메시지의 시간을 숨김
            }
            else {
                var lastMessage = document.querySelector('.message:last-child');
                if (lastMessage) lastMessage.classList.add('time-visible'); // 시간이 표시되는 메시지에 클래스 추가
            }
            messageElement.appendChild(messageContent);
            messageElement.appendChild(timestampSpan);
        }

        document.getElementById('messages').appendChild(messageElement);
        scrollBottom();

        lastTimestamp = currentTimestamp; // 현재 메시지의 시간을 저장
    }
    

    // 업데이트한 시간으로 바꿈
    function updateTimes() {
        $('.message-time').each(function() {
            var timestamp = $(this).attr('data-timestamp');
            if (timestamp) {
                var newTime = timeAgo(new Date(timestamp));
                $(this).text(newTime);
            }
        });
    }

    // 1초마다 시간 업데이트
    setInterval(updateTimes, 1000);  


    // 메시지 입력 후 스크롤 맨 밑으로 이동
    function scrollBottom() {
        var messagesContainer = document.getElementById('messages');
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }


    // 프로필 이미지 불러옴
    // $('.chatContent').each(function () {
    //     var userEmail = $(this).data('user-email')
        
    //     var uploadResultContainer = $(this).find('.UserImage ul');

    //     $.ajax({
    //         url: '/getUserImageList',
    //         type: 'GET',
    //         data: {user_email: userEmail}, // 이메일만 데이터로 전송
    //         dataType: 'json',
    //         success: function(data) {
    //             showUploadResult(data, uploadResultContainer);
    //         },
    //         error: function(xhr, status, error) {
    //             console.error('Error fetching file list for email ' + email + ':', error);
    //         }
    //     });
    // });

    // // 프로필 이미지 불러옴
    // function showUploadResult(uploadResultArr, uploadResultContainer){
    //     if (!uploadResultArr || uploadResultArr.length == 0) {
    //         return;
    //     }

    //     var str = "";

    //     $(uploadResultArr).each(function (i, obj) {
    //         var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

    //         str += "<li data-path='" + obj.uploadPath + "'";
    //         str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
    //         str += "<div>";
    //         str += "<span style='display:none;'>" + obj.fileName + "</span>";
    //         str += "<img src='/snsDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
    //         str += "</div></li>";
    //     });

    //     uploadResultContainer.empty().append(str);
    // }
    // 프로필 이미지 끝
</script>


</html>