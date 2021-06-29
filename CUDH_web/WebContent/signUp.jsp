<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<script type="text/javascript">

function signUpFn(){
	alert("되는줄");
	location.href="<c:url value='/signUp.do'/>";
	location.href="/CUDH_web/companyHome.jsp";
}

</script>
<title>Insert title here</title>
</head>
<body>
				<form class="form-inline" action="/CUDH_web/signUp.do" method="get">
						<div class="form-group">
							<label>ID</label> <input type="text" class="form-control"
								id="m_id" name="m_id">
						</div>
						<div class="form-group">
							<label>PW</label> <input type="text" class="form-control"
								id="m_pw" name="m_pw">
						</div>
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								id="m_name" name="m_name">
						</div>
						<div class="form-group">
							<label>희망작물</label> <input type="text" class="form-control"
								id="m_hoping_crop" name="m_hoping_crop">
						</div>
						
						<button type="submit" class="btn btn-default">로그인</button>
				</form>
</body>
</html>