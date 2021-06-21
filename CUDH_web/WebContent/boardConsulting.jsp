<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no" />
<title>CUDH 컨설팅 페이지</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css">

<script type="text/javascript">

$(document).ready(()=>{ 
	cardList(); 
}); 
	
function cardList(){
	$.ajax({
	   url : "cardlist.do", 
	   type : "get",       
	   success : callBack, 
	   dataType : "json",
	   error : function(){ alert("error");}
	}); 
}	

function callBack(data){
	var view = "";
	view +=" ";
	$.each(data, (index,obj)=>{
	});
	$("# 붙일 곳").html(view);
}






</script>


</head>
<body>
	
	<div class="Contact" id="CONTACT">
		<div class="" >
		
		</div>	
	
	
	</div>

</body>
</html>