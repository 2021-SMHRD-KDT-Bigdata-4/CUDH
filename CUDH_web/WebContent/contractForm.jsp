<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	bsrc="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
<title>컨설팅 신청</title>
</head>
<body>

<div class="container">
	<h2>컨설팅 신청</h2>
	<div>
		<div >컨설팅 신청</div>
		<div>		
			<form action="<c:url value='/contractWrite.do'/>" method="post">
				<div class="form-group">
					<label>신청인: </label><input type="text" class="form-control"
						id="m_name" name="m_name" 
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>전문가: </label><input type="text" class="form-control"
						id="p_name" name="p_name"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>전문 영역: </label><input type="text" class="form-control"
						id="p_expertise" name="p_expertise"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>요청 사유: </label> 
					<input type="text" class="form-control"
						id="con_about" name="con_about">
				</div>
				<div class="form-group">
					<label>신청할 날짜:</label>
					<input type="date" class="form-control"
						 id="con_date"	name="con_date">
				</div>
				<button type="submit" class="btn btn-success">신청하기</button>
			</form>
		</div>
		<div>빅데이터 4차(큐티 윤빈)</div>
	</div>
</div>

</body>
</html>