package com.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.entities.Message;
import com.entities.User;
import com.helper.ConnectionProvider;
import com.helper.ImageHelper;

/**
 * Servlet implementation class ProfileEditServlet
 */
@WebServlet("/ProfileEditServlet")
@MultipartConfig
public class ProfileEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileEditServlet() {
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
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Profile Edit Servlet</title>");
			out.println("</head>");
			out.println("<body>");

//			fetch all data

			String userEmail = request.getParameter("user_email");
			String userName = request.getParameter("user_name");
			String userPassword = request.getParameter("user_password");
			String userAbout = request.getParameter("user_about");

			Part part = request.getPart("profile-img");
			String imageName = part.getSubmittedFileName();

//			get user from session
			HttpSession s = request.getSession();
			User user = (User) s.getAttribute("currentUser");
			user.setEmail(userEmail);
			user.setName(userName);
			user.setPassword(userPassword);
			user.setAbout(userAbout);
			user.setProfile(imageName);

//			update in database
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			boolean ans = userDao.UpdateUser(user);
			if (ans) {

				String path = getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
				ImageHelper.deleteFile(path);

				if (ImageHelper.saveFile(part.getInputStream(), path)) {
					out.println("Profile Updated ");
					Message msg = new Message("Profile Details Updated", "success", "alert-success");
					s.setAttribute("msg", msg);

				} else {
					Message msg = new Message("Somethingwent Wrong", "error", "alert-danger");
					s.setAttribute("msg", msg);
				}

			} else {
				out.println("not updated");
				Message msg = new Message("Somethingwent Wrong", "error", "alert-danger");
				s.setAttribute("msg", msg);

			}

			response.sendRedirect("profile.jsp");

			out.println("</body>");
			out.println("</html>");
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
