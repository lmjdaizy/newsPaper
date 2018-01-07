<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Change.jsp' starting page</title>
    
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
    <h2>请输入你要录入的报刊信息：</h2>

    <hr></hr>
    <form action="/Newspaper/AddServlet" method="post">
    	编号：<input type="text" name="num1"><br><br>
    	刊名：<input type="text" name="name1"><br><br>
    	刊期：<select name="time">
    			<option value="week">周刊</option>
				<option value="mouth">月刊</option>
				<option value="other">其他</option>
			</select><br><br>
    	价格：<input type="text" name="prize1"><br><br>
    	种类：<select name="depart">
				<option value="news">报纸</option>
				<option value="magin">杂志</option>
				<option value="other">其他</option>
			</select><br><br>
		<input type="submit" value="提交">
	</form>
	
  </body>
</html>
