package com.lmj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lmj.domain.Book;
import com.lmj.util.MyTool;



public class BuyServlet extends HttpServlet {
	Map<String, Book> map=new HashMap<String, Book>();
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset:utf-8");
		  request.setCharacterEncoding("utf-8"); 
		  response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		response.setHeader("Pragma","No-cache"); 
		response.setHeader("Cache-Control","no-cache"); 
		response.setDateHeader("Expires", 0);
		
		String num=MyTool.getString(request.getParameter("num"));
		String name=MyTool.getString(request.getParameter("name"));
		String time=MyTool.getString(request.getParameter("time"));
		String prize=MyTool.getString(request.getParameter("prize"));
		String depart=MyTool.getString(request.getParameter("depart"));
	//	int buyNum=Integer.parseInt(request.getParameter("buynum"));
		
		Book book=new Book();
		book.setNum(num);
		book.setName(name);
		book.setTime(time);
		book.setPrize(prize);
		book.setDepart(depart);
		
		boolean a=map.containsKey(num);
		System.out.println(a);
		if(map.containsKey(num)){
//			buyNum=book.getBuynum();
//			System.out.println(buyNum+"!!!!");
//			buyNum++;
//			book.setBuynum(buyNum);
			System.out.println(book.getBuynum());
		}else{
			book.setBuynum(1);
			System.out.println(book.getBuynum());
		}
		map.put(book.getNum(), book);
		HttpSession session=request.getSession();
		session.setAttribute("cart", map);
		//System.out.println(name);
		request.getRequestDispatcher("/Buy.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
