package myservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myclasses.staff;

import common.dbconnection;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private dbconnection db=null;

	public login() {
		super();
		db=new dbconnection();
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{

			db.open();
			System.out.println("context path "+getServletContext().getRealPath("/"));
			HttpSession session=request.getSession();
			String userId=(String)request.getParameter("userId");
			String password=(String)request.getParameter("password");	
			String errorMsg="";	
			if(db.isUserExists(userId))
			{	
				staff stf=db.login(userId, password);
				if(stf.getUsername()!=null)
				{
					session.setAttribute("staff",stf);
					session.setAttribute("userId",userId);
					session.setAttribute("password",password);
					session.setAttribute("name",stf.getUsername());

					request.getRequestDispatcher("Home.jsp").forward(request, response);
					//response.sendRedirect("Home.jsp");
				}else
				{
					errorMsg="Invalid credential.";
				}
			}else
			{
				errorMsg="User does not exists.";
			}
			db.close();
			if(!errorMsg.equals(""))
			{
				session.setAttribute("ErrorMsg", errorMsg);
				response.sendRedirect("index.jsp");
			}

		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
