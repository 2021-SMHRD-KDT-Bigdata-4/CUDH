<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	bsrc="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

function btnApply() {
	 //var formData=$("#confrm").serialize();
	 
	 var con_m_idx = $("#con_m_idx").val();
	 var con_p_idx = $("#con_p_idx").val();
	 var con_about = $("#con_about").val();
	 var con_date = $("#con_date").val();
	 var con_approval =$("#con_approval").val();
		 $.ajax({
			url : "consultingWrite.do",
			type : "post",
			data : { "con_m_idx" : con_m_idx, "con_p_idx" : con_p_idx, "con_about" : con_about , "con_date" : con_date,  "con_approval" : con_approval },
			success : function(){
			alert("이제 쉬어도 되나?");
			//location.href="consulting.jsp";
			},
		error : function(){ alert("error"); }
	});
}

</script>
<title>컨설팅 신청</title>
</head>
<body>

<div class="container">
	<h2>컨설팅 신청</h2>
	<div>
		<div>		
			<form method="post" id="confrm">
				<div class="form-group" style ="display:none">
					<label>신청인 id</label>
					<input type="text" class="form-control"
						 id="con_m_idx"	name="con_m_idx" readonly="readonly"  >
				</div>
				<div class="form-group">
					<label>신청인 </label>
					<input type="text" class="form-control"
						id="m_name" name="m_name" readonly="readonly">
				</div>
				<div class="form-group"  style ="display:none">
					<label>전문가 id</label>
					<input type="text" class="form-control"
						 id="con_p_idx"	name="con_p_idx" readonly="readonly" >
				</div>
				<div class="form-group">
					<label>전문가 </label><input type="text" class="form-control"
						id="p_name" name="p_name"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>전문 영역 </label><input type="text" class="form-control"
						id="p_expertise" name="p_expertise"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>요청 사유 </label> 
					<input type="text" class="form-control"
						id="con_about" name="con_about">
				</div>
				<div class="form-group">
					<label>신청할 날짜</label>
					<input type="date" class="form-control"
						 id="con_date"	name="con_date">
				</div>
				<div class="form-group" style ="display:none">
					<label>승인 여부 </label><input type="text" class="form-control"
						id="con_approval" name="con_approval" value = "n" readonly="readonly">
				</div>
				<button type="button" class="btn btn-default" onclick="btnApply()"> 신청하기 </button>
			</form>
		</div>
		<div>빅데이터 4차(큐티 윤빈)</div>
	</div>
</div>

</body>
</html>