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
import com.app.master.Nursing;
import com.app.master.NursingDAO;
import com.app.master.Opd;
import com.app.master.OpdDAO;
import com.app.master.Patient;
import com.app.master.PatientDAO;
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
	WardDAO wardDAO = new WardDAO();
	AdmissionTypeDAO admissionTypeDAO = new AdmissionTypeDAO();
	
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
			
			OpdDAO opdDAO = new OpdDAO();
			String admissionId =  request.getParameter("admissionId").trim();
			Opd opd = opdDAO.findByAdmissionId(admissionId);
			if(opd != null){
				request.setAttribute("opd", opd);
				
			}else{
				msg = "No data to load";
			}
			loadData(request);
		}
		
		request.setAttribute("msg",msg);
		request.getRequestDispatcher("/pages/ipd.jsp").forward(request, response);
		
	}
	
	private void loadData(HttpServletRequest request){
		// ---------- patient list -----------
		List<Patient> patientlist= new ArrayList<Patient>();
		patientlist = patientDAO.getList();
		
		// ---------- doctor list -----------
		List<Doctor> doctorlist= new ArrayList<Doctor>();
		doctorlist = doctorDAO.getList();
		
		// ---------- database fetch -----------
		List<Ward> wardlist= new ArrayList<Ward>();
		wardlist = wardDAO.getList();
		
		
		// ---------- database fetch -----------
		List<AdmissionType> admissionTypelist= new ArrayList<AdmissionType>();
		admissionTypelist = admissionTypeDAO.getList();
		
		request.setAttribute("wardlist", wardlist);
		request.setAttribute("admissionTypelist", admissionTypelist);
		request.setAttribute("doctorlist", doctorlist);
		request.setAttribute("patientlist", patientlist);
		
	}
}
