<%@page import="com.lmj.domain.Page"%>
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
    
    <title>My JSP 'Manger_1_1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function checkok(){
			var b=confirm("确认订阅？");
			if(b){
				request.getRequestDispatcher("/Manger_1_1.jsp").forward(request, response);
			}
		}
	</script>
  </head>
  <style type="text/css">
	table{margin-left:100px;}	
	td{line_height:50px;text-align:center;}
	p{margin-left:400px;}
	a{text-decoration: none;}
	</style>
  <body>
  	<a href="/Newspaper/Buy.jsp" style="font-size:20px;text-decoration:underline;">查看我的订阅</a>
  	<hr></hr>
    	<%HttpSession session2=request.getSession();
    	
    	List<Book> list=(List)session2.getAttribute("booklist");
    	Page p=(Page)request.getSession().getAttribute("page"); 
    	//out.print(p.getCurrentPage());
    	
    	//out.print(p.getCurrentPage());
    	%>
    <table border=1px width=800px cellspacing=0 height=1200px>
    	
    	<tr>
    		<th>编号</th><th>名称</th><th>刊期</th><th>年价</th><th>种类</th><th>订阅</th>
    	</tr>
    	<%
    	
    		for(Book b:list){%>
    			<tr>
    				<td><%=b.getNum() %></td><td><%=b.getName() %></td><td><%=b.getTime() %></td>
    				<td><%=b.getPrize() %></td><td><%=b.getDepart() %></td>
    				<td><a href="/Newspaper/BuyServlet?num=<%=b.getNum()%>&name=<%=b.getName()%>&time=<%=b.getTime() %>&prize=<%=b.getPrize() %>&depart=<%=b.getDepart() %>&buynum=<%=b.getNum() %>" onclick="return confirm('确认订阅？')">订阅</a></td>
    			</tr>
    	<% 	} %>
    	
    </table>
    <p>
    <a href="/Newspaper/PageServlet?currentpage=<%=p.getCurrentPage()==1?1:p.getCurrentPage()-1%>">上一页</a>
             第<%=p.getCurrentPage() %>页/共<%=p.getTotalPage() %>页
    <a href="/Newspaper/PageServlet?currentpage=<%=p.getCurrentPage()==p.getTotalPage()?p.getTotalPage():p.getCurrentPage()+1%>">下一页</a>
  </p>
  </body>
</html>
