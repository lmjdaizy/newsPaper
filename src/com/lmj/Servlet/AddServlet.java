package com.lmj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lmj.UserService.UserService;
import com.lmj.domain.Book;
import com.lmj.util.MyTool;

public class AddServlet extends HttpServlet {

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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8"); 
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String num=MyTool.getString(request.getParameter("num1"));
		String name=MyTool.getString(request.getParameter("name1"));
		String time=MyTool.getString(request.getParameter("time"));
		String prize=MyTool.getString(request.getParameter("prize1"));
		String depart=MyTool.getString(request.getParameter("depart"));
		System.out.println(name);
		if(time.equals("week")){
			time="周刊";
		}else if(time.equals("mouth")){
			time="月刊";
		}else if(time.equals("other")){
			time="其他";
		}
		if(depart.equals("news")){
			depart="报纸";
		}else if(depart.equals("magin")){
			depart ="杂志";
		}else if(depart.equals("other")){
			depart ="其他";
		}
		//System.out.println(num+name+time+prize+depart);
		Book book=new Book();
		book.setNum(num);
		book.setName(name);
		book.setTime(time);
		book.setPrize(prize);
		book.setDepart(depart);
		
		UserService userService=new UserService();
		try {
			userService.addNews(book);
			request.getSession().setAttribute("addresult", book);
			request.getRequestDispatcher("/AddResult.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			request.getRequestDispatcher("/Err.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
