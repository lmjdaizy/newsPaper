package com.lmj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lmj.UserService.UserService;
import com.lmj.domain.Page;

public class PageServlet extends HttpServlet {

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
		Page page=new Page();
		UserService userService=new UserService();
		int pageSize=30;
		int currentPage;
//		System.out.println();
		if(request.getParameter("currentpage")==null){
			currentPage=1;
		}else {
			
			currentPage=Integer.parseInt(request.getParameter("currentpage"));
			//System.out.println(currentPage);
		}
		int totalClass = 0;
		try {
			totalClass = userService.count();
			//System.out.println(totalClass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int totalPage=(int) Math.ceil(totalClass*1.0/pageSize);
		
		page.setPageSize(pageSize);
		page.setCurrentPage(currentPage);
		page.setTotalClass(totalClass);
		page.setTotalPage(totalPage);
		request.getSession().setAttribute("page", page);
		request.getRequestDispatcher("/BookServlet").forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
