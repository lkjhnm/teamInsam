<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath }/js/stomp.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<script type="text/javascript">
	$(function(){
		
		var url = window.location.pathname;
		var indexS = url.indexOf('/',1)
		var indexL = url.indexOf('/',indexS+1)
		var page = url.substring(indexS+1,indexL)
		var headInter;
		
		switch(page){
			case 'auction':
				$("#menuAuction").css("color", "#ff1d43")
				$("#menuAuction").css("border-top","1px solid #707070")
				break;
			case 'item':
				$("#menuItem").css("color", "#ff1d43")
				$("#menuItem").css("border-top","1px solid #707070")
				break;
			case 'studio':
				$("#menuStudio").css("color", "#ff1d43")
				$("#menuStudio").css("border-top","1px solid #707070")
				break;
		}
		
		$(".menuLink").on("mouseover",function(){
			var i = 0;
			headInter = setInterval(() => {
				i++
				if(i == 2){
					$(this).siblings().animate({
						opacity : '0.2'
					})
				}
			}, 100);
		})
		$(".menuLink").on("mouseleave",function(){
			clearInterval(headInter)
			$(this).siblings().animate({
				opacity : '1'
			})
		})
		
		$("#menuAuction").on("click",function(){
			location.href='${pageContext.request.contextPath}/auction/list'
		})
		$("#menuStudio").on("click",function(){
			location.href='${pageContext.request.contextPath}/studio/list'
		})
		$("#menuItem").on("click",function(){
			location.href='${pageContext.request.contextPath}/item/list'
		})
		
		$("#headerTitle").on("click",function(){
			location.href="${pageContext.request.contextPath}/main"
		})
		
		$("#myPageBtn").on("click",function(){
			location.href="${pageContext.request.contextPath}/user/myPage?m_pk=${m_pk}"
		})
		$("#logoutBtn").on("click",function(){
			location.href="${pageContext.request.contextPath}/logout" 
		})
		
		$("#myPageAuthor").on("click",function(){
			location.href="${pageContext.request.contextPath}/author/privatePage?m_pk=${m_pk}";
		})
		
		//웹소켓 정의 (알람)
		connect();
		
	})
	
	
	function connect(){
		var m_pk = "${sessionScope.m_pk}";
		
		Notification.requestPermission();
		
		sock = new SockJS("${pageContext.request.contextPath}/connect");
		stompClient = Stomp.over(sock);
		stompClient.connect({},function(){
			
			if(!m_pk || m_pk==""){
				return;
			}

			$.ajax({
				url:"${pageContext.request.contextPath}/user/subscribeListAll",
				data: {"m_pk_user":m_pk},
				dataType: "json",
				type:"post",
				success:function(data){					// 1: author   2:studio    3:auction	
														// hi_pk, a_pk 
					$.each(data,function(i,list){
						console.log(list);
						stompClient.subscribe("/subscribe/alarm/"+list.MS_TYPE+"/"+list.MS_FK, function(webSocketData){
							var data = JSON.parse(webSocketData.body);
							
							var title = data.title;
							var pk = data.pk;
							var img = data.img;
							var content = data.content;
							var url = data.type == 1 ? "auction/detail?a_pk=" : 
										   data.type == 2 ? "item/detail?num=" : "studio/detail?num="  ;
							url += pk;
							
							var option = {
								body: content
							}
							
							var notification = new Notification(title, option);
							notification.onclick = function(){
								location.href='${pageContext.request.contextPath}/' + url ;
								notification.close();
							}
							
							setTimeout(function(){
								notification.close();
							},10000);
						})
					})
				}
			})
		})
	
	}
	
</script>
<sec:authorize access="isAuthenticated()" >
	<script>
		$(function(){
			$("#loginHeader").on("mouseenter",function(){
				$("#menuUser").stop().slideDown();
			})
			$("#loginHeader").on("mouseleave",function(){
				$("#menuUser").stop().slideUp();
			})
		})
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script>
		$(function(){
			$("#loginHeader").on("click",function(){
				location.href="${pageContext.request.contextPath}/member/loginForm"
			})
		})
	</script>
</sec:authorize>
<div id="header">
	<div id="menuContainer">
		<span class='menuLink' id="menuItem">I T E M</span>
		<span class='menuLink' id="menuAuction">A U C T I O N</span>
		<span class='menuLink' id="menuStudio">S T U D I O</span>
	</div>
	<span id="headerTitle">
		<i>Handus</i>
	</span>
	<ul id="iconContainer">
<%-- 		<sec:authorize access="isAuthenticated()"> --%>
<!-- 			<div id="bell"><span><i class="far fa-bell"></i></span><div id="redCircle"></div></div> -->
<%-- 		</sec:authorize> --%>
<%-- 		<sec:authorize access="isAnonymous()"> --%>
<!-- 			<div id="bell"></div> -->
<%-- 		</sec:authorize> --%>
		<li id="loginHeader"><img src="${pageContext.request.contextPath }/img/header-icon-account.svg">
			<ul id='menuUser'>
				<sec:authorize access="hasRole('ROLE_MEMBER')" />
				<sec:authorize access="hasRole('ROLE_AUTHOR')" var="author" />
				<c:choose>
					<c:when test="${author }">
						<li id="myPageBtn">MY PAGE</li>
						<li id="myPageAuthor">AUTHOR</li>
						<li id="logoutBtn">LOGOUT</li>
					</c:when>
					<c:otherwise>
						<li id="myPageBtn">MY PAGE</li>
						<li id="logoutBtn">LOGOUT</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</li>
		<li id="subscribeHeader"><img src="${pageContext.request.contextPath }/img/header-icon-bookmark.svg"></li>
		<li id="shoppingCartHeader"><img src="${pageContext.request.contextPath }/img/header-icon-cart.svg"></li>		
	</ul>
</div>
