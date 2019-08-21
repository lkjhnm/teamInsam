<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script> -->
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
						'background-color': 'transparent',
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
