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

<script type="text/javascript">

$(document).ready(()=> { 
	consultingList();
}); 


function consultingList(){
	 $.ajax({
	    url : "consultingList.do", //----------------------> AjavBoardListController ----↓
	    type : "get",        //                      ↓ JSON = dic : {"idx":1, "name":"홍길동"}
	    success : callBack,  //-----------------------------------------------------
	    dataType : "json",
	    error : function(){ alert("error"); }
	 });
	}
	
function callBack(data){
	 var view="<table class = 'table table-bordered'>";
	 view+="<tr>";
	 view+="<td>신청 번호</td>";
	 view+="<td>멤버 아이디</td>";
	 view+="<td>전문가 아이디</td>";
	 view+="<td>예약 날짜</td>";
	 view+="<td>신청 내용</td>";;
	 view+="<td>승인 여부</td>";
	 view+="</tr>";
	 $.each(data, (index,obj) =>{
		 view += "<tr>";
		 view += "<td>"+obj.con_idx+"</td>";
		 view += "<td>"+obj.con_m_idx+"</td>";
		 view += "<td>"+obj.con_p_idx+"</td>";
		 view += "<td>"+obj.con_date+"</td>";
		 view += "<td>"+obj.con_about+"</td>";
		 view += "<td>"+obj.con_approval+"</td>";
		 view += "<td> <input type='button' value='승인' id='btnConsultingApproval' onclick='btnConsultingApproval("+obj.con_idx+")' class='btn btn-primary'/></td>";
		 view += "<td> <input type='button' value='삭제' id='btnConsultingDelete' onclick='btnConsultingDelete("+obj.con_idx+")' class='btn btn-primary'/></td>";
		 view += "</tr>";
	 });
	 view +="</table>";
	 $("#listShow").html(view);
}

function btnConsultingApproval(con_idx){
	$.ajax({
		url : "consultingUpdate.do",
		type : "get",
		data : { "con_idx" : con_idx},
		dataType : "json",
		success : function() {	
			consultingList();
			},
		error : function() { alert("error");		}
	});
	
}

function btnConsultingDelete(con_idx){
	$.ajax({
		url : "consultingDelete.do",
		type : "get",
		data : { "con_idx" : con_idx},
		dataType : "json",
		success : function() {	
		location.href="/CUDH_web/consulting.jsp";},
		error : function() { alert("error");		}
	});
}


</script>
</head>

<body>
	<div id="listShow"></div>
</body>
</html>