package com.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MethodImplementations.LoginImpl;

import com.beans.Login;

/**
 * Servlet implementation class dccontroller
 */
public class dccontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//RequestDispatcher rd=null;
		response.setContentType("text/html");
		
		
		String m_userName = request.getParameter("auname");
		String m_password = request.getParameter("apass");
		
		HttpSession hs = request.getSession();
		hs.setAttribute("username", m_userName);
		
		
		Login login = new Login(m_userName,m_password);
		login.setUsername(m_userName);
		login.setPassword(m_password);
		
		LoginImpl lgimpl=new LoginImpl();
		String validate1=lgimpl.validate(login);
		
		if(validate1.equalsIgnoreCase("admin")){
			
		 //rd=request.getRequestDispatcher("AdminFunc.jsp");
		 	//rd.forward(request, response);
			response.sendRedirect("AdminFunc.jsp");
		}else if (validate1.equalsIgnoreCase("staff")){
			
			response.sendRedirect("StaffFunc.jsp");
		}
		else{
			
			 /*rd=request.getRequestDispatcher("Login.html");
			 rd.forward(request, response);*/
			response.sendRedirect("Login.html");
		}
		
			
	}

	

}
