<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var profile = ${userProfile };
	var id = profile.response.id;
	var name = profile.response.name;
	var email = profile.response.email;
	$.ajax({
		url: "setProfile",
		data: {
			"id":id,
			"name":name,
			"email":email
		},
		type: "post",
		dataType: "json",
		success: function (result) {
// 			alert(result);
			if(result){
				// 로그인, 권한설정 
				$.ajax({
					url:"naverAuth",
					data: {"id":id},
					success: function (data) {
						opener.parent.location="/handusProject/studio/list";
						window.close();
					},
					error: function () {
						alert("로그인진행에러");
					}
				});
			}else{
				// 회원가입
				opener.parent.location="additionalSignUp";
				window.close();
			}
		},
		error: function () {
			alert("값저장에러");
		}
	});
</script>
</head>
</html>