<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, user-scalable=no" />
<title>CUDH 컨설팅 페이지</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css">

<script type="text/javascript">
	 $(document).ready(()=>{ 
	 cardList(); 
	 //이름 다시 정해서 핸들러 매핑할 것
	 }); 
	
	 function cardList(){
	 $.ajax({
		 url : "cardlist.do", //이름 다시 정해서 핸들러 매핑할 것
		 type : "get",       
		 success : callBack, 
		 dataType : "json",
		 error : function(){ alert("error");}
		 }); 
	 }	

	 function callBack(data){
		 var view = "";
		  $.each(data, (p_idx, obj)=>{
			 view += "<div class='profile_img'>";
			 view += "<img src='img/profile.png'>";
			 view += "<p class='text-primary'> 이름 : "+ obj.p_name +"</p>";
			 view += "</div>";
			 view += "<div class='profile_text'>";
			 view += "<p class='text-secondary'>소분류 : "+obj.p_mc_crop+"</p>";
			 view += "<p class='text-secondary'>소개 : "+obj.p_sc_crop+"</p>";
			 view += "<p class='text-secondary'>이력 : "+obj.p_career+"</p>";
			 view += "<p class='text-success'>가격 : "+obj.p_consulting_price+ "만원</p>";
			 view += "</div>";		 
		  });
		 $("#oneCard").html(view); 
	 }
</script>


</head>
<body>
	<div class="Contact" id="CONTACT">
		<div class="oneCard" id="oneCard">
			<div class="profile_img">
				<img src="img/profile.png">
				<p class="text-primary">이름 : </p>
			</div>
			<div class="profile_text">
				<p class="text-secondary">소분류 : </p>
				<p class="text-secondary">소개 : </p>
				<p class="text-secondary">이력 : </p>
				<p class="text-success">가격 : </p>
			</div>
		</div>
	</div>
</body>
</html>