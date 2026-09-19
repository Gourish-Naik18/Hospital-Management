package com.hospital.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hospital.dao.DoctorDAO;
import com.hospital.dto.Doctor;
import com.hospital.utility.Connector;

public class DoctorDAOImpl implements DoctorDAO {
	
	private Connection con;
    
	public DoctorDAOImpl() {
		this.con = Connector.request_Connection();
	}

	@Override
	public void add_Doctor(Doctor d) {
		// TODO Auto-generated method stub
		String query = "insert into doctor values(0,?,?,?,?,?,?,default)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, d.getName());
			ps.setString(2, d.getSpecialization());
			ps.setString(3, d.getPhone());
			ps.setString(4, d.getMail());
			ps.setInt(5, d.getExperience_years());
			ps.setDouble(6, d.getConsultation_fee());
			int i = ps.executeUpdate();
			if(i >= 1) {
				System.out.println("sucessfully inserted");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void update_Doctor(Doctor d) {
		// TODO Auto-generated method stub
		String query = "update doctor set name=?,specialization=?,phone=?,email=?,experience_years=?,consultation_fee=?,available=? where doctor_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, d.getName());
			ps.setString(2, d.getSpecialization());
			ps.setString(3, d.getPhone());
			ps.setString(4, d.getMail());
			ps.setInt(5, d.getExperience_years());
			ps.setDouble(6, d.getConsultation_fee());
			ps.setString(7, d.getAvailable());
			ps.setInt(8, d.getDoctor_id());
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
	public void delete_Doctor(Integer doctor_id) {
		// TODO Auto-generated method stub
		String query = "delete from doctor where doctor_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, doctor_id);
			int i = ps.executeUpdate();
			if(i >=1 ) {
				System.out.println("deleted");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Doctor get_DoctorById(Integer doctor_id) {
		// TODO Auto-generated method stub
		String query = "select * from doctor where doctor_id = ?";
		Doctor d = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, doctor_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				d = new Doctor();
				d.setDoctor_id(rs.getInt("doctor_id"));
				d.setName(rs.getString("name"));
				d.setMail(rs.getString("email"));
				d.setAvailable(rs.getString("available"));
				d.setConsultation_fee(rs.getDouble("consultation_fee"));
				d.setExperience_years(rs.getInt("experience_years"));
				d.setSpecialization(rs.getString("specialization"));
				d.setPhone(rs.getString("phone"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public List<Doctor> get_AllDoctor() {
		// TODO Auto-generated method stub
		String query = "select * from doctor";
		List<Doctor> li = new ArrayList<Doctor>();
		Doctor d = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setDoctor_id(rs.getInt("doctor_id"));
				d.setName(rs.getString("name"));
				d.setMail(rs.getString("email"));
				d.setAvailable(rs.getString("available"));
				d.setConsultation_fee(rs.getDouble("consultation_fee"));
				d.setExperience_years(rs.getInt("experience_years"));
				d.setSpecialization(rs.getString("specialization"));
				d.setPhone(rs.getString("phone"));
				li.add(d);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
	}

}
