package com.servlet.business;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.framework.DateTimeUtil;
import com.app.master.AdmissionType;
import com.app.master.AdmissionTypeDAO;
import com.app.master.Doctor;
import com.app.master.DoctorDAO;
import com.app.master.Ipd;
import com.app.master.IpdDAO;
import com.app.master.Medicine;
import com.app.master.MedicineDAO;
import com.app.master.Nursing;
import com.app.master.NursingDAO;
import com.app.master.Opd;
import com.app.master.OpdDAO;
import com.app.master.Patient;
import com.app.master.PatientDAO;
import com.app.master.Test;
import com.app.master.TestDAO;
import com.app.master.Ward;
import com.app.master.WardDAO;

import common.commonmethods;
import common.dbconnection;

/**
 * Servlet implementation class doctor_master
 */
public class NursingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PatientDAO patientDAO = new PatientDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	MedicineDAO medicineDAO = new MedicineDAO();
	TestDAO testDAO = new TestDAO();
	
	 /**
    * @see HttpServlet#HttpServlet()
    */
   public NursingServlet() {
       super();
   }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loadData(request);
		request.getRequestDispatcher("/pages/nursing.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		WardDAO wardDAO = new WardDAO();
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("save".equalsIgnoreCase(btnclick)){
			
			// check if entry for same date present
			
			NursingDAO nursingDAO = new NursingDAO();
			String admissionId = request.getParameter("admissionId").trim();
			Nursing nursing = nursingDAO.findByAdmissionIdAndCurrentDate(admissionId);
			if(nursing == null){
				// add new nursing
				int patientId = Integer.parseInt(request.getParameter("patientId").trim());
				Patient patient = patientDAO.findById(patientId);
				
				int doctorId = Integer.parseInt(request.getParameter("doctorId").trim());
				Doctor doctor = doctorDAO.findById(doctorId);
				String staffName = request.getParameter("staffName").trim();
			}
			
			// add nursing transaction for that nursing
			
			// if present than add transaction for add
			
			// ------------ OLD CODE ----------------------
			
			
			Date admissionDate = DateTimeUtil.ParseString(request.getParameter("admissionDate").trim());
			String admissionTime = request.getParameter("admissionTime").trim();
			String ward = request.getParameter("ward").trim();
			Integer bedNo = Integer.parseInt(request.getParameter("bedNo").trim());
			String admissionDiagnosis = request.getParameter("admissionDiagnosis").trim();
			String admissionDetail = request.getParameter("admissionDetail").trim();
			String admissionTreatment = request.getParameter("admissionTreatment").trim();
			String allergyDetail = request.getParameter("allergyDetail").trim();
			String specialNote = request.getParameter("specialNote").trim();
			Double advancePayment = Double.parseDouble(request.getParameter("advancePayment").trim());
			String remark = request.getParameter("remark").trim();
			
			
			// setting all the value
			
		}else if("load".equalsIgnoreCase(btnclick)){
			
			IpdDAO ipdDAO = new IpdDAO();
			String admissionId =  request.getParameter("admissionId").trim();
			Ipd ipd = ipdDAO.findByAdmissionId(admissionId);
			if(ipd != null){
				request.setAttribute("ipd", ipd);
				
			}else{
				msg = "No data to load";
			}
			loadData(request);
		}
		
		request.setAttribute("msg",msg);
		request.getRequestDispatcher("/pages/nursing.jsp").forward(request, response);
		
	}
	
	private void loadData(HttpServletRequest request){
		
		// ---------- doctor list -----------
		List<Doctor> doctorlist= new ArrayList<Doctor>();
		doctorlist = doctorDAO.getList();
		
		// ---------- medicine list -----------
		List<Medicine> medicinelist= new ArrayList<Medicine>();
		medicinelist = medicineDAO.getList();
		
		// ---------- medicine list -----------
		List<Test> testlist= new ArrayList<Test>();
		testlist = testDAO.getList();
		
		request.setAttribute("medicinelist", medicinelist);
		request.setAttribute("testlist", testlist);
		request.setAttribute("doctorlist", doctorlist);
		
	}
}
