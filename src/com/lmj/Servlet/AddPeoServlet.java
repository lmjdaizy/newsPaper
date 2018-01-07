package com.lmj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lmj.UserService.UserService;
import com.lmj.util.MyTool;

public class AddPeoServlet extends HttpServlet {

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
		
		UserService userService=new UserService();
		try {
			List list=userService.AddPeo(uno,num);
			//System.out.println(list.size());
			HttpSession session = request.getSession();
			session.setAttribute("takelist", list);
			request.getRequestDispatcher("/AddPeo.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getSession().setAttribute("addpeoerr", "Â¼ÈëÊ§°Ü");
		}
		

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
