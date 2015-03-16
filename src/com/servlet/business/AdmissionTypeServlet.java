package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.master.AdmissionType;
import com.app.master.AdmissionTypeDAO;

/**
 * Servlet implementation class admissionType_master
 */
public class AdmissionTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmissionTypeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<AdmissionType> admissionTypelist= new ArrayList<AdmissionType>();
		
		// ---------- database fetch -----------
		AdmissionTypeDAO admissionTypeDAO = new AdmissionTypeDAO();
		admissionTypelist = admissionTypeDAO.getList();
		
		request.setAttribute("admissionTypelist", admissionTypelist);
		
		if(request.getParameter("report") != null)
		{
			request.getRequestDispatcher("/pages/master/admissionTypeReport.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("/pages/master/admissionType.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		AdmissionTypeDAO admissionTypeDAO = new AdmissionTypeDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			AdmissionType admissionType = new AdmissionType();
			
			String code = request.getParameter("code").trim();
			String name = request.getParameter("name").trim();
			
			admissionType.setCode(code);
			admissionType.setName(name);
			
			admissionTypeDAO.add(admissionType);
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("ddladmissionType").trim());
			AdmissionType admissionType = admissionTypeDAO.findById(id);
			if(admissionType != null){
				admissionTypeDAO.delete(admissionType);
			}
		}
		
		// ------ getting admissionType list ---------------
		List<AdmissionType> admissionTypelist= new ArrayList<AdmissionType>();
		admissionTypelist = admissionTypeDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("admissionTypelist", admissionTypelist);
		request.getRequestDispatcher("/pages/master/admissionType.jsp").forward(request, response);
		
	}

}
