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
public class IpdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PatientDAO patientDAO = new PatientDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	WardDAO wardDAO = new WardDAO();
	AdmissionTypeDAO admissionTypeDAO = new AdmissionTypeDAO();
	IpdDAO ipdDAO = new IpdDAO();
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
		
		String action = request.getParameter("action");
		
		if("addNew".equalsIgnoreCase(action)){
			loadData(request);
			request.getRequestDispatcher("/pages/ipdAdd.jsp").forward(request, response);
		}else if("edit".equalsIgnoreCase(action)){
			loadData(request);
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			Ipd ipd = ipdDAO.findById(id);
			
			//loading opd 
			OpdDAO opdDAO = new OpdDAO();
			Opd opd = opdDAO.findByAdmissionId(ipd.getAdmissionId());
			request.setAttribute("ipd", ipd);
			request.setAttribute("opd", opd);
			request.setAttribute("admissionDate", DateTimeUtil.DateToString(ipd.getAdmissionDate()));
			request.getRequestDispatcher("/pages/ipdEdit.jsp").forward(request, response);
		}else if("delete".equalsIgnoreCase(action)){
			String msg = "";
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			IpdDAO ipdDAO  = new IpdDAO();
			Ipd ipd = ipdDAO.findById(id);
			
			boolean flag = true;
			if(!ipd.getDischargeTickets().isEmpty()){
				msg = "Cannot delete IPD, Discharge Ticket information is present. <br>";
				flag = false;
			}
			
			if(!ipd.getFinalBills().isEmpty()){
				msg = "Cannot delete IPD, Final Bill information is present. <br>";
				flag = false;
			}
			
			if(flag){
				ipdDAO.delete(ipd);
				msg = "IPD deleted successfully";
				// deletion of patient goes here
			}
			request.setAttribute("msg", msg);
			
			List<Ipd> ipdlist =  ipdDAO.getList();
			request.setAttribute("ipdlist", ipdlist);
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/pages/opd.jsp").forward(request, response);
				
		}else{
			List<Ipd> ipdlist =  ipdDAO.getList();
			request.setAttribute("ipdlist", ipdlist);
			request.getRequestDispatcher("/pages/ipd.jsp").forward(request, response);
		}
		
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
				String wardName = request.getParameter("ward").trim();
				Integer bedNo = MyObject.stringToInt(request.getParameter("bedNo"));
				String admissionDiagnosis = request.getParameter("admissionDiagnosis").trim();
				String admissionDetail = request.getParameter("admissionDetail").trim();
				String admissionTreatment = request.getParameter("admissionTreatment").trim();
				String allergyDetail = request.getParameter("allergyDetail").trim();
				String specialNote = request.getParameter("specialNote").trim();
				Double advancePayment = MyObject.stringToDouble(request.getParameter("advancePayment"));
				String remark = request.getParameter("remark").trim();
				
				// ------- GETTING WARD CHARGES FROM DATABASE BY WARD NAME -------------
				Double wardCharges = 0.0;
				
				WardDAO wardDAO = new WardDAO();
				Ward ward = wardDAO.findByName(wardName);
				
				if(ward != null){
					wardCharges = ward.getRate();
				}
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
				ipd.setWard(wardName);
				ipd.setWardCharges(wardCharges);
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
				
				OpdDAO opdDAO = new OpdDAO();
				Opd opd = opdDAO.findByAdmissionId(ipd.getAdmissionId());
				
				request.setAttribute("msg", "IPD added successfully");
				request.setAttribute("opd", opd);
				request.setAttribute("ipd", ipd);
				request.getRequestDispatcher("/pages/ipdPrint.jsp").forward(request, response);
				return;
				
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
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/pages/ipdAdd.jsp").forward(request, response);
			return;
		}else if("update".equalsIgnoreCase(btnclick)){
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			
			Integer admissionTypeId = MyObject.stringToInt(request.getParameter("admissionTypeId"));
			AdmissionType admissionType = admissionTypeDAO.findById(admissionTypeId);
			Date admissionDate = DateTimeUtil.ParseString(request.getParameter("admissionDate"));
			String admissionTime = request.getParameter("admissionTime").trim();
			String wardName = request.getParameter("ward").trim();
			Integer bedNo = MyObject.stringToInt(request.getParameter("bedNo"));
			String admissionDiagnosis = request.getParameter("admissionDiagnosis").trim();
			String admissionDetail = request.getParameter("admissionDetail").trim();
			String admissionTreatment = request.getParameter("admissionTreatment").trim();
			String allergyDetail = request.getParameter("allergyDetail").trim();
			String specialNote = request.getParameter("specialNote").trim();
			Double advancePayment = MyObject.stringToDouble(request.getParameter("advancePayment"));
			String remark = request.getParameter("remark").trim();
			
			// ------- GETTING WARD CHARGES FROM DATABASE BY WARD NAME -------------
			Double wardCharges = 0.0;
			
			WardDAO wardDAO = new WardDAO();
			Ward ward = wardDAO.findByName(wardName);
			
			if(ward != null){
				wardCharges = ward.getRate();
			}
			
			Ipd ipd = ipdDAO.findById(id);
			ipd.setAdmissionType(admissionType);
			ipd.setAdmissionDate(admissionDate);
			ipd.setAdmissionTime(admissionTime);
			ipd.setWard(wardName);
			ipd.setWardCharges(wardCharges);
			ipd.setBedNo(bedNo);
			ipd.setAdmissionDiagnosis(admissionDiagnosis);
			ipd.setAdmissionDetail(admissionDetail);
			ipd.setAdmissionTreatment(admissionTreatment);
			ipd.setAllergyDetail(allergyDetail);
			ipd.setSpecialNote(specialNote);
			ipd.setAdvancePayment(advancePayment);
			ipd.setRemark(remark);
			
			ipdDAO.update(ipd);
			request.setAttribute("msg", "Ipd updated successfull");
		}else if("search".equalsIgnoreCase(btnclick)){
			Date startDate = DateTimeUtil.ParseString(request.getParameter("startDate"));
			Date endDate = DateTimeUtil.ParseString(request.getParameter("endDate"));
			
			List<Ipd> ipdlist =  ipdDAO.getListByDate(startDate, endDate);
			request.setAttribute("ipdlist", ipdlist);
			request.setAttribute("startDate", request.getParameter("startDate"));
			request.setAttribute("endDate", request.getParameter("endDate"));
			request.getRequestDispatcher("/pages/ipd.jsp").forward(request, response);
			return;
		}
		
		List<Ipd> ipdlist =  ipdDAO.getList();
		request.setAttribute("ipdlist", ipdlist);
		
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
