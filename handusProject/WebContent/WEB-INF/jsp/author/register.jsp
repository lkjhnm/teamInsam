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
		width: 70%;
		height: 800px;
		margin: 0 auto;
		padding-top: 150px;
	}
	#category_container{
		margin-top:200px;
		margin-bottom:75px;
	}
	#category_container>div{
		display:inline-block;
		width: 190px;
		height: 30px;
		font-size: 28px;
		text-align: center;
	}
	#category_container>div:hover{
		cursor:pointer;
	}
	#common_info{
		display:flex;
		justify-content: space-between;
	}
	#common_info>div{
		width: 450px;
		height: 350px;
	}
	#common_info img{
		width: 350px;
		height: 350px;
	}
	.form_container{
		width: 75%;
		margin: 0 auto;
	}
	.common_input{
		font-weight: 500;
		font-size: 20px;
		margin:15px;
	}
	.common_input input{
		width:100%;
		height:25px;
		background-color: inherit;
		border-top:none;
		border-left:none;
		border-right:none;
		border-bottom: 1px solid #191919;
	}
	.common_input input:focus{
		outline: none;
	}
	#category_modal{
		width: 350px;
		height: 150px;
		position: absolute;
		top:240px;
		left:1475px;
		background-color: inherit;
		display:none;
		font-size:15px;
	}
	.button_container{
		height:45px;
		display:flex;
		justify-content: space-between;
	}
	.button_container>div{
		width: 100px;
		height: 35px;
		text-align: center;
		line-height: 30px;
		margin-top:10px;
		background-color: #191919;
		color:#fff;
	}
	.button_container>div:hover{
		cursor:pointer;
	}
	#c_input:hover{
		cursor:pointer;
	}
	.details_info{
		margin-bottom:100px;
	}
	.details_input{
		font-weight: 500;
		font-size: 20px;
		margin:15px auto;
		width:88%;
	}
	.details_input input:focus{
		outline:none;
	}
	.details_input input{
		width:100%;
		height:25px;
		background-color: inherit;
		border-top:none;
		border-left:none;
		border-right:none;
		border-bottom: 1px solid #191919;
	}
	.detail_text{
		width:100%;
		height:50px;
		border-top:0;
		border-left:0;
		border-right:0;
		border-bottom: 1px solid #191919;
		background-color: inherit;
		margin-top:10px;
	}
	.detail_text:focus{
		outline: none;
	}
	input[type="date"]::-webkit-calendar-picker-indicator,
 	input[type="date"]::-webkit-inner-spin-button {
     	display: none;
    	appearance: none;
 	}
 	.datePick:focus{
 		outline: none;
 	}
 	.datePick:hover{
 		cursor:pointer;
 	}
 	#submitBtn{
 		float:right;
 		width: 100px;
 		height: 30px;
 		text-align:center;
 		line-height:30px;
 		background-color: #191919;
 		color:#fff;
 		position:relative;
 		top:-45px;
 		right:60px;
 	}
 	#submitBtn:hover{
 		cursor:pointer;
 	}
 	#studio{
 		display:none;
 	}
 	#auction{
 		display:none;
 	}
 	#thumbnail_container{
 		width: 350px;
 		position:relative;
 		top:0;
 		left:0;
 		overflow: hidden;
 	}
 	#thumbnail_train{
 		position:relative;
 		width: 1000px;
 		height:90px;
 		top:0;
 		left:0;
 	}
 	#thumbnail_train>img{
 		width: 83px;
 		height: 83px;
 		margin-left:2px;
 		border:1px solid #191919;
 	}
 	#left-arrow{
 		position:relative;
 		width:30px;
 		top:-65px;
 		left:-30px;
 		font-size:30px;
 	}
 	#left-arrow>span:active{
 		color:#ff1d43;
 	}
 	#right-arrow>span:active{
 		color:#ff1d43;
 	}
 	#left-arrow>span:hover{
 		cursor:pointer;
 	}
 	#right-arrow>span:hover{
 		cursor:pointer;
 	}
 	#right-arrow{
 		position:relative;
 		width:30px;
 		top: -106px;
 		right: -360px;
 		font-size:30px;
 	}
 	#img_modal{
 		display:none;
 		width: 1075px;
 		height: 550px;
 		background-color: #EBE9E5;
 		position: fixed;
 		top: 25%;
 		left: 23%;
 		box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
 		z-index: 150;
 	}
 	#button_container{
 		text-align: end;
 		padding:10px;
 		font-size:28px;
 		word-spacing:20px;
 		line-height:25px;
 	}
 	.fa-times:hover{
 		cursor:pointer;
 		color: #ff1d43;
 	}
 	.fa-images:hover{
 		cursor:pointer;
 		color: #ff1d43;
 	}
 	#mainImg:hover{
 		cursor:pointer;
 	}
 	#upload_container{
 		margin-top:10px;
 		text-align: initial;
 	}
 	#upload_container>div{
 		display:inline-block;
 	}
 	.fa-minus{
 		position: relative;
 		top:-200px;
 		right:30px;
		font-size:20px;
 	}
 	.fa-minus:hover{
 		cursor:pointer;
 		color: #ff1d43;
 	}
 	#upload_container img{
 		width: 225px;
 		height: 225px;
 		margin-top: 10px;
 		margin-left: 20px;
 	}
 	.fa-file-upload:hover{
 		cursor:pointer;
 		color:#ff1d43;
 	}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript">
	$(function(){
		var type = 'item';
		
		$("#category_container>div").on("click",function(){
			$(this).css({"color":"#ff1d43", "opacity":"1"})
			$(this).siblings().css({"color":"#191919","opacity":"0.2"})
			var data = $(this).attr("data-value")
			
			switch(data){
			case 'item':
				$("#item").css("display","block")
				$("#studio").css("display","none")
				$("#auction").css("display","none")
				type='item'
				break;
			case 'auction':
				$("#auction").css("display","block")
				$("#studio").css("display","none")
				$("#item").css("display","none")
				type='auction'
				break;
			case 'studio':
				$("#studio").css("display","block")
				$("#item").css("display","none")
				$("#auction").css("display","none")
				type='studio'
				break;
			}
		})
		
		var isOpen = false;
		
		$("#c_input").on("click",function(){
			if(!isOpen){
				$("#category_modal").css("display","block")
			}else{
				$("#category_modal").css("display","none")
			}
			isOpen = !isOpen;
		})
		
		$(".button_container>div").on("click",function(){
			var value = $(this).text()
			var c_pk;
			
			switch(value){
				case '도자 공예':
					c_pk = 1;
					break;
				case '금속 공예':
					c_pk = 2;
					break;
				case '유리 공예':
					c_pk = 3;
					break;
				case '자수 공예':
					c_pk = 4;
					break;
				case '가죽 공예':
					c_pk = 5;
					break;
				case '목 공예':
					c_pk = 6;
					break;
			}			
			$("#c_input").val(value)
			$("#c_pk").val(c_pk)
			$("#category_modal").css("display","none")
			isOpen= false;
		})
		
		$("#category_container").children().first().css("color","#ff1d43").siblings().css("opacity","0.2")
		
		$(".datePick").datepicker()
		
		$("#submitBtn").on("click",function(){
			
			var subtype = changeName(type)
			
			if(subtype == null){
				subtype = 'item'
			}
			
			// 이미지 데이터
			var imgs = $("#thumbnail_train").children();
			
			$.each(imgs, function(i, item){
				var value = $(item).attr("data-name")
				var input = $("<input type='hidden' name='imgList["+i+"].img_fileName' value='"+value+"'>")
				$("#common_form").append(input)
			})
			
			
			// 추가 데이터
			var extraData = $("#"+subtype+"_form").find("input")
			
			$(extraData).each(function(){
				var name = $(this).attr("name")
				var value = $(this).attr("value")
				
				var input = $("<input type='hidden'>").attr("name",name).attr("value",value)
				$("#common_form").append(input)
			})
			
			var textname = $("#"+subtype+"_form").find("textarea").attr("name")
			var textvalue = $("#"+subtype+"_form").find("textarea").attr("value")
			var textarea = $("<textarea hidden='true'>").attr("name",textname).text(textvalue)
			var m_pk = $("<input type='hidden'>").attr("name","m_pk_writer").attr("value","${m_pk}")
// 			var urlType = $("<input type='hidden'>").attr("name","type").attr("value",subtype)
			
			$("#common_form").attr("action","${pageContext.request.contextPath}/author/register/"+subtype)
			
			$("#common_form").append(textarea).append(m_pk);
			$("#common_form").submit()			
		})
		
		
		$("#mainImg").on("click",function(){
			$("#img_modal").css("display","block")
			var data = $("#thumbnail_train").children();
			
			$.each(data, function(i,item){
				var div = $("<div>")
				var img = item
				var fileName = $(img).attr("data-name")
				var i = $("<i class='fas fa-minus' data-name='"+fileName+"' onclick='deleteTempImg(this)'>")
				div.append(img).append(i)
				$("#upload_container").append(div);
			})
		})
		
		
		$(".fa-times").on("click",function(){
			$("#img_modal").css("display","none")
		})
		$(".fa-images").on("click",function(){
			$("#img_file").trigger("click")
		})
		
		$("#img_file").on("change",function(){
			var formData = new FormData($("#fileForm")[0]);
			
			$.ajax({
				url:"imgUpload",
				type:"post",
				data : formData,
				enctype: 'multipart/form-data',
				processData : false,
				contentType : false,
				dataType : "json",
				success: function(data){
					$.each(data, function(i,item){
						var div = $("<div>")
						var img = $("<img src='${pageContext.request.contextPath}/author/getTempImg?fileName="+
									item+"' data-name='"+item+"'>");
						var i = $("<i class='fas fa-minus' data-name='"+item+"' onclick='deleteTempImg(this)'>")
						div.append(img).append(i)
						$("#upload_container").append(div);
					})
				},
				error:function(){
					alert("에라르르르르르")	
				}
			})
			$(this).val("")
		})
		
		
		$(".fa-file-upload").on("click",function(){
			var imgs = $("#upload_container").children().find("img")
			$("#thumbnail_train").append(imgs);
			
			imgSlide();
			
			var main = imgs.first().attr("src")
			$("#mainImg").attr("src",main)
			
			$("#thumbnail_train").children().on("click",function(){
				var src = $(this).attr("src")
				$("#mainImg").attr("src",src);
			})
			$("#img_modal").css("display","none")
			$("#upload_container").children().remove()
		})
		
		
		
	})// 온로드 끝
	
	// 이미지 슬라이드 쇼
	function imgSlide(){
		var position = 0;
		var count = $("#thumbnail_train").children().length - 4;
		
		$("#left-arrow > span").on("click",function(){
			if(position -1 < 0){
				return;
			}
			position = position <= 0 ? 0 : position - 1;
			
			
			var left = position == 0 ? 0 : (-87)*position;

			$("#thumbnail_train").animate({
				"left" : left
			})
		})
		
		$("#right-arrow >span").on("click",function(){
			if(position + 1 > count){
				return;
			}
			position = position >= count ? count : position + 1;
			
			
			var left = position == count ? (-87)*count : (-87)*position;
			
			$("#thumbnail_train").animate({
				"left" : left
			})
		})
	}
	
	function deleteTempImg(data){
		var fileName = $(data).attr("data-name")
		
			$.ajax({
			url: "deleteTempImg",
			type:"POST",
			data : {"fileName":fileName},
			success: function(result){
				if(result){
					$(data).parent().remove()
				}
			},
			error: function(){
				
			}
		})
	}
	
	function changeName(type){
		var data = $("#common_form").find("input").not("input[name=c_pk]")
		switch(type){
		case 'item':
			$(data).each(function(){
				var name = $(this).attr("name").substr(1)
				$(this).attr("name",'i'+name)
			})
			return 'item';
		case 'auction':
			$(data).each(function(){
				var name = $(this).attr("name").substr(1)
				if(name == '_price'){
					$(this).attr("name","a_startPrice")
				}else{
					$(this).attr("name",'a'+name)					
				}
			})
			return 'auction';
		case 'studio':
			$(data).each(function(){
				var name = $(this).attr("name").substr(1)
				$(this).attr("name",'s'+name)
			})
			return 'studio';
		}
	}

</script>
</head>
<body>
	<div class='container'> 
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div class="form_container">
				<form id="common_form" method='POST' enctype="multipart/form-data">
					<div id="common_info">
					
					
						<div>
							<img id="mainImg">
							<div id="thumbnail_container">
								<div id="thumbnail_train">
								</div>
							</div>
							<div id="left-arrow"><span><i class="fas fa-chevron-left"></i></span></div>
							<div id="right-arrow"><span><i class="fas fa-chevron-right"></i></span></div>
						</div>
						
						
						<div>
							<div class="common_input">
								<label >TITLE
									<input type="text" name="i_title">
								</label>
							</div>
							<div class="common_input">
								<label>CATEGORY 
									<input type="text" readonly="readonly" id="c_input" name="useless">
									<input type="hidden" name="c_pk" id="c_pk">
								</label>
								<div id="category_modal">
								<div class='button_container'>
									<div>도자 공예</div>
									<div>금속 공예</div>
									<div>유리 공예</div>
								</div>
								<div class='button_container'>
									<div>자수 공예</div>
									<div>가죽 공예</div>
									<div>목 공예</div>
								</div>
							</div>
							</div>
							<div class="common_input">
								<label>COMMENT 
									<input type="text" name="i_comment">
								</label>
							</div>
							<div class="common_input">
								<label>PRICE
									<input type="number" name="i_price">
								</label>
							</div>
						</div>
					</div>
					<div id="category_container">
						<div data-value="item">ITEM</div>
						<div data-value="auction">AUCTION</div>
						<div data-value="studio">STUDIO</div>
					</div>
				</form>
				<div id='submitBtn'>
					등 록
				</div>
				<div class="details_info" id="auction">
					<form id="auction_form">
						<div class='details_input'>
							<label> COUNTRY
								<input type="text" name="a_country">
							</label>
						</div>
						<div class='details_input'>
							<label> MATERIAL 
								<input type="text" name="a_material">
							</label>
						</div>
						<div class='details_input'>
							<label> COLOR 
								<input type="text" name="a_color">
							</label>
						</div>
						<div class='details_input'>
							<label> SIZE 
								<input type="text" name="a_size">
							</label>
						</div>
						<div class='details_input'>
							<label> START DATE
								<input type="text" class="datePick" readonly="readonly" name="a_startTime">
							</label>
						</div>
						<div class='details_input'>
							<label> ITEM DETAIL 
								<textarea class="detail_text" name="a_details"></textarea>
							</label>
						</div>
					</form>
				</div>
				
				<!-- 경계선 여기부턴 아이템 -->
				<div class="details_info" id="item">
					<form id="item_form">
						<div class='details_input'>
							<label> COUNTRY
								<input type="text" name="i_country">
							</label>
						</div>
						<div class='details_input'>
							<label> MATERIAL 
								<input type="text" name="i_material">
							</label>
						</div>
						<div class='details_input'>
							<label> COLOR 
								<input type="text" name="i_color">
							</label>
						</div>
						<div class='details_input'>
							<label> SIZE 
								<input type="text" name="i_size">
							</label>
						</div>
						<div class='details_input'>
							<label> STOCK
								<input type="number" name="i_stock">
							</label>
						</div>
						<div class='details_input'>
							<label> ITEM DETAIL 
								<textarea class="detail_text" name="i_details"></textarea>
							</label>
						</div>
					</form>
				</div>
				
				<!-- 스튜디오 경계선 위임 to UP -->
				<div class="details_info" id="studio">
					<form id="studio_form">
						<div class='details_input'>
							<label> COUNTRY
								<input type="text" >
							</label>
						</div>
						<div class='details_input'>
							<label> MATERIAL 
								<input type="text" >
							</label>
						</div>
						<div class='details_input'>
							<label> COLOR 
								<input type="text" >
							</label>
						</div>
						<div class='details_input'>
							<label> SIZE 
								<input type="text" >
							</label>
						</div>
						<div class='details_input'>
							<label> START DATE
								<input type="text" class="datePick" readonly="readonly">
							</label>
						</div>
						<div class='details_input'>
							<label> ITEM DETAIL 
								<textarea class="detail_text"></textarea>
							</label>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="img_modal">
			<div id="button_container">
				<span><i class="fas fa-file-upload"></i></span>
				<span><i class="far fa-images"></i></span>
				<span><i class="fas fa-times"></i></span>
				<form id="fileForm" enctype="multipart/form-data">
				<input type="file" name="uploadFiles" id="img_file" hidden="true" multiple="multiple"/>
				</form>
			</div>
			<div id="upload_container">

			</div>
		</div>
	</div>
</body>
</html>