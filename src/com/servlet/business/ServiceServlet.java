package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.app.master.Department;
import com.app.master.DepartmentDAO;
import com.app.master.Service;
import com.app.master.ServiceDAO;

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
		request.getRequestDispatcher("/pages/master/service.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Boolean editMode = false;
		String msg= "";
		ServiceDAO serviceDAO = new ServiceDAO();
		DepartmentDAO departmentDAO = new DepartmentDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			Service service = new Service();
			
			String name = request.getParameter("name").trim();
			String code = request.getParameter("code").trim();
			Integer departmentId = Integer.parseInt(request.getParameter("department").trim());
			String fee = request.getParameter("fee").trim();
			
			service.setName(name);
			service.setCode(code);
			service.setDepartment(departmentDAO.findById(departmentId));
			service.setCharges(fee);
			
			
			serviceDAO.add(service);
			editMode = false;
			
		}else if("show".equalsIgnoreCase(btnclick)){
			
			Service service = serviceDAO.findById(Integer.parseInt(request.getParameter("serviceId")));
			
			List<Department> departmentList= new ArrayList<Department>();
			departmentList = departmentDAO.getList();
			
			request.setAttribute("service", service);
			request.setAttribute("departmentList", departmentList);
			
			editMode = true;
			
		}else if("update".equalsIgnoreCase(btnclick)){
			
			Service service = serviceDAO.findById(Integer.parseInt(request.getParameter("id")));
			Integer departmentId = Integer.parseInt(request.getParameter("department").trim());
			
			service.setCharges(request.getParameter("fee").trim());
			service.setCode(request.getParameter("code").trim());
			service.setName(request.getParameter("name").trim());
			service.setDepartment(departmentDAO.findById(departmentId));
			
			serviceDAO.update(service);
			
			List<Department> departmentList= new ArrayList<Department>();
			departmentList = departmentDAO.getList();
			request.setAttribute("service", new Service());
			request.setAttribute("departmentList", departmentList);
			
			editMode = false;
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("serviceId").trim());
			Service deleteService = serviceDAO.findById(id);
			if(deleteService != null){
				serviceDAO.delete(deleteService);
			}
			editMode = false;
		}
		
		
		// ------ getting ward list ---------------
		List<Service> servicelist= new ArrayList<Service>();
		servicelist = serviceDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("editMode", editMode);
		request.setAttribute("serviceList", servicelist);
		request.getRequestDispatcher("/pages/master/service.jsp").forward(request, response);
	}

}
