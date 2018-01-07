<%@page import="java.util.*"%>
<%@page import="com.lmj.domain.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Buy.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 	  <%
    	HttpSession session2=request.getSession();    	
    	Map<String,Book> map=new HashMap<String,Book>();
    	map=(Map)session2.getAttribute("cart");
    	User user=new User();
    	user=(User)session2.getAttribute("user");
    	double p=0.0;
     %>

  </head>
  	<style type="text/css">
		.txt1{width:30px;text-align: center;}
		td{height:40px;text-align:center;}
	</style>
	<script type="text/javascript">
			var keys = 0;
			var price = 0;
			var price2 = 0;
			var count =0;
			var count1 = 0;
			window.onload=function(){
			var aBut1=document.getElementsByClassName("but1");
			var aBut2=document.getElementsByClassName("but2");
			var aTxt=document.getElementsByClassName("txt1");
			var price1 = document.getElementById("price1");
			//mon
			var mon=document.getElementsByClassName("mon");
			var money = document.getElementById("money");
			for(var i =0; i < mon.length;i++){
				money.value = parseInt(money.value)+parseInt(mon[i].innerHTML);
			}
			for(var i =0;i<aTxt.length;i++){
				aBut1[i].onclick=function(){
					
					if(this.nextElementSibling.value!=1){
						if(this.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.value==this.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.value){
						 price= this.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.value;
						 	key = ++this.nextElementSibling.value;
						count = this.parentNode.previousElementSibling.previousElementSibling.innerHTML = price * key;
						money.value = parseInt(money.value)- parseInt(price);
					}

					}
				
				}
				aBut2[i].onclick=function(){
					if(this.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.value==this.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.value){
						 price= this.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.value;
						 	key = ++this.previousElementSibling.value;
						//alert(price);
						count = this.parentNode.previousElementSibling.previousElementSibling.innerHTML = price * key;
						money.value = parseInt(money.value)+ parseInt(price);
					}

				
			}
			
		}
		}
		
		
		function money(){
				var aPrize=document.getElementsByClassName("prize").innerHTML;
				var aTxt=document.getElementsByClassName("txt1");
				var money=document.getElementById("money");
				var sum=0;
			//	alert(aPrize[0].innerHTML);
				alert(aPrize[0]+" "+aTxt[0]);
//				var i=0;
//				for(i=0;i<aPrize.length;i++){
//					
//					//sum+=aPrize[i]*aTxt[i];
//				}
//				money.value=sum;
			} 
	</script>
  <body>
  
   	<h2> 你订阅的书刊有：</h2> <a href="/Newspaper/Manger_1_1.jsp">返回订阅</a><hr></hr>
  
   	 <table border=1px width=800px cellspacing=0 >
     	<tr>
     		<th>编号</th><th>期刊名</th><th>刊期</th><th>年价</th><th>种类</th><th>数量</th><th>是否删除</th>
     	</tr>
   	<%for(Book b:map.values()){
     		//out.print(b.getBuynum());
     	%> 
     	<tr>
     		<td><%=b.getNum() %></td><td><%=b.getName()%></td><td><%=b.getTime() %></td>
     		<input type="hidden" value="<%=b.getPrize()%>"/>
     		<input type="hidden" value="<%=b.getPrize()%>"/>
     		<td class="mon"><%=b.getPrize()%></td><td><%=b.getDepart()%></td>
     		<td>
	     		<input type="button" value="-" onclick="num2()" class="but1">
				<input type="text" value="1" class="txt1"/>
				<input type="button" value="+" onclick="num1()" class="but2"/>
			</td>
     		<td><a href="/Newspaper/DelServlet?num=<%=b.getNum()%>">删除</a></td>
     	</tr>
     	<%} %>
     </table><br><br>
      	<%for(Book b:map.values()){
     	
     		List<String> list=new ArrayList<String>();
     		list.add(b.getPrize());
     		
     } %>
     	总金额为：<input type="text" id="money" value="0"><input type="button" id="but1" value="计算总金额" onclick="money()"><br><br>
     	<form action="" method="post">
     		<input type="submit" value="提交订单"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     		<a href="/Newspaper/CleanServlet" onclick="return confirm('是否清空你的订阅？')">清空订阅</a>
     	</form>
  </body>
</html>
