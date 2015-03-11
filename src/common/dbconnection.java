package common;
import java.lang.Thread.State;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.ResourceBundle;

import com.app.master.Doctor;
import com.app.master.Staff;


public class dbconnection {
	private Connection conn = null;
	private Statement stmt=null;
	private String hostname="";
	private String port="";
	private String dbname="";
	private String username="";
	private String password="";

	ResourceBundle res=ResourceBundle.getBundle("connection");   //accessing all parameter required for database connection

	public dbconnection()  // constructor
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");			

		}catch(Exception e)
		{
			System.out.println("error in dbconnection constructor");
			e.printStackTrace();
		}
	}

	// Establishing database connection
	public void open()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			if(conn==null|| conn.isClosed())
			{
				hostname=res.getString("hostname");
				port=res.getString("port");
				dbname=res.getString("dbname");
				username=res.getString("username");
				password=res.getString("password");
				String url="jdbc:mysql://"+hostname+":"+port+"/"+dbname+"?autoReconnect=true";   // creating database connection string
				conn = DriverManager.getConnection(url,username, password);
			}

		}catch(Exception e)
		{
			System.out.println("error in dbconnection open connection");
			e.printStackTrace();
		}
	}

	//================ User login=========================================================================

	public Staff login(String userId, String password) 
	{

		Staff stf=new Staff();
		try
		{
			// Getting staff information from staff table.
			String qry="select * from  staff where user_id='"+userId+"' and password='"+password+"'";
			stmt=conn.createStatement();
			ResultSet rs= stmt.executeQuery(qry);
			int dep_code=0;
			int login_type=0;
			if(rs.next())
			{
				stf.setId(rs.getInt("id"));
				stf.setCode(rs.getString("code"));
				stf.setName(rs.getString("name"));
				stf.setAddress1(rs.getString("address1"));
				dep_code=(rs.getInt("department_id"));				
				stf.setDutyHours(rs.getString("duty_hrs"));
				stf.setQualification(rs.getString("qualification"));
				login_type=rs.getInt("login_type_id");				
				stf.setUserId(rs.getString("user_id"));			

				rs.close();

				// Getting department name from department table.
				qry="select * from  department where code="+dep_code;
				stmt=conn.createStatement();
				rs= stmt.executeQuery(qry);
				if(rs.next())
				{
					//stf.setDepartmentCode(rs.getString("name"));
				}
				rs.close();
			}	
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return stf;   //return staff details

	}


	//===================Checking user Exists or not=============================================================

	public boolean isUserExists(String userId)
	{		
		boolean isExists=true;
//		try
//		{
//			String qry="select * from staff where user_id='"+userId+"'";
//			stmt=conn.createStatement();
//			ResultSet rs= stmt.executeQuery(qry);
//			if(rs.next())
//				isExists= true;
//			else
//				isExists= false;
//			rs.close();
//			stmt.close();
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
		return isExists;
	}

	//====================================================================================================

	//  function that return arraylist of arraylist with required fields.
	// return multiple rows with multiple column
	// Input quiry and required field
	public ArrayList<ArrayList<String>> executeGetQuery(String qry, ArrayList<String> requiredFields)
	{
		ArrayList<ArrayList<String>> res=new ArrayList<ArrayList<String>>();
		ResultSet rs=null;
		try
		{
			
			stmt=conn.createStatement();
			rs= stmt.executeQuery(qry);

			while(rs.next()) //retriving row by row
			{
				ArrayList<String> l=new ArrayList<String>();
				if(requiredFields.size()==0)  //retriving all column if requiredField arraylist is blank (s
				{
										
					l.add(Integer.toString(rs.getInt("code")));
					l.add(rs.getString("name"));
					l.add(rs.getString("address"));
					l.add(rs.getString("qualification"));
					l.add(Integer.toString(rs.getInt("department_code")));
					l.add(rs.getString("consultation_fee"));
					l.add(rs.getString("weekly_day_off"));
					l.add(rs.getString("duty_hours"));
					
				}else
				{
					for(int i=0;i<requiredFields.size();i++) 
					{					
						l.add(rs.getString(requiredFields.get(i)));  //retriving required column and putting them into arraylist
					}
					res.add(l);
				}
			}
			rs.close();
			stmt.close();
		}
		catch(Exception e)
		{
			System.out.println("Error in dbconnection:- executeQuery function");
			e.printStackTrace();
		}
		return res;
	}

	
	
	//====================================================================================================
	// This function only execute a query, function used when we want to use delete  update or insert
	public boolean executeUpdateQuery(String qry)  
	{
		boolean b = false;
		try
		{
			stmt=conn.createStatement();
			b=stmt.execute(qry);			
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return b;

	}
	
	//====================================================================================================
	// This function for execute a query with single column
	//means it return only arraylist which have only a column
	public ArrayList<String> executeGetQuery(String qry) 
	{
		ArrayList<String> row= new ArrayList<String>();
		ResultSet rs=null;
		try
		{
			stmt=conn.createStatement();
			rs= stmt.executeQuery(qry);

			while(rs.next()) //retriving row by row
			{									
				row.add(rs.getString(1));  //retriving column and putting them into arraylist				
			}
			rs.close();
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return row;

	}
	
	//=======================================
	// This function return code (pk) of the table
	public int getCode(String tableName, String whereFieldName, String WhereFieldValue)
	{
		int code=0;
		try
		{
			stmt=conn.createStatement();
			String qry="select code from "+tableName+" where "+whereFieldName+"= '"+WhereFieldValue+"'";
			ResultSet rs= stmt.executeQuery(qry);
					
			if(rs.next())
			{
				code=rs.getInt("code");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	
	//=============================== 
	// This function return Object of doctor with a doctor details.
	public ArrayList<Doctor> getDoctorDetails(String qry)
	{
		ArrayList<Doctor> doctors=new ArrayList<Doctor>();
		try
		{
			// Getting staff information from doctor table.
			
			//stmt=conn.createStatement();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ResultSet rs= stmt.executeQuery(qry);
			int dep_code=0;
			
			while(rs.next())
			{
				Doctor doc=new Doctor();
				//doc.setCode(Integer.parseInt(rs.getString("code")));
				doc.setName(rs.getString("name"));
				String add=rs.getString("address");
				String address1="";
				String address2="";
				if(add.contains("__"))
				{
					String address[]=add.split("__");
					address1=address[0];
					address2=address[1];
				}
				else
				{
					address1=add;
				}
				doc.setAddress1(address1);
				doc.setAddress2(address2);
				dep_code=Integer.parseInt(rs.getString("department_code"));				
				doc.setDutyHours(rs.getString("duty_hrs"));
				doc.setQualification(rs.getString("qualification"));
				doc.setWeeklyoff(rs.getString("weekly_off_day"));
				doc.setConsultationfee(rs.getString("consultation_fee"));
				

				// Getting department name from department table.
				qry="select * from  department where code="+dep_code;
				
				Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ResultSet rs1= stmt1.executeQuery(qry);
				if(rs1.next())
				{
					//doc.setDepartment(rs1.getString("name"));
				}
				stmt1.close();
				doctors.add(doc);
			}	
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return doctors;   //return doctor details

	}	
	
	
	
	
	//old
	//====================================================================================================
	public void deleteWebsite(String webUrl)
	{
		try
		{
			stmt=conn.createStatement();
			String qry="select id from hostingrequest where appaddress='"+webUrl+"'";
			stmt.execute(qry);
			ResultSet rs= stmt.executeQuery(qry);
			int requestid=0;
			if(rs.next())
			{
				requestid=rs.getInt(1);
			}
			rs.close();

			qry="delete from hostingrequest where  appaddress='"+webUrl+"'";
			stmt.execute(qry);

			qry="delete from appdetails where  requestid="+requestid;
			stmt.execute(qry);			
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection => addUser");
			e.printStackTrace();
		}
	}

	public void addUser(String name, String username,String password, String role, int status )
	{
		try
		{
			String qry="insert into login values(null,'"+name+"','"+username+"','"+password+"',"+status+",'"+role+"')";
			stmt=conn.createStatement();			
			stmt.execute(qry);
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection => addUser");
			e.printStackTrace();
		}

	}

	public String getUserRole(String userName)
	{
		String userrole="";
		try
		{
			String qry="select role from login where username='"+userName+"'";
			stmt=conn.createStatement();
			ResultSet rs= stmt.executeQuery(qry);
			if(rs.next())
				userrole= rs.getString(1);

			rs.close();
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return userrole;
	}



	//


	//	public String getLoginUserDesignation(String userName)
	//	{
	//		String designation="";
	//		try
	//		{
	//			String query="select designation from designation where id=(select designation from login where username='"+userName+"')";
	//			ResultSet rs=  statement.executeQuery(query);			
	//			if(rs.next())
	//			{
	//				designation=rs.getString(1);
	//			}
	//		}
	//		catch (Exception e) {
	//			e.printStackTrace();
	//		}
	//		return designation;
	//	}



	public ArrayList<String> getAllAppName()
	{
		ArrayList<String> res=new ArrayList<String>();
		ResultSet rs=null;
		try
		{
			String qry="select appname from appdetails";
			stmt=conn.createStatement();
			rs= stmt.executeQuery(qry);
			while(rs.next())
			{
				res.add(rs.getString(1));
			}
			rs.close();
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection:- getAllAppName function");
			e.printStackTrace();
		}
		return res;
	}

	public ArrayList<webobject> getWebObjectList(String WhereField, String value)
	{
		ArrayList<webobject> webdetailList=null;
		try
		{

			String qry="select * from appdetails,hostingrequest";	
			qry+=" where hostingrequest.id=appdetails.requestid and "+WhereField+" = '"+value+"'";
			System.out.println("Query "+qry);
			stmt=conn.createStatement();
			ResultSet rs= stmt.executeQuery(qry);
			commonmethods mymethod=new commonmethods();
			webdetailList =mymethod.convertToWebObjectList(rs);

			rs.close();
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection : getWebObjectList Method");
		}
		return webdetailList;
	}




	public void DeleteSafetohost(String appname, String filename)
	{
		try
		{
			stmt=conn.createStatement();
			String qry="select id from appdetails where appname='"+appname+"'";
			System.out.println("Qry select  "+qry);
			ResultSet res=stmt.executeQuery(qry);
			int appid=0;
			if(res.next())
				appid=res.getInt(1);
			res.close();			

			qry=" delete from sthdetails where appid="+appid+" and filename like '%"+filename+"'";
			System.out.println("delete qry "+qry);

			stmt.execute(qry);
			stmt.close();

		}catch(Exception e)
		{
			System.out.println("Error in dbconnection deletesafetohost Methd "+e.getStackTrace());
		}
	}

	public void InsertSafetohost(String appname, String filename, String validfrom,String validto, boolean isexpired, boolean isvulnerable,String conclusion)
	{
		try
		{

			DateFormat dateFormat = new SimpleDateFormat("M/d/yyyy");
			Date d_validfrom=dateFormat.parse(validfrom);
			Date d_validto=dateFormat.parse(validto);
			DateFormat dateFormat1 = new SimpleDateFormat("yyyy/MM/dd");
			validfrom=dateFormat1.format(d_validfrom);
			validto=dateFormat1.format(d_validto);

			//Date k=dateFormat.format(d_validto);

			stmt=conn.createStatement();
			String qry="select id from appdetails where appname='"+appname+"'";
			System.out.println("Qry select  "+qry);
			ResultSet res=stmt.executeQuery(qry);
			int appid=0;
			if(res.next())
				appid=res.getInt(1);
			res.close();			

			qry="insert into sthdetails values(null,"+appid+",'"+filename+"','"+validfrom+"','"+validto+"',"+isexpired+","+isvulnerable+",'"+conclusion+"')";
			System.out.println("insert qry "+qry);

			stmt.execute(qry);
			stmt.close();

		}catch(Exception e)
		{ 
			System.out.println("error in dbconnection insertsafetohost");
			e.printStackTrace();
		}

	}

	public int getAppid(String appname)
	{
		int appid=0;
		try
		{
			stmt=conn.createStatement();
			String qry="select id from appdetails where appname='"+appname+"'";
			System.out.println("Qry select  "+qry);
			ResultSet res=stmt.executeQuery(qry);
			if(res.next())
				appid=res.getInt(1);
			res.close();	
			stmt.close();
		}catch(Exception e)
		{ 
			System.out.println("error in dbconnection getappid");
			e.printStackTrace();
		}
		return appid;
	}

	public int addwebrequest(String appaddress, String depname, String nodalofficer, String designation, String depphoneoffice, String depmoblie, String depemail, String devcompany, String dcontactperson, String dphoneoffice, String dmobileno, String demail, String fmsexpirydate, int webformno, String webformpath, String auditreppath,String pending, String remarks,String appname, String typeofapplication, String natureofapp,String curstatus,String developedin,String database,String serveros,String servertag,String serverip,String priority)
	{
		int requestid=0;
		try
		{
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();


			//System.out.println(dateFormat.format(cal.getTime()));
			Date d=new Date();

			System.out.print("Date" +dateFormat.format(d));
			//dateFormat.format(d);String s=dateFormat.format(d);
			String qry="insert into hostingrequest values('"+appaddress+"','"+depname+"','"+nodalofficer+"','"+designation+"','"+depphoneoffice+"','"+depmoblie+"','"+depemail+"','"+devcompany+"','"+dcontactperson+"','"+dphoneoffice+"','"+dmobileno+"','"+demail+"','"+fmsexpirydate+"','"+dateFormat.format(d)+"','"+dateFormat.format(d)+"',"+webformno+",'"+webformpath+"','"+auditreppath+"','"+pending+"','"+remarks+"',null)";
			System.out.println("insert qry "+qry);
			stmt=conn.createStatement();
			stmt.execute(qry);

			qry="select id from hostingrequest where appaddress='"+appaddress+"'";
			ResultSet rs= stmt.executeQuery(qry);

			if(rs.next())
			{
				requestid=rs.getInt(1);
			}
			rs.close();
			qry="insert into appdetails values(null,"+requestid+",'"+appname+"','"+typeofapplication+"','"+natureofapp+"','"+curstatus+"','"+developedin+"','"+database+"','"+serveros+"','"+servertag+"','"+serverip+"','"+priority+"','','')";
			stmt.execute(qry);
			stmt.close();

		}catch(Exception e)
		{ 
			System.out.println("error in dbconnection addwebrequest");
			e.printStackTrace();
		}
		return requestid;
	}


	public void editwebrequest(String depname, String nodalofficer, String designation, String depphoneoffice, String depmoblie, String depemail, String devcompany, String dcontactperson, String dphoneoffice, String dmobileno, String demail, String fmsexpirydate, int webformno, String webformpath, String auditreppath,String pending, String remarks,String appname, String typeofapplication, String natureofapp,String curstatus,String developedin,String database,String serveros,String servertag,String serverip,String priority,String whereAppAddress)
	{
		try
		{
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			//System.out.println(dateFormat.format(cal.getTime()));
			Date d=new Date();
			System.out.print("Date" +dateFormat.format(d));
			//dateFormat.format(d);String s=dateFormat.format(d);
			String qry="update  hostingrequest set " +
					"depname='"+depname+"'," +
					"nodalofficername='"+nodalofficer+"'," +
					"designation='"+designation+"'," +
					"depphoneoffice='"+depphoneoffice+"'," +
					"depmobile='"+depmoblie+"'," +
					"depemail='"+depemail+"'," +
					"devcompany='"+devcompany+"'," +
					"dcontactperson='"+dcontactperson+"'," +
					"dphoneoffice='"+dphoneoffice+"'," +
					"dmobile='"+dmobileno+"'," +
					"demail='"+demail+"'," +
					"fmsexpirydate='"+fmsexpirydate+"'," +
					"requestdate='"+dateFormat.format(d)+"'," +
					"hostingdate='"+dateFormat.format(d)+"'," +
					"webformno="+webformno+"," +
					"webformpath='"+webformpath+"'," +
					"webauditreppath='"+auditreppath+"'," +
					"pendingdata='"+pending+"'," +
					"remarks='"+remarks+"'";
			qry+=" where appaddress='"+whereAppAddress+"'";

			System.out.println("qry "+qry);

			stmt=conn.createStatement();
			stmt.execute(qry);

			qry="select id from hostingrequest where appaddress='"+whereAppAddress+"'";
			stmt.execute(qry);
			ResultSet rs= stmt.executeQuery(qry);
			int requestid=0;
			if(rs.next())
			{
				requestid=rs.getInt(1);
			}
			rs.close();

			qry="update appdetails set "+
					"appname='"+appname+"',"+
					"typeofapp='"+typeofapplication+"',"+
					"natureofapp='"+natureofapp+"',"+
					"curstatus='"+curstatus+"',"+
					"developedin='"+developedin+"',"+
					"databaseuse='"+database+"',"+
					"serveros='"+serveros+"',"+
					"servertag='"+servertag+"',"+
					"serverip='"+serverip+"',"+
					"priority='"+priority+"'";
			qry+=" where requestid='"+requestid+"'";

			System.out.println("qry "+qry);

			stmt.execute(qry);
			stmt.close();

		}catch(Exception e)
		{ 
			System.out.println("error in dbconnection addwebrequest");
			e.printStackTrace();
		}
	}

	public ArrayList<webobject> getNewHostingApproval()
	{
		ArrayList<webobject> webdetailList=null;
		try
		{
			String qry="select * from appdetails,hostingrequest where hostingrequest.id=appdetails.requestid and hostingrequest.id in (select requestid from newhostingstatus where approvalforhosting=0)";
			System.out.println("Query "+qry);
			stmt=conn.createStatement();
			ResultSet rs= stmt.executeQuery(qry);
			commonmethods mymethod=new commonmethods();
			webdetailList =mymethod.convertToWebObjectList(rs);
			rs.close();
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection : getNewHostingApproval Method");
		}
		return webdetailList;
	}

	public void inserIntoHostingStatus(int requestid, String comments)
	{
		try
		{

			String qry="insert into newhostingstatus (requestid,comment) values("+requestid+",'"+comments+"')";
			System.out.println("Query "+qry);
			stmt=conn.createStatement();
			stmt.execute(qry);
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection : inserIntoHostingStatus Method");
		}
	}

	public void updateNewHostingApproval(ArrayList<String> appnames)
	{
		try
		{

			String qry="update newhostingstatus set approvalforhosting=1 where requestid in (";
			for(int i=0;i<appnames.size();i++)
			{
				qry+=getHostingrequestId(appnames.get(i));
				if(i!=appnames.size()-1)
				{
					qry+=",";
				}								
			}
			qry+=")";

			System.out.println("Query "+qry);
			stmt=conn.createStatement();
			stmt.execute(qry);
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection : updateNewHostingApproval Method");
		}
	}


	public ArrayList<webobject> getNewHostingRequest()
	{
		ArrayList<webobject> webdetailList=null;
		try
		{
			String qry="select * from appdetails,hostingrequest where hostingrequest.id=appdetails.requestid and hostingrequest.id in (select requestid from newhostingstatus where hostingstatus=0 and approvalforhosting=1)";
			System.out.println("Query "+qry);
			stmt=conn.createStatement();
			ResultSet rs= stmt.executeQuery(qry);
			commonmethods mymethod=new commonmethods();
			webdetailList =mymethod.convertToWebObjectList(rs);
			rs.close();
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection : getNewHosting Method");
		}
		return webdetailList;
	}

	public void updateNewHostingRequest(ArrayList<String> appnames)
	{
		try
		{

			String qry="update newhostingstatus set hostingstatus=1 where requestid in (";
			for(int i=0;i<appnames.size();i++)
			{
				qry+=getHostingrequestId(appnames.get(i));
				if(i!=appnames.size()-1)
				{
					qry+=",";
				}								
			}
			qry+=")";

			System.out.println("Query "+qry);
			stmt=conn.createStatement();
			stmt.execute(qry);
			stmt.close();
		}catch(Exception e)
		{
			System.out.println("Error in dbconnection : updateNewHostingRequest Method");
		}
	}

	private int getHostingrequestId(String appname)
	{
		int requestid=0;
		try
		{
			stmt=conn.createStatement();
			String qry="select requestid from appdetails where appname='"+appname+"'";
			System.out.println("Qry select  "+qry);
			ResultSet res=stmt.executeQuery(qry);
			if(res.next())
				requestid=res.getInt(1);
			res.close();	
			stmt.close();
		}catch(Exception e)
		{ 
			System.out.println("error in dbconnection getHostingrequestId "+e.getStackTrace());
			e.printStackTrace();
		}
		return requestid;
	}

	public void close()
	{
		try
		{
			if(conn!=null)
			{
				if(!conn.isClosed())
					conn.close();
			}
		}catch(Exception e)
		{
			System.out.println("error in dbconnection close connection");
			e.printStackTrace();
		}
	}



}
