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
		width: 80%;
		margin:0 auto;
		padding-top: 100px;
	}
	#page_title{
		text-align: center;
		font-size: 35px;
		font-weight: 500;
	}
	#profile_container{
		width: 80%;
		height: 400px;
		margin: 50px auto;
	}
	#profile_container img{
		width: 250px;
		height: 250px;
		margin: 30px;
	}
	#profile_container fieldset>div{
		float:left;
	}
	.profile_button_container{
		width: 150px;
		height:250px;
		margin:30px;
	}
	.profile_button{
		width: 130px;
		height: 37px;
		text-align:center;
		line-height:37px;
		margin-top:15px;
		background-color: #191919;
		color:#fff;
	}
	.profile_button:hover{
		cursor:pointer;
	}
	#profile_info_container{
		width: 600px;
		height: 250px;
		margin: 30px;
	}
	#profile_info_container>div{
		width: 100%;
		height: 30px;
		padding:5px;
		line-height:30px;
		border-bottom: 1px solid #191919;
		margin-top: 15px;
		display:flex;
		justify-content: space-between;
	}
	.info_title{
		font-weight: 600;
	}
	.info_value{
		font-weight: 500;
	}
	#modify{
		display:none;
	}
	.hover{
		cursor:pointer;
	}
	modifyModal{
		width: 700px;
		height: 100px;
		background-color: blue;
		position:fixed;
		top: 50%;
		left: 50%;
	}
	.modify-input{
		display:none;
		font-weight:550;
		background-color: inherit;
		border:none;
		width: 225px;
		color:#191919;
	}
	.modify-input:focus{
		outline:none;
	}
	.list{ 
		margin-bottom:55px;
		margin-top:55px;
		border: 1px solid #191919;
		overflow: hidden;
		position:relative;
		height: 302px;
	}
	.list > div{
		
	}
	.list > div > div{
		height:230px;
		margin-bottom:55px;
		margin-top:55px;
	}
	.list img{
		width:230px;
		height:230px;
		margin: 35px;
		border: 1px solid #191919;
	}
	.list_container{
		width: 80%;
		margin: 100px auto;
	}
	.tab_menu{
		width: 130px;
		font-size: 22px;
	}
	.slide_button{
		position:relative;
		font-size: 80px;
		top:280px;
	}
	.slide_button:hover{
		cursor:pointer;
		color: #ff1d43;
	}
	.left{
		left:-50px;
	}
	.right{
		left: 1215px;
	}
	.train{
		position:relative;
	}
</style>
<script>
	$(function(){
		
		var isMod = false;
		var origin_src;
		
		$("#regBtn").on("click",function(){
			location.href='register';
		})
		
		$("#modBtn").on("click",function(){
			$("#menu").css("display","none")
			$("#modify").css("display","block")
			$("#profile_info_container").children().css("border","1px solid #ff1d43").addClass("hover")
			$("#profile_image").css("border","1px solid #ff1d43").addClass("hover")
			origin_src = $("#profile_image").attr("src")
			isMod = true;
			
			$(".hover").off("click").on("click",function(){
				if(!isMod){
					return;
				}
				$(this).children("input").css("display","block").focus().val("");
				$(this).children(".info_value").css("display","none")
			})
		})
		
		$("#cancel").on("click",function(){
			$(".hover").find("input").css("display","none")
			$(".info_value").css("display","block")
			
			$("#menu").css("display","block")
			$("#modify").css("display","none")
			$("#profile_info_container").children().css("border","none").css("border-bottom","1px solid #191919").removeClass("hover")
			$("#profile_image").css("border","none").removeClass("hover")
			$("#profile_image").attr("src",origin_src)
			isMod = false;		
		})
		
		$("#confirm").on("click",function(){
			var formData = new FormData();
			formData.append("ap_filename", $("#profile_image").attr("data-name"))
			formData.append("m_pk","${m_pk}");
			var name = $("#at_name").val() == "" ? $("#at_name").prev().text() : $("#at_name").val()
			var email = $("#at_email").val() == "" ? $("#at_email").prev().text() : $("#at_email").val()
			var studio = $("#at_studio").val() == "" ? $("#at_studio").prev().text() : $("#at_studio").val()
			var address = $("#at_address").val() == "" ? $("#at_address").prev().text() : $("#at_address").val()
			var filename = $("#profile_image").attr("data-name")

			$.ajax({
				url:"${pageContext.request.contextPath}/author/updateAuthor",
				type:"post",
				data: {"at_name":name, "at_email":email, "at_studio":studio, "at_address":address,
						"hi_filename":filename, "m_pk":"${m_pk}"},
				dataType:"json",
				success: function(data){
					$("#menu").css("display","block");
					$("#modify").css("display","none");
					$(".info_value").css("display","block");
					$(".modify-input").css("display","none");
					$("#profile_info_container").children().css("border","none").css("border-bottom","1px solid #191919").removeClass("hover");
					$("#profile_image").css("border","none").removeClass("hover");
					$("#profile_image").attr("src","${pageContext.request.contextPath}/image/"+data.hi_pk);
					isMod = false;
					origin_src = $("#profile_image").attr("src");
				}
			});
			
			$("#at_name").prev().text(name)
			$("#at_email").prev().text(email)
			$("#at_studio").prev().text(studio)
			$("#at_address").prev().text(address)
		})
		
		//---드래그 앤 드랍 이미지 업로드
		var profile = $("#profile_image")
		
		profile.on('dragenter',function(e){
			e.stopPropagation();
			e.preventDefault();
			if(!isMod){
				return;	
			}
			$(this).css("border-color","#FFF")
		})
		
		profile.on('dragleave',function(e){
			e.stopPropagation();
			e.preventDefault();
			if(!isMod){
				return;	
			}
			$(this).css("border-color","#ff1d43")
		})
		
		profile.on('dragover',function(e){
			e.stopPropagation();
			e.preventDefault();
			if(!isMod){
				return;	
			}
		})
		profile.on('drop',function(e){
			e.preventDefault();
			if(!isMod){
				return;
			}
			$(this).css("border-color","#ff1d43")
			var file = e.originalEvent.dataTransfer.files
			var data = new FormData();
			$.each(file,function(i,item){
				data.append("uploadFiles",item);
			})
			
			$.ajax({
				url:"${pageContext.request.contextPath}/author/imgUpload",
				type:"post",
				data:data,
				dataType:"json",	
				processData:false,
				contentType:false,
				success:function(data){
					$("#profile_image").attr("src","${pageContext.request.contextPath}/author/getTempImg?fileName="+data[0])
					.attr("data-name",data[0])
				}
			})
		})
		
		
		//리싀트
		getListOfType(1,function(data){		// ITEM 데이터 가져오기	
			$("#item_container").css("width",302*data.length)
			$.each(data,function(i,item){
				var img = $("<img src='${pageContext.request.contextPath}/image/"+item.HI_PK+"'>")
				$(img).on("click",function(){
					location.href='${pageContext.request.contextPath}/item/detail?num='+item.I_PK;
				});
				$("#item_container").append(img)
			})
			imgSlide("item_container")
		})
		
		getListOfType(2,function(data){		// AUCTION 데이터 가져오기
			$("#auction_container").css("width", 302*data.length)
			$.each(data,function(i,item){
				var img = $("<img src='${pageContext.request.contextPath }/image/"+item.HI_PK+"'>")
				$(img).on("click",function(){
					location.href="${pageContext.request.contextPath}/auction/detail?a_pk="+item.A_PK;
				})
				$("#auction_container").append(img)
			})
			imgSlide("auction_container")
		})
		
		getListOfType(3,function(data){		// STUDIO 데이터 가져오기
			$("#studio_container").css("width", 302*data.length)
			$.each(data,function(i,item){
				var img = $("<img src='${pageContext.request.contextPath}/image/"+item.HI_PK+"'>")
				$(img).on("click",function(){
					location.href="${pageContext.request.contextPath}/studio/detail?num="+item.S_PK;
				})
				$("#studio_container").append(img)
			})
			imgSlide("studio_container")
		})
	})
	
	
	function getListOfType(type,func){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/author/getList/"+type,
			type:"post",
			data: {"m_pk": '${M_PK_WRITER}' },
			dataType: "json",
			success: function(data){
				func(data)
			}
		})
	}
	
	// 이미지 슬라이드 쇼
	function imgSlide(cont_name){
		var position = 0;
		var train = $("#"+cont_name)
		var count = $(train).children().length - 4;
		var left = $(train).parent().prev().prev().prev()
		var right = $(train).parent().prev().prev()
		
		if(count < 4){
			left.css("display","none")
			right.css("display","none")
		}

		$(left).on("click",function(){
			if(position -1 < 0){
				console.log("왼쪽안됌")
				return;
			}
			console.log("asd")
			position = position <= 0 ? 0 : position - 1;
			
			
			var left = position == 0 ? 0 : (-300)*position;

			$(train).animate({
				"left" : left
			})
		})
		
		$(right).on("click",function(){
			if(position + 1 > count){
				console.log("오른쪽 안됨")
				return;
			}
			console.log('asd')
			position = position >= count ? count : position + 1;
			
			
			var left = position == count ? (-300)*count : (-300)*position;
			
			$(train).animate({
				"left" : left
			})
		})
	}
</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		<div id="main">
			<div id="page_title"><span> AUTHOR PAGE</span></div>
			<div id="profile_container">
				<fieldset>
					<legend>PROFILE</legend>
					<div><img id="profile_image" src="${pageContext.request.contextPath }/image/${HI_PK}"
								data-name="${HI_FILENAME }">
					</div>
					<div id="profile_info_container">
						<div><span class="info_title">NAME</span><span class='info_value'> ${AT_NAME }</span>
							 <input class='modify-input' type="text" name="at_name" id="at_name">
						</div>
						<div><span class="info_title">EMAIL</span><span class='info_value'> ${AT_EMAIL }</span>
							 <input class='modify-input' type="text" name="at_email" id="at_email">
						</div>
						<div><span class="info_title">STUDIO</span><span class='info_value'> ${AT_STUDIO }</span>
							 <input class='modify-input' type="text" name="at_studio" id="at_studio">
						</div>
						<div><span class="info_title">ADDRESS</span><span class='info_value'> ${AT_ADDRESS }</span>
							 <input class='modify-input' type="text" name="at_address" id="at_address">
						</div>
					</div>
					<div class="profile_button_container" id="menu">
						<div class='profile_button' id="regBtn">작품 등록</div>
						<div class='profile_button' id="modBtn">정보 수정</div>
						<div class='profile_button' id="msgBtn">문의 보기</div>
					</div>
					<div class="profile_button_container" id="modify">
						<div class='profile_button' id="confirm">수 정</div>
						<div class='profile_button' id="cancel">취 소</div>
					</div>
				</fieldset>
			</div>
			<div class='list_container'>
				<span class='slide_button left'><i class="fas fa-caret-left"></i></span>
				<span class='slide_button right'><i class="fas fa-caret-right"></i></span>
				<div class="tab_menu" id="itemBtn">ITEM</div>
				<div class="list">
					<div id="item_container" class='train'>
					</div>
				</div>

				<span class='slide_button left'><i class="fas fa-caret-left"></i></span>
				<span class='slide_button right'><i class="fas fa-caret-right"></i></span>
				<div class="tab_menu" id="auctionBtn">AUCTION</div>
				<div class="list">
					<div id="auction_container" class='train'>
					</div>
				</div>

				<span class='slide_button left'><i class="fas fa-caret-left"></i></span>
				<span class='slide_button right'><i class="fas fa-caret-right"></i></span>
				<div class="tab_menu" id="studioBtn">STUDIO</div>
				<div class="list">
					<div id="studio_container" class='train'>
					</div>
				</div>
			</div>
			
			<div id="modifyModal">
				
			</div>
		</div>
	</div>
</body>
</html>