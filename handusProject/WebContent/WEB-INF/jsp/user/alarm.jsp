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
<script src="https://kit.fontawesome.com/c62d0d5d4f.js"></script>
<style>
	#alarmNav{
		height:50px;
		background-color: #191919;
		display:flex;
		justify-content: center;
	}
	#alarmNav>ul{
		list-style: none;
		margin:0;
		padding:0;
		width:100%;
		display:flex;
		justify-content: space-around;
	}
	#alarmNav li{
		border-bottom: 1px solid #fff;
		color:#fff;
		margin:10px;
		padding:5px;
	}
	#alarmNav li:hover{
		cursor:pointer;
		color: #ff1d43;
		border-bottom-color: #ff1d43;
	}	
	.alarm{
		height: 100px;
		text-align: center;
		display: flex;
		align-items: center;
		justify-content: space-evenly;
 		border-bottom: 1px solid #191919; 
	}
	img{
		border-radius:50%;
		border: 1px solid #191919;
		width:65px;
		height:65px;
	}
	.moreBtn:hover{
		cursor:pointer;
		color:#ff1d43;
	}
	.message{
		font-weight: 600;
	}
	div[data-read='1']{
		background-color: #d9d5d4;
	}
</style>
<script type="text/javascript">
	$(function(){
		getAlarmListByBtn(1);
		
		$("[data-btn]").on("click",function(){
			var type = $(this).attr("data-btn");
			getAlarmListByBtn(type);
		})
	})
	function getAlarmListByBtn(type){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/user/alarmList",
			dataType:"json",
			type:"get",
			data: {"readType" : type},
			success:function(alarmList){
				drawAlarm(alarmList);
			},
			error:function(){
				alert("error")
			}
		})
	}
	function drawAlarm(alarmList){
		var container = $("#messageContainer");
		container.html("");
		$.each(alarmList,function(i,item){
			var div = $("<div class='alarm' data-read='"+ item.UA_READ +"'>");
			var img = $("<img src='${pageContext.request.contextPath}/image/"+item.HI_PK+"'>")
			var spanMsg = $("<span class='message'>"+ item.UA_MESSAGE +"</span>")
			var spanBtn = $("<span class='moreBtn' onclick='moveDetailsPage("+item.UA_TYPE+","+item.UA_FK+","+item.UA_PK+","+item.UA_READ+")'>")
			spanBtn.append($("<i class='fas fa-angle-double-right'>"));
			div.append(img).append(spanMsg).append(spanBtn).appendTo(container);
		})
	}
	function moveDetailsPage(ua_type, ua_fk, ua_pk, ua_read){
		var url = "${pageContext.request.contextPath}/";
		switch(ua_type){
		case 1:
			url += "item/detail?num="+ua_fk;
			break;
		case 2:
			url += "auction/detail?a_pk="+ua_fk;
			break;
		case 3:
			url += "studio/detail?num="+ua_fk;
			break;
		}
		if(ua_read == 0){
			$.ajax({
				url:"${pageContext.request.contextPath}/user/alarmRead/"+ ua_pk,
				dataType:"text",
				type:"put",
				success:function(result){
					opener.location.href= url;
					window.close();					
				},
				error:function(data,data2,data3){
					console.log(data)
					console.log(data2)
					console.log(data3)
				}
			})
		}
	}
</script>
</head>
<body>
	<div class='alarmContainer'>
		<div id="alarmNav">
			<ul>
				<li data-btn="1"> NEW </li>
				<li data-btn="2"> READ </li>
				<li data-btn="3"> ALL </li>
			</ul>
		</div>
		<div id='messageContainer'>						
		</div>
	</div>
</body>
</html>