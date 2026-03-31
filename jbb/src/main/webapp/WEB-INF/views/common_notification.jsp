<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<style>
  #notificationMenu{
    position: relative;
    display: inline-flex !important;
    align-items: center;
    justify-content: center;
    width: 44px;
    height: 44px;
    border-radius: 14px;
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.92);
    cursor: pointer;
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease, background .15s ease;
    box-shadow: 0 8px 18px rgba(17,24,39,.06);
    backdrop-filter: blur(10px);
  }

  #notificationMenu:hover{
    transform: translateY(-1px);
    background: #fff;
    border-color: rgba(255,140,0,.32);
    box-shadow: 0 12px 24px rgba(17,24,39,.10);
  }

  #bellIcon{
    font-size: 20px !important;
    line-height: 1 !important;
    color: #ff8c00;
    filter: saturate(115%);
  }

  #unreadBadge{
    position: absolute !important;
    top: -4px !important;
    right: -4px !important;
    min-width: 20px !important;
    height: 20px !important;
    padding: 0 6px !important;
    line-height: 20px !important;
    text-align: center !important;
    border-radius: 999px !important;
    border: 2px solid #fff !important;
    background: linear-gradient(135deg, #ff8c00, #ffb15a) !important;
    color: #fff !important;
    display: none;
    font-size: 11px !important;
    font-weight: 800 !important;
    box-shadow: 0 8px 16px rgba(255,140,0,.28);
  }
</style>

<!-- 알림 아이콘 + 배지 -->
<div id="notificationMenu" style="position:relative; display:inline-block; cursor:pointer;">
  <span id="bellIcon" style="font-size:40px; line-height:1;">&#128276;</span>
  <span id="unreadBadge"
        style="position:absolute; top:0; right:0; background:red; color:white;
               width:16px; height:16px; line-height:16px; text-align:center;
               border-radius:50%; display:none; font-size:12px;">0</span>
</div>

<script>
  $(function(){
    var socket  = new SockJS('${ctx}/ws');
    var client  = Stomp.over(socket);

    // 1) 서버에 연결
    client.connect({}, function() {
      console.log('STOMP connected');
      // 2) 읽지 않은 배지 개수 가져와서 표시
      updateBadge();

      // 3) 실시간 알림 구독
      client.subscribe('/user/queue/notifications', function(frame) {
        var noti = JSON.parse(frame.body);
        // (a) 배지 +1
        var cnt = parseInt($('#unreadBadge').text()||0) + 1;
        $('#unreadBadge').text(cnt).show();
        // (b) 데스크탑 알림/confirm 그대로 처리
        showNotification(noti);
      });
    });

    // 배지 업데이트 함수: 서버에서 현재 읽지 않은 개수 조회
    function updateBadge(){
      $.getJSON('${ctx}/notifications/unreadCount', function(data){
        if(data.count > 0){
          $('#unreadBadge').text(data.count).show();
        } else {
          $('#unreadBadge').hide();
        }
      });
    }

    // 알림 보여주기 (기존 코드 재사용)
    window.showNotification = function(noti){
    	// (1) 데스크탑 알림 대신 무조건 alert
    	  alert(noti.message);
    	  
    	  // (2) 만약 '이동' 기능이 필요하면 추가로 confirm 혹은 직접 redirect
    	  if (confirm('페이지로 이동하시겠습니까?')) {
    	    location.href = '${ctx}' + noti.url;
    	  }
    };

    // 페이지 로드 시 알림 권한 요청
    if(Notification && Notification.permission!=='granted'){
      Notification.requestPermission();
    }

    // 4) 아이콘 클릭 시 알림 페이지로 이동
    $('#notificationMenu').click(function(){
      // 클릭하면 읽음 처리
      $.post('${ctx}/notifications/markAllRead')
       .always(function(){ location.href='${ctx}/notifications'; });
    });
  });
</script>