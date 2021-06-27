
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CUDH</title>
<script type="text/javascript">
function loginFn() {
	var m_id = $("#m_id").val();
	var m_pw = $("#m_pw").val();
	$.ajax({
		url : "loginCheck.do",
		type : "post",
		data : {
			"m_id" : m_id,
			"m_pw" : m_pw
		},
		success : function(data) {
			if (data == "NO") {
				alert("회원인증 실패");
			} else {
				//location.href="/CUDH_web/memberBoard.jsp"
				location.href="/CUDH_web/tabHome.jsp"
			}
		},
		error : function() {
			alert("error");
		}

	});
}
function show(){
	//location.href="/CUDH_web/loginForm.jsp";
	$("#login_bt").css("display","none");
	$("#login_form").css("display","block");
}  
</script>
</head>
<body>
	<div class="header">
	
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="companyHome.jsp">CUDH</a>
				<div class="collapse navbar-collapse" id="navbarColor03">
				
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link" href="#TITLES">About</a></li>
						<li class="nav-item"><a class="nav-link" href="#SERVICE">Service</a></li>
						<li class="nav-item"><a class="nav-link" href="#CONTACT">Contact</a></li>
					</ul>
					
					<form class="d-flex">
					<div id="login_form" style="display : none">
										
					
						<div class="form-group" style="display: inline-block;">
							<input type="text" class="nav-item" id="m_id" name="m_id" placeholder="ID">
						</div>
						
						<div class="nav-item" style="display: inline-block;">
							 <input type="password" class="nav-item" id="m_pw" name="m_pw" placeholder="PW">
						</div>
						<button type="button" class="btn btn-outline-success" onclick="loginFn()">로그인</button>
										
					</div>
					<div id="login_bt" class="login_bt" name="login_bt">
						<button type="button" class="btn btn-outline-success" onclick="show()">로그인</button>
					</div>
					</form>
					
				</div>
			</div>
		</nav>
		
	</div>
		<div class="About" id="ABOUT">
		<div class="Main__background" >

			<div id="TITLES">
				<span class="subTitle">첨단농업의 시작<br></span> <span
					class="mainTitle">정보기술을 기반으로 농업을 재해석 하며<br>농업의 지속 가능한
					발전을 추구합니다.
				</span>
			</div>


		</div>
	</div>

	<div class="Service" id="SERVICE">
	
	</div>
	
	
	<div class="Contact" id="CONTACT">
	
	</div>
	
</body>

</html>