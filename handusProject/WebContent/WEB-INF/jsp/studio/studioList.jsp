<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공방 리스트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
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
	.wrapper{
		padding-top: 80px;
		width: 1536px;
		margin: 0 auto; 
		background-color: #F3F1ED;
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
		<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp" />
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
	<!--  -->
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