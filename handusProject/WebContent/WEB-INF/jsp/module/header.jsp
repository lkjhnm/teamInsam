<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#header{
		width: 100%;
		height: 10%;
		position:fixed;
		top:0;
		left:0;
		background-color: #FBF9F6;
	}
	#menuContainer{
		width: 30%;
		position: absolute;
		left:40%;
		bottom:7%;
		display:flex;
		justify-content: space-around;
	}
	#headerTitle{
		position:absolute;
		right:5%;
		bottom:15%;
		font-size:40px;
	}
	.menuLink{
		font-size:20px;
	}
	.menuLink:hover{
		cursor:pointer;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".menuLink").on("mouseover",function(){
			$(this).siblings().animate({
				opacity : '0.2'
			})
		})
		$(".menuLink").on("mouseleave",function(){
			$(this).siblings().animate({
				opacity : '1'
			})
		})
	})
</script>
</head>
<body>
	<div id="header">
		<div id="menuContainer">
			<span class='menuLink'>I T E M</span>
			<span class='menuLink'>A U C T I O N</span>
			<span class='menuLink'>S T U D I O</span>
		</div>
		<span id="headerTitle">
			<i>Handus</i>
		</span>
	</div>
</body>
</html>