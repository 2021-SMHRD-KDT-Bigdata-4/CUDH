<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
$(document).ready(()=>{
    consultingList();
});

function consultingList(){
	 $.ajax({
	    url : "consultingList.do", //----------------------> AjavBoardListController ----↓
	    type : "get",        //                      ↓ JSON = dic : {"idx":1, "name":"홍길동"}
	    success : callBack,  //-----------------------------------------------------
	    dataType : "json",
	    error : function(){ alert("error");}
	 });
	}
	
function callBack(data){
	var view="<table class = 'table table-bordered'>";
	 view+="<tr>";
	 view+="<td>멤버 아이디</td>";
	 view+="<td>전문가 아이디</td>";
	 view+="<td>예약 날짜</td>";
	 view+="<td>신청 내용</td>";;
	 view+="<td>승인 여부</td>";
	 view+="</tr>";
	 view="</table>";
	 var dt =JSON.stringify( data[0] );
	 alert(dt);
	 $("#listShow").append(view);
	 
}
	
	

</script>
</head>
<body>
	<div class="panel panel-default" id="listShow">
		
		
		
		
	</div>
</body>
</html>