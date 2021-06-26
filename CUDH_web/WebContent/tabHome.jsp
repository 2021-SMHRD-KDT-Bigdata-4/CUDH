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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>CUDH</title>
<script type="text/javascript">

$(document).ready(()=> { 
	maptab()
}); 

function maptab(){
	$(".active_map").css("display","block");
	$(".active_board").css("display","none");
	$(".active_con").css("display","none");
	/* $('div').append('.active_map');
	//$('div').detach('.active_map');
	$('div').detach('.active_board');
	$('div').detach('.active_con');  */
}
function boardtab(){
	$(".active_map").css("display","none");
	$(".active_board").css("display","block");
	$(".active_con").css("display","none");
	/* $('div').append('.active_board');
	$('div').detach('.active_map');
	//$('div').detach('.active_board');
	$('div').detach('.active_con');  */
}


function consultingtab(){
	$(".active_map").css("display","none");
	$(".active_board").css("display","none");
	$(".active_con").css("display","block");
	/* $('div').append('.active_con');
	$('div').detach('.active_map');
	$('div').detach('.active_board');
	//$('div').detach('.active_con');  */
} 



</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<a class="navbar-brand" href="companyHome.jsp">CUDH</a>
		
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="tab" data-tab="tab-1" onclick='maptab()' href="#tab-1">수확량 예측 지도</a></li>
			
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="tab" data-tab="tab-2" onclick='boardtab()' href="#tab-2">사용자 게시판</a></li>
			
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="tab" data-tab="tab-3" onclick='consultingtab()' href="#tab-3">컨설팅 신청</a></li>
	</ul>

	<div id="myTabContent" class="tab-content" name="Tab">

		<div id="tab-1" class="active_map">
			<div style="display: block;" id="mh" class="mh" name="mh">
				<c:import url="mapHome.jsp" />
			</div>
		</div>

		<div id="tab-2" class="active_board">
			<div style="display: block;" id="mb" class="mb" name="mb">
				<c:import url="memberBoard.jsp" />
			</div>
		</div>

		<div id="tab-3" class="active_con">
			<div style="display: block;" id="mc" class="mc" name="mc">
				<c:import url="consulting.jsp" />
				<h1>야이 색햐</h1>
			</div>
		</div>

	</div></html>
