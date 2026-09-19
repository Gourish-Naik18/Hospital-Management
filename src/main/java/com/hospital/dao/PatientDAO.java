package com.hospital.dao;

import java.util.List;

import com.hospital.dto.Patient;

public interface PatientDAO {
   
	void add_Patient(Patient p);
	
	void update_Patient(Patient p);
	
	void delete_Patient(Integer patient_id);
	
	Patient getPatientByMailAndPassword(String mail , String password);
	
	Patient getByMail(String mail);
	
	List<Patient> get_All_Patient();
	
	Patient getById(Integer patient_id);
}
