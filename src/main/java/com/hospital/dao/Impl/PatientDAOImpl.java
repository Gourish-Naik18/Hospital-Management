package com.hospital.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hospital.dao.PatientDAO;
import com.hospital.dto.Patient;
import com.hospital.utility.Connector;

public class PatientDAOImpl implements PatientDAO {
	
	private Connection con;
	
	public PatientDAOImpl() {
		this.con = Connector.request_Connection();
	}

	@Override
	public void add_Patient(Patient p) {
		// TODO Auto-generated method stub
		String query = "insert into patient values(0,?,?,?,?,default,sysdate())";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, p.getName());
			ps.setString(2, p.getPhone());
			ps.setString(3, p.getMail());
			ps.setString(4, p.getPassword());
			int i = ps.executeUpdate();
			if(i>=1) {
				System.out.println("sucessfully inserted");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void update_Patient(Patient p) {
		// TODO Auto-generated method stub
		String query = "update patient set name=?,phone=?,email=?,password=?,role=?,created_date=? where patient_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(7, p.getPatient_id());
			ps.setString(1, p.getName());
			ps.setString(2, p.getPhone());
			ps.setString(3, p.getMail());
			ps.setString(4, p.getPassword());
			ps.setString(5, p.getRole());
			ps.setString(6, p.getCreated_at());
			int i = ps.executeUpdate();
			if(i>=1) {
				System.out.println("sucessfully updated");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void delete_Patient(Integer patient_id) {
		// TODO Auto-generated method stub
		String query = "delete from patient where patient_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, patient_id);
			int i = ps.executeUpdate();
			if(i >=1) {
				System.out.println("deleted");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Patient getPatientByMailAndPassword(String mail, String password) {
		String query = "select * from patient where email=? and password = ?";
		Patient p = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				p = new Patient();
				p.setPatient_id(rs.getInt("patient_id"));
				p.setName(rs.getString("name"));
				p.setPhone(rs.getString("phone"));
				p.setMail(rs.getString("email"));
				p.setPassword(rs.getString("password"));
				p.setCreated_at(rs.getString("created_date"));
				p.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public List<Patient> get_All_Patient() {
		String query = "select * from patient";
		List<Patient> li = new ArrayList<Patient>();
		Patient p = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				p = new Patient();
				p.setPatient_id(rs.getInt("patient_id"));
				p.setName(rs.getString("name"));
				p.setPhone(rs.getString("phone"));
				p.setMail(rs.getString("email"));
				p.setPassword(rs.getString("password"));
				p.setCreated_at(rs.getString("created_date"));
				p.setRole(rs.getString("role"));
				li.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public Patient getById(Integer patient_id) {
		// TODO Auto-generated method stub
		String query = "select * from patient where patient_id = ?";
		Patient p = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, patient_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				p = new Patient();
				p.setPatient_id(rs.getInt("patient_id"));
				p.setName(rs.getString("name"));
				p.setPhone(rs.getString("phone"));
				p.setMail(rs.getString("email"));
				p.setPassword(rs.getString("password"));
				p.setCreated_at(rs.getString("created_date"));
				p.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public Patient getByMail(String mail) {
		String query = "select * from patient where email=?";
		Patient p = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, mail);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				p = new Patient();
				p.setPatient_id(rs.getInt("patient_id"));
				p.setName(rs.getString("name"));
				p.setPhone(rs.getString("phone"));
				p.setMail(rs.getString("email"));
				p.setPassword(rs.getString("password"));
				p.setCreated_at(rs.getString("created_date"));
				p.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

}
