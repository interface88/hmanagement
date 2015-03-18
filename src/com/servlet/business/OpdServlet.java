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
import com.app.master.Doctor;
import com.app.master.DoctorDAO;
import com.app.master.Opd;
import com.app.master.OpdDAO;
import com.app.master.Patient;
import com.app.master.PatientDAO;

/**
 * Servlet implementation class doctor_master
 */
public class OpdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PatientDAO patientDAO = new PatientDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	/**
     * @see HttpServlet#HttpServlet()
     */
    public OpdServlet() {
        super();
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loadList(request);
		request.getRequestDispatcher("/pages/opd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String msg= "";
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("save".equalsIgnoreCase(btnclick)){
			
			//- ---------- patient object -----------------------
			String registrationNo = request.getParameter("registrationNo");
			
			Patient patient = new Patient();
			if("".equalsIgnoreCase(registrationNo.trim())){
				Date registrationDate = DateTimeUtil.ParseString(request.getParameter("registrationDate").trim());
				String regNo = generatePatientRegNo();
				String title =  request.getParameter("title").trim();
				String firstName =  request.getParameter("firstName").trim();
				String middleName =  request.getParameter("middleName").trim();
				String lastName =  request.getParameter("lastName").trim();
				String gender =  request.getParameter("gender").trim();
				Date birthDate =  DateTimeUtil.ParseString(request.getParameter("birthDate").trim());
				String contactInfo =  request.getParameter("contactInfo").trim();
				String referredBy =  request.getParameter("referredBy").trim();
				String bloodGroup =  request.getParameter("bloodGroup").trim();
				Integer weight =  MyObject.stringToInt(request.getParameter("weight"));
				String telephone =  request.getParameter("telephone").trim();
				String mobile =  request.getParameter("mobile").trim();
				String email =  request.getParameter("email").trim();
				String address =  request.getParameter("address").trim();
				String address1 =  request.getParameter("address1").trim();
				String address2 =  request.getParameter("address2").trim();
				String address3 =  request.getParameter("address3").trim();
				String area =  request.getParameter("area").trim();
				String district =  request.getParameter("district").trim();
				String city =  request.getParameter("city").trim();
				String state =  request.getParameter("state").trim();
				String zip =  request.getParameter("zip").trim();
				String country =  request.getParameter("country").trim();
				
				patient.setRegistrationDate(registrationDate);
				patient.setRegistrationNo(regNo);
				patient.setTitle(title);
				patient.setFirstName(firstName);
				patient.setMiddleName(middleName);
				patient.setLastName(lastName);
				patient.setGender(gender);
				patient.setBirthDate(birthDate);
				patient.setContactInfo(contactInfo);
				patient.setReferredBy(referredBy);
				patient.setBloodGroup(bloodGroup);
				patient.setWeight(weight);
				patient.setTelephone(telephone);
				patient.setMobile(mobile);
				patient.setEmail(email);
				patient.setAddress(address);
				patient.setAddress1(address1);
				patient.setAddress2(address2);
				patient.setAddress3(address3);
				patient.setArea(area);
				patient.setDistrict(district);
				patient.setCity(city);
				patient.setState(state);
				patient.setZip(zip);
				patient.setCountry(country);
				
				patientDAO.add(patient);
			}else{
				// got id  so load from database.
				patientDAO.findByRegistrationNo(registrationNo);
			}
			
			
			//---------- doctor object -----------------------
			Doctor doctor = new Doctor();
			Integer doctor_id = MyObject.stringToInt(request.getParameter("doctorId")); 
			doctor = doctorDAO.findById(doctor_id);
			
			String staffName = request.getParameter("staffName");
			Date entryDate = DateTimeUtil.ParseString(request.getParameter("entryDate"));
			String caseType = request.getParameter("caseType");
			String admissionNo = generateAdmissionId();
			Double consulationFee = MyObject.stringToDouble(request.getParameter("consulationFee"));
			
			if(consulationFee == null){
				consulationFee = 0.0; // Default price
			}
			
			Opd opd = new Opd();
			
			opd.setPatient(patient);
			opd.setDoctor(doctor);
			opd.setStaffName(staffName);
			opd.setEntryDate(entryDate);
			opd.setCaseType(caseType);
			opd.setAdmissionId(admissionNo);
			opd.setConsulationFee(consulationFee);
			
			
			OpdDAO opdDAO = new OpdDAO();
			opdDAO.add(opd);
			
		}else if("load".equalsIgnoreCase(btnclick)){
			String registrationNo = request.getParameter("patientRegistrationNo").trim();
			Patient patient =  patientDAO.findByRegistrationNo(registrationNo);
			if(patient == null){
				msg = "No patient found";
			}else{
				request.setAttribute("patient", patient);
			}
		}
		
		loadList(request);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/pages/opd.jsp").forward(request, response);
		
	}
	
	private void loadList(HttpServletRequest request){
		// ---------- patient list -----------
		List<Patient> patientlist= new ArrayList<Patient>();
		patientlist = patientDAO.getList();
		
		// ---------- doctor list -----------
		List<Doctor> doctorlist= new ArrayList<Doctor>();
		doctorlist = doctorDAO.getList();
		
		request.setAttribute("doctorlist", doctorlist);
		request.setAttribute("patientlist", patientlist);
		
	}
	
	private String generateAdmissionId(){
		OpdDAO opdDAO = new OpdDAO();
		Opd opd = opdDAO.getLatestOpd();
		if(opd == null){
			return "HMS/ADD_ID/1"; // inintial no patient present in database
		}
		
		String[] regNoParts = opd.getAdmissionId().split("/");
		int newRegIncrement =  Integer.parseInt(regNoParts[2]) + 1;
		return "HMS/ADD_ID/" + newRegIncrement;
	}
	
	private String generatePatientRegNo(){
		Patient patient = patientDAO.getLatestPatient();
		if(patient == null){
			return "HMS/PAT/1"; // inintial no patient present in database
		}
		
		String[] regNoParts = patient.getRegistrationNo().split("/");
		int newRegIncrement =  Integer.parseInt(regNoParts[2]) + 1;
		return "HMS/PAT/" + newRegIncrement;
	}

}
