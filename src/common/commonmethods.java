package common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import java.net.URL;
import java.sql.ResultSet;
import java.util.ArrayList;


import javax.servlet.http.HttpSession;

public class commonmethods {

	// Checking session attributes
	public static boolean checkSession(HttpSession session)
	{
		if(session.getAttribute("userId")!=null)
		{
			String userId=(String)session.getAttribute("userId");
			String password=(String)session.getAttribute("password");
		//	String role=(String)session.getAttribute("role");

			if(userId==null || password==null) 
			{ 	
				session.setAttribute("ErrorMsg","Please login."); 
				return false;
			}else
				return true;
		}else{
			session.setAttribute("ErrorMsg","Please login."); 
			return false;
		}
	}

	//=============================
	
	public  ArrayList<webobject> convertToWebObjectList(ResultSet rs)
	{
		ArrayList<webobject>webLists=new ArrayList<webobject>();
		try
		{
			while(rs.next())
			{
				webobject webdetails=new webobject();
				webdetails.setAppaddress(rs.getString("appaddress"));
				webdetails.setAppname(rs.getString("appname"));
				webdetails.setTypeofapp(rs.getString("typeofapp"));
				webdetails.setNatureofapp(rs.getString("natureofapp"));
				webdetails.setCurstatus(rs.getString("curstatus"));
				webdetails.setDevelopedin(rs.getString("developedin"));
				webdetails.setDatabaseuse(rs.getString("databaseuse"));
				webdetails.setServeros(rs.getString("serveros"));
				webdetails.setServertag(rs.getString("servertag"));
				webdetails.setServerip(rs.getString("serverip"));
				webdetails.setPriority(rs.getString("priority"));
				webdetails.setWebformno(String.valueOf(rs.getInt("webformno")));
				webdetails.setReqdate(String.valueOf( rs.getDate("requestdate")));
				webdetails.setHostingrequestdate(String.valueOf(rs.getDate("hostingdate")));
				webdetails.setPendingdata(rs.getString("pendingdata"));
				webdetails.setWebformpath(rs.getString("webformpath"));
				webdetails.setWebauditreppath(rs.getString("webauditreppath"));
				webdetails.setRemarks(rs.getString("remarks"));
				webdetails.setDevcompany(rs.getString("devcompany"));
				webdetails.setDcontactperson(rs.getString("dcontactperson"));
				webdetails.setDphoneoffice(rs.getString("dphoneoffice"));
				webdetails.setDmobile(rs.getString("dmobile"));
				webdetails.setDemail(rs.getString("demail"));
				webdetails.setFmsexpirydate(rs.getString("fmsexpirydate"));
				webdetails.setDepname(rs.getString("depname"));
				webdetails.setNodalofficername(rs.getString("nodalofficername"));
				webdetails.setDesignation(rs.getString("designation"));
				webdetails.setDepphoneoffice(rs.getString("depphoneoffice"));
				webdetails.setDepmobile(rs.getString("depmobile"));
				webdetails.setDepemail(rs.getString("depemail"));
				webLists.add(webdetails);
			}
		}catch(Exception e)
		{
			System.out.println("Error in commonmethod -> converToWebObjectList");
			e.printStackTrace();
		}
		return webLists;
	}


	public void downloadFile(String fnamewithpath)
	{
		BufferedInputStream in = null;
		FileOutputStream fout = null;
		try
		{
			in = new BufferedInputStream(new URL(fnamewithpath).openStream());
			String []filename=fnamewithpath.split("/");
			System.out.println("Filename "+ filename[filename.length-1]);
			fout = new FileOutputStream(filename[filename.length-1]);

			byte data[] = new byte[1024];
			int count;
			while ((count = in.read(data, 0, 1024)) != -1)
			{
				fout.write(data, 0, count);
			}
			if (in != null)
				in.close();
			if (fout != null)
				fout.close();
		}catch(Exception e)
		{
			System.out.println("Error in Commommethod => downloadFile()");
			e.printStackTrace();

		}

	}

	
	public void  uploadInputStream(String fnameWithPath, InputStream is)
	{
		try
		{	

			System.out.println("fname in upload "+fnameWithPath);
			File f=new File(fnameWithPath); 

			if(!f.getParentFile().exists()) 
				f.getParentFile().mkdirs();


			System.out.println("f parent "+f.getParentFile());
			if(!f.exists())
				f.createNewFile();
			FileOutputStream fout=new FileOutputStream(f);	

			byte[] buf = new byte[1024];  
			int len;  
			while ((len = is.read(buf)) != -1) {  
				fout.write(buf, 0, len);  
			}
			fout.close();
		}catch(Exception e)
		{
			System.out.println("Error in commonmethod => uploadInputStream method.");
			e.printStackTrace();
		}
	}
}
