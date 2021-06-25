<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>CUDH</title>
<script type="text/javascript">
 $(document).ready(()=> {
	$('ul.nav-tabs >li >a').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.nav-tabs >li >a').removeClass('active');
		$('.tab-pane').removeClass('active show');

		$(this).addClass('active');
		$("#"+tab_id).addClass('active show');
	});
});
	
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<a class="navbar-brand" href="companyHome.jsp">CUDH</a>
		<li class="nav-item">
			<a class="nav-link " data-bs-toggle="tab" data-tab="tab-1" href="#tab-1">수확량 예측 지도</a></li>
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="tab" data-tab="tab-2" href="#tab-2">사용자 게시판</a></li>
		<li class="nav-item">
			<a class="nav-link active" data-bs-toggle="tab" data-tab="tab-3" href="#tab-3">컨설팅 신청</a></li>
	</ul>
	<div id="Tab_C" class="Tab_C" name="Tab_C" >
		<div id="tab-1">
		</div>
		<div id="tab-2">
			<div style="display: block;" id="mb" class="mb" name="mb">
				<c:import url="memberBoard.jsp" />
			</div>
		</div>
		<div id="tab-3">
			
		</div>
	</div>	
	


</body>
</html>