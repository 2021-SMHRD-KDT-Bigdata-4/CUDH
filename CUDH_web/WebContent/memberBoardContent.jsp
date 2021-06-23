<%@page import="model.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function deleteFn(b_idx) {
if (confirm("정말로 삭제 하시겠습니까?") == true) {
		location.href="<c:url value='/memberBoardDelete.do'/>?b_idx="+b_idx;
	} else {
		return false;
	}
}
function list(){
	location.href="/CUDH_web/memberBoard.jsp"
}

</script>
</head>
<body>
  <div class="container">
  <div class="panel panel-default">
    <div class="panel-heading"></div>
    <div class="panel-body">
		 <form id="ufrm" class="form-horizontal" action="<c:url value='/memberBoardUpdate.do'/>" method="post">
		  <div class="form-group">
		    <label class="control-label col-sm-2">번호:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="b_idx" id="b_idx" readonly="readonly" value="${vo.getB_idx()}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2">제목:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="b_title" id="b_title" value="${vo.getB_title()}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2">내용:</label>
		    <div class="col-sm-10">
		      <textarea rows="8" cols="60" class="form-control" name="b_contents" id="b_contents">${vo.getB_contents()}</textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2">작성자:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" readonly="readonly" id="b_writer" value="${vo.getB_writer()}">
		    </div>
		  </div>		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		    
		    <c:if test="${sessionScope.loginVO.m_id =='admin'|| sessionScope.loginVO.m_idx ==vo.getB_m_idx()}">
		      <<button type="submit" class="btn btn-primary btn-sm">수정</button>
		    </c:if>
		    
		    <c:if test="${sessionScope.loginVO.m_id =='admin'|| sessionScope.loginVO.m_idx ==vo.getB_m_idx()}">
		    
		      <button type="button" class="btn btn-primary btn-sm" onclick="deleteFn(${vo.b_idx})">삭제</button>
		    </c:if>

		      <button type="button" class="btn btn-success btn-sm" onclick="list()">
		       <span class="glyphicon glyphicon-remove"></span>목록</button>
		    </div>
		  </div>
		</form>
    </div>
  </div>
</div>
</body>
</html>