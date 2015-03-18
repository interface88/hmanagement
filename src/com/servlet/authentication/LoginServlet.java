package com.servlet.authentication;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.framework.Auth;
import com.app.master.Medicine;
import com.app.master.MedicineDAO;
import com.app.master.Staff;
import com.app.master.StaffDAO;

/**
 * Servlet implementation class medicine_master
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(Auth.isUserLogged(request)){
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("context path "
				+ getServletContext().getRealPath("/"));

		try {
			HttpSession session = request.getSession();

			// loading staff DAO
			StaffDAO staffDAO = new StaffDAO();

			// getting userId and password from request
			String userId = (String) request.getParameter("userId");
			String password = (String) request.getParameter("password");

			// getting staff object from database with userId and password
			Staff staff = staffDAO.findByUserIdAndPassword(userId, password);
			
			if (staff != null) {
				// logged successfully;
				session.setAttribute("userId", staff.getUserId());
				session.setAttribute("staffName", staff.getName());
				session.setAttribute("loginRole", staff.getLoginType().getName());
				
				request.getRequestDispatcher("home.jsp").forward(request, response);
			} else {
				// no staff found so invalid credential.
				session.setAttribute("ErrorMsg", "Invalid credential.");
				response.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
