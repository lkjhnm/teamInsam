<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<style>		
	#preload{
		width:1920px;
		height:1080px;
		font-size : 50px;
		z-index: 101;
		position:fixed;
		top:0;
		left:0;
		background-color:inherit;
	}
	
	#preload i{
		position:absolute;
		top:50%;
		left:50%;
		transform : translate(-50%,-100%);
	}
	
	#main{
		width: 100%;
		height:100%;
		z-index:98;
		text-align:center;
	}
	#title{
		font-size: 45px;
		opacity:0;
		position:absolute;
		top:-5%;
		left:-5%;
		transform:rotate(-30deg);
		color: #707070;
	}
	
	#infoContainer{
		width: 70%;
 		height: 70%;
		position:absolute;
		border: 1px solid;
		border-color: #707070;
		top:50%;
		left:50%;
		transform : translate(-50%,-50%);
		display:flex;
		justify-content:center;
		align-items: center;
	}
	.info{
		width: 10%;
		height: 30%;
		float:left;
		margin: 0 15px;
		background-color: #fff;
		text-align:center;
		font-size: 20px;
	}
	.info:hover{
		cursor:pointer;
	}
	
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<script>
	var infoClicked = false;

	$(function(){
		
		$("#preload i").animate({
			"opacity" : "0"
		},300,function(){					//2300
			$("#preload").css("display","none")
			
			$("#title").animate({
				'opacity':'1'
			},1000)
			
			$(".info").animate({
				width: '22%',
				height: '70%'
			},700)
		})
		
		$('.info').on("mouseover",function(){
			if(infoClicked){
				if($(this).hasClass('open')){
					return;					
				}else{
					$(this).css('backgroundColor','#E0E0E0')
				}
			}else{
				$(this).siblings().not("#title").css("opacity","0.3")				
			}
		})
		
		$('.info').on("mouseleave",function(){
			$(this).siblings().css("opacity","1")
			$(this).css('backgroundColor','#fff')
		})
		
		$(".info").on("click",function(){
			infoClicked = true;
			if($(this).hasClass('open')){
				return;
			}
			
			$(".info").css({
				margin : "5px",
			})
			
			$(this).siblings().css("opacity","1")
			$(".info").css('background-color','#fff')
			$(this).css('cursor','unset')
			
	
			$(this).animate({
				width: '65%'
			})
			
			$(this).siblings().not("#title").animate({
				width:'7%'
			})
			$(this).siblings().not("#title").removeClass("open")
			$(this).siblings().css('cursor','pointer')
			
			$(this).addClass("open");
		})
	})
	
</script>
</head>
<body>
	
	<div class="container">
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<div id="preload">
			<i>Handus <br> Project</i>
		</div>
		
		<div id="main">
				
			<div id="infoContainer">
				<span id="title"><i>Handus <br> Project</i></span>
				
				<div class="info" id="buyInfo">
					<span>Buy & Sell</span>
				</div>
				<div class="info" id="auctionInfo">
					<span>Auction</span>
				</div>
				<div class="info" id="studioInfo">
					<span>Class</span>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>