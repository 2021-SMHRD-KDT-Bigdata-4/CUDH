<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>멤버 게시판</title>
<meta charset="utf-8">


<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="bootstrap.css">


<script type="text/javascript">
$(document).ready(()=>{
    list();
});
function list(){
 $.ajax({
    url : "memberBoard.do", //----------------------> AjavBoardListController ----↓
    type : "get",        //                      ↓ JSON = dic : {"idx":1, "name":"홍길동"}
    success : callBack,  //-----------------------------------------------------
    dataType : "json",
    error : function(){ alert("error");}
 });
}
function callBack(data){
 //alert(data);
 var view="<table class = 'table table-bordered'>";
 view+="<tr style='border-top: 3px solid #08614D; border-bottom: 1px solid #08614D;'>";
 view+="<td>번호</td>";
 view+="<td>지역</td>";
 view+="<td><center>제목</center></td>";
 view+="<td>작성자</td>";
 view+="<td>조회수</td>";
 view+="<td>좋아요</td>";
 view+="</tr>";
 
 $.each(data,(b_idx,obj)=>{
    view+="<tr>";
    view+="<td>"+(b_idx+1)+"</td>";
    view+="<td id='b_idx"+b_idx+"'>"+obj.b_state+'/'+obj.b_city+"</td>";
    view+="<td><a style='text-decoration:none;' href='javascript:contentFn("+obj.b_idx+","+obj.b_views+")'>"+obj.b_title+"</td>";
    view+="<td>"+obj.b_writer+"</td>";
    view+="<td>"+obj.b_views+"</td>";
    view+="<td>"+obj.b_likes+"</td>";
     
    view+="</tr>";
 });
 view+="<tr>";
 view+="<td colspan='6'>";
 
 view+="<c:if test='${!empty sessionScope.loginVO}'>";
 view+="<button type='button' style='float: right;' class='btn btn-outline-warning' onclick ='btnWrite()'>글쓰기</button>";
 view+="</c:if>";
 
 view+="</td>"
 view+="</tr>";
 view+="</table>";
 $("#msg").html(view);
}
function btnWrite(){
	location.href="<c:url value='/memberBoardWrite.do'/>"
}
function contentFn(b_idx, b_views) {
	location.href="<c:url value='/memberBoardContent.do'/>?b_idx="+b_idx+"&b_views="+b_views;
}
/* style="background-image : url('img/base1.png'); background-repeat: no-repeat; background-position: center; background-size: cover;" */
/* style="background-color:transparent" */
</script>
</head>
<body style="background-color: transparent; font-family: 'NanumSquare', sans-serif !important;">
	<div style='margin-top: 100px; margin-bottom: 50px;'>
		<center>
			<h1>게시판</h1>
		</center>
	</div>
	<div class="container">
		<div class="panel panel-default">

			<div class="panel-heading"></div>

			<div class="panel-body">
				<div id="msg"></div>
			</div>
		</div>

		<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups"  style="text-ailgn:center;">
			<div class="btn-group me-2" role="group" aria-label="First group">
				<button type="button" class="btn btn-secondary">1</button>
				<button type="button" class="btn btn-secondary">2</button>
				<button type="button" class="btn btn-secondary">3</button>
				<button type="button" class="btn btn-secondary">4</button>
			</div>
		</div>
	</div>
</body>
</html>