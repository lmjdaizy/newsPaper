package com.lmj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lmj.UserService.UserService;
import com.lmj.domain.Take;
import com.lmj.util.MyTool;

public class DelTwoServlet extends HttpServlet {

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
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8"); 
		response.setCharacterEncoding("UTF-8");
		
		String uno=MyTool.getString(request.getParameter("uno"));
		String num=MyTool.getString(request.getParameter("num"));
		
		HttpSession session=request.getSession();    	
		HttpSession session2=request.getSession();    	
    	List<Take> list=new ArrayList<Take>();
    	list=(List)session2.getAttribute("takelist");
    	UserService userService=new UserService();
    	try {
			List list2=userService.DelAdd(uno,num);
			session.setAttribute("takelist", list2);
			request.getRequestDispatcher("/AddPeo.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
