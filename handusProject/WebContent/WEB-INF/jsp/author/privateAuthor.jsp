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
</style>
<script>
	$(function(){
		
		var isMod = false;
		var origin_src;
		
		$("#modBtn").on("click",function(){
			$("#menu").css("display","none")
			$("#modify").css("display","block")
			$("#profile_info_container").children().css("border","1px solid #ff1d43").addClass("hover")
			$("#profile_image").css("border","1px solid #ff1d43").addClass("hover")
			origin_src = $("#profile_image").attr("src")
			isMod = true;
			
			$(".hover").on("click",function(){
				$(this).children("input").css("display","block").focus();
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
			
			formData.append("at_name",name)
			formData.append("at_email",email)
			formData.append("at_studio",studio)
			formData.append("at_address",address)
			var str = "";
			str += "ap_filename="+$("#profile_image").attr("data-name")
			str += "m_pk=${m_pk}"
			str += "at_name"

			$.ajax({
				url:"${pageContext.request.contextPath}/author/updateAuthor",
				type:"post",
				data: formData,
				dataType:"json",
				success: function(data){
					alert(data);
					$("#menu").css("display","block");
					$("#modify").css("display","none");
					$("#profile_info_container").children().css("border","none").css("border-bottom","1px solid #191919").removeClass("hover");
					$("#profile_image").css("border","none").removeClass("hover")
					$("#profile_image").attr("src","${pageContext.request.contextPath}/author/authorImg?ap_pk="+ data.ap_pk);
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
	})
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
					<div><img id="profile_image" src="${pageContext.request.contextPath }/author/authorImg?ap_pk=${AP_PK}"
								data-name="${AP_FILENAME }">
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
						<div class='profile_button'>작품 검색</div>
					</div>
					<div class="profile_button_container" id="modify">
						<div class='profile_button' id="confirm">수 정</div>
						<div class='profile_button' id="cancel">취 소</div>
					</div>
				</fieldset>
			</div>
			<div id="modifyModal">
				
			</div>
		</div>
	</div>
</body>
</html>