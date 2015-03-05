package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.master.Department;
import com.app.master.DepartmentDAO;

import common.HibernateUtil;
import common.commonmethods;
import common.dbconnection;

/**
 * Servlet implementation class department_master
 */
public class DepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartmentServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Department> departmentlist= new ArrayList<Department>();
		
		// ---------- database fetch -----------
		DepartmentDAO departmentDAO = new DepartmentDAO();
		departmentlist = departmentDAO.getList();
		
		request.setAttribute("departmentlist", departmentlist);
		request.getRequestDispatcher("/pages/master/department.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();	
		String msg="";
		if(!commonmethods.checkSession(session))
		{
			response.sendRedirect("index.jsp");
		}else
		{
			try
			{
				String btnclick = request.getParameter("action");
				if(btnclick.equalsIgnoreCase("delete"))
				{
					// delete a department
					String department = request.getParameter("ddldepartment").trim();
					if(!department.equals("-1"))
					{
					}
				}else
				{
					if(btnclick.equalsIgnoreCase("save"))
					{
						Session s = HibernateUtil.getSession();
						Department department = new Department();
						String newdepartment = request.getParameter("txtdepname").trim();
						department.setName(newdepartment);
						
						final Transaction transaction = s.beginTransaction();
						s.save(department);
						transaction.commit();

							msg="Department Added Successfully";
					}
				}
				request.setAttribute("msg",msg);
				request.getRequestDispatcher("department.jsp").forward(request, response);
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}

}
