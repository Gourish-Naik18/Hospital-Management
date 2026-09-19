package com.hospital.dao;

import java.util.List;

import com.hospital.dto.Doctor;

public interface DoctorDAO {
    
	void add_Doctor(Doctor d);
	
	void update_Doctor(Doctor d);
	
	void delete_Doctor(Integer doctor_id);
	
    Doctor get_DoctorById(Integer doctor_id);
    
    List<Doctor> get_AllDoctor();
}
