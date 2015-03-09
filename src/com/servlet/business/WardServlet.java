package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.master.Ward;
import com.app.master.WardDAO;

/**
 * Servlet implementation class ward_master
 */
public class WardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public WardServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Ward> wardlist= new ArrayList<Ward>();
		
		// ---------- database fetch -----------
		WardDAO wardDAO = new WardDAO();
		wardlist = wardDAO.getList();
		
		request.setAttribute("wardlist", wardlist);
		request.getRequestDispatcher("/pages/master/ward.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		WardDAO wardDAO = new WardDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			Ward ward = new Ward();
			
			String code = request.getParameter("code").trim();
			String name = request.getParameter("name").trim();
			
			ward.setCode(code);
			ward.setName(name);
			
			wardDAO.add(ward);
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("ddlward").trim());
			Ward ward = wardDAO.findById(id);
			if(ward != null){
				wardDAO.delete(ward);
			}
		}
		
		// ------ getting ward list ---------------
		List<Ward> wardlist= new ArrayList<Ward>();
		wardlist = wardDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("wardlist", wardlist);
		request.getRequestDispatcher("/pages/master/ward.jsp").forward(request, response);
		
	}

}
