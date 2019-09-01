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
		margin: 0 auto;
	}
	#signUpTitle{
		text-align: center;
		font-size: 40px;
		padding-top : 70px;
	}
	#signContainer{
		width: 70%;
		height: 700px;
		margin: 0 auto;
	}
	#signForm{
		margin-top: 80px;
	}
	.signUpBox{
		width: 550px;
		height: 60px;
		margin: 20px auto;
		line-height: 30px;
		font-weight: 400;
	}
	.signUpBox input{
		width: 550px;
		height: 30px;
		border-top:0;
		border-left:0;
		border-right:0;
		border-bottom: 1px solid #191919;
		background-color: inherit;
	}
	.signUpBox input:focus{
		outline: none;
	}
	#addressBox{
		width: 550px;
		height: 200px;
		margin: 20px auto;
		line-height: 50px;
		font-weight: 400;
	}
	#addressBox input:not(#zipCode){
		width: 550px;
		height: 30px;
		border-top:0;
		border-left:0;
		border-right:0;
		border-bottom: 1px solid #191919;
		background-color: inherit;
	}
	#zipCode{
		width: 200px;
		height: 30px;
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
	
	.boundary-sign{
		height: 30px;
	}
	#signUpButton{
		margin:0 auto;
	}
	.signUpBox button{
		width: 550px;
		height:50px;
		background-color: #191919;
		color: #fff;
		border: none;
	}
	.signUpBox button{
		cursor:pointer;
	}
	.validate{
		color: green;
		display:none;
	}
	#checkBox{
		width: 550px;
		margin: 20px auto;
		line-height: 30px;
		font-weight: 400;
	}
	#checkBox input{
		width: 20px;
		height: 15px;
	}
	.checkPosition{
		display:flex;
		justify-content: space-around;
	}
	.checkPosition div{
		width: 225px;
		height: 30px;
	}
</style>
<script>
	$(function(){	
		
		$("#zipCode").on("click",function(){
			daumPostcode()
		})
		
		$("#address").on("click",function(){
			daumPostcode()
		})
		
		$("#signForm").on("submit",function(e){
			console.log(123)
			var addr = $("#address").val()
			var addrDetail = $("#address-detail").val()
			
			var addrData = $("<input type='hidden' name='m_address'/>").val(addr + " " + addrDetail)
			$(this).append(addrData)
		})
	})
	

</script>
</head>
<body>
	<div class='container'>
		<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
		
		<div id="main">
			<div id="signUpTitle">
				ADDITIONAL SIGN  UP
			</div>
			<div id="signContainer">
				<form action="additionalSignUp" method="post" id="signForm"> 	<!-- 사인업 사인업 -->
					
					<div class='signUpBox'>
						<label> NAME
							<input type="text" name="m_name" autocomplete="off"></label>
					</div>
					<div class='signUpBox'>
						<label> EMAIL
							<input type="email" name="m_email"></label>
					</div>
					<div class='signUpBox'>
						<label> PHONE
							<input type="tel" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" placeholder="EX) 01012341234" name="m_phonenum"></label>
					</div>
					
					<div class='boundary-sign'></div>
					
					<div id='addressBox'>
						<div>ADDRESS</div>
							<input id="zipCode" type="text" readonly="readonly" placeholder="Zip-code">					
						<div>
							<input id="address" type="text" readonly="readonly" placeholder="Address">		
							<input id="address-detail" type="text"  placeholder="Detail" autocomplete="off">
						</div>
					</div>
					
					<div class='boundary-sign'></div>
					
					<div id="checkBox">
						<div>INTEREST</div>
						<div class='boundary-sign'></div>
						<div class='checkPosition'>
							<div><label><input type="checkbox" name="c_pk" value="1" >CERAMICS</label></div>
							<div><label><input type="checkbox" name="c_pk" value="2">METAL</label></div>
						</div>
						<div class='checkPosition'>
							<div><label><input type="checkbox" name="c_pk" value="3">GLASS</label></div>
							<div><label><input type="checkbox" name="c_pk" value="4">EMBROIDERY</label></div>
						</div>
						<div class='checkPosition'>
							<div><label><input type="checkbox" name="c_pk" value="5">LEATHER</label></div>
							<div><label><input type="checkbox" name="c_pk" value="6">WOOD</label></div>
						</div>
					</div>
					<div class='boundary-sign'></div>
					<div class="signUpBox">
						<button type="submit">SIGNUP</button>
					</div>
				</form>
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
                document.getElementById('zipCode').value = data.zonecode;
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