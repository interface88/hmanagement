package com.servlet.business;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.framework.DateTimeUtil;
import com.app.framework.MyObject;
import com.app.master.AdmissionType;
import com.app.master.AdmissionTypeDAO;
import com.app.master.Doctor;
import com.app.master.DoctorDAO;
import com.app.master.Ipd;
import com.app.master.IpdDAO;
import com.app.master.Opd;
import com.app.master.OpdDAO;
import com.app.master.Patient;
import com.app.master.PatientDAO;
import com.app.master.Ward;
import com.app.master.WardDAO;

/**
 * Servlet implementation class doctor_master
 */
public class IpdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PatientDAO patientDAO = new PatientDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	WardDAO wardDAO = new WardDAO();
	AdmissionTypeDAO admissionTypeDAO = new AdmissionTypeDAO();
	
  /**
    * @see HttpServlet#HttpServlet()
    */
   public IpdServlet() {
       super();
   }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loadData(request);
		request.getRequestDispatcher("/pages/ipd.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg = "";

		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			Integer patientId = MyObject.stringToInt(request.getParameter("patientId"));
			if(patientId != null){
				Patient patient = patientDAO.findById(patientId);
				
				Integer doctorId = MyObject.stringToInt(request.getParameter("doctorId"));
				Doctor doctor = doctorDAO.findById(doctorId);
				
				Integer admissionTypeId = MyObject.stringToInt(request.getParameter("admissionTypeId"));
				AdmissionType admissionType = admissionTypeDAO.findById(admissionTypeId);
				
				//  ---------------  Getting value from request --------------
				String staffName = request.getParameter("staffName").trim();
				String admissionId = request.getParameter("admissionId").trim();
				Date entryDate = DateTimeUtil.ParseString(request.getParameter("entryDate"));
				Date admissionDate = DateTimeUtil.ParseString(request.getParameter("admissionDate"));
				String admissionTime = request.getParameter("admissionTime").trim();
				String ward = request.getParameter("ward").trim();
				Integer bedNo = MyObject.stringToInt(request.getParameter("bedNo"));
				String admissionDiagnosis = request.getParameter("admissionDiagnosis").trim();
				String admissionDetail = request.getParameter("admissionDetail").trim();
				String admissionTreatment = request.getParameter("admissionTreatment").trim();
				String allergyDetail = request.getParameter("allergyDetail").trim();
				String specialNote = request.getParameter("specialNote").trim();
				Double advancePayment = MyObject.stringToDouble(request.getParameter("advancePayment"));
				String remark = request.getParameter("remark").trim();
				
				// setting all the request value to IPD object.
				Ipd ipd = new Ipd();
				ipd.setPatient(patient);
				ipd.setDoctor(doctor);
				ipd.setAdmissionType(admissionType);
				ipd.setStaffName(staffName);
				ipd.setAdmissionId(admissionId);
				ipd.setEntryDate(entryDate);
				ipd.setAdmissionDate(admissionDate);
				ipd.setAdmissionTime(admissionTime);
				ipd.setWard(ward);
				ipd.setBedNo(bedNo);
				ipd.setAdmissionDiagnosis(admissionDiagnosis);
				ipd.setAdmissionDetail(admissionDetail);
				ipd.setAdmissionTreatment(admissionTreatment);
				ipd.setAllergyDetail(allergyDetail);
				ipd.setSpecialNote(specialNote);
				ipd.setAdvancePayment(advancePayment);
				ipd.setRemark(remark);

				IpdDAO ipdDAO = new IpdDAO();
				ipdDAO.add(ipd);// saving ipd object to database with DAO
				
			}else{
				msg = "Please load data for admission in IPD";
			}
			
			
		}else if("load".equalsIgnoreCase(btnclick)){
			
			OpdDAO opdDAO = new OpdDAO();
			String admissionId =  request.getParameter("admissionId").trim();
			Opd opd = opdDAO.findByAdmissionId(admissionId);
			if(opd != null){
				request.setAttribute("opd", opd);
				
			}else{
				msg = "Invalid Admission No";
			}
			loadData(request);
		}
		
		request.setAttribute("msg",msg);
		request.getRequestDispatcher("/pages/ipd.jsp").forward(request, response);
		
	}
	
	private void loadData(HttpServletRequest request) {
		// ---------- patient list -----------
		List<Patient> patientlist = new ArrayList<Patient>();
		patientlist = patientDAO.getList();

		// ---------- doctor list -----------
		List<Doctor> doctorlist = new ArrayList<Doctor>();
		doctorlist = doctorDAO.getList();

		// ---------- ward list-----------
		List<Ward> wardlist = new ArrayList<Ward>();
		wardlist = wardDAO.getList();

		// ---------- admission type list -----------
		List<AdmissionType> admissionTypelist = new ArrayList<AdmissionType>();
		admissionTypelist = admissionTypeDAO.getList();

		request.setAttribute("wardlist", wardlist);
		request.setAttribute("admissionTypelist", admissionTypelist);
		request.setAttribute("doctorlist", doctorlist);
		request.setAttribute("patientlist", patientlist);

	}
}
