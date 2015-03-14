package com.app.framework;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.app.master.Staff;

public class Auth {

	public static Staff login(String userID, String login){
		return null;
	}
	
	public static Boolean isUserLogged(HttpServletRequest request){
		HttpSession session  = request.getSession();
		if(session.getAttribute("userId") != null){
			return true;
		}
		return false;
	}
	
	
	/**
	 * Function to get logged user Id by Servlet request.
	 * 
	 * @param ServletRequest request
	 * @return String username
	 */
	public static String getLoggedUserId(ServletRequest request){
		return getLoggedUserId((HttpServletRequest) request);
	}
	
	/**
	 * Function to get logged user Id by HttpServletRequest request.
	 * @param HttpServletRequest request
	 * @return
	 */
	public static String getLoggedUserId(HttpServletRequest request){
		return (String)request.getSession().getAttribute("userId");
	}
	
	/**
	 * Function to get logged staff name by Servlet request.
	 * 
	 * @param ServletRequest request
	 * @return String staffName
	 */
	public static String getLoggedStaffName(ServletRequest request){
		return getLoggedUserId((HttpServletRequest) request);
	}
	
	/**
	 * Function to get logged staff name by HttpServletRequest request.
	 * @param HttpServletRequest request
	 * @return String staffName
	 */
	public static String getLoggedStaffName(HttpServletRequest request){
		return (String)request.getSession().getAttribute("userId");
	}
	
}
