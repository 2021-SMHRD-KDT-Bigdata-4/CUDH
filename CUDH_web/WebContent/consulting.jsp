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
	 var Colunms = [];
	 $(document).ready(()=> { 
		 cardColunmsList();
		 cardList();
	 }); 
	 
	 function cardColunmsList(){
		 //픽스
		 $.ajax({
			 url : "consultingCardColunmslist.do", 
			 type : "get",       
			 success : cardColunmsListArray, 
			 dataType : "json",
			 async:false,
			 error : function(){ alert("error");}
			 }); 
		 }	
	
	 function cardColunmsListArray(data){
		 	
		 	for(var i = 0 ; i < data.length ; i++){
		 		Colunms.push( data[i]);
		 	}
	 }
	 
	 function cardList(){

		for(var i =0; i < 3 ; i ++){
			$.ajax({
				url : "consultingCardlist.do", 
				type : "get", 
				data : { "p_expertise" : Colunms[i] },
				async:false,
				dataType : "text",
				success : card,
				error : function(){alert("error");}
				});
		 }
	 }
	 
	 function card(data){
		 data = JSON.parse(data);
		 var view="";
		 view += "<span class='badge bg-success' id='span"+data[0].p_expertise+"'> "+ data[0].p_expertise +" </span>";
		 view += "<div class='flex-container' id =div"+data[0].p_expertise+">";
		 $.each(data, (index,obj) =>{
			 view += "<table class='flex-item' id='tbl"+ obj.p_expertise + index +"'>";
			 view += "<tr>";
			 view += "<td> <img class='img_profile' src='img/profile.png'> </td>";
			 view += "<td> <p class='text-secondary'> "+obj.p_career+" </p> </td>";
			 view += "</tr>";
			 view += "<tr>";
			 view += "<td><p class='text-primary'> "+ obj.p_name +" </p></td>";
			 view += "<td><p class='text-success'>" + obj.p_consulting_price + "만원</p></td>";
			 view += "</tr>";
			 view += "<tr>";
			 //view += "<td colspan = '2'><button onclick=ConsultingForm("+ obj.p_idx + obj.p_name + obj.p_expertise +")> 컨설팅 신청 </button></td>";
			 //view += "<td colspan = '2'><button onclick=ConsultingForm("+obj.p_idx+obj.p_name+obj.p_expertise+")> 컨설팅 신청 </button></td>";
			 view += "<td colspan = '2'><input type ='button' value ='컨설팅 신청' class ='btn btn-primary' onclick='btnWrite("+'obj.p_name'+","+'obj.p_expertise'+")'/></td>";
			 view += "</tr>";
			 view += "</table>";
		});
		 view += "</div>";
		 $("#consulting_main").append(view);
	 }
	 
	 function btnWrite(p_name,p_expertise){
		 var name = p_name;
		 alert(name);
		 //var m_name='${sessionScope.loginVO.m_name}';
		 //var p_name = p_name.toString();
		// var p_expertise = p_expertise.toString();
		 //alert( ${vo.getP_name()} );
		 		 
		 //$("#cf").css("display","block");
		 //$("#m_name").val(m_name);
		 //$("#p_name").val(p_name);
		 //$("#p_expertise").val(p_expertise);
	 }
	 
	 
</script>
</head>
<body>
		<div style="display: none;" id="cf">
					<c:import url="contractForm.jsp" />
		</div>
		<div id="consulting_main"></div>
</body>
</html>