package com.hospital.dto;

public class Doctor {
  private Integer doctor_id;
  private String name;
  private String specialization;
  private String phone;
  private String mail;
  private Integer experience_years ;
  private Double consultation_fee;
  private String  available;
  
  
  public Integer getDoctor_id() {
	return doctor_id;
  }
  public void setDoctor_id(Integer doctor_id) {
	this.doctor_id = doctor_id;
  }
  public String getName() {
	return name;
  }
  public void setName(String name) {
	this.name = name;
  }
  public String getSpecialization() {
	return specialization;
  }
  public void setSpecialization(String specialization) {
	this.specialization = specialization;
  }
  public String getPhone() {
	return phone;
  }
  public void setPhone(String phone) {
	this.phone = phone;
  }
  public String getMail() {
	return mail;
  }
  public void setMail(String mail) {
	this.mail = mail;
  }
  public Integer getExperience_years() {
	return experience_years;
  }
  public void setExperience_years(Integer experience_years) {
	this.experience_years = experience_years;
  }
  public Double getConsultation_fee() {
	return consultation_fee;
  }
  public void setConsultation_fee(Double consultation_fee) {
	this.consultation_fee = consultation_fee;
  }
  public String getAvailable() {
	return available;
  }
  public void setAvailable(String available) {
	this.available = available;
  }
  
  @Override
  public String toString() {
	return "Doctor [doctor_id=" + doctor_id + ", name=" + name + ", specialization=" + specialization + ", phone="
			+ phone + ", mail=" + mail + ", experience_years=" + experience_years + ", consultation_fee="
			+ consultation_fee + ", available=" + available + "]";
  }
  
  
  
  
}
