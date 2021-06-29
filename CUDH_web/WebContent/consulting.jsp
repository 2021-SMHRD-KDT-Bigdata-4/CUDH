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
	        view += "<span class='badge bg-success' id='span"+data[0].p_expertise+"'>"+ "<h4><strong>"+data[0].p_expertise+"</strong></h4>" +"</span>";
	        view += "</div>";
	        view += "<div class='flex-container' id='div'"+data[0].p_expertise+">";
	        $.each(data, (index,obj)=>{
	           view += "<table class='flex-item' id='tbl"+ obj.p_expertise + index +"'>";
	           view += "<tr>";
	           view += "<td rowspan='5'><img class='img_profile' src='img/"+obj.p_name+".png'></td>";
	           view += "<td></td>";
	           view += "</tr>";
	           view += "<table>";
	           view += "<tr>";
	           view += "<td></td>";
	           view += "<td><p class='text-primary'>"+"<strong><h4>"+obj.p_name+"</h4></strong>" +" </p></td>";
	           view += "</tr>";
	           view += "<tr>";
	           view += "<td></td>";
	           view += "<td><p class='text-success'>" + obj.p_career + "</p></td>";
	           view += "</tr>";
	           view += "<tr>";
	           view += "<td></td>";
	           view += "<td><p class='text-success'>컨설팅 비용: " + obj.p_consulting_price + "</p></td>";
	           view += "</tr>";
	           view += "<tr>";	          
	              var idx=JSON.stringify( obj.p_idx );
	              var name=JSON.stringify( obj.p_name );
	              var ept=JSON.stringify( obj.p_expertise );
	              view += "<td></td>";
	             view += "<td><input type ='button' value ='컨설팅 신청' class ='btn btn-primary' href=\"#top\" onclick='btnWrite("+idx+","+name+","+ept+")'></td>";
	             view += "</tr>";
	          view += "</table>";   
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

<body>

	<div class="panel-heading">
		<c:if test='${sessionScope.loginVO.m_id==\'admin\'}'>
			<button class='btn btn-warning' onclick='btnList()'>계약목록확인</button>
			<button class='btn btn-warning' onclick='proList()'>목록으로</button>
		</c:if>
		
	</div>
	<div style="display: none; "id="cl">
		<c:import url="consultingList.jsp" />
	</div>
	
	<div style="display: none; "id="cf">
		<c:import url="consultingForm.jsp" />
	</div>
	
	<div style="display: none; "id="consulting_main"></div>
</body>

</html>