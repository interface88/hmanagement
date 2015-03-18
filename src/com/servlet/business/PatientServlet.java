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
 * Servlet implementation class Ipd servlet
 */
public class PatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PatientDAO patientDAO = new PatientDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	IpdDAO ipdDAO = new IpdDAO();
	
   /**
    * @see HttpServlet#HttpServlet()
    */
   public PatientServlet() {
       super();
   }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if("edit".equalsIgnoreCase(action)){
			loadData(request);
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			Patient patient = patientDAO.findById(id);
			request.setAttribute("patient", patient);
			request.getRequestDispatcher("/pages/patientEdit.jsp").forward(request, response);
		}
		else if("delete".equalsIgnoreCase(action)){
			loadData(request);
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			String msg = "";
			Patient patient = patientDAO.findById(id);
			boolean flag = true;
			if(!patient.getIpds().isEmpty()){
				msg = "Cannot delete patient, IPD information is present. <br>";
				flag = false;
			}
			
			if(!patient.getOpds().isEmpty()){
				msg = "Cannot delete patient, Opd information is present. <br>";
				flag = false;
			}
			
			if(flag){
				patientDAO.delete(patient);
				msg = "Patient deleted successfully";
				// deletion of patient goes here
			}
			request.setAttribute("msg", msg);
			
			List<Patient> patientlist = new ArrayList<Patient>();
			patientlist = patientDAO.getList();
			request.setAttribute("patientlist", patientlist);
			request.getRequestDispatcher("/pages/patient.jsp").forward(request, response);
		}else{
			// ---------- patient list -----------
			List<Patient> patientlist = new ArrayList<Patient>();
			patientlist = patientDAO.getList();
			request.setAttribute("patientlist", patientlist);
			request.getRequestDispatcher("/pages/patient.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg = "";

		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("load".equalsIgnoreCase(btnclick)){
			
			OpdDAO opdDAO = new OpdDAO();
			String admissionId =  request.getParameter("admissionId").trim();
			Opd opd = opdDAO.findByAdmissionId(admissionId);
			if(opd != null){
				request.setAttribute("opd", opd);
				
			}else{
				msg = "Invalid Admission No";
			}
			loadData(request);
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/pages/ipdAdd.jsp").forward(request, response);
			return;
		}else if("update".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			String title =  request.getParameter("title").trim();
			String firstName =  request.getParameter("firstName").trim();
			String middleName =  request.getParameter("middleName").trim();
			String lastName =  request.getParameter("lastName").trim();
			String gender =  request.getParameter("gender").trim();
			String contactInfo =  request.getParameter("contactInfo").trim();
			String referredBy =  request.getParameter("referredBy").trim();
			String bloodGroup =  request.getParameter("bloodGroup").trim();
			Integer weight =  MyObject.stringToInt(request.getParameter("weight"));
			Integer day =  MyObject.stringToInt(request.getParameter("day"));
			Integer month =  MyObject.stringToInt(request.getParameter("month"));
			Integer year =  MyObject.stringToInt(request.getParameter("year"));
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
			
			
			Patient patient = patientDAO.findById(id);
			request.setAttribute("patient", patient);
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
			
			patientDAO.update(patient);
			request.setAttribute("msg", "Ipd updated successfull");
		}
		
		List<Patient> patientlist = new ArrayList<Patient>();
		patientlist = patientDAO.getList();
		request.setAttribute("patientlist", patientlist);
		
		request.setAttribute("msg",msg);
		request.getRequestDispatcher("/pages/patient.jsp").forward(request, response);
		
	}
	
	private void loadData(HttpServletRequest request) {

		// ---------- doctor list -----------
		List<Doctor> doctorlist = new ArrayList<Doctor>();
		doctorlist = doctorDAO.getList();
		request.setAttribute("doctorlist", doctorlist);

	}
}
