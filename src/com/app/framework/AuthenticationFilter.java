package com.app.framework;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {


	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		

		HttpSession session = req.getSession();
		
		 // get the file being requested
        String file = req.getServletPath();
        
        String uri = ((HttpServletRequest)request).getRequestURI();
        
        if ( uri.indexOf("/theme") > 0 || uri.indexOf("/login") > 0){
    		chain.doFilter(request, response);
        }else if("/hms/".equalsIgnoreCase(uri) && Auth.isUserLogged(req)){
        	String loginURL = req.getContextPath() + "/home.jsp";
			res.sendRedirect(loginURL);
        }
        else if (Auth.isUserLogged(req) || file.equals("/index.jsp")) {
			chain.doFilter(request, response);
		} else {
			String loginURL = req.getContextPath() + "/index.jsp";
			session.setAttribute("ErrorMsg", "Please login.");
			res.sendRedirect(loginURL);
		}

	}
	
	@Override
    public void destroy() {
    }

}
