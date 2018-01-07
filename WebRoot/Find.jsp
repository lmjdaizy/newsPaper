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
    
    <title>My JSP 'Find.jsp' starting page</title>
    
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
  table{margin-left:100px;}
  	tr{height:40px;text-align:center;}
  </style>
  <body>
  	 <h1>请选择要查询的信息：</h1><hr></hr>
    <form action="/Newspaper/FindServlet" method="post">
    	编号：<input type="text" name="num">书名：<input type="text" name="name"><br><br>
    	期刊类型：<select name="finddepart">
    		<option value="">不限</option>
			<option value="报纸">报纸</option>
			<option value="杂志">杂志</option>
			</select>
		价格：<select name="findprize">
    		<option value="">不限</option>
			<option value="100">100以下</option>
			<option value="200">100~200</option>
			<option value="300">200~300</option>
			<option value="800">300以上</option>
			</select><br><br>
    	<input type="submit" value="查询">
    </form>
    <hr></hr>
    <%HttpSession session2=request.getSession();
    	
    	List<Book> list=(List)session2.getAttribute("findlist");
    	%>
    <table border=1px width=800px cellspacing=0 >
    	<tr>
    		<th>编号</th><th>名称</th><th>刊期</th><th>年价</th><th>种类</th><th>订阅</th><th>操作</th>
    	</tr>
    	<%
    	if(list!=null){
    		for(Book b:list){%>
    			<tr>
    				<td><%=b.getNum() %></td><td><%=b.getName() %></td><td><%=b.getTime() %></td>
    				<td><%=b.getPrize() %></td><td><%=b.getDepart() %></td>
    				<td><a href="/Newspaper/BuyServlet?num=<%=b.getNum()%>&name=<%=b.getName()%>&time=<%=b.getTime() %>&prize=<%=b.getPrize() %>&depart=<%=b.getDepart() %>&buynum=<%=b.getNum() %>" onclick="return confirm('确认订阅？')">订阅</a></td>
    				<td><a href="">删除</a></td>
    			</tr>
    	<% }	} %>
    	
    </table>
  </body>
</html>
