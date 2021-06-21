<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
		 var view_nutrition = "<p class='text-secondary'> 영양학 </p>";
		 var view_pathology = "<p class='text-secondary'> 질병학 </p>";
		 var view_breeding = "<p class='text-secondary'> 육종학 </p>";
		 
		 $.each(data, (p_idx, obj)=>{
			 if(obj.p_expertise.toString()=="영양학"){
				 view_nutrition += card(obj);
			 }
			 else if(obj.p_expertise.toString()=="질병학"){
				 view_pathology += card(obj);
			 }
			 else if(obj.p_expertise.toString()=="육종학"){
				 view_breeding += card(obj);
			 }
		 });
		 
		 $("#card_nutrition").html(view_nutrition); 
		 $("#card_pathology").html(view_pathology); 
		 $("#card_breeding").html(view_breeding); 
	 }

	 function card(obj){
		 var view = "";
			 view += "<div class='profile_img'>";
			 view += "<img src='img/profile.png'>";
			 view += "<p class='text-primary'> 이름 : "+ obj.p_name +"</p>";
			 view += "</div>";
			 view += "<div class='profile_text'>";
			 view += "<p class='text-secondary'>이력 : "+obj.p_career+"</p>";
			 view += "<p class='text-success'>가격 : "+obj.p_consulting_price+ "만원</p>";
			 view += "</div>";
		 return view;
	  }
	 
		 
</script>


</head>
<body>
	<div class="Contact" id="CONTACT">
		<div id ="card_nutrition" > </div>
		<div id ="card_pathology" > </div>
		<div id ="card_breeding" > </div>
	</div>
</body>
</html>