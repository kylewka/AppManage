<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户名密码错误</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <span>用户名密码错误，3秒钟后自动转到登录页面，若页面无法跳转<a href="javascript:history.back(-1)">点击此处返回上一页</a></span>
    <script type="text/javascript">setTimeout("history.go(-1)", 3000);  </script>
    <SCRIPT language=javascript>
    function go()
     {
       window.history.go(-1);
     }
    setTimeout("go()",3000);
</SCRIPT>

  </body>
</html>
