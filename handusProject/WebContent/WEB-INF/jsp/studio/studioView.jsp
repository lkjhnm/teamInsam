<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANDUS/Studio</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/handus.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div class='container'> <!-- 필수!! side,header는 필요에따라 추가 하면됩니다. -->
	<jsp:include page="/WEB-INF/jsp/module/sideMenu.jsp"/>
	<jsp:include page="/WEB-INF/jsp/module/header.jsp"/>
	<!-- ***** -->
	<div>
		<table>
			<tr><th>번호</th><td>${studio.s_pk}</td></tr>
			<tr><th>제목</th><td>${studio.s_title}</td></tr>
			<tr><th>글쓴이(번호)</th><td>${studio.m_pk_writer}</td></tr>
			<tr><th>가격</th><td>${studio.s_price}</td></tr>
			<tr><th>주소</th><td>${studio.s_location}</td></tr>
			<tr><th>카테고리</th><td>${studio.s_category}</td></tr>
			<tr><th>등록일</th><td>${studio.s_regdate}</td></tr>
			<tr><th>수정일</th><td>${studio.s_updatedate}</td></tr>
			<tr><th>최대인원</th><td>${studio.s_maximum}</td></tr>
			<tr><th>현재인원</th><td>${studio.s_current}</td></tr>
			<tr><th>시작일</th><td>${studio.s_classstart}</td></tr>
			<tr><th>종료일</th><td>${studio.s_classend}</td></tr>
			<tr><th>조회수</th><td>${studio.s_read_count}</td></tr>
			<tr><th>내용</th><td>${studio.s_content}</td></tr>
			
		</table>
		</div>
</div>
</body>
</html>