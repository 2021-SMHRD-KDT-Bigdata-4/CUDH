<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
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
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade" id="tab-1">
			<!-- 이 자리에 원하는 jsp 넣고 싶음 -->
			<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
		</div>
		<div class="tab-pane fade" id="tab-2">
			<!-- 이 자리에 원하는 jsp 넣고 싶음 -->
			<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
		</div>
		<div class="tab-pane fade active show" id="tab-3">
			<!-- 이 자리에 원하는 jsp 넣고 싶음 -->
			<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level 
		</div>
	</div>	
	


</body>
</html>