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
import com.app.master.Department;
import com.app.master.DepartmentDAO;
import com.app.master.DoctorDAO;
import com.app.master.MedicineDAO;
import com.app.master.ModuleDAO;
import com.app.master.Service;
import com.app.master.ServiceDAO;
import com.app.master.StaffDAO;
import com.app.master.TestDAO;
import com.app.master.WardDAO;

/**
 * Servlet implementation class admissionType_master
 */
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reportName = request.getParameter("report");
		
		if("admissionType".equalsIgnoreCase(reportName)){
			
			AdmissionTypeDAO admissionTypeDAO = new AdmissionTypeDAO();
			request.setAttribute("admissionTypelist", admissionTypeDAO.getList());
			request.getRequestDispatcher("/pages/master/admissionTypeReport.jsp").forward(request, response);
			
		}else if("department".equalsIgnoreCase(reportName)){
			
			DepartmentDAO departmentDAO = new DepartmentDAO();
			request.setAttribute("departmentlist", departmentDAO.getList());
			request.getRequestDispatcher("/pages/master/departmentReport.jsp").forward(request, response);
			
		}else if("doctor".equalsIgnoreCase(reportName)){
			
			DoctorDAO doctorDAO = new DoctorDAO();
			request.setAttribute("doctorlist", doctorDAO.getList());
			request.getRequestDispatcher("/pages/master/doctorReport.jsp").forward(request, response);
			
		}else if("medicine".equalsIgnoreCase(reportName)){
			

			MedicineDAO medicineDAO = new MedicineDAO();
			request.setAttribute("medicinelist", medicineDAO.getList());
			request.getRequestDispatcher("/pages/master/medicineReport.jsp").forward(request, response);
			
		}else if("service".equalsIgnoreCase(reportName)){
			
			ServiceDAO serviceDAO = new ServiceDAO();
			request.setAttribute("servicelist",  serviceDAO.getList());
			request.getRequestDispatcher("/pages/master/serviceReport.jsp").forward(request, response);
			
		}else if("staff".equalsIgnoreCase(reportName)){
			
			StaffDAO staffDAO = new StaffDAO();
			request.setAttribute("stafflist", staffDAO.getList());
			request.getRequestDispatcher("/pages/master/staffReport.jsp").forward(request, response);
			
		}else if("test".equalsIgnoreCase(reportName)){
			
			TestDAO testDAO = new TestDAO();
			request.setAttribute("testlist", testDAO.getList());
			request.getRequestDispatcher("/pages/master/testReport.jsp").forward(request, response);
			
		}else if("ward".equalsIgnoreCase(reportName)){
			// ---------- database fetch -----------
			WardDAO wardDAO = new WardDAO();
			
			request.setAttribute("wardlist", wardDAO.getList());
			request.getRequestDispatcher("/pages/master/wardReport.jsp").forward(request, response);
		}else if("module".equalsIgnoreCase(reportName)){
			// ---------- database fetch -----------
			ModuleDAO moduleDAO = new ModuleDAO();
			
			request.setAttribute("modulelist", moduleDAO.getList());
			request.getRequestDispatcher("/pages/master/moduleReport.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
