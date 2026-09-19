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

@WebServlet("/UpdateDoctor")
public class UpdateDoctor extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	DoctorDAO ddao = new DoctorDAOImpl();
	Doctor d = ddao.get_DoctorById(Integer.parseInt(req.getParameter("doctorId")));
	if(d != null) {
		d.setDoctor_id(Integer.parseInt(req.getParameter("doctorId")));
		d.setAvailable(req.getParameter("available"));
		d.setName(req.getParameter("name"));
		d.setSpecialization(req.getParameter("specialization"));
		d.setPhone(req.getParameter("phone"));
		d.setMail(req.getParameter("email"));
		d.setExperience_years(Integer.parseInt(req.getParameter("experience")));
		d.setConsultation_fee(Double.parseDouble(req.getParameter("fee")));
		ddao.update_Doctor(d);
		
		req.setAttribute("sucess", "updated sucessfully!!!");
		req.getRequestDispatcher("update_doctor.jsp").forward(req, resp);
	}
	else {
		req.setAttribute("error", "cannot find Doctor!!!");
		req.getRequestDispatcher("update_doctor.jsp").forward(req, resp);
	}
}
}
