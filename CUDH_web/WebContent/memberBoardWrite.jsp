<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 글쓰기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	bsrc="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>메인화면</h2>
		<div >
			<div >게시판 글쓰기</div>
			<div>		
				<form action="<c:url value='/boardRegister.do'/>" method="post">
					<table>
					<tr>
					<td>
						<label for="exampleSelect1" class="form-label mt-4">카테고리</label>
						<select class="form-select" id="category">
							<option>팁</option>
							<option>이슈</option>
							<option>토론</option>
						</select>
						</td>
						<td>
						<label for="exampleSelect1" class="form-label mt-4">도</label>
						<select class="form-select" id="category">
							<option>서울특별시</option>
							<option>전라북도</option>
							<option>전라남도</option>
						</select>
						</td>
						<td>
						<label for="exampleSelect1" class="form-label mt-4">시</label>
						<select class="form-select" id="category">
							<option>목포</option>
							<option>여수</option>
							<option>고흥</option>
						</select>
						</td>
						</tr>
					</table>
					<div class="form-group">
						<label>제목: </label> <input type="text" class="form-control"
							id="title" name="title">
					</div>
					<div class="form-group">
						<label>내용:</label>
						<textarea class="form-control" rows="5" id=contents
							name="contents"></textarea>
					</div>
					<div class="form-group">
						<label>작성자: </label> <input type="text" class="form-control"
							id="writer" name="writer" value="${sessionScope.loginVO.m_id}"
							readonly="readonly">
					</div>
					<button type="submit" class="btn btn-primary">글쓰기</button>

				</form>
			</div>
			<div>빅데이터 4차(장경진)</div>
		</div>
	</div>

</body>
</html>