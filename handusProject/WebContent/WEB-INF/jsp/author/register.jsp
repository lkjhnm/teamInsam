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
	#addressBox input:not(#zipCode){
		width: 100%;
		height: 50px;
		border-top:0;
		border-left:0;
		border-right:0;
		border-bottom: 1px solid #191919;
		background-color: inherit;
	}
	#zipCode{
		width: 400px;
		height: 50px;
		border-top:0;
		border-left:0;
		border-right:0;
		border-bottom: 1px solid #191919;
		background-color: inherit;
	}
	#addressBox input:focus{
		outline: none;
	}
	
	#addressBox input:not(#address-detail){
		cursor :pointer;	
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
		
		$(".datePick").datepicker({
			showOtherMonths:true,
			changeMonth: true,
		})
		
		$("#submitBtn").on("click",function(){
			
			var subtype = changeName(type)
			var formContainer = $("#common_form")
			
			if(subtype == null){
				subtype = 'item'
			}
			
			// 이미지 데이터
			var imgs = $("#thumbnail_train").children();
			var mainImg = $("#mainImg").attr("data-name");
			
			$.each(imgs, function(i, item){
				var value = $(item).attr("data-name")
				var input = $("<input type='hidden' name='imgList["+i+"].img_fileName' value='"+value+"'>")
				if(mainImg == value){
					var isMain = $('<input type="hidden" name="imgList['+i+'].img_main" value="true" >')
					formContainer.append(isMain)
				}
				formContainer.append(input)
			})
			
			
			// 추가 데이터
			var extraData = $("#"+subtype+"_form").find("input")
			$(extraData).each(function(){
				console.log($(this))
				var name = $(this).attr("name")
				console.log(name)
				var value = $(this).attr("value")
				
				var input = $("<input type='hidden'>").attr("name",name).attr("value",value)
				formContainer.append(input)
			})
			
			var textname = $("#"+subtype+"_form").find("textarea").attr("name")
			var textvalue = $("#"+subtype+"_form").find("textarea").attr("value")
			var textarea = $("<textarea hidden='true'>").attr("name",textname).text(textvalue)
			var m_pk = $("<input type='hidden'>").attr("name","m_pk_writer").attr("value","${m_pk}")
			
			formContainer.attr("action","${pageContext.request.contextPath}/author/register/"+subtype)
			
			formContainer.append(textarea).append(m_pk);
			formContainer.submit()			
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
			var main_name = imgs.first().attr("data-name")
			$("#mainImg").attr("src",main).attr("data-name",main_name)
			
			$("#thumbnail_train").children().on("click",function(){
				var src = $(this).attr("src")
				var name = $(this).attr("data-name")
				$("#mainImg").attr("src",src);
				$("#mainImg").attr("data-name",name)
			})
			$("#img_modal").css("display","none")
			$("#upload_container").children().remove()
		})
		
		$("#zipCode").on("click",function(){
			daumPostcode()
		})
		
		$("#address").on("click",function(){
			daumPostcode()
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
				
				<!-- 스튜디오 경계선 위임  -->
				<div class="details_info" id="studio">
					<form id="studio_form">
						<div class='details_input'>
							<label> MAXIMUM
								<input type="number" name="s_maximum">
							</label>
						</div>
						<div class='details_input'>
							<label> START DATE
								<input type="text" class="datePick" readonly="readonly" name="s_classstart">
							</label>
						</div>
						<div class='details_input'>
							<label> END DATE
								<input type="text" class="datePick" readonly="readonly" name="s_classend">
							</label>
						</div>
						<div class='details_input'>
							<label> STUDIO NAME
								<input type="text" name="s_name">
							</label>
						</div>
						<div class='details_input'>
							<label> STUDIO DETAIL 
								<textarea class="detail_text" name="s_content"></textarea>
							</label>
						</div>
						<div class='details_input' id='addressBox'>
							<div>STUDIO ADDRESS</div>					
							<div>
								<input id="address" name="s_location" type="text" readonly="readonly" placeholder="Address">		
								<input id="address-detail" name="s_loaction_detail" type="text"  placeholder="Detail" autocomplete="off">
							</div>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	var themeObj = {
	   bgColor: "#FBF9F6", //바탕 배경색
	   searchBgColor: "#FBF9F6", //검색창 배경색
	   contentBgColor: "#FBF9F6", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
	   pageBgColor: "#FBF9F6", //페이지 배경색
	   textColor: "#191919", //기본 글자색
	   queryTextColor: "#191919", //검색창 글자색
	   //postcodeTextColor: "", //우편번호 글자색
	   //emphTextColor: "", //강조 글자색
	   outlineColor: "#191919" //테두리
	};
	var width = 500;
	var height = 600;
	
    function daumPostcode() {
        new daum.Postcode({
        	theme: themeObj,
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
//                     document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
//                     document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address-detail").focus();
            }
        }).open({
        	left: (window.screen.width / 2) - (width / 2),
            top: (window.screen.height / 2) - (height / 2)
        });
    }
</script>
</html>