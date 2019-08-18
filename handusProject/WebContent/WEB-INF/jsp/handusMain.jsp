<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<style>		
	#preload{
		width:100%;
		height:100%;
		font-size : 50px;
		z-index: 100;
		position:fixed;
		top:0;
		left:0;
		background-color:inherit;
	}
	
	#preload i{
		position:absolute;
		top:50%;
		left:50%;
		transform : translate(-50%,-50%);
	}
	
	#main{
		width: 100%;
		height: 100%;
		z-index:98;
		text-align:center;
	}
	#title{
		padding-top: 3%;
		font-size: 45px;
		opacity:0;
	}
	
	#infoContainer{
		width:100%;
		height: 45%;
		margin:0 auto;
		position:absolute;
		top:25%;
		display:flex;
		justify-content:center;
	}
	.info{
		width: 10%;
		height: 50%;
		float:left;
		margin: 0 30px;
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
	$(function(){
		
		$("#preload i").animate({
			"opacity" : "0"
		},300,function(){					//2300
			$("#preload").css("display","none")
			
			$("#title").animate({
				'opacity':'1'
			},2500)
			
			$(".info").animate({
				width: '20%',
				height: '100%'
			},1000)
		})
	})
	
</script>
</head>
<body>
	
	<div class="container">
		<jsp:include page="/WEB-INF/jsp/sideMenu.jsp" />
		<div id="preload">
			<i>Handus</i>
		</div>
		
		<div id="main">
			<span id="title"><i>Handus</i></span>
				
			<div id="infoContainer">
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