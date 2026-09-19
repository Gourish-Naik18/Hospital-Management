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

@WebServlet("/update")
public class UpdatePatient extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	PatientDAO pdao = new PatientDAOImpl();
	Patient p = pdao.getByMail(req.getParameter("mail"));
	HttpSession session = req.getSession();
	Patient p1 = (Patient)session.getAttribute("patient");
	if((p != null) && (p.getPatient_id() == p1.getPatient_id())) {
		p.setMail(req.getParameter("mail"));
		p.setPassword(req.getParameter("password"));
		p.setName(req.getParameter("name"));
		p.setPhone(req.getParameter("phone"));
		
		pdao.update_Patient(p);
		req.setAttribute("sucess", "updated sucessfully!!!");
		req.getRequestDispatcher("update_patient.jsp").forward(req, resp);
	}
	else {
		req.setAttribute("error", "invalid mail id");
		req.getRequestDispatcher("update_patient.jsp").forward(req, resp);
	}
}
}
