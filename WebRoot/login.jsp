<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="defaultHeader.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<link rel="stylesheet" href="css/commonNew.css" />
	<link rel="stylesheet" href="css/login.css" />
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>用户名密码登录</title>
    </head>
	<body>
<div class="loginBox">
			<div class="loginForm">
				<div class="loginForm_main">
					<div class="login_title">登录</div>
					<form action="login" method="POST" class="login_form">
						<div class="nameBox">
							<input type="text" name="name" id="name" placeholder="请输入账号" />
							<span></span>
						</div>
						<div class="passWordBox">
							<input type="password" placeholder="请输入密码" id="pwd" name="pwd" />
							<span></span>
						</div>
						<button class="login" style="background-color:#0000ff";type="submit">登&nbsp;录</button>
					</form>
					<c:if test="${not empty error}">
						<p>${error}</p>
					</c:if>
				</div>
			</div>
		</div>
	</body>
	<script src="<c:url value='js/jquery-1.11.3.js'/>"></script>
	<script>
	</script>
</html>
