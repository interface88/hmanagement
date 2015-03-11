package com.app.entity.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.app.master.Department;
import com.app.master.DepartmentDAO;
import com.app.master.Ipd;
import com.app.master.IpdDAO;
import com.app.master.OpdDAO;
import com.app.master.Patient;
import com.app.master.PatientDAO;
import com.app.master.StaffDAO;
import com.app.entity.PaymentCollection;
import com.app.entity.PaymentCollectionDAO;
import com.app.framework.DateTimeUtil;

/**
 * Servlet implementation class doctor_master
 */
public class PaymentCollectionServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentCollectionServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/pages/master/paymentCollectionList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		
		PaymentCollectionDAO paymentCollectionDAO = new PaymentCollectionDAO();
		StaffDAO staffDAO = new StaffDAO();
		PatientDAO patientDAO = new PatientDAO();
		IpdDAO ipdDAO = new IpdDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			PaymentCollection paymentCollection = new PaymentCollection();
			
			Integer staffId = Integer.parseInt(request.getParameter("staff").trim());
			String entryDate = request.getParameter("entryDate").trim();
			Integer registrationNumber = Integer.parseInt(request.getParameter("registrationNumber").trim());
			Integer patientId = Integer.parseInt(request.getParameter("patient").trim());
			String paymentDate =  request.getParameter("paymentDate").trim();
			Double receiveAmount = Double.parseDouble(request.getParameter("receiveAmount").trim());
			String paymentMode = request.getParameter("paymentMode").trim();
			String chequeNumber = request.getParameter("chequeNumber").trim();
			String chequeDate = request.getParameter("chequeDate").trim();
			String bank = request.getParameter("bank").trim();
			String otherDetails = request.getParameter("otherDetails").trim();
			String remark = request.getParameter("remark").trim();

			paymentCollection.setBank(bank);
			paymentCollection.setChequeDate(DateTimeUtil.ParseString(chequeDate));
			paymentCollection.setChequeNumber(chequeNumber);
			paymentCollection.setEntryDate(DateTimeUtil.ParseString(entryDate));
			paymentCollection.setOtherDetails(otherDetails);
			paymentCollection.setPatient(patientDAO.findById(patientId));
			paymentCollection.setPaymentDate(DateTimeUtil.ParseString(paymentDate));
			paymentCollection.setPaymentMode(paymentMode);
			paymentCollection.setReceiveAmount(receiveAmount);
			paymentCollection.setRegistrationNumber(registrationNumber);
			paymentCollection.setRemark(remark);
			paymentCollection.setStaff(staffDAO.findById(staffId));
			
			paymentCollectionDAO.add(paymentCollection);
			
		}else if("load".equalsIgnoreCase(btnclick)){
			
			Ipd ipd = ipdDAO.findByAdmissionId(request.getParameter("admissionId"));
			request.setAttribute("patient", ipd.getPatient());
		}
		
		request.setAttribute("msg",msg);
		request.getRequestDispatcher("/pages/master/paymentCollection.jsp").forward(request, response);
	}

}
