package com.app.entity.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.app.master.Ipd;
import com.app.master.IpdDAO;
import com.app.master.PatientDAO;
import com.app.entity.PaymentCollection;
import com.app.entity.PaymentCollectionDAO;
import com.app.framework.Auth;
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
		PaymentCollection paymentCollection = new PaymentCollection();
		paymentCollection.setStaffName(Auth.getLoggedStaffName(request));
		request.setAttribute("paymentCollection", paymentCollection);
		
		request.getRequestDispatcher("/pages/paymentCollection.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		
		PaymentCollectionDAO paymentCollectionDAO = new PaymentCollectionDAO();
		PatientDAO patientDAO = new PatientDAO();
		IpdDAO ipdDAO = new IpdDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("submit".equalsIgnoreCase(btnclick)){
			
			PaymentCollection paymentCollection = new PaymentCollection();
			
			String staffName = request.getParameter("staffName").trim();
			String entryDate = request.getParameter("entryDate").trim();
			String admissionId = request.getParameter("admissionId").trim();
			Integer patientId = Integer.parseInt(request.getParameter("patientId").trim());
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
			paymentCollection.setAdmissionId(admissionId);
			paymentCollection.setRemark(remark);
			paymentCollection.setStaffName(staffName);
			
			paymentCollectionDAO.add(paymentCollection);
			
			PaymentCollection paymentCollectionPrint = paymentCollectionDAO.findById(paymentCollection.getId());
			
			request.setAttribute("paymentCollection", paymentCollectionPrint);
			request.getRequestDispatcher("/pages/paymentCollectionPrint.jsp").forward(request, response);
			
		}else if("load".equalsIgnoreCase(btnclick)){
			
			Ipd ipd = ipdDAO.findByAdmissionId(request.getParameter("admissionId"));
			
			PaymentCollection paymentCollection = new PaymentCollection();
			paymentCollection.setPatient(ipd.getPatient());
			paymentCollection.setAdmissionId(ipd.getAdmissionId());
			paymentCollection.setStaffName(Auth.getLoggedStaffName(request));
			
			request.setAttribute("paymentCollection", paymentCollection);
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("/pages/paymentCollection.jsp").forward(request, response);
		}
		
	}

}
