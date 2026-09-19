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

@WebServlet("/Forgot")
public class Forgot extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	PatientDAO pdao = new PatientDAOImpl();
	Patient p = pdao.getByMail(req.getParameter("email"));
	if(p != null) {
		p.setPassword(req.getParameter("newPassword"));
		pdao.update_Patient(p);
		req.setAttribute("sucess", "password updated sucessfully!");
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}
	else {
		req.setAttribute("error", "invalid email");
		req.getRequestDispatcher("forgot.jsp").forward(req, resp);
	}
}
}
