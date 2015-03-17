package com.servlet.business;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.app.framework.Constants;
import com.app.framework.DateTimeUtil;
import com.app.framework.MyObject;
import com.app.master.Doctor;
import com.app.master.DoctorDAO;
import com.app.master.Ipd;
import com.app.master.IpdDAO;
import com.app.master.Medicine;
import com.app.master.MedicineDAO;
import com.app.master.Nursing;
import com.app.master.NursingDAO;
import com.app.master.NursingTransaction;
import com.app.master.NursingTransactionDAO;
import com.app.master.Patient;
import com.app.master.PatientDAO;
import com.app.master.Test;
import com.app.master.TestDAO;
import com.app.master.WardDAO;

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
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("save".equalsIgnoreCase(btnclick)){
			
			Integer patientId = MyObject.stringToInt(request.getParameter("patientId"));
			
			if(patientId != null){
				
				NursingDAO nursingDAO = new NursingDAO();
				Nursing nursing = new Nursing();
				
				Patient patient = patientDAO.findById(patientId);
				
				Integer doctorId = MyObject.stringToInt(request.getParameter("doctorId"));
				Doctor doctor = doctorDAO.findById(doctorId);
				
				String admissionId = request.getParameter("admissionId").trim();
				String staffName = request.getParameter("staffName").trim();
				Integer noOfVisit = MyObject.stringToInt(request.getParameter("noOfVisit"));
				Date nursingDate = DateTimeUtil.ParseString(request.getParameter("nursingDate"));
				String pressure = request.getParameter("pressure").trim();
				String pulse = request.getParameter("pulse").trim();
				String temperature = request.getParameter("temperature").trim();
				String sugar = request.getParameter("sugar").trim();
				String examingTime = request.getParameter("examingTime").trim();
				String remark = request.getParameter("remark").trim();
				
				
				nursing.setAdmissionId(admissionId);
				nursing.setPatient(patient);
				nursing.setDoctor(doctor);
				nursing.setStaffName(staffName);
				nursing.setNoOfVisit(noOfVisit);
				nursing.setNursingDate(nursingDate);
				nursing.setPressure(pressure);
				nursing.setPulse(pulse);
				nursing.setTemperature(temperature);
				nursing.setSugar(sugar);
				nursing.setExamingTime(examingTime);
				nursing.setRemark(remark);
				
				nursingDAO.add(nursing);
				
				Double medicineTotalCost = MyObject.stringToDouble(request.getParameter("medicineTotalPrice"));
				Double testTotalCost = MyObject.stringToDouble(request.getParameter("testTotalPrice").trim());
				
				if(medicineTotalCost > 0){
					NursingTransaction nursingMedicineTransaction = new NursingTransaction();
					nursingMedicineTransaction.setTreatmentCost(medicineTotalCost);
					nursingMedicineTransaction.setTreatment(Constants.TREATMENT_MEDICINE);
					nursingMedicineTransaction.setNursing(nursing);
					
					// ---------- saving medicine information ---------------
					NursingTransactionDAO nursingTransactionDAO = new NursingTransactionDAO();
					nursingTransactionDAO.add(nursingMedicineTransaction);
				}
				
				
				if(testTotalCost > 0){
					NursingTransaction nursingTestTransaction = new NursingTransaction();
					nursingTestTransaction.setNursing(nursing);;
					nursingTestTransaction.setTreatment(Constants.TREATMENT_TEST);
					nursingTestTransaction.setTreatmentCost(testTotalCost);
					
					// ---------- saving test information ---------------
					NursingTransactionDAO nursingTransactionDAO = new NursingTransactionDAO();
					nursingTransactionDAO.add(nursingTestTransaction);
				}
			}else{
				msg = "Please load patient data for nursing entry";
			}
			
			
		}else if("load".equalsIgnoreCase(btnclick)){
			
			IpdDAO ipdDAO = new IpdDAO();
			String admissionId =  request.getParameter("admissionId").trim();
			Ipd ipd = ipdDAO.findByAdmissionId(admissionId);
			if(ipd != null){
				request.setAttribute("ipd", ipd);
				
			}else{
				msg = "Invalid Admission no.";
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
		List<Test> testTypelist= new ArrayList<Test>();
		testTypelist = testDAO.getUniqueTestTypeList();
		
		request.setAttribute("medicinelist", medicinelist);
		request.setAttribute("testTypelist", testTypelist);
		request.setAttribute("doctorlist", doctorlist);
		
	}
}
