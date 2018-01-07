<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Manger_1.jsp' starting page</title>
    
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
	*{margin: 0;padding: 0;}
	a{text-decoration: none;}
	ul{width:200px;border: 1px solid gainsboro;}
	li{width: 200px;height: 50px;line-height: 50px;border: 1px solid gainsboro;list-style: none;
	text-align: center;color:black;}
	li:hover{background:black;color:white;font-weight: bold;}
	</style>
	<body>
		<ul>
			<a href="/Newspaper/PageServlet" target="Manger_2"><li>订阅报刊</li></a>
			<a href="/Newspaper/Change.jsp" target="Manger_2"><li>录入报刊</li></a>
			<a href="/Newspaper/AddPeo.jsp" target="Manger_2"><li>录入订阅人员信息</li></a>
			<a href="/Newspaper/Find.jsp" target="Manger_2"><li>查询报刊</li></a>
			<a href="/Newspaper/FindPeo.jsp"  target="Manger_2"><li>查询订阅人员信息</li></a>
			<a href="/Newspaper/Total.jsp" target="Manger_2"><li>统计</li></a>
		</ul>
	</body>
</html>
