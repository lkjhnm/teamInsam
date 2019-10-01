<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#main{
		width:70%;
		margin: 0 auto;
		padding-top: 100px;
	}
	#title{
		font-size: 50px;
		margin-bottom:100px;
		text-align:center;
	}
	.list{ 
		margin-bottom:55px;
		margin-top:55px;
		border: 1px solid #191919;
	}
	.list > div{
		border-bottom-style: dashed;
		border-bottom-color: #ebe7dd;
		display:flex;
	}
	.list > div > div{
		height:200px;
		margin-top:85px;
		margin-left: 55px;
	}
	.list img{
		width:200px;
		height:200px;
		margin: 70px;
	}
	.list_container{
		width:1325px;
		margin: 0px auto;
	}
	.item-detail{
		postion:relative;
		top:0;
		left:0;
	}
	.tab_menu{
		width: 130px;
		display:inline-block;
		font-size: 22px;
		text-align: center;
	}
	.tab_menu:hover{
		cursor:pointer;
	}
	#tab_title{
		width: 150px;
		display:inline-block;
		font-size: 30px;
	}
	.author_info>div{
		width: 575px;
		border-bottom:1px solid #191919;
		display:flex;
		justify-content: space-between;
		margin-bottom:20px;
	}
	.info-title{
		font-weight:600;
	}
	.author_btn_container{
		width: 250px;
		height:230px;
	}
	.author_btn{
		width: 120px;
		height: 25px;
		line-height:25px;
		text-align:center;
		padding: 5px;
		background-color: #191919;
		color:#fff;
		float:right;
		margin-bottom: 5px;
	}
	.author_btn:hover{
		cursor:pointer;
	}
</style>
<script>
	$(function(){
		
		showMySubsList("${m_pk}",1,function(data){
			$.each(data,function(i,item){
				var parent = $("<div>").append($("<img src='${pageContext.request.contextPath}/image/"+item.HI_PK+"'>"))
				var div = $("<div class='author_info'>")
				
				var name = $("<div><span class='info-title'>NAME</span><span>"+item.AT_NAME+"</span></div>")
				var email = $("<div><span class='info-title'>EMAIL</span><span>"+item.AT_EMAIL+"</span></div>")
				var studio = $("<div><span class='info-title'>STUDIO</span><span>"+item.AT_STUDIO+"</span></div>")
				var studio_addr = $("<div><span class='info-title'>ADDRESS</span><span>"+item.AT_ADDRESS+"</span></div>")
				
				var div2 = $("<div class='author_btn_container'>")
				var btn1 = $("<div class='author_btn' onclick='cancelSubscribe(1,${m_pk},"+item.M_PK+",this)'>구독 취소</div>")
				var btn2 = $("<div class='author_btn'>1:1 문의</div>")
				var btn3 = $("<div class='author_btn'>SNS</div>")
				var btn4 = $("<div class='author_btn' onclick='movetoPage(1,"+item.M_PK+")'>작가 보기</div>")
				
				div.append(name).append(email).append(studio).append(studio_addr)
				div2.append(btn1).append(btn2).append(btn3).append(btn4)
				parent.append(div).append(div2)
				$(".list").append(parent)
			})			
		})
		//페이지 초기화 함수
		
		
		
		
		$(".tab_menu").first().css("color","#ff1d43");
		$(".tab_menu").first().siblings().css("opacity","0.5")
		
		$(".tab_menu").on("click",function(){
			$(this).css({"color":"#ff1d43", "opacity":"1"})
			$(this).siblings().not("#tab_title").css({"opacity":"0.5","color":"#191919"})
		})
		
		$("#alarmBtn").on("click",function(){
			location.href="subscribe"
		})
		
		$("#authorBtn").on("click",function(){			
			showMySubsList("${m_pk}",1,function(data){
				$.each(data,function(i,item){

					var parent = $("<div>").append($("<img src='${pageContext.request.contextPath}/image/"+item.HI_PK+"'>"))
					var div = $("<div class='author_info'>")
					
					var name = $("<div><span class='info-title'>NAME</span><span>"+item.AT_NAME+"</span></div>")
					var email = $("<div><span class='info-title'>EMAIL</span><span>"+item.AT_EMAIL+"</span></div>")
					var studio = $("<div><span class='info-title'>STUDIO</span><span>"+item.AT_STUDIO+"</span></div>")
					var studio_addr = $("<div><span class='info-title'>ADDRESS</span><span>"+item.AT_ADDRESS+"</span></div>")
					
					var div2 = $("<div class='author_btn_container'>")
					var btn1 = $("<div class='author_btn' onclick='cancelSubscribe(1,${m_pk},"+item.M_PK+",this)'>구독 취소</div>")
					var btn2 = $("<div class='author_btn'>1:1 문의</div>")
					var btn3 = $("<div class='author_btn'>SNS</div>")
					var btn4 = $("<div class='author_btn' onclick='movetoPage(1,"+item.M_PK+")'>작가 보기</div>")
					
					div.append(name).append(email).append(studio).append(studio_addr)
					div2.append(btn1).append(btn2).append(btn3).append(btn4)
					parent.append(div).append(div2)
					$(".list").append(parent)
				})				
			})
		})

		$("#studioBtn").on("click",function(){
			showMySubsList("${m_pk}",2,function(data){
				
				$.each(data,function(i,item){
					var parent = $("<div>").append("<img src='${pageContext.request.contextPath}/image/"+item.HI_PK+"'>")
					var div = $("<div class='author_info'>")
					
					var title = $("<div><span class='info-title'>TITLE</span><span>"+item.S_TITLE+"</span></div>");
					var category = $("<div><span class='info-title'>CATEGORY</span><span>"+item.C_CATEGORY+"</span></div>")
					var classStart = $("<div><span class='info-title'>CLASS START</span><span>"+
										dateFormat(new Date(item.S_CLASSSTART))+"</span></div>")
					var location = $("<div><span class='info-title'>LOCATION</span><span>"+item.S_LOCATION+"</span></div>")
					
					var div2 = $("<div class='author_btn_container'>")
					var btn1 = $("<div class='author_btn' onclick='cancelSubscribe(2,${m_pk},"+item.S_PK+",this)'>구독 취소</div>")
					var btn2 = $("<div class='author_btn' onclick='movetoPage(2,"+item.S_PK+")'>상세 보기</div>")
					
					div.append(title).append(category).append(classStart).append(location)
					div2.append(btn1).append(btn2)
					parent.append(div).append(div2)
					$(".list").append(parent)
				})
			})
		})	
		
		$("#auctionBtn").on("click",function(){
			showMySubsList("${m_pk}", 3, function(data){
				
				$.each (data,function(i, item){
					var parent = $("<div>").append($("<img src='${pageContext.request.contextPath }/image/"+item.HI_PK+"'>"))
					var div = $("<div class='author_info'>")

					var name = $("<div><span class='info-title'>TITLE</span><span>"+item.A_TITLE+"</span></div>")
					var category = $("<div><span class='info-title'>CATEGORY</span><span>"+item.C_CATEGORY+"</span></div>")
					var endtime = $("<div><span class='info-title'>END TIME</span><span>"+
									dateFormat(new Date(item.A_ENDTIME))+"</span></div>")
					var bidding = $("<div><span class='info-title'>CURRENT PRICE</span><span>"+ item.AG_BIDDING+" 원</span></div>")
					
					var div2 = $("<div class='author_btn_container'>")
					var btn1 = $("<div class='author_btn' onclick='cancelSubscribe(3,${m_pk},"+item.A_PK+",this)'>구독 취소</div>")
					var btn2 = $("<div class='author_btn' onclick='movetoPage(3,"+item.A_PK+")'>상세 보기</div>")
					
					div.append(name).append(category).append(endtime).append(bidding)
					div2.append(btn1).append(btn2)
					parent.append(div).append(div2)
					$(".list").append(parent)				
				})
			});
		})
	})
	
	function showMySubsList(m_pk,type,func){
		
		$.ajax({
			url: "${pageContext.request.contextPath}/user/subscribeList/"+type,
			type:"post",
			data : {"m_pk_user" : m_pk},
			dataType:"json",
			success:function(data){
				$(".list").html("")
				func(data)			
			}
		})
	}
	function dateFormat(date){
		var str ="";
		str += date.getFullYear() + "/"
		str += (date.getMonth()+1) < 10 ? "0"+(date.getMonth()+1) + "/" : (date.getMonth()+1) + "/" 
		str += date.getDate() < 10 ? "0"+date.getDate() + " " : date.getDate()+ " "
		str += date.getHours() < 10 ? "0"+ date.getHours() + ":" : date.getHours() + ":"
		str += date.getMinutes() < 10 ? "0"+ date.getMinutes() : date.getMinutes()
		return str;
	}
	function cancelSubscribe(type,m_pk_user,ms_fk,element){
		var result = confirm("구독을 취소하시겠습니까?")
		
		if(result){
			$.ajax({
				url:"${pageContext.request.contextPath}/user/subscribeCancel/"+type,
				type:"post",
				data:{"m_pk_user": m_pk_user, "ms_fk":ms_fk},
				dataType:"json",
				success:function(data){
					$(element).parent().parent().remove()
				}
			})
		}
	}
	function movetoPage(type,ms_fk){
		
		switch(type){
		case 1:
			location.href="${pageContext.request.contextPath}/author/publicPage?m_pk=" + ms_fk
			break;
		case 2:
			alert("스튜디오 페이지 이동")
			break;
		case 3:
			location.href="${pageContext.request.contextPath}/auction/detail?a_pk=" + ms_fk
			break;	
		}
	}
</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="title">SUBSCRIBE</div>
			<div class='list_container'>
				<div id="tab_menu_container">
					<div class="tab_menu" id="authorBtn">AUTHOR</div>
					<div class="tab_menu" id="studioBtn">STUDIO</div>
					<div class="tab_menu" id="auctionBtn">AUCTION</div>
				</div>
				<div class="list">
				</div>
			</div>
		</div>
	</div>
</body>
</html>