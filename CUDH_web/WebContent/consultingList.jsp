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
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">계약 상세보기</div>
		<div class="panel-body">

			<form id="ufrm" class="form-horizontal" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">회원 아이디:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="idx" id="cidx"
							readonly="readonly">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2">전문가 아이디:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="title" id="ctitle">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2">내용:</label>
					<div class="col-sm-10">
						<textarea rows="8" cols="60" class="form-control" name="contents"
							id="ccontents"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2">작성자:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cwriter"
							readonly="readonly">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<c:if test="${ !empty sessionScope.userVO}">
							<button type="button" class="btn btn-primary btn-sm" onclick="updateFn()">수정</button>
						</c:if>
						<button type="reset" class="btn btn-warning btn-sm" onclick ="contentFn1()">취소</button>
						<button type="button" class="btn btn-success btn-sm" onclick="closeFn()">
							<span class="glyphicon glyphicon-remove"></span>닫기
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>