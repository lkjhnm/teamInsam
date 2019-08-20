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
	#sideMenu{
		width: 25%;
		height: 100%;
		position: fixed;
		top:0;
		left:-25%;
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
		width: 75%;
		height: 100%;
		margin:0 auto;
		padding-top: 6%;
	}
	
	#profile{
		width: 130px;
		height: 130px;
		border-radius: 50%;
		background: url('${pageContext.request.contextPath}/img/mansam.jpg');
		background-size:cover;
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
		margin-top: 6%;
	}
	#logout{
		margin-top: 5%;
	}
	#searchBar{
		margin-top: 50%;
		width: 90%;
		height: 5%;
		border-radius: 5px;
		background-color: #fff;
		
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
		font-size: 20px;
		vertical-align: middle;
	}
	.menu:hover{
		cursor:pointer;
	}
	
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<script>
	var isClicked = false;
	
	$(function(){	
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
					left:"-25%"
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
</head>
<body>
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
			<div id="logout" class="center menu">
				<span>Logout</span>
			</div>
			
			<form action="#" method="get" id="searchForm">
				<div id="searchBar" class="center">
					<input type="text" name="search" autocomplete="off"/>
					<span id="submit"><i class="fas fa-search"></i></span> 
				</div>
			</form>
		</div>
	</div>
</body>
</html>