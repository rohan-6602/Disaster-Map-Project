package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.ConnectionProvider;
import com.dao.*;
import com.entities.*;


/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
//			out.println("<!DOCTYPE html>");
//			out.println("<html>");
//			out.println("<head>");
//			out.println("<title>Registration Servlet</title>");
//			out.println("</head>");
//			out.println("<body>");
				String check= request.getParameter("check");
//				out.println(check);
				if(check==null)
				{
					out.println("Please Agree to our terms and Conditions");
				}else
				{
					String name= request.getParameter("user_name");
					String email= request.getParameter("user_email");
					String password = request.getParameter("user_password");
					String gender= request.getParameter("gender");
					String about =request.getParameter("about");
//					create user object and set all data to that object
					
					User user= new User(name,email,password,gender,about);
					
//					create a User DAO object
					UserDao dao= new UserDao(ConnectionProvider.getConnection());
					if(dao.insertUser(user)) {
//						save...
						out.println("Done");
					
					  }else {
						  out.println("error");
					  }
					}
				
				
			
			
//			out.println("</body>");
//			out.println("</html>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
