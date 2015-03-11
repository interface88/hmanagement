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
import com.app.master.LoginType;
import com.app.master.LoginTypeDAO;
import com.app.master.Staff;
import com.app.master.StaffDAO;

/**
 * Servlet implementation class staff_master
 */
public class StaffServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		// ---------- staff list -----------
		List<Staff> staffList= new ArrayList<Staff>();
		StaffDAO staffDAO = new StaffDAO();
		staffList = staffDAO.getList();
		
		
		// ---------- database fetch -----------
		List<Department> departmentList= new ArrayList<Department>();
		DepartmentDAO departmentDAO = new DepartmentDAO();
		departmentList = departmentDAO.getList();

		List<LoginType> loginTypeList= new ArrayList<LoginType>();
		LoginTypeDAO loginTypeDAO = new LoginTypeDAO();
		loginTypeList = loginTypeDAO.getList();
		
		request.setAttribute("staffList", staffList);
		request.setAttribute("departmentList", departmentList);
		request.setAttribute("loginTypeList", loginTypeList);
		request.getRequestDispatcher("/pages/master/staff.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Boolean editMode = false;
		String msg= "";
		StaffDAO staffDAO = new StaffDAO();
		DepartmentDAO departmentDAO = new DepartmentDAO();
		LoginTypeDAO loginTypeDAO = new LoginTypeDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			Staff staff = new Staff();
			
			String name = request.getParameter("name").trim();
			String code = request.getParameter("code").trim();
			Integer departmentId = Integer.parseInt(request.getParameter("department").trim());
			Integer loginTypeId = Integer.parseInt(request.getParameter("loginType").trim());
			String address1 = request.getParameter("address1").trim();
			String address2 = request.getParameter("address2").trim();
			String dutyHours = request.getParameter("dutyHours").trim();
			String qualification = request.getParameter("qualification").trim();
			String userId = request.getParameter("userId").trim();
			String password = request.getParameter("password").trim();
			
			staff.setName(name);
			staff.setCode(code);
			staff.setDepartment(departmentDAO.findById(departmentId));
			staff.setLoginType(loginTypeDAO.findById(loginTypeId));
			staff.setAddress1(address1);
			staff.setAddress2(address2);
			staff.setDutyHours(dutyHours);
			staff.setQualification(qualification);
			staff.setUserId(userId);
			staff.setPassword(password);
			
			
			staffDAO.add(staff);
			editMode = false;
			
		}else if("show".equalsIgnoreCase(btnclick)){
			
			Staff staff = staffDAO.findById(Integer.parseInt(request.getParameter("staffId")));
			
			List<Department> departmentList= new ArrayList<Department>();
			departmentList = departmentDAO.getList();
			
			List<LoginType> loginTypeList= new ArrayList<LoginType>();
			loginTypeList = loginTypeDAO.getList();
			
			request.setAttribute("staff", staff);
			request.setAttribute("departmentList", departmentList);
			request.setAttribute("loginTypeList", loginTypeList);
			
			editMode = true;
			
		}else if("update".equalsIgnoreCase(btnclick)){
			
			Staff staff = staffDAO.findById(Integer.parseInt(request.getParameter("id")));
			Integer departmentId = Integer.parseInt(request.getParameter("department").trim());
			Integer loginTypeId = Integer.parseInt(request.getParameter("loginType").trim());
			
			staff.setName(request.getParameter("name").trim());
			staff.setCode(request.getParameter("code").trim());
			staff.setDepartment(departmentDAO.findById(departmentId));
			staff.setLoginType(loginTypeDAO.findById(loginTypeId));
			staff.setAddress1(request.getParameter("address1").trim());
			staff.setAddress2(request.getParameter("address2").trim());
			staff.setDutyHours(request.getParameter("dutyHours").trim());
			staff.setQualification(request.getParameter("qualification").trim());
			
			staffDAO.update(staff);
			
			List<Department> departmentList= new ArrayList<Department>();
			departmentList = departmentDAO.getList();
			
			List<LoginType> loginTypeList= new ArrayList<LoginType>();
			loginTypeList = loginTypeDAO.getList();
			
			request.setAttribute("staff", new Staff());
			request.setAttribute("departmentList", departmentList);
			request.setAttribute("loginTypeList", loginTypeList);
			
			editMode = false;
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("id").trim());
			Staff deleteStaff = staffDAO.findById(id);
			if(deleteStaff != null){
				staffDAO.delete(deleteStaff);
			}
			editMode = false;
		}
		
		
		// ------ getting staff list ---------------
		List<Staff> stafflist= new ArrayList<Staff>();
		stafflist = staffDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("editMode", editMode);
		request.setAttribute("staffList", stafflist);
		request.getRequestDispatcher("/pages/master/staff.jsp").forward(request, response);
	}

}
