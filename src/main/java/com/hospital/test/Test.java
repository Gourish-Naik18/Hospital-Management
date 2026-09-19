package com.hospital.test;

import java.util.List;

import com.hospital.dao.AppointmentDAO;
import com.hospital.dao.DoctorDAO;
import com.hospital.dao.PatientDAO;
import com.hospital.dao.Impl.AppointmentDAOImpl;
import com.hospital.dao.Impl.DoctorDAOImpl;
import com.hospital.dao.Impl.PatientDAOImpl;
import com.hospital.dto.Appointment;
import com.hospital.dto.Doctor;
import com.hospital.dto.Patient;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//       PatientDAO pdao = new PatientDAOImpl();
//       Patient p = new Patient();
//       p.setName("gaythri");
//       p.setMail("gaythri@gmail.com");
//       p.setPassword("gayi@123"); 
//       p.setPhone(1234567003);
//       pdao.add_Patient(p);
       
//       Patient p = pdao.getById(1);
//       if(p != null) {
//    	   p.setName("gourish naik");
//    	   p.setPassword("gb123");
//    	   pdao.update_Patient(p);
//       }
         
//       	Patient p = pdao.getPatientByMailAndPassword("vishnu@gmail.com", "vishnu@123");
//       	System.out.println(p);
       
//           List<Patient> li = pdao.get_All_Patient();
//           li.forEach(System.out::println);

//             pdao.delete_Patient(2);
       
		
//          DoctorDAO ddao = new DoctorDAOImpl();
//          Doctor d = new Doctor();
//          d.setName("bhavana");
//          d.setConsultation_fee(2000.0);
//          d.setExperience_years(3);
//          d.setMail("bhanu@gmail.com");
//          d.setPhone(1234544890);
//          d.setSpecialization("child specalist");
//          ddao.add_Doctor(d);
          
//          Doctor d = ddao.get_DoctorById(1);
//          if(d != null) {
//        	  d.setExperience_years(4);
//        	  ddao.update_Doctor(d);
//          }
          
//          List<Doctor> li = ddao.get_AllDoctor();
//          li.forEach(System.out::println);
          
//          ddao.delete_Doctor(2);
		
		
//		   AppointmentDAO adao = new AppointmentDAOImpl();
//		   Appointment a = new Appointment();
//		   a.setPatient_id(3);
//		   a.setDoctor_id(3);
//		   a.setAppointment_date("2026-06-02");
//		   a.setAppointment_time("9:30");
//		   a.setReason("cold");
//		   adao.book_Appointment(a);
		   
//		   Appointment a = adao.getById(1);
//		   if(a != null) {
//			   a.setAppointment_date("2026-06-10");
//			   adao.update_Appointment(a);
//		   }
		   
//		   List<Appointment> a = adao.getAllAppointment();
//		   a.forEach(System.out::println);
		   
//		   Appointment a = adao.getById(1);
//		   System.out.println(a);

		   
		   
		   
	}

}
