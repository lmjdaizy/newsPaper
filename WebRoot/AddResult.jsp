<%@page import="com.lmj.domain.Book"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddResult.jsp' starting page</title>
    
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
   	<%
   	Book b=(Book)request.getSession().getAttribute("addresult");
   
   	//out.print(b.getDepart());
    	%>
    	<a href="/Newspaper/Change.jsp">返回继续录入</a><br><hr></hr>
    <table border=1px width=800px cellspacing=0 >
    	<tr>
    		<th>编号</th><th>名称</th><th>刊期</th><th>年价</th><th>种类</th><th>操作</th>
    	</tr>
    	<% 	if(b!=null){%>
    	<tr>
    		<td><%=b.getNum() %></td><td><%=b.getName() %></td><td><%=b.getTime() %></td>
    		<td><%=b.getPrize() %></td><td><%=b.getDepart() %></td>
    		<td><a href="/Newspaper/DelPeoServlet?num=<%=b.getNum() %>" onclick="return confirm('确认删除？')">删除</a></td>
    	</tr>	
    	<%} %>
    </table>
  </body>
</html>
