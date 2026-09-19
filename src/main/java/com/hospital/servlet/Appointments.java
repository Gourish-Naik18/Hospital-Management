package com.hospital.servlet;

import java.io.IOException;

import com.hospital.dao.AppointmentDAO;
import com.hospital.dao.Impl.AppointmentDAOImpl;
import com.hospital.dto.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Appointment")
public class Appointments extends HttpServlet {
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	AppointmentDAO adao = new AppointmentDAOImpl();
	Appointment a = new Appointment();
	a.setDoctor_id(Integer.parseInt(req.getParameter("doctorId")));
	a.setPatient_id(Integer.parseInt(req.getParameter("patientId")));
	a.setAppointment_time(req.getParameter("time"));
	a.setAppointment_date(req.getParameter("date"));
	a.setReason(req.getParameter("reason"));
	adao.book_Appointment(a);
	
	req.setAttribute("sucess", "booked appointment");
	req.getRequestDispatcher("book_appointment.jsp").forward(req, resp);
	
}
}
