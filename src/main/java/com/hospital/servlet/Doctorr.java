package com.hospital.servlet;

import java.io.IOException;

import com.hospital.dao.DoctorDAO;
import com.hospital.dao.Impl.DoctorDAOImpl;
import com.hospital.dto.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Doctor")
public class Doctorr extends HttpServlet {
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	DoctorDAO ddao = new DoctorDAOImpl();
	Doctor d = new Doctor();
	d.setName(req.getParameter("name"));
	d.setMail(req.getParameter("mail"));
	d.setConsultation_fee(Double.parseDouble(req.getParameter("fee")));
	d.setSpecialization(req.getParameter("specialization"));
	d.setPhone(req.getParameter("phone"));
	d.setExperience_years(Integer.parseInt(req.getParameter("experience")));
	ddao.add_Doctor(d);
	
	req.setAttribute("sucess", "details added");
	req.getRequestDispatcher("add_doctor.jsp").forward(req, resp);
}
}













