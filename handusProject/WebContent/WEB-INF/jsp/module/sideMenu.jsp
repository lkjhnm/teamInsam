<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
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
		width:1920px;
		min-height: 1080px;
		position:relative;
		background-color:#F3F1ED;
	}
	#sideMenu{
		width: 300px;
		height: 100%;
		position: fixed;
		top:0;
		left:-300px;
		background-color: #D8C9BF;
		z-index:99;
	}
	
	#menuBtn{
		position: absolute;
		width:40px;
		border-radius: 5px;
		background-color:#F3F1ED;
		top:50px;
		right: -40px;
		z-index: 99;
		text-align: center;
	}
	
	#menuBtn:hover{
		cursor:pointer;
	}
	
	#sideContainer{
		width: 200px;
		height: 100%;
		margin:0 auto;
		padding-top: 6%;
	}
	
	#profile{
		width: 100px;
		height: 100px;
		border-radius: 50%;
		background: url('${pageContext.request.contextPath}/img/mansam.jpg');
		background-size:cover;
		margin-top: 60px;
	}
	
	#userName{
		width: 70%;
		height: 3%;
		margin-top : 3%;
	}
	#userName span{
		font-size: 20px;
	}
	#userGrade{
		width: 70%;
		height: 2%;
	}
	#userGrade span{
		font-size: 18px;
	}
	
	#myPage{
		margin-top: 50px;
		background-color: #AB926C;
		height: 35px;
	
	}
	#myCart{
		margin-top: 20px;
		background-color: #AB926C;
		height: 35px;
	}
	#logout{
		margin-top: 350px;
		background-color: #AB926C;
		height: 35px;
	}
	#copyrigths{
		margin-top: 10px;
		font-size: 0.7em;
	}
	#searchBar{
		margin-top: 20px;
		width: 90%;
		border-radius: 5px;
		background-color: rgba( 0, 0, 0, 0.5 );
		
		border: 1px solid;
		border-color: #707070;
		bottom: 10%;
	}
	#searchBar input{
		border-style: none;
	}
	#searchBar span{
		font-size: 20px;
		vertical-align: middle;
	}
	#searchBar span:hover{
		cursor:pointer;
	}
	.center{
		margin: 0 auto;
		text-align: center;
	}
	
	.menu{
		width: 90%;
		height: 5%;
		border-radius: 5px;
		background-color: #fff;
		border: 1px solid;
		border-color: #707070;
	}
	.menu span{
		font-size: 1em;
		vertical-align: middle;
	}
	.menu:hover{
		cursor:pointer;
	}
	
</style>
=======
>>>>>>> branch 'master' of https://github.com/lkjhnm/teamInsam.git
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<script>
	var isClicked = false;
	
	$(function(){
		$("#profile").css({"background" : "url('${pageContext.request.contextPath}/img/mansam.jpg')",
							"background-size" : "cover"})
		
		$("#menuBtn").on("click",function(){
			if(!isClicked){
				$("#sideMenu").animate({
					left:0
				},1000,function(){
					$("#menuBtn").css({
						top:0,
						right:0,
						'background-color':'inherit',
						'color': '#707070'
					})
					$("#menuBtn span").html("<i class='fas fa-times'></i>");
					isClicked = true;
				})
				
			}else{
				$("#sideMenu").animate({
					left:"-300px"
				},1000,function(){
					$("#menuBtn").css({
						top: '50px',
						right: '-40px',
						'background-color': '#F3F1ED',
						'color':'black'
					})
					$("#menuBtn span").html("<i class='fas fa-bars'></i>");
					isClicked = false;
				})
			}
		})
		
		$("#submit").on("click",function(){
			$("#searchForm").submit();
		})
	})
</script>
	<div id="sideMenu">
		<div id="menuBtn">
			<span style="font-size:30px;">
				<i class="fas fa-bars"></i>
			</span>
		</div>
		<div id="sideContainer">
			<div id="profile" class="center menu">
			</div>
			<div id="userName" class="center">
				<span> 만년삼 </span>
			</div>
			<div id="userGrade" class="center">
				<span> Author </span>
			</div>
		
			<div id="myPage" class="center menu">
				<span>My Page</span>	
			</div>
			<div id="myCart" class="center menu">
				<span>My Cart</span>	
			</div>
			<!-- 검색창 -->
			<form action="#" method="get" id="searchForm">
				<div id="searchBar" class="center">
					<input type="text" name="search" autocomplete="off"/>
					<input type="button" value="search">
<!-- 					<span id="submit"><i class="fas fa-search"></i></span>  -->
				</div>
			</form>
			<!--  -->
			<div id="logout" class="center menu">
				<span>Logout</span>
			</div>
			<div id="copyrigths">
				<span>copyrights all reserved (c)2019TeamInsam</span>
			</div>
			
		</div>
	</div>
