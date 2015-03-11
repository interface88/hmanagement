package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
		
		// ---------- patient list -----------
		List<Patient> patientlist= new ArrayList<Patient>();
		PatientDAO patientDAO = new PatientDAO();
		patientlist = patientDAO.getList();
		
		// ---------- doctor list -----------
		List<Doctor> doctorlist= new ArrayList<Doctor>();
		DoctorDAO doctorDAO = new DoctorDAO();
		doctorlist = doctorDAO.getList();
		
		request.setAttribute("doctorist", doctorlist);
		request.setAttribute("patientlist", patientlist);
		request.getRequestDispatcher("/pages/opd.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ---------- patient list -----------
		List<Patient> patientlist= new ArrayList<Patient>();
		PatientDAO patientDAO = new PatientDAO();
		patientlist = patientDAO.getList();
		
		// ---------- doctor list -----------
		List<Doctor> doctorlist= new ArrayList<Doctor>();
		DoctorDAO doctorDAO = new DoctorDAO();
		doctorlist = doctorDAO.getList();
		
		String msg= "";
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("add".equalsIgnoreCase(btnclick)){
			
			//- ---------- patient object -----------------------
			String patient_id = request.getParameter("patient_id").trim();
			
			Patient patient = new Patient();
			if("".equalsIgnoreCase(patient_id)){
				String code =  request.getParameter("code").trim();
				//Date registrationDate =  Date.parse(request.getParameter("registrationDate").trim());
				String title =  request.getParameter("title").trim();
				String firstName =  request.getParameter("firstName").trim();
				String middleName =  request.getParameter("middleName").trim();
				String lastName =  request.getParameter("lastName").trim();
				String gender =  request.getParameter("gender").trim();
				Integer day =  Integer.parseInt(request.getParameter("day").trim());
				Integer month =  Integer.parseInt(request.getParameter("month").trim());
				Integer year =  Integer.parseInt(request.getParameter("year").trim());
				String contactInfo =  request.getParameter("contactInfo").trim();
				String referredBy =  request.getParameter("referredBy").trim();
				String bloodGroup =  request.getParameter("bloodGroup").trim();
				Integer weight =  Integer.parseInt(request.getParameter("weight").trim());
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
				
				patient.setCode(code);
				//patient.setRegistrationDate(registrationDate);
				patient.setTitle(title);
				patient.setFirstName(firstName);
				patient.setMiddleName(middleName);
				patient.setLastName(lastName);
				patient.setGender(gender);
				patient.setDay(day);
				patient.setMonth(month);
				patient.setYear(year);
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
			}else{
				// got id  so load from database.
				patientDAO.findById(Integer.parseInt(patient_id));
				
			}
			
			
			//---------- doctor object -----------------------
			Doctor doctor = new Doctor();
			int doctor_id = Integer.parseInt(request.getParameter("doctor_id").trim()); 
			doctor = doctorDAO.findById(doctor_id);
			
			String staffName = request.getParameter("staffName");
			//Date entryDate = request.getParameter("entryDate");
			String caseType = request.getParameter("caseType");
			String admissionNo = request.getParameter("admissionNo");
			Double consulationFee = Double.parseDouble(request.getParameter("consulationFee"));
			
			
			
			Opd opd = new Opd();
			
			opd.setPatient(patient);
			opd.setDoctor(doctor);
			opd.setStaffName(staffName);
			//opd.setEntryDate(entryDate);
			opd.setCaseType(caseType);
			opd.setAdmissionId(admissionNo);
			opd.setConsulationFee(consulationFee);
			
			
			OpdDAO opdDAO = new OpdDAO();
			opdDAO.add(opd);
			
		}
		
		request.setAttribute("doctorist", doctorlist);
		request.setAttribute("patientlist", patientlist);
		request.getRequestDispatcher("/pages/opd.jsp").forward(request, response);
		
	}
	
	private String generateAdmissionNo(){
		return "ADMI1133";
	}

}
