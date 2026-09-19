<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Time"%>
<%@page import="com.hospital.dto.Doctor"%>
<%@page import="com.hospital.dao.Impl.DoctorDAOImpl"%>
<%@page import="com.hospital.dao.DoctorDAO"%>
<%@page import="com.hospital.dto.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.dao.Impl.AppointmentDAOImpl"%>
<%@page import="com.hospital.dao.AppointmentDAO"%>
<%@page import="com.hospital.dao.Impl.PatientDAOImpl"%>
<%@page import="com.hospital.dao.PatientDAO"%>
<%@page import="com.hospital.dto.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Patient Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

<%
Patient p = (Patient)session.getAttribute("patient");
%>
<%
if(p != null){
%>
<%
PatientDAO pdao = new PatientDAOImpl();
%>
<%
AppointmentDAO adao =  new AppointmentDAOImpl();
%>
<%
DoctorDAO ddao = new DoctorDAOImpl();
%>


<div class="bg-green-700 text-white p-5 flex justify-between">
    <h1 class="text-2xl font-bold">🏥 Hospital Management</h1>

    <a href="Logout"
       class="bg-red-500 px-4 py-2 rounded-lg">
       Logout
    </a>
</div>



<div class="p-8">

    <div class="bg-white p-6 rounded-xl shadow mb-8">
        <h2 class="text-3xl font-bold">
           Welcome <%=p.getName()%> 👋
        </h2>

        <p class="text-gray-500 mt-2">
            Manage your appointments and health records.
        </p>
    </div>

    <div class="grid grid-cols-3 gap-6 mb-8">

        <div class="bg-white p-6 rounded-xl shadow">
            <p class="text-gray-500">Total Appointments</p>
            <h1 class="text-4xl font-bold text-green-700">
                <%
                List<Appointment> li = adao.getByPatient(p.getPatient_id());
                %>
                <%=li.size()%>
            </h1>
        </div>

        <div class="bg-white p-6 rounded-xl shadow">
            <p class="text-gray-500">Upcoming Visits</p>
            <h1 class="text-4xl font-bold text-blue-700">
                <%
                long count = li.stream().filter((p1)->p1.getStatus().equalsIgnoreCase("booked")).count();
                %>
                <%=count%>
            </h1>
        </div>

        <div class="bg-white p-6 rounded-xl shadow">
            <p class="text-gray-500">Available Doctors</p>
            <h1 class="text-4xl font-bold text-purple-700">
                <%
                List<Doctor> ld = ddao.get_AllDoctor();
                %>
                <%
                long count1 = ld.stream().filter((d)->d.getAvailable().equalsIgnoreCase("yes")).count();
                %>
                <%=count1%>
            </h1>
        </div>

    </div>

    <div class="grid grid-cols-4 gap-6 mb-8">

        <a href="view_doctors.jsp"
           class="bg-blue-600 text-white p-6 rounded-xl shadow hover:bg-blue-700">

            <h2 class="text-xl font-bold">
                👨‍⚕️ View Doctors
            </h2>

        </a>

        <a href="book_appointment.jsp"
           class="bg-green-600 text-white p-6 rounded-xl shadow hover:bg-green-700">

            <h2 class="text-xl font-bold">
                📅 Book Appointment
            </h2>

        </a>

        <a href="my_appointments.jsp"
           class="bg-purple-600 text-white p-6 rounded-xl shadow hover:bg-purple-700">

            <h2 class="text-xl font-bold">
                📋 My Appointments
            </h2>

        </a>

        <a href="update_patient.jsp"
           class="bg-orange-600 text-white p-6 rounded-xl shadow hover:bg-orange-700">

            <h2 class="text-xl font-bold">
                ⚙️ Update Profile
            </h2>

        </a>

    </div>

    <div class="bg-white p-6 rounded-xl shadow">

        <h2 class="text-2xl font-bold mb-5">
            Recent Appointments
        </h2>

        <table class="w-full">
 
            <tr class="bg-gray-100">
                <th class="p-3 text-left">Doctor</th>
                <th class="p-3 text-left">Date</th>
                <th class="p-3 text-left">Time</th>
                <th class="p-3 text-left">Status</th>
            </tr>
           
           <%
                      for(Appointment ap : li){
                      %>
           <%Doctor d1 = ddao.get_DoctorById(ap.getDoctor_id());%>
           <%String dat = ap.getAppointment_date();
			          LocalDate ldd = LocalDate.parse(dat);
			          DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");%>
			<%String time = ap.getAppointment_time();
                    LocalTime lt = LocalTime.parse(time);
                    DateTimeFormatter dt = DateTimeFormatter.ofPattern("hh:mm:ss a");%>
            <tr class="border-b">
                <td class="p-3"><%=d1.getName()%></td>
                <td class="p-3"><%=ldd.format(dtf)%></td>
                <td class="p-3"><%=lt.format(dt)%></td>
                <% if(ap.getStatus().equals("BOOKED")) { %>
			    <td class="p-3 text-yellow-600 font-bold">
			        <%= ap.getStatus() %>
			    </td>
				<% } else { %>
			    <td class="p-3 text-green-600 font-bold">
			        <%= ap.getStatus() %>
			    </td>
				<% } %>
            </tr>
            <%}%>

        </table>

    </div>

</div>
<%} else { %>
<%request.setAttribute("error","session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request,response);%>
<%}%>
</body>
</html>