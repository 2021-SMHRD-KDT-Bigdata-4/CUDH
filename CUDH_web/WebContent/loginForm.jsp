<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

function loginFn() {
	var member_id = $("#member_id").val();
	var member_pw = $("#member_pw").val();
	alert(member_id)
	$.ajax({
		url : "loginCheck.do",
		type : "post",
		data : {
			"member_id" : member_id,
			"member_pw" : member_pw
		},
		success : function(data) {
			if (data == "NO") {
				alert("회원인증 실패");
			} else {
				location.href="loginForm.jsp"
			}
		},
		error : function() {
			alert("error");
		}

	});
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

	<div class="container">
		<h4>빅데이터 분석 서비스 과정</h4>
		<div class="panel panel-default">
			<div class="panel-heading">


				<c:if test="${sessionScope.loginVO==null}">
					<form id="loginfrm" class="form-inline" method="post">
						<div class="form-group">
							<label>ID</label> <input type="text" class="form-control"
								id="member_id" name="member_id">
						</div>
						<div class="form-group">
							<label for="pwd">Password:</label> <input type="password"
								class="form-control" id="member_pw" name="member_pw">
						</div>
						<button type="button" class="btn btn-default" onclick="loginFn()">로그인</button>
					</form>
				</c:if>

				<c:if test="${sessionScope.loginVO!=null}"> 
					${sessionScope.loginVO.member_name}님  방문을환영합니다
					<input type="button" value="로그아웃" onclick="logoutFn()">
				</c:if>

			</div>
			<div class="panel-body">
			<h3> JSP/Servlet Test</h3>
			</div>
			<div class="panel-footer">Tester 장경진 </div>
		</div>
	</div>
</body>
</html>