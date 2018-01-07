<%@page import="com.lmj.domain.Take"%>
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
    
    <title>My JSP 'Total.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>
  	function Print() {
   window.print();
} 
  </script>
      <style>
    table{margin-left:150px;}
  	tr{height:40px;text-align:center;}
  </style>
  <body>
   <h1>统计表</h1><hr></hr>
  <form action="/Newspaper/TotalServlet" method="post">
   统计：<select name="total">
    		<option value="news">按报刊号统计</option>
			<option value="uno">按工号统计</option>
			<option value="depart">按部门统计</option>
		</select>
		<input type="text" name="txt"><br><br>
		<input type="submit" value="预览">   <input type="button" value="打印" id="but1" onclick="Print()">
	</form>
	    <hr></hr><br>
    <%HttpSession session2=request.getSession();
    	
    	List<Take> list2=(List)session2.getAttribute("totallist");
    	%>
    <table border=1px width=800px cellspacing=0 >
    	<tr>
    		<th>工号</th><th>姓名</th><th>部门</th><th>编号</th><th>刊期名</th><th>刊期</th>
    	</tr>
    	<%
    	if(list2!=null){
    		for(Take t:list2){%>
    			<tr>
     			<td><%=t.getUno() %></td><td><%=t.getUname()%></td><td><%=t.getUdepart() %></td>
     			<td><%=t.getNum()%></td><td><%=t.getName()%></td><td><%=t.getTime()%></td>
     			
     			</tr>
    	<% }	} %>
    	
    </table>
  </body>
</html>
