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

@WebServlet("/UpdateAppointment")
public class UpdateAppointment extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	AppointmentDAO adao = new AppointmentDAOImpl();
	Appointment a = adao.getById(Integer.parseInt(req.getParameter("appointmentId")));
	if(a != null) {
		a.setStatus(req.getParameter("status"));
		adao.update_Appointment(a);
		req.setAttribute("sucess", "updated sucessfully!!!");
		req.getRequestDispatcher("view_appointments.jsp").forward(req, resp);
	}
	else {
		req.setAttribute("error", "could not find appointment");
		req.getRequestDispatcher("view_appointments.jsp").forward(req, resp);
	}
}
}
