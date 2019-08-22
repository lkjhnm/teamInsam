<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANDUS/Studio</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<link href="https://fonts.googleapis.com/css?family=Hepta+Slab|Nanum+Gothic|Nanum+Myeongjo|Noto+Serif+KR&display=swap" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function () {
		/* 상품 그리기 */
		
	});
	function drawList() {
		var itemCount = 4;
		for(var i = 0 ; i < itemCount; i++){
			var item;
			var imageBox;
			var titleBox; 
			$("#items").append();
		}
	};
</script>
<style type="text/css">
/* 	사이드 카테고리 */
	#sideCategoryContainer{
		width: 20%;
		height:1080px;
		margin-top:250px;
		color:#544a4a;
	}
	#sideGrid{
		width: 250px;
		height: 100%;
		margin: 0 auto;
	}
	.categoryTitle{
		font-size: 16px;
		font-weight: 600;
		margin: 102px 0 45px 0;
	}
	#category ul{
		list-style: none;
		padding-left: 20px;
	}
	#category ul li{
		margin-bottom: 15px;
		font-size:15px;
	}
	#category ul li a{
		color: inherit;
		text-decoration: none;
	}
	.wrapper{
		padding-top: 80px;
		width: 1536px;
		margin: 0 auto; 
		background-color: #FBF9F6;
	}
	.items{
		width: 1300px;
		margin: 0 auto;
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start;
/* 		border: 1px solid #707070; */
/* 		text-align: center; */
	}
	.item{
		display: inline-block;
		width: 410px;
		margin-bottom: 20px;
	}
	#image{
		width: 400px;
		height: 400px;
		background-color: #ffff;
	}
	#title{
		text-align: left;
		margin-top: 7px;
		margin-left: 10px;
		font-size: 1.1em;
	}
	#subscribe{
		margin-left: 270px;
		text-align: right;
		font-size: 1.1em;
	}
	.margin-right{
/* 		margin-right: 30px; */
	}
</style>
</head>
<body>
<div class='container'> <!-- 필수!! side,header는 필요에따라 추가 하면됩니다. -->
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp"/>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
	<!-- 사이드 카테고리 -->
	<div id="sideCategoryContainer">
			<div id="sideGrid">
				<div id="category">
					<div class="categoryTitle"><span> C A T E G O R Y ----- </span></div>
					<ul>
						<li><a href="#"> A L L</a> </li>
						<li><a href="#"> C E R A M I C S </a></li>
						<li><a href="#"> M E T A L </a></li>
						<li><a href="#"> G L A S S </a></li>
						<li><a href="#"> E M B R O I D E R Y </a></li>
						<li><a href="#"> L E A T H E R </a></li>
						<li><a href="#"> W O O D </a></li>
					</ul>
				</div>
			</div>
		</div>
	<!-- 공방 리스트 -->
	<div class="wrapper">

		<div class="items">
			<div class="item margin-right">
				<div class="image-box " id="image">
					<img alt="" src="">
				</div>
				<div class="title-box" id="title">
					<span id="name">상품이름1</span>
					<span id="subscribe"><i class='far fa-heart'></i></span>
				</div>
			</div>
		</div>
		
		
	</div>
</div>
</body>
</html>