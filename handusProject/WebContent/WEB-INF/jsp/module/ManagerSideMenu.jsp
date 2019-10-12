<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-3">
            <!-- Left column -->
            <a href="#"><strong><i class="glyphicon glyphicon-wrench"></i> Tools</strong></a>
            <hr>
            <ul class="nav nav-stacked">
                <li class="nav-header"> <a href="#" data-toggle="collapse" data-target="#userMenu">C A T E G O R Y</a>
                    <ul class="nav nav-stacked collapse in" id="userMenu">
                        <li class="active"> <a href="#"><i class="glyphicon glyphicon-circle"></i> H O M E </a></li>
                        <li><a href="managerAuction"><i class="glyphicon glyphicon-circle"></i> A U C T I O N </a></li>
                        <li><a href="managerStudio"><i class="glyphicon glyphicon-circle"></i> S T U D I O </a></li>
                    	<li><a href="managerMember"><i class="glyphicon glyphicon-circle"></i> I T E M </a></li>
                    	<li><a href="managerMember"><i class="glyphicon glyphicon-circle"></i> M E M B E R </a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-envelope"></i> Messages <span class="badge badge-info">4</span></a></li>
                    </ul>
                </li>                
            </ul>
        </div>
 		
 		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- 		<script src="js/bootstrap.min.js"></script> -->
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
		
</body>
</html>