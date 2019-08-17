<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<style>
	html,body{
		padding:0;
		margin:0;
	}
	.container{
		width:100%;
		height:1000px;
		background-color:#F3F1ED;
	}		
	#logo{
		width:100%;
		height:100%;
		font-size : 50px;
		z-index: 101;
		position:fixed;
		top:0;
		left:0;
		background-color:inherit;
	}
	
	#logo i{
		position:absolute;
		top:40%;
		left:40%;
	}
	
	#main{
		width: 100%;
		height: 100%;
		z-index:100;
		text-align:center;
	}
	#title{
		padding-top: 3%;
		font-size: 45px;
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
		width: 20%;
		height: 100%;
		float:left;
		margin: 0 30px;
		background-color: #fff;
		text-align:center;
		font-size: 20px;
	}
	.info:hover{
		cursor:pointer;
	}
	#sideMenu{
		width: 100%;
		height: 100%;
		position: fixed;
		top:0;
		left:-80%;
		z-index:102;
	}
	#menuBtn{
		position: absolute;
		top:50px;
		right:-40px;
		z-index:102;
	}

</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<script>
	$(function(){
		
		$("#logo i").animate({
			"opacity" : "0"
		},2300,function(){
			$("#logo").css("display","none")
		})
		
	})
	
</script>
</head>
<body>
	<div class="container">
		<div id="logo">
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
			
			<div id="sideMenu">
				<div id="menuBtn">
					<span style="font-size:40px;">
						<i class="fas fa-user"></i>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>