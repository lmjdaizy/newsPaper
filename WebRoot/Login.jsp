<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style type="text/css">
  body{background:url(img/bk.jpg);}
  
		#div1{width:500px;height:400px;border: 1px solid gainsboro;background-color: white;
		margin-left: 800px;margin-top: 100px;filter: alpha(opacity=90);opacity: 0.9;border:1px soild #cacaca;border-radius:15px;}
		form{margin-left:120px;margin-top:50px;}
		#sub1{margin-left:70px;width:100px;height:40px;}
	</style>
  <body>
    <div id="div1">
			<h1>用户登录</h1>
			<hr></hr>
			<form action="/Newspaper/LoginServlet" method="post">
			用户名:<input type="text" name="uno"  /><br><br><br>
			密&nbsp;&nbsp;码:<input type="password" name="password" /><br><br><br>
			<%
   		 	if(request.getAttribute("login_msg")!=null){
   		 		out.print(request.getAttribute("login_msg")); 
   		 	}%></br>
			<input type="submit"  value="登录" id="sub1"/> 
			
			</form>
		</div>
  </body>
</html>
