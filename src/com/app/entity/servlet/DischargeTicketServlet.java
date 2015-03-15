package com.app.entity.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.master.Doctor;
import com.app.master.DoctorDAO;
import com.app.master.Ipd;
import com.app.master.IpdDAO;
import com.app.master.PatientDAO;
import com.app.entity.DischargeTicket;
import com.app.entity.DischargeTicketDAO;
import com.app.framework.DateTimeUtil;

/**
 * Servlet implementation class doctor_master
 */
public class DischargeTicketServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	DischargeTicketDAO dischargeTicketDAO = new DischargeTicketDAO();
	PatientDAO patientDAO = new PatientDAO();
	IpdDAO ipdDAO = new IpdDAO();
	DoctorDAO doctorDAO = new DoctorDAO();
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public DischargeTicketServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DischargeTicket dischargeTicket = new DischargeTicket();
		dischargeTicket.setStaffName("Default Staff name");
		request.setAttribute("dischargeTicket", dischargeTicket);
		
		request.getRequestDispatcher("/pages/dischargeTicket.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg= "";
		
		String btnclick = request.getParameter("action");
		
		// ----------checking action to perform --------------
		if("submit".equalsIgnoreCase(btnclick)){
			
			DischargeTicket dischargeTicket = new DischargeTicket();
			
			String admissionId = request.getParameter("admissionId").trim();
			String advice = request.getParameter("advice").trim();
			String conditionOfPatient = request.getParameter("conditionOfPatient").trim();
			Integer patientId = Integer.parseInt(request.getParameter("patientId").trim());
			Integer doctorId = Integer.parseInt(request.getParameter("doctorId").trim());
			String entryDate =  request.getParameter("entryDate").trim();
			String examingTime = request.getParameter("examingTime").trim();
			String followUpSchedule = request.getParameter("followUpSchedule").trim();
			Integer ipdId = Integer.parseInt(request.getParameter("ipdId").trim());
			String prescribedMedicine = request.getParameter("prescribedMedicine").trim();
			String pressure = request.getParameter("pressure").trim();
			String pulse = request.getParameter("pulse").trim();
			String remark = request.getParameter("remark").trim();
			String staffName = request.getParameter("staffName").trim();
			String sugar = request.getParameter("sugar").trim();
			String weight = request.getParameter("weight").trim();
			String temperature = request.getParameter("temperature").trim();
			String treatementNote = request.getParameter("treatmentNote").trim();
			String dischargeNote = request.getParameter("dischargeNote").trim();

			dischargeTicket.setAdmissionId(admissionId);
			dischargeTicket.setAdvice(advice);
			dischargeTicket.setConditionOfPatient(conditionOfPatient);
			dischargeTicket.setDoctor(doctorDAO.findById(doctorId));
			dischargeTicket.setEntryDate(DateTimeUtil.ParseString(entryDate));
			dischargeTicket.setExamingTime(examingTime);
			dischargeTicket.setFollowUpSchedule(followUpSchedule);
			dischargeTicket.setIpd(ipdDAO.findById(ipdId));
			dischargeTicket.setPatient(patientDAO.findById(patientId));
			dischargeTicket.setPrescribedMedicine(prescribedMedicine);
			dischargeTicket.setPressure(pressure);
			dischargeTicket.setPulse(pulse);
			dischargeTicket.setRemark(remark);
			dischargeTicket.setStaffName(staffName);
			dischargeTicket.setSugar(sugar);
			dischargeTicket.setWeight(weight);
			dischargeTicket.setTemperature(temperature);
			dischargeTicket.setTreatmentNote(treatementNote);
			dischargeTicket.setDischargeNote(dischargeNote);
			
			dischargeTicketDAO.add(dischargeTicket);
			
		}else if("load".equalsIgnoreCase(btnclick)){
			
			Ipd ipd = ipdDAO.findByAdmissionId(request.getParameter("admissionId"));
			
			DischargeTicket dischargeTicket = new DischargeTicket();
			dischargeTicket.setStaffName("Default Staff name");
			
			if(ipd != null){
				request.setAttribute("ipd", ipd);
				
			}else{
				msg = "No data to load";
			}
			
			loadData(request);
			
			request.setAttribute("dischargeTicket", dischargeTicket);
		}
		
		request.setAttribute("msg",msg);
		request.getRequestDispatcher("/pages/dischargeTicket.jsp").forward(request, response);
	}
	
private void loadData(HttpServletRequest request){
		
		// ---------- doctor list -----------
		List<Doctor> doctorlist= new ArrayList<Doctor>();
		doctorlist = doctorDAO.getList();
		
		request.setAttribute("doctorlist", doctorlist);
		
	}

}
