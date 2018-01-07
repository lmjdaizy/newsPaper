<%@page import="com.lmj.domain.Take"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'FindPeo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
    <style>
    table{margin-left:150px;}
  	tr{height:40px;text-align:center;}
  </style>
  <body>
    <h1>请选择要查询的信息：</h1><hr></hr>
    <form action="/Newspaper/FindPeoServlet" method="post">
    员工号：<input type="text" name="uno"><br><br>
    期刊号：<input type="text" name="num"><br><br>
  部门号：<input type="text" name="udepart"><br><br>
  <input type="submit" value="查询">
  </form><hr></hr>
   <%	HttpSession session2=request.getSession();
    	
    	List<Take> list=(List)session2.getAttribute("findpeolist");
    	%>
    <table border=1px width=800px cellspacing=0 >
    	<tr>
    		<th>工号</th><th>姓名</th><th>部门</th><th>编号</th><th>刊期名</th><th>刊期</th><th>操作</th>
    	</tr>
    	<%
    	
    	if(list!=null){
    		for(Take t:list){%>
    			<tr>
     			<td><%=t.getUno() %></td><td><%=t.getUname()%></td><td><%=t.getUdepart() %></td>
     			<td><%=t.getNum()%></td><td><%=t.getName()%></td><td><%=t.getTime()%></td>
     			<td><a href="">删除</a></td>
     		</tr>
    	<% }	} %>
    	
    </table>
  </body>
</html>
