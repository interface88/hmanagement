package common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class constants {
	
	public static String webformpath="RSDC/Webforms/";
	public static String auditreportpath="RSDC/AuditReports/";

	public enum role{
		user,
		admin,
		superadmin,
		requester,
		hostingmgr
	};
	

	public enum apptype{
		Application,
		Website,
		Portal
	};
	public enum appnature
	{
		G2G,
		G2B,
		G2C
	};

	public enum curstatus
	{
		staging("staging"),production("production"),underdeployment("under deployment"),datapendency("data pendency"),undermantinance("under mantinance"),stopped("stopped"),undeployed("undeployed");		

		private final String displayName;  
		curstatus(final String display)
		{
			this.displayName = display;  
		}  

		@Override public String toString()  
		{  
			return this.displayName;  
		}		
	};

	public enum developendIn
	{
		java,
		vbdotnet,
		aspdotnet,
		php
	};

	public enum apppriority
	{
		normal,
		midium,
		high
	};

	public enum hostingserver
	{
		windows2008,
		windows2005,
		linux
	};

	public enum database
	{
		sql,
		mysql,
		oracle,
		sqlite,
		db2,
		postgresql
	};

	public enum pendingdata
	{
		none,
		website,
		database,
		audit_report,
		all
	};
	
	public static HashMap<String, String> where = new HashMap<String, String>(){{

		put("appname","App Name");
		put("appaddress","Web Address");
		put("typeofapp","Type of App");
		put("natureofapp","Nature of App");
		put("curstatus","Current Status");
		put("developedin","Developed In");
		put("databaseuse","Database");
		put("serveros","Server OS");
		put("servertag","Server Tag");
		put("serverip","Server IP");
		put("priority","Priority");
		put("webformno","Web Form No");
		put("pendingdata","Pending Data");		
	}};

	public static HashMap<String, String> condition = new HashMap<String, String>(){{

//		put("<","<");
//		put(">",">");
		put("=","=");
//		put("<=","<=");
//		put(">=",">=");
		put("!=","!=");
		put("like","contains");
		put("startwith","startwith");
		put("endswith","endwith");			
	}};
	
	public static HashMap<String, String> appInfoDisplayFields = new HashMap<String, String>(){{

		put("appname","App Name");
		put("appaddress","Web Address");
		put("typeofapp","Type of App");
		put("natureofapp","Nature of App");
		put("curstatus","Current Status");
		put("developedin","Developed In");
		put("databaseuse","Database");
		put("serveros","Server OS");
		put("servertag","Server No");
		put("serverip","Server IP");
		put("priority","Priority");
		put("webformno","Web Form No");
		put("requestdate","Request Date");
		put("hostingdate","Hosting Date");
		put("pendingdata","Pending Data");
		//put("webformpath","Web Form");
		//put("webauditreppath","Audit Report");
		put("remarks","Remarks");
	}};

	//	public enum appInfoDisplayFields
	//	{		
	//		appname("App Name"),
	//		webaddress("Web Address"),
	//		typeofapp("Type of App"),
	//		natureofapp("Nature of App"),
	//		currentstatus("Current Status"),
	//		developedin("Developed In"),
	//		database("Database"),
	//		severos("Server OS"),
	//		serverno("Server No"),
	//		serverIP("Server IP"),
	//		priority("Priority"),
	//		webformno("Web Form No"),
	//		requestdate("Request Date"),
	//		hostingdate("Hosting Date"),
	//		pendingdata("Pending Data"),
	//		webform("Web Form"),
	//		auditrep("Audit Report"),
	//		remarks("Remarks");
	//
	//		private final String displayName;  
	//		appInfoDisplayFields(final String display)
	//		{
	//			this.displayName = display;  
	//		}  
	//
	//		@Override public String toString()  
	//		{  
	//			return this.displayName;  
	//		}		
	//	};


	public static HashMap<String, String> departmentInfoDisplayFields = new HashMap<String, String>(){{

		put("depname","Department");
		put("nodalofficername","Nodal Officer");
		put("designation","Designation");
		put("depphoneoffice","Phone Office");
		put("depmobile","D_Mobile No");
		put("depemail","D_Email");
	}};
	//	public enum departmentInfoDisplayFields
	//	{
	//		departmenat("Department"),
	//		nodalofficer("Nodal Officer"),
	//		designation("Designation"),
	//		dphoneoffice("D_Phone Office"),
	//		dmobileno("D_Mobile No"),
	//		demail("D_Email");
	//
	//		private final String displayName;  
	//		departmentInfoDisplayFields(final String display)
	//		{
	//			this.displayName = display;  
	//		}  
	//
	//		@Override public String toString()  
	//		{  
	//			return this.displayName;  
	//		}
	//	};


	public static HashMap<String, String> developerInfoDisplayFields = new HashMap<String, String>(){{

		put("devcompany","Company/Ag");
		put("dcontactperson","Contact Person");
		put("dphoneoffice","Phone Office");
		put("dmobile","Mobile No");
		put("demail","Email");
		put("fmsexpirydate","FMS Exipry");
	}};


	//	public enum developerInfoDisplayFields
	//	{		
	//		companyag("Company/Ag"),
	//		contactperson("Contact Person"),
	//		cphoneoffice("C_Phone Office"),
	//		cmobileno("C_Mobile No"),
	//		dmail("D_Email"),
	//		fms("Fms");
	//
	//		private final String displayName;  
	//		developerInfoDisplayFields(final String display)
	//		{
	//			this.displayName = display;  
	//		}  
	//
	//		@Override public String toString()  
	//		{  
	//			return this.displayName;  
	//		}
	//	}


}
