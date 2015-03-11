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
import com.app.master.Doctor;
import com.app.master.DoctorDAO;

/**
 * Servlet implementation class doctor_master
 */
public class DoctorServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		// ---------- doctor list -----------
		List<Doctor> doctorList= new ArrayList<Doctor>();
		DoctorDAO doctorDAO = new DoctorDAO();
		doctorList = doctorDAO.getList();
		
		
		// ---------- database fetch -----------
		List<Department> departmentList= new ArrayList<Department>();
		DepartmentDAO departmentDAO = new DepartmentDAO();
		departmentList = departmentDAO.getList();
		
		request.setAttribute("doctorList", doctorList);
		request.setAttribute("departmentList", departmentList);
		request.getRequestDispatcher("/pages/master/doctor.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Boolean editMode = false;
		String msg= "";
		DoctorDAO doctorDAO = new DoctorDAO();
		DepartmentDAO departmentDAO = new DepartmentDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			Doctor doctor = new Doctor();
			
			String name = request.getParameter("name").trim();
			String code = request.getParameter("code").trim();
			Integer departmentId = Integer.parseInt(request.getParameter("department").trim());
			String address1 = request.getParameter("address1").trim();
			String address2 = request.getParameter("address2").trim();
			String dutyHours = request.getParameter("dutyHours").trim();
			String qualification = request.getParameter("qualification").trim();
			String consultationfee = request.getParameter("consultationfee").trim();
			String weeklyoff = request.getParameter("weeklyoff").trim();
			
			doctor.setName(name);
			doctor.setCode(code);
			doctor.setDepartment(departmentDAO.findById(departmentId));
			doctor.setAddress1(address1);
			doctor.setAddress2(address2);
			doctor.setConsultationfee(consultationfee);
			doctor.setDutyHours(dutyHours);
			doctor.setQualification(qualification);
			doctor.setWeeklyoff(weeklyoff);
			
			
			doctorDAO.add(doctor);
			editMode = false;
			
		}else if("show".equalsIgnoreCase(btnclick)){
			
			Doctor doctor = doctorDAO.findById(Integer.parseInt(request.getParameter("doctorId")));
			
			List<Department> departmentList= new ArrayList<Department>();
			departmentList = departmentDAO.getList();
			
			request.setAttribute("doctor", doctor);
			request.setAttribute("departmentList", departmentList);
			
			editMode = true;
			
		}else if("update".equalsIgnoreCase(btnclick)){
			
			Doctor doctor = doctorDAO.findById(Integer.parseInt(request.getParameter("id")));
			Integer departmentId = Integer.parseInt(request.getParameter("department").trim());
			
			doctor.setName(request.getParameter("name").trim());
			doctor.setCode(request.getParameter("code").trim());
			doctor.setDepartment(departmentDAO.findById(departmentId));
			doctor.setAddress1(request.getParameter("address1").trim());
			doctor.setAddress2(request.getParameter("address2").trim());
			doctor.setConsultationfee(request.getParameter("consultationfee").trim());
			doctor.setDutyHours(request.getParameter("dutyHours").trim());
			doctor.setQualification(request.getParameter("qualification").trim());
			doctor.setWeeklyoff(request.getParameter("weeklyoff").trim());
			
			doctorDAO.update(doctor);
			
			List<Department> departmentList= new ArrayList<Department>();
			departmentList = departmentDAO.getList();
			request.setAttribute("doctor", new Doctor());
			request.setAttribute("departmentList", departmentList);
			
			editMode = false;
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("id").trim());
			Doctor deleteDoctor = doctorDAO.findById(id);
			if(deleteDoctor != null){
				doctorDAO.delete(deleteDoctor);
			}
			editMode = false;
		}
		
		
		// ------ getting doctor list ---------------
		List<Doctor> doctorlist= new ArrayList<Doctor>();
		doctorlist = doctorDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("editMode", editMode);
		request.setAttribute("doctorList", doctorlist);
		request.getRequestDispatcher("/pages/master/doctor.jsp").forward(request, response);
	}

}
