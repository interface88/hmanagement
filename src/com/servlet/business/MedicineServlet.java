package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.master.Medicine;
import com.app.master.MedicineDAO;

/**
 * Servlet implementation class medicine_master
 */
public class MedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public MedicineServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Medicine> medicinelist= new ArrayList<Medicine>();
		
		// ---------- database fetch -----------
		MedicineDAO medicineDAO = new MedicineDAO();
		medicinelist = medicineDAO.getList();
		
		request.setAttribute("medicinelist", medicinelist);
		request.getRequestDispatcher("/pages/master/medicine.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		MedicineDAO medicineDAO = new MedicineDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			Medicine medicine = new Medicine();
			
			String code = request.getParameter("code").trim();
			String name = request.getParameter("name").trim();
			String rate = request.getParameter("rate").trim();
			
			medicine.setCode(code);
			medicine.setName(name);
			medicine.setRate(rate);
			
			medicineDAO.add(medicine);
			
		}else if("delete".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("ddlmedicine").trim());
			Medicine medicine = medicineDAO.findById(id);
			if(medicine != null){
				medicineDAO.delete(medicine);
			}
		}
		
		// ------ getting medicine list ---------------
		List<Medicine> medicinelist= new ArrayList<Medicine>();
		medicinelist = medicineDAO.getList();
		
		request.setAttribute("msg",msg);
		request.setAttribute("medicinelist", medicinelist);
		request.getRequestDispatcher("/pages/master/medicine.jsp").forward(request, response);
		
	}

}
