package com.app.entity.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.master.AdmissionTypeDAO;
import com.app.master.DoctorDAO;
import com.app.master.Ipd;
import com.app.master.IpdDAO;
import com.app.master.Nursing;
import com.app.master.NursingDAO;
import com.app.master.PatientDAO;
import com.app.entity.FinalBill;
import com.app.entity.FinalBillDAO;
import com.app.framework.Auth;
import com.app.framework.DateTimeUtil;
import com.app.framework.MyObject;

/**
 * Servlet implementation class 
 */
public class FinalBillServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	FinalBillDAO finalBillDAO = new FinalBillDAO();
	PatientDAO patientDAO = new PatientDAO();
	IpdDAO ipdDAO = new IpdDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	AdmissionTypeDAO admissionTypeDAO = new AdmissionTypeDAO();
	NursingDAO nursingDAO = new NursingDAO();
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalBillServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FinalBill finalBill = new FinalBill();
		finalBill.setStaffName(Auth.getLoggedStaffName(request));
		request.setAttribute("finalBill", finalBill);
		
		request.getRequestDispatcher("/pages/finalBill.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("submit".equalsIgnoreCase(btnclick)){
			
			FinalBill finalBill = new FinalBill();
			
			String admissionId = request.getParameter("admissionId").trim();
			String staffName = request.getParameter("staffName").trim();

			Integer patientId = Integer.parseInt(request.getParameter("patientId").trim());
			Integer doctorId = Integer.parseInt(request.getParameter("doctorId").trim());
			Integer admissionTypeId = Integer.parseInt(request.getParameter("admissionTypeId").trim());
			Integer ipdId = Integer.parseInt(request.getParameter("ipdId").trim());
			
			String entryDate =  request.getParameter("entryDate").trim();
			String billNo = request.getParameter("billNo").trim();
			String billDate =  request.getParameter("billDate").trim();
			String dischargeDate = request.getParameter("dischargeDate").trim();
			String grossTotal = request.getParameter("grossTotal").trim();
			String discount = request.getParameter("discount").trim();
			String tax = request.getParameter("tax").trim();
			String netAmount = request.getParameter("netAmount").trim();
			String balanceReceiveAmount = request.getParameter("balanceReceiveAmount").trim();
			String finalReceiveAmount = request.getParameter("finalReceiveAmount").trim();
			String paymentMode = request.getParameter("paymentMode").trim();
			String chequeNumber = request.getParameter("chequeNumber").trim();
			String chequeDate = request.getParameter("chequeDate").trim();
			String bank = request.getParameter("bank").trim();
			String otherDetails = request.getParameter("otherDetails").trim();
			String remark = request.getParameter("remark").trim();

			finalBill.setAdmissionId(admissionId);
			finalBill.setStaffName(staffName);
			finalBill.setDoctor(doctorDAO.findById(doctorId));
			finalBill.setIpd(ipdDAO.findById(ipdId));
			finalBill.setPatient(patientDAO.findById(patientId));
			finalBill.setAdmissionType(admissionTypeDAO.findById(admissionTypeId)); 
			
			finalBill.setEntryDate(DateTimeUtil.ParseString(entryDate));
			finalBill.setBillNo(billNo);
			finalBill.setBillDate(DateTimeUtil.ParseString(billDate));
			finalBill.setDischargeDate(DateTimeUtil.ParseString(dischargeDate));
			finalBill.setGrossTotal(MyObject.stringToDouble(grossTotal));
			finalBill.setDiscount(MyObject.stringToDouble(discount));
			finalBill.setTax(MyObject.stringToDouble(tax));
			finalBill.setNetAmount(Double.parseDouble(netAmount));
			finalBill.setBalanceReceiveAmount(MyObject.stringToDouble(balanceReceiveAmount));
			finalBill.setFinalReceiveAmount(MyObject.stringToDouble(finalReceiveAmount));
			finalBill.setPaymentMode(paymentMode);
			finalBill.setChequeNumber(chequeNumber);
			finalBill.setChequeDate(DateTimeUtil.ParseString(chequeDate));
			finalBill.setBank(bank);
			finalBill.setOtherDetails(otherDetails);
			finalBill.setRemark(remark);
			
			finalBillDAO.add(finalBill);
			
			FinalBill printFinalBill = finalBillDAO.findById(finalBill.getId());
			
			loadData(request);
			request.setAttribute("finalBill", printFinalBill);
			request.getRequestDispatcher("/pages/finalBillPrint.jsp").forward(request, response);
			
		}else if("load".equalsIgnoreCase(btnclick)){
			
			loadData(request);
			request.getRequestDispatcher("/pages/finalBill.jsp").forward(request, response);
		}
		
	}
	
	private void loadData(HttpServletRequest request)
	{
		String msg= "";
		Ipd ipd = ipdDAO.findByAdmissionId(request.getParameter("admissionId"));
		List<Nursing> nursingList = nursingDAO.findListByAdmissionId(request.getParameter("admissionId"));
		
		FinalBill finalBill = new FinalBill();
		finalBill.setStaffName(Auth.getLoggedStaffName(request));
		
		if(ipd != null){
			request.setAttribute("ipd", ipd);
			
		}else{
			msg = "Invalid Admission no.";
		}
		
		request.setAttribute("nursingList", nursingList);
		request.setAttribute("finalBill", finalBill);
		
		request.setAttribute("msg",msg);
		
	}
}
