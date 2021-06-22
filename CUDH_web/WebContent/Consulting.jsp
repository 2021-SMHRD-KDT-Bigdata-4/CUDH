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
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<meta name="viewport" content="width=device-width, user-scalable=no" />

<title>CUDH 컨설팅 페이지</title>

<script type="text/javascript">
	 $(document).ready(()=>{ 
	 cardList(); 
	 //이름 다시 정해서 핸들러 매핑할 것
	 }); 
	
	 function cardList(){
	 $.ajax({
		 url : "consultingCardlist.do", //이름 다시 정해서 핸들러 매핑할 것
		 type : "get",       
		 success : callBack, 
		 dataType : "json",
		 error : function(){ alert("error");}
		 }); 
	 }	

	 function callBack(data){
		 var view_nutrition = "<span class='badge bg-success'> 영양학 </span>";
		 var view_pathology = "<span class='badge bg-success'> 질병학 </span>";
		 var view_breeding = "<span class='badge bg-success'> 육종학 </span>";
		 var n_col_num = 0;
		 var p_col_num = 0;
		 var b_col_num = 0;
		 $.each(data, (p_idx, obj)=>{
			 if(obj.p_expertise.toString()=="영양학"){
				 n_col_num++;
				 view_nutrition += card(obj,n_col_num);
			 }
			 else if(obj.p_expertise.toString()=="질병학"){
				 p_col_num++;
				 view_pathology += card(obj,p_col_num);
			 }
			 else if(obj.p_expertise.toString()=="육종학"){
				 b_col_num++;
				 view_breeding += card(obj,b_col_num);
			 }
		 });
		 $("#card_nutrition").html(view_nutrition);
		 $("#card_pathology").html(view_pathology); 
		 $("#card_breeding").html(view_breeding); 
	 }

	 function card(obj,num){
			 var view = "<table>";
			 view += "<tr>";
			 view += "<td colspan ='2' >"+num+"</td>";
			 view += "<td></td>";
			 view += "</tr>";
			 view += "<tr>";
			 view += "<td> <img class='img_profile' src='img/profile.png'> </td>";
			 view += "<td> <p class='text-secondary'> "+obj.p_career+" </p> </td>";
			 view += "</tr>";
			 view += "<tr>";
			 view += "<td><p class='text-primary'> "+ obj.p_name +" </p></td>";
			 view += "<td><p class='text-success'>" + obj.p_consulting_price + "만원</p></td>";
			 view += "</tr>";
			 view += "</table>";
		 return view;
	  }
	 
	
	  
	  
</script>
</head>

<body>
	<div class="Content" id="CONTENT">
		<div id="card_nutrition"></div>
		<div id="card_pathology"></div>
		<div id="card_breeding"></div>
		<div>
			<table>
				<tr>
					<td><img class='img_profile' src='img/profile.png'></td>
					<td><p class='text-secondary'>이력</p></td>
				</tr>
				<tr>
					<td><p class='text-primary'>이름</p></td>
					<td><p class='text-success'>가격</p></td>
				</tr>
			</table>
		</div>

		
	</div>
</body>
</html>