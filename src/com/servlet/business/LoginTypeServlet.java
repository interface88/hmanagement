package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.master.LoginType;
import com.app.master.LoginTypeDAO;

/**
 * Servlet implementation class loginType_master
 */
public class LoginTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginTypeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<LoginType> loginTypelist= new ArrayList<LoginType>();
		
		// ---------- database fetch -----------
		LoginTypeDAO loginTypeDAO = new LoginTypeDAO();
		loginTypelist = loginTypeDAO.getList();
		
		request.setAttribute("loginTypelist", loginTypelist);
		request.getRequestDispatcher("/pages/master/loginType.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		LoginTypeDAO loginTypeDAO = new LoginTypeDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			LoginType loginType = new LoginType();
			
			String code = request.getParameter("code").trim();
			String name = request.getParameter("name").trim();
			
			loginType.setCode(code);
			loginType.setName(name);
			
			loginTypeDAO.add(loginType);
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("ddlloginType").trim());
			LoginType loginType = loginTypeDAO.findById(id);
			if(loginType != null){
				loginTypeDAO.delete(loginType);
			}
		}
		
		// ------ getting loginType list ---------------
		List<LoginType> loginTypelist= new ArrayList<LoginType>();
		loginTypelist = loginTypeDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("loginTypelist", loginTypelist);
		request.getRequestDispatcher("/pages/master/loginType.jsp").forward(request, response);
		
	}

}
