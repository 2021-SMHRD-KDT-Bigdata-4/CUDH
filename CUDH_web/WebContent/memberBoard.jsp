<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>          
<!DOCTYPE html>
<html lang="en">
<head>
<title>멤버 게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
 view+="<tr>";
 view+="<td>지역</td>";
 view+="<td>제목</td>";
 view+="<td>작성자</td>";
 view+="<td>조회수</td>";
 view+="</tr>";
 
 $.each(data,(b_idx,obj)=>{
    view+="<tr>";
    view+="<td id='b_idx"+b_idx+"'>"+obj.b_area+"</td>";
    view+="<td><a href='javascript:contentFn("+obj.b_idx+")'>"+obj.b_title+"</td>";
    view+="<td>"+obj.b_writer+"</td>";
    view+="<td>"+obj.b_views+"</td>";
    
    view+="<c:if test='${sessionScope.loginVO==null || sessionScope.loginVO.m_id != \'admin\'}'>";
    view+="<td><button class='btn btn-warning' onclick='delBtn("+obj.b_idx+")'disabled='disabled'>삭제</button></td>";
    view+="</c:if>";
    
    view+="<c:if test='${sessionScope.loginVO.m_id == \'admin\'}'>";
    view+="<td><button class='btn btn-warning' onclick='delBtn("+obj.b_idx+")' >삭제</button></td>";
    view+="</c:if>";
    
    view+="</tr>";
 });
 view+="<tr>";
 view+="<td colspan='5'>";
 
 view+="<c:if test='${!empty sessionScope.loginVO}'>";
 view+="<button type='button' class='btn btn-outline-secondary' onclick ='btnWrite()'>글쓰기</button>";
 view+="</c:if>";
 
 view+="</td>"
 view+="</tr>";
 view+="</table>";
 $("#msg").html(view);
}
function contentFn(b_idx) {
	location.href="<c:url value='/memberBoardContent.do'/>?b_idx="+b_idx;
}

</script>
</head>
<body>
	<div class="container">
		<h4> Test 게시판</h4>
		<div class="panel panel-default">
			<div class="panel-heading">	</div>
			<div class="panel-body">
			<div id="msg"></div>
			<button type='button' class='btn btn-outline-secondary' onclick ='btnWrite()'>글쓰기</button>							
			</div>
	</div>
</body>
</html>