<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.body{
	
	display:flex;
	
}
.bodybody{
	text-align:center;
	display:flex;
	width:1140px;
	justify-content:center;
	flex-wrap:wrap;
	align-content:center;
	margin:auto;
	
}
.flex-container{
	display:flex;
	flex-direction:row;
	width:1140px;
	justify-content:space-between;
	flex-wrap:wrap;
	align-content:center;
	margin-bottom:50px;
	}
	
.flex-item{
	display:flex;
	flex-basis:350px;
	font-size: 1.5rem !important;
	}
	
.img_profile{
	width: 200px;
	height: 240px;
	object-fit: fill;
}
.text-inner{
 	font-family: 'NanumSquare', sans-serif !important;
 	white-space:pre;
 }
 
	
</style>


<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript">
	 var Columns = [];
	 
	 $(document).ready(()=> { 
		 cardColumnsList();
		 cardList();
		$("#consulting_main").css("display","block");
		$("#cl").css("display","none");
		$("#cf").css("display","none");
		 
	 }); 
	 
	 
	 function cardColumnsList(){
		 //픽스
		 $.ajax({
			 url : "consultingCardColumnslist.do", 
			 type : "get",       
			 success : cardColumnsListArray, 
			 dataType : "json",
			 async:false,
			 error : function(){ alert("error");}
			 }); 
		 }	
	
	 function cardColumnsListArray(data){
		 	
		 	for(var i = 0 ; i < data.length ; i++){
		 		Columns.push( data[i]);
		 	}
	 }
	 
	 function cardList(){
		for(var i =0; i < 3 ; i ++){
			$.ajax({
				url : "consultingCardlist.do", 
				type : "get", 
				data : { "p_expertise" : Columns[i] },
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
	        view += "<div class='flex-container' id='div'"+data[0].p_expertise+">";
	        view += "<span style='width:1140px; height:40px; border-top:3px solid #08614D; border-bottom:1px solid #08614D; text-size:2rem; margin-bottom:20px;' id='span"+data[0].p_expertise+"'>";
	        view += "<h4 style='color:#08614D; text-align:center; margin-bottom:20px'><strong>"+data[0].p_expertise+"</strong></h4>" +"</span>";
	        view += "</div>";
	        view += "<div class='flex-container' id='div'"+data[0].p_expertise+">";
	        $.each(data, (index,obj)=>{
	           view += "<table  class='flex-item' id='tbl"+ obj.p_expertise + index +"'>";
	           view += "<tr>";
	           view += "<td rowspan='5'><img class='img_profile' src='img/"+obj.p_name+".png'></td>";
	           view += "</tr>";
	           view += "<tr>";
	           view += "<td></td>";
	           view += "<td><p class='text-primary' style='font-size: 15px !important;'>"+"<strong><h4>"+obj.p_name+"</h4></strong>" +" </p></td>";
	           view += "</tr>";
	           view += "<tr>";
	           view += "<td><p style='font-size : 2 rem;'  class='text-inner'>약력</p><p style='font-size : 2 rem;'  class='text-inner'>" + obj.p_career + "</p></td>";
	           view += "</tr>";
	           view += "<tr>";
	           view += "<td><p style='font-size : 2 rem;'  class='text-inner'>컨설팅 비용</p><p style='font-size : 2 rem;'  class='text-inner'>" + obj.p_consulting_price + "</p></td>";
	           view += "</tr>";
	           view += "<tr>";	          
	              var idx=JSON.stringify( obj.p_idx );
	              var name=JSON.stringify( obj.p_name );
	              var ept=JSON.stringify( obj.p_expertise );
	             view += "<td><input type ='button' value ='컨설팅 신청' class ='btn btn-primary' href=\"#top\" onclick='btnWrite("+idx+","+name+","+ept+")'></td>";
	             view += "</tr>";
	          view += "</table>";
	           
	       });
	        
	        view += "</div>";
	        $("#consulting_main").append(view);
	     }


	 function btnList(){
			 $("#cl").css("display","block");
		 }
	
	 
	 function btnWrite(idx,name,ept){
		 var con_m_idx='${sessionScope.loginVO.m_idx}';
		 var m_name='${sessionScope.loginVO.m_name}';
		 var con_p_idx = idx;
		 var p_name = name;
		 var p_expertise = ept;
		 
		 $("#consulting_main").css("display","none");
		 $("#cl").css("display","none");
		 $("#cf").css("display","block");
		 
		 $("#con_m_idx").val(con_m_idx);
		 $("#con_p_idx").val(con_p_idx);
		 $("#m_name").val(m_name);
		 $("#p_name").val(p_name); //오류
		 
		 $("#p_expertise").val(p_expertise); //오류
		 
	 }
	 

		function proList(){
			location.href="/CUDH_web/consulting.jsp"
		}
		
		function logoutFn() {
			$.ajax({
				url : "logoutCheck.do",
				type : "get",
				success : function() {
					location.href = "loginForm.jsp";
				},
				error : function() {
					alert("error");
				}
			});
			}
		
	
</script>
</head>

<body style="background-color:transparent; font-family: 'NanumSquare', sans-serif !important;" >
<div class = "bodybody">
	<div class="panel-heading">
		<c:if test='${sessionScope.loginVO.m_id==\'admin\'}'>
			<button class='btn btn-warning' onclick='btnList()'>계약목록확인</button>
			<button class='btn btn-warning' onclick='proList()'>목록으로</button>
		</c:if>
		
	</div>
	<div style="display: none; "id="cl">
		<c:import url="consultingList.jsp" />
	</div>
	
	<div style="display: none; float:right;"id="cf">
		<c:import url="consultingForm.jsp" />
	</div>
	
	<div style="display: none; "id="consulting_main">
	<h1 style="font-size: 4.4rem; margin-top:80px; margin-bottom: 50px; font-weight: 700; line-height: 1.2;">전문가 목록</h1>
	</div>
</div>
</body>

</html>