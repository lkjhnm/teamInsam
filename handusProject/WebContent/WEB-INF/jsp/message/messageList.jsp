<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Handus</title>
<script type="text/javascript">
	$(function () {
		// 메세지 보내기 아이콘 
		$("#msg-icon").on("mouseover", function () {
			$("#msg-fa").removeClass("far");
			$("#msg-fa").addClass("fas")
		});
		$("#msg-icon").on("mouseout", function () {
			$("#msg-fa").removeClass("fas");
			$("#msg-fa").addClass("far")
		});
		$("#msg-icon").on("click", function () {
			alert("새 메세지 보내기");
			
		});
		
		
		
		
	});
</script>
</head>
<body>
	<div id="container">
		<!-- 받은 메세지 정렬(최신순) -->
		<div id="messageList">
			<div id="msg-head">
				<div>메세지</div>
				<div><span id="msg-icon"><i class="far fa-envelope" id="msg-fa"></i></span></div>
			</div>
			<div id="msg-body">
				
			</div>
		</div>
		
	</div>
</body>
</html>