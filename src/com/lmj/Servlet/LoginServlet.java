package com.lmj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lmj.UserService.UserService;
import com.lmj.domain.User;

public class LoginServlet extends HttpServlet {

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
		String uno=request.getParameter("uno");
		String password=request.getParameter("password");
	//	System.out.println(uno);
		User user=new User();
		user.setUno(uno);
		user.setPassword(password);
		UserService userService=new UserService();
		try {
			boolean b=userService.checkLogin(user);
			if(b==true){
				request.getSession().setAttribute("uno", uno);
				request.getRequestDispatcher("/Manger.jsp").forward(request, response);
			}else {
				request.setAttribute("login_msg", "用户名或密码错误");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
