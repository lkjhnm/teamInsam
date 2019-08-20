<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		$(".menuLink").on("mouseover",function(){
			$(this).siblings().animate({
				opacity : '0.2'
			})
		})
		$(".menuLink").on("mouseleave",function(){
			$(this).siblings().animate({
				opacity : '1'
			})
		})
	})
</script>
<div id="header">
	<div id="menuContainer">
		<span class='menuLink'>I T E M</span>
		<span class='menuLink'>A U C T I O N</span>
		<span class='menuLink'>S T U D I O</span>
	</div>
	<span id="headerTitle">
		<i>Handus</i>
	</span>
</div>
