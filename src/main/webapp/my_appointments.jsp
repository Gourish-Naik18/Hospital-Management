<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.hospital.dao.Impl.DoctorDAOImpl"%>
<%@page import="com.hospital.dao.DoctorDAO"%>
<%@page import="com.hospital.dto.Doctor"%>
<%@page import="com.hospital.dto.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.dao.Impl.AppointmentDAOImpl"%>
<%@page import="com.hospital.dao.AppointmentDAO"%>
<%@page import="com.hospital.dto.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Appointments</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%Patient p = (Patient)session.getAttribute("patient");%>
<%if(p != null){%>
<%AppointmentDAO adao = new AppointmentDAOImpl();%>
<%DoctorDAO ddao = new DoctorDAOImpl();%>
<%List<Appointment> li = adao.getByPatient(p.getPatient_id());%>
<body class="bg-gradient-to-br from-green-100 via-white to-blue-100 min-h-screen p-8">

<div class="max-w-6xl mx-auto">

    <!-- Header -->
    <div class="flex justify-between items-center mb-8">
        <div>
            <h1 class="text-4xl font-bold text-gray-800">
                📋 My Appointments
            </h1>
            <p class="text-gray-500 mt-2">
                View your upcoming and completed hospital visits.
            </p>
        </div>

        <a href="patient_db.jsp"
           class="bg-green-600 text-white px-5 py-2 rounded-xl hover:bg-green-700">
            Back
        </a>
    </div>

    <!-- Cards -->
    <div class="grid md:grid-cols-2 gap-6">
       
       <%for(Appointment aa : li){%>
        <!-- Appointment Card -->
        <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition">

            <div class="flex justify-between items-start mb-4">
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">
                    <%Doctor d1 = ddao.get_DoctorById(aa.getDoctor_id());%>
                    
                        <%=d1.getName()%>
                    </h2>
                    <p class="text-gray-500">
                        Appointment ID: <%=aa.getAppointment_id()%>
                    </p>
                </div>

                <span class="bg-green-100 text-green-700 px-4 py-1 rounded-full font-semibold">
                    <%=aa.getStatus() %>
                </span>
            </div>
               <%String dat = aa.getAppointment_date();
			          LocalDate ldd = LocalDate.parse(dat);
			          DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");%>
			   <%String time = aa.getAppointment_time();
                    LocalTime lt = LocalTime.parse(time);
                    DateTimeFormatter dt = DateTimeFormatter.ofPattern("hh:mm:ss a");%>
            <div class="space-y-3 text-gray-700">
                <p>📅 Date: <span class="font-semibold"><%=ldd.format(dtf)%></span></p>
                <p>⏰ Time: <span class="font-semibold"><%=lt.format(dt)%></span></p>
            </div>

        </div>
        <%}%>

    </div>

</div>
<%} else { %>
<%request.setAttribute("error","session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request,response);%>
<%}%>
</body>
</html>