<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 글쓰기</title>
<meta charset="utf-8">

<style>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	.nanumsquare {
	    font-family: 'NanumSquare', sans-serif !important;
}
</style>

<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function opchange(){

	var select = $("#b_state").val();
	var op;
	if(select=="전라남도"){
		op+="<option value='전지역'>전지역</option>";
		op+="<option value='나주시'>나주시</option>";
		op+="<option value='순천시'>순천시</option>";
		op+="<option value='무안군'>무안군</option>";
		$('#b_city').html(op);
	};
}

</script>
</head>
<body style="font-family: 'NanumSquare', sans-serif !important;">

	<div class="container" style="margin-top: 120px; margin-bottom: 50px;">
		<h2>게시글 작성</h2>
		<div >
			<div>		
				<form action="<c:url value='/memberBoardRegister.do'/>" method="post">
					<table style="font-family: 'NanumSquare', sans-serif !important; font-size: 2rem; margin-bottom:15px;">
					<tr>
					<td style="text-align: center;">
						<label for="exampleSelect1" class="form-label mt-4">카테고리</label>
						<select style="font-size: 1.8rem;" class="form-select" id="b_category" name="b_category">
							<option value="팁">팁</option>
							<option value="이슈">이슈</option>
							<option value="토론">토론</option>
						</select>
						</td>
						<td style="text-align : right;">
						<label for="exampleSelect1" class="form-label mt-4" >도</label>
						<select style="font-size: 1.8rem;" class="form-select" id="b_state" name="b_state" onchange ="opchange()">
							<option value="전국">전국</option>
							<option value="서욽특별시">서울특별시</option>
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
						</select>
						</td>
						<td style="text-align: right;">
						<label for="exampleSelect1" class="form-label mt-4">시</label>
						<select style="font-size: 1.8rem;" class="form-select" id="b_city" name="b_city">							
						</select>
						</td>
						</tr>
					</table>
					
					
					<div class="form-group" style="font-family: 'NanumSquare', sans-serif !important; font-size: 2rem;">
						<label>제목: </label> <input type="text" class="form-control"
							id="b_title" name="b_title">
					</div>
					<div class="form-group" style="font-family: 'NanumSquare', sans-serif !important; font-size: 2rem;">
						<label>내용:</label>
						<textarea class="form-control" rows="5" id="b_contents"
							name="b_contents"></textarea>
					</div>
					<div class="form-group" style="font-family: 'NanumSquare', sans-serif !important; font-size: 2rem;">
						<label>작성자: </label><input type="text" class="form-control"
							id="b_writer" name="b_writer" value="${sessionScope.loginVO.m_name}"
							readonly="readonly">
					</div>
					<div class="form-group" style="font-family: 'NanumSquare', sans-serif !important; font-size: 2rem;">
						<input type="text" class="form-control"
							id="b_m_idx" name="b_m_idx" value="${sessionScope.loginVO.m_idx}"
							readonly="readonly" visibility : hidden>
					</div>
					<button type="submit" class="btn btn-success" style="float:right;">글쓰기</button>

				</form>
			</div>
			
		</div>
	</div>

</body>
</html>