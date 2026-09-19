package com.hospital.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hospital.dao.AppointmentDAO;
import com.hospital.dto.Appointment;
import com.hospital.utility.Connector;

public class AppointmentDAOImpl implements AppointmentDAO {
	
	private Connection con;
    
	public AppointmentDAOImpl() {
		this.con = Connector.request_Connection();
	}

	@Override
	public void book_Appointment(Appointment a) {
		// TODO Auto-generated method stub
		String query = "insert into appointment values(0,?,?,?,?,?,default)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, a.getPatient_id());
			ps.setInt(2, a.getDoctor_id());
			ps.setString(3, a.getAppointment_date());
			ps.setString(4, a.getAppointment_time());
			ps.setString(5, a.getReason());
			int i = ps.executeUpdate();
			if(i >= 1) {
				System.out.println("inserted");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void update_Appointment(Appointment a) {
		// TODO Auto-generated method stub
		String query = "update appointment set patient_id=?,doctor_id=?,appointment_date=?,appointment_time=?,reason=?,status=? where  appointment_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, a.getPatient_id());
			ps.setInt(2, a.getDoctor_id());
			ps.setString(3, a.getAppointment_date());
			ps.setString(4, a.getAppointment_time());
			ps.setString(5, a.getReason());
			ps.setString(6, a.getStatus());
			ps.setInt(7, a.getAppointment_id());
			int i = ps.executeUpdate();
			if(i >= 1) {
				System.out.println("updated");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Appointment getById(Integer id) {
		// TODO Auto-generated method stub
		String query = "select * from appointment where appointment_id = ?";
		Appointment a = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				a = new Appointment();
				a.setAppointment_id(rs.getInt("appointment_id"));
				a.setPatient_id(rs.getInt("patient_id"));
				a.setDoctor_id(rs.getInt("doctor_id"));
				a.setReason(rs.getString("reason"));
				a.setStatus(rs.getString("status"));
				a.setAppointment_date(rs.getString("appointment_date"));
				a.setAppointment_time(rs.getString("appointment_time"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public List<Appointment> getByPatient(Integer patient_id) {
		String query = "select * from appointment where patient_id = ?";
		List<Appointment> li = new ArrayList<Appointment>();
		Appointment a = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, patient_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				a = new Appointment();
				a.setAppointment_id(rs.getInt("appointment_id"));
				a.setPatient_id(rs.getInt("patient_id"));
				a.setDoctor_id(rs.getInt("doctor_id"));
				a.setReason(rs.getString("reason"));
				a.setStatus(rs.getString("status"));
				a.setAppointment_date(rs.getString("appointment_date"));
				a.setAppointment_time(rs.getString("appointment_time"));
				li.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public List<Appointment> getByDoctor(Integer doctor_id) {
		String query = "select * from appointment where doctor_id = ?";
		List<Appointment> li = new ArrayList<Appointment>();
		Appointment a = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, doctor_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				a = new Appointment();
				a.setAppointment_id(rs.getInt("appointment_id"));
				a.setPatient_id(rs.getInt("patient_id"));
				a.setDoctor_id(rs.getInt("doctor_id"));
				a.setReason(rs.getString("reason"));
				a.setStatus(rs.getString("status"));
				a.setAppointment_date(rs.getString("appointment_date"));
				a.setAppointment_time(rs.getString("appointment_time"));
				li.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public List<Appointment> getAllAppointment() {
		String query = "select * from appointment";
		List<Appointment> li = new ArrayList<Appointment>();
		Appointment a = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				a = new Appointment();
				a.setAppointment_id(rs.getInt("appointment_id"));
				a.setPatient_id(rs.getInt("patient_id"));
				a.setDoctor_id(rs.getInt("doctor_id"));
				a.setReason(rs.getString("reason"));
				a.setStatus(rs.getString("status"));
				a.setAppointment_date(rs.getString("appointment_date"));
				a.setAppointment_time(rs.getString("appointment_time"));
				li.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
	}

}
