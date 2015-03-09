package com.servlet.business;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myclasses.doctor;

import common.commonmethods;
import common.dbconnection;

/**
 * Servlet implementation class doctor_master
 */
public class LoginTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	dbconnection db=null;
	ArrayList<String> doctornames=null;
	ArrayList<String> departmentlist=null;
	doctor doctordetails=null;
	String isedit="no";
	String selecteddoctor=""; // doctor select for edit.
	
	
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginTypeServlet() {
        super();
        db=new dbconnection();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();		
		if(!commonmethods.checkSession(session))
		{
			response.sendRedirect("index.jsp");
			
		}else
		{
			db.open();
			doctornames= db.executeGetQuery("select name from doctor");		//getting all doctors name for dropdown	
			db.close();
			request.setAttribute("doctornames", doctornames);
			
			db.open();
			departmentlist= db.executeGetQuery("select name from department");  // getting all departments name for dropdown
			db.close();
			request.setAttribute("department", departmentlist);
			
			//setting blank doctor object for first time blank fields.
			doctordetails=new doctor();
			request.setAttribute("doctordetails", doctordetails);
			
			
			
			request.setAttribute("edit", isedit);
			request.getRequestDispatcher("/pages/master/doctor.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();	
		String msg="";
		if(!commonmethods.checkSession(session))
		{
			response.sendRedirect("index.jsp");
		}else
		{
			try
			{
						
				String btnclick = request.getParameter("action");  // checking which button clicked save, delete, edit or show
				
				if(btnclick.equalsIgnoreCase("delete")) // delete a doctor
				{
					
					String doctorname = request.getParameter("ddldoctor").trim();
					if(!doctorname.equals("-1"))
					{
						db.open();
						boolean b= db.executeUpdateQuery("delete from doctor where name='"+doctorname+"'");
						db.close();
					
						if(!b)
						{
							msg="Doctor deleted Successfully.";
							db.open();
							ArrayList<doctor> Alldoctordetails= db.getDoctorDetails("Select * from doctor where name='"+doctorname+"'");								
							doctordetails=Alldoctordetails.get(0);
							db.close();
						}
						else
						{
							msg="Unable to delete Doctor.";
						}
						isedit="false";
					}
				}else
				{
					if(btnclick.equalsIgnoreCase("save"))  // add new doctor
					{
						
						String name="";
						String address = request.getParameter("txtaddress1").trim()+"__"+request.getParameter("txtaddress2").trim();
						String department = request.getParameter("ddldepartment").trim();
						String qualification = request.getParameter("txtqualification").trim();
						String consultation_fee = request.getParameter("txtfee").trim();
						String weekly_off_day = request.getParameter("txtweekoff").trim();
						String duty_hrs = request.getParameter("txtdutyhours").trim();
						db.open();
						int code=db.getCode("department", "name", department);
						String iseditrocord=request.getParameter("txtedit").trim();
						boolean b=true;
						String task="";
						if(iseditrocord.equalsIgnoreCase("no"))
						{
							name = request.getParameter("txtname").trim();
							b= db.executeUpdateQuery("insert into doctor values(null,'"+name+"','"+address+"',"+code+",'"+duty_hrs+"','"+qualification+"','"+consultation_fee+"','"+weekly_off_day+"')");
							task="Added";
							 isedit="yes";
						}
						else
						{
							String q="update doctor  set address='"+address+"',department_code="+code+",duty_hrs='"+duty_hrs+"',qualification='"+qualification+"',consultation_fee='"+consultation_fee+"',weekly_off_day='"+weekly_off_day+ "' where name='"+selecteddoctor+"'";
							 b= db.executeUpdateQuery(q);
							 task="Updated";
							 name=selecteddoctor;
							 isedit="yes";
						}
						db.close();
						if(!b)
						{
							msg="Doctor Information "+task+" Successfully.";

							
						}
						else
						{
							msg="Unable to "+task+" Doctor Information.";
						}
						db.open();
						ArrayList<doctor> Alldoctordetails= db.getDoctorDetails("Select * from doctor where name='"+name+"'");								
						doctordetails=Alldoctordetails.get(0);

						
						isedit="false";
					}
					else
					{
						if(btnclick.equalsIgnoreCase("show"))
						{
							String doctorname = request.getParameter("ddldoctor").trim();
							selecteddoctor=doctorname;
							request.setAttribute("selecteddoctor", selecteddoctor);
							if(!doctorname.equals("-1"))
							{
								db.open();
								ArrayList<doctor> Alldoctordetails= db.getDoctorDetails("Select * from doctor where name='"+doctorname+"'");								
								doctordetails=Alldoctordetails.get(0);
								db.close();
								isedit="yes";  //flag for edit, after show user can edit that doctor details.
								
							}
						}else
						{
							if(btnclick.equalsIgnoreCase("add"))
							{
									doctordetails=new doctor();
								
									isedit="no";  //flag for edit, after show user can edit that doctor details.
									
								
							}
						}
						
					}
				}
				db.close();
				db.open();
				doctornames= db.executeGetQuery("select name from doctor");		//getting all doctors name for dropdown	
				db.close();
				request.setAttribute("msg",msg);
				request.setAttribute("doctordetails", doctordetails);
				request.setAttribute("doctornames", doctornames);
				request.setAttribute("department", departmentlist);
				request.setAttribute("edit", isedit);
				request.getRequestDispatcher("/pages/master/doctor.jsp").forward(request, response);
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}

}
