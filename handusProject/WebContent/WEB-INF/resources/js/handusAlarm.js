/**
 * 	핸더스 알람 js 파일입니다.
 */
var sock;
var stompClient;

function connect(){
	var m_pk = "${m_pk}";
	
	sock = new SockJS("/handusProject/connect");
	stompClient = Stomp.over(sock);
	stompClient.connect({},function(){
		
		if(!m_pk || m_pk==""){
			return;
		}
		
		$.ajax({
			url:"${pageContext.request.contextPath}/subscribeListAll",
			data: {"m_pk_user":m_pk},
			dataType: "json",
			type:"post",
			success:function(data){					// 1: author   2:studio    3:auction
				console.log(data)
				
				$.each(data,function(i,list){
					
				})
			}
		})
		
		
		stompClient.subscribe("/subscribe/alarm/${auction.a_pk}",function(webSocketData){	// 애를 개인 구독 페이지로 넘긴다.
			var data = webSocketData.body;
			alert(data);
		})
	})
}

$(function(){
	connect();
})