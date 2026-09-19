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

@WebServlet("/Register")
public class Register extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PatientDAO pdao = new PatientDAOImpl();
		Patient p = new Patient();
		p.setMail(req.getParameter("email"));
		p.setName(req.getParameter("name"));
		p.setPhone(req.getParameter("phone"));
		p.setPassword(req.getParameter("password"));
		pdao.add_Patient(p);
		req.setAttribute("sucess", "registered sucessfully");
		req.getRequestDispatcher("login.jsp").forward(req, resp);
		
		
	}

}
