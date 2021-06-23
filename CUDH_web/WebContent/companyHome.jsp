<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no" />
<title>CUDH</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<script type="text/javascript">
function loginFn(){
	location.href="/CUDH_web/loginForm.jsp";
}  
</script>
</head>
<body>
	<div class="header">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="boardCompany.jsp">CUDH</a>
				<div class="collapse navbar-collapse" id="navbarColor03">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link" href="#TITLES">About</a></li>
						<li class="nav-item"><a class="nav-link" href="#SERVICE">Service</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#CONTACT">Contact</a></li>
					</ul>
					<form class="d-flex">
						<button type="button" class="btn btn-outline-success" onclick="loginFn()">로그인</button>
					</form>
				</div>
			</div>
		</nav>
	</div>
		<div class="About" id="ABOUT">
		<div class="Main__background">

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