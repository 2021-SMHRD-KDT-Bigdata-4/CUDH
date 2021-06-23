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
<script type="text/javascript">

</script>
<body>

	<div class="container">
		<h2>메인화면</h2>
		<div >
			<div >게시판 글쓰기</div>
			<div>		
				<form action="<c:url value='/memberBoardRegister.do'/>" method="post">
					<table>
					<tr>
					<td>
						<label for="exampleSelect1" class="form-label mt-4">카테고리</label>
						<select class="form-select" id="b_category" name="b_category">
							<option value="팁">팁</option>
							<option value="이슈">이슈</option>
							<option value="토론">토론</option>
						</select>
						</td>
						<td>
						<label for="exampleSelect1" class="form-label mt-4">도</label>
						<select class="form-select" id="b_state" name="b_state">
							<option value="전국">전국</option>
							<option value="서욽특별시">서울특별시</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
						</select>
						</td>
						<td>
						<label for="exampleSelect1" class="form-label mt-4">시</label>
						<select class="form-select" id="b_city" name="b_city">
							<option value="전국">전국</option>
							<option value="목표">목포</option>
							<option value="여수">여수</option>
							<option value="고흥">고흥</option>
						</select>
						</td>
						</tr>
					</table>
					<div class="form-group">
						<label>제목: </label> <input type="text" class="form-control"
							id="b_title" name="b_title">
					</div>
					<div class="form-group">
						<label>내용:</label>
						<textarea class="form-control" rows="5" id="b_contents"
							name="b_contents"></textarea>
					</div>
					<div class="form-group">
						<label>작성자: </label><input type="text" class="form-control"
							id="b_writer" name="b_writer" value="${sessionScope.loginVO.m_name}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<input type="text" class="form-control"
							id="b_m_idx" name="b_m_idx" value="${sessionScope.loginVO.m_idx}"
							readonly="readonly" visibility : hidden>
					</div>
					<button type="submit" class="btn btn-success">글쓰기</button>

				</form>
			</div>
			<div>빅데이터 4차(장경진)</div>
		</div>
	</div>

</body>
</html>