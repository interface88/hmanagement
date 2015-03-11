package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.master.Module;
import com.app.master.ModuleDAO;

/**
 * Servlet implementation class module_master
 */
public class ModuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public ModuleServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Module> modulelist= new ArrayList<Module>();
		
		// ---------- database fetch -----------
		ModuleDAO moduleDAO = new ModuleDAO();
		modulelist = moduleDAO.getList();
		
		request.setAttribute("modulelist", modulelist);
		request.getRequestDispatcher("/pages/master/module.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		ModuleDAO moduleDAO = new ModuleDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			Module module = new Module();
			
			String code = request.getParameter("code").trim();
			String name = request.getParameter("name").trim();
			
			module.setCode(code);
			module.setName(name);
			
			moduleDAO.add(module);
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("ddlmodule").trim());
			Module module = moduleDAO.findById(id);
			if(module != null){
				moduleDAO.delete(module);
			}
		}
		
		// ------ getting module list ---------------
		List<Module> modulelist= new ArrayList<Module>();
		modulelist = moduleDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("modulelist", modulelist);
		request.getRequestDispatcher("/pages/master/module.jsp").forward(request, response);
		
	}

}
