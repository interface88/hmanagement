package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.master.Department;
import com.app.master.DepartmentDAO;
import com.app.master.Service;
import com.app.master.ServiceDAO;

import myclasses.doctor;

import common.commonmethods;
import common.dbconnection;

/**
 * Servlet implementation class doctor_master
 */
public class ServiceServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		// ---------- service list -----------
		List<Service> serviceList= new ArrayList<Service>();
		ServiceDAO serviceDAO = new ServiceDAO();
		serviceList = serviceDAO.getList();
		
		
		// ---------- database fetch -----------
		List<Department> departmentList= new ArrayList<Department>();
		DepartmentDAO departmentDAO = new DepartmentDAO();
		departmentList = departmentDAO.getList();
		
		request.setAttribute("serviceList", serviceList);
		request.setAttribute("departmentList", departmentList);
		request.getRequestDispatcher("/pages/master/services.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
