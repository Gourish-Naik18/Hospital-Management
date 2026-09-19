package com.hospital.servlet;

import java.io.IOException;

import com.hospital.dao.PatientDAO;
import com.hospital.dao.Impl.PatientDAOImpl;
import com.hospital.dto.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
  
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	     PatientDAO pdao = new PatientDAOImpl();
	     Patient p = pdao.getPatientByMailAndPassword(req.getParameter("email"), req.getParameter("password"));
	     if(p != null) {
	    	 HttpSession session = req.getSession();
	    	 session.setAttribute("patient", p);
	    	 if(p.getRole().equals("admin")) {
	    		 resp.sendRedirect("admin.jsp");
	    	 }
	    	 else {
	    		 resp.sendRedirect("patient_db.jsp");
	    	 }
	     }
	     else {
	    	 req.setAttribute("error", "invalid credentials");
	    	 req.getRequestDispatcher("login.jsp").forward(req, resp);
	     }
	}
}
