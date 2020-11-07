<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="defaultHeader.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<link rel="stylesheet" href="css/commonNew.css" />
	<link rel="stylesheet" href="css/home.css" />
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Download系统工具</title>
    </head>
	<body>
	    
		<div class="home_top">
		<span style="font-size:30px;margin-left:25px;color:white">Download系统工具</span> 
		<div class="right homeControl">
				<span class="left" id = 'username' value = "${sessionScope.user.name}">
					
				</span>
			</div>
			<ul class="right">
				<li id="1" data-href="user_list.jsp"><i class="menuL1_icon2"><img src="images/menuL1_icon2.png"/></i><span>用户管理</span></li>
				<li id="2" data-href="goods_list.jsp"><i class="menuL1_icon1"><img src="images/menuL1_icon1.png"/></i><span>文件下载</span></li>
							
				<li id="3" data-href="login.jsp"><i class="menuL1_icon3"><img src="images/menuL1_icon3.png"/></i><span>退出</span></li>
				
			</ul>
		</div>
		<div class="home_top_border"></div>
		<div class="home_content">
			<div class="floodLoading none"></div> 
			<div>
				<iframe id="secondPage" frameborder=0 height="100%" width="100%"></iframe>
			</div>
		</div>
	</body>
	<script src="js/jquery-1.11.3.js"></script>
	
    <script src="js/layui/layui.all.js"></script>
    <script src="js/plugin.js"></script>
	<script>
		var username = "${sessionScope.user.name}"; 
		if(username.length > 1){
			username = username.substr(username.length-2,2);
			$("#username").text(username);
		}else{
			$("#username").text(username);
			console.log(username);
		}
		$(".home_top>ul>li:last-child").click(function(){
			var href=$(this).attr("data-href");
			$(window).attr("location",href);
		});
		
		$(".home_top>ul>li").click(function(){
			$(this).addClass("active").siblings().removeClass("active");
			var href=$(this).attr("data-href");
			$("#secondPage").attr("src",href);
		});

		$(".home_top>ul>li:first-child").trigger("click");
		var floodResult="";
		var waterType="";
		var rainType=1;
	</script>
</html>
