package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.master.Test;
import com.app.master.TestDAO;

/**
 * Servlet implementation class test_master
 */
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Test> testlist= new ArrayList<Test>();
		
		// ---------- database fetch -----------
		TestDAO testDAO = new TestDAO();
		testlist = testDAO.getList();
		
		request.setAttribute("testlist", testlist);
		request.getRequestDispatcher("/pages/master/test.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		TestDAO testDAO = new TestDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			Test test = new Test();
			
			String code = request.getParameter("code").trim();
			String name = request.getParameter("name").trim();
			Double rate = Double.parseDouble(request.getParameter("rate").trim());
			
			test.setCode(code);
			test.setName(name);
			test.setRate(rate);
			
			testDAO.add(test);
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("ddltest").trim());
			Test test = testDAO.findById(id);
			if(test != null){
				testDAO.delete(test);
			}
		}
		
		// ------ getting test list ---------------
		List<Test> testlist= new ArrayList<Test>();
		testlist = testDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("testlist", testlist);
		request.getRequestDispatcher("/pages/master/test.jsp").forward(request, response);
		
	}

}
