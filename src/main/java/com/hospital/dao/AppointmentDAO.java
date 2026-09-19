package com.hospital.dao;

import java.util.List;

import com.hospital.dto.Appointment;

public interface AppointmentDAO {
    
	void book_Appointment(Appointment a);
	
	void update_Appointment(Appointment a);
	
	Appointment getById(Integer id);
	
	List<Appointment> getByPatient(Integer patient_id);
	
	List<Appointment> getByDoctor(Integer doctor_id);
	
	List<Appointment> getAllAppointment();
}
