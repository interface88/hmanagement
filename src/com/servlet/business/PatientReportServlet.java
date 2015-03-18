package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.entity.DischargeTicket;
import com.app.entity.DischargeTicketDAO;
import com.app.entity.FinalBill;
import com.app.entity.FinalBillDAO;
import com.app.entity.PaymentCollection;
import com.app.entity.PaymentCollectionDAO;
import com.app.master.Ipd;
import com.app.master.IpdDAO;
import com.app.master.Nursing;
import com.app.master.NursingDAO;
import com.app.master.Opd;
import com.app.master.OpdDAO;
import com.app.master.Patient;
import com.app.master.PatientDAO;

/**
 * Servlet implementation class admissionType_master
 */
public class PatientReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientReportServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reportName = request.getParameter("report");
		
		if("opd".equalsIgnoreCase(reportName)){
			OpdDAO opdDAO = new OpdDAO();
			Opd opd = opdDAO.findById(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("opd", opd);
			request.setAttribute("patient", opd.getPatient());
			request.getRequestDispatcher("/pages/opdprint.jsp").forward(request, response);
		}else if("ipd".equalsIgnoreCase(reportName)){
			IpdDAO ipdDAO = new IpdDAO();
			Ipd ipd = ipdDAO.findById(Integer.parseInt(request.getParameter("id")));
			
			OpdDAO opdDAO = new OpdDAO();
			Opd opd = opdDAO.findByAdmissionId(ipd.getAdmissionId());
			
			request.setAttribute("opd", opd);
			request.setAttribute("ipd", ipd);
			request.getRequestDispatcher("/pages/ipdPrint.jsp").forward(request, response);
		}else if("prescription".equalsIgnoreCase(reportName)){
			OpdDAO opdDAO = new OpdDAO();
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			Opd opd = opdDAO.findById(id);
			request.setAttribute("opd", opd);
			request.getRequestDispatcher("/pages/opdPrescription.jsp").forward(request, response);
		}else if("dischargeTicket".equalsIgnoreCase(reportName)){
			DischargeTicketDAO dischargeTicketDAO = new DischargeTicketDAO();
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			DischargeTicket dischargeTicket = dischargeTicketDAO.findById(id);
			request.setAttribute("dischargeTicket", dischargeTicket);
			request.getRequestDispatcher("/pages/dischargeTicketPrint.jsp").forward(request, response);
		}
		else if("paymentCollection".equalsIgnoreCase(reportName)){
			PaymentCollectionDAO paymentCollectionDAO = new PaymentCollectionDAO();
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			PaymentCollection paymentCollection = paymentCollectionDAO.findById(id);
			request.setAttribute("paymentCollection", paymentCollection);
			request.getRequestDispatcher("/pages/paymentCollectionPrint.jsp").forward(request, response);
		}else if("finalBill".equalsIgnoreCase(reportName)){
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			FinalBillDAO finalBillDAO = new FinalBillDAO();
			FinalBill printFinalBill = finalBillDAO.findById(id);
			NursingDAO nursingDAO = new NursingDAO();
			List<Nursing> nursingList = nursingDAO.findListByAdmissionId(printFinalBill.getAdmissionId());
			
			request.setAttribute("nursingList", nursingList);
			request.setAttribute("finalBill", printFinalBill);
			request.getRequestDispatcher("/pages/finalBillPrint.jsp").forward(request, response);
		}else if("admissionReport".equalsIgnoreCase(reportName)){
			request.getRequestDispatcher("/pages/admissionReport.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String registrationNo = request.getParameter("registrationNo");
		
		String msg = "";
		
		PatientDAO patientDAO = new PatientDAO();
		Patient patient = patientDAO.findByRegistrationNo(registrationNo);
		if(patient != null){
			List<PaymentCollection> paymentCollectionlist = new  ArrayList<PaymentCollection>(patient.getPaymentCollections());
			List<Ipd> ipdlist = new  ArrayList<Ipd>(patient.getIpds());
			List<Opd> opdlist = new  ArrayList<Opd>(patient.getOpds());
			List<Nursing> nursinglist = new  ArrayList<Nursing>(patient.getNursings());
			List<FinalBill> finalBilllist = new  ArrayList<FinalBill>(patient.getFinalBills());
			List<DischargeTicket> dischargeTicketlist = new  ArrayList<DischargeTicket>(patient.getDischargeTickets());
			
			request.setAttribute("paymentCollectionlist", paymentCollectionlist);
			request.setAttribute("ipdlist", ipdlist);
			request.setAttribute("opdlist", opdlist);
			request.setAttribute("dischargeTicketlist", dischargeTicketlist);
			request.setAttribute("nursinglist", nursinglist);
			request.setAttribute("finalBilllist", finalBilllist);
		}else{
			msg = "Patient with reg no : " + registrationNo + " doesn't exist";
		}
		
		
		request.setAttribute("msg", msg);
		
		
		
		request.getRequestDispatcher("/pages/patientReport.jsp").forward(request, response);
		
	}

}
