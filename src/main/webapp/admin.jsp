<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.hospital.dto.Appointment"%>
<%@page import="com.hospital.dto.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.dao.Impl.AppointmentDAOImpl"%>
<%@page import="com.hospital.dao.AppointmentDAO"%>
<%@page import="com.hospital.dao.Impl.DoctorDAOImpl"%>
<%@page import="com.hospital.dao.DoctorDAO"%>
<%@page import="com.hospital.dao.Impl.PatientDAOImpl"%>
<%@page import="com.hospital.dao.PatientDAO"%>
<%@page import="com.hospital.dto.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<%Patient p = (Patient)session.getAttribute("patient");%>
<%PatientDAO pdao = new PatientDAOImpl();%>
<%DoctorDAO ddao = new DoctorDAOImpl();%>
<%AppointmentDAO adao = new AppointmentDAOImpl();%>
<%if(p != null){%>
<body class="bg-gray-100">

<div class="flex min-h-screen">

  <!-- Sidebar -->
  <div class="w-64 bg-blue-900 text-white p-6">
    <h1 class="text-2xl font-bold mb-10">🏥 Hospital</h1>

    <nav class="space-y-4">
      <a href="admin.jsp" class="block bg-blue-700 p-3 rounded-lg">Dashboard</a>
      <a href="add_doctor.jsp" class="block hover:bg-blue-700 p-3 rounded-lg">Add Doctor</a>
      <a href="Manage_Doctors.jsp" class="block hover:bg-blue-700 p-3 rounded-lg">Update Doctor</a>
      <a href="view_patients.jsp" class="block hover:bg-blue-700 p-3 rounded-lg">View Patients</a>
      <a href="view_appointments.jsp" class="block hover:bg-blue-700 p-3 rounded-lg">View Appointments</a>
      <a href="Logout" class="block bg-red-500 p-3 rounded-lg mt-10">Logout</a>
    </nav>
  </div>

  <!-- Main Content -->
  <div class="flex-1 p-8">

    <!-- Top Bar -->
    <div class="bg-white p-5 rounded-xl shadow flex justify-between items-center mb-8">
      <div>
        <h2 class="text-3xl font-bold text-gray-800">Admin Dashboard</h2>
        <p class="text-gray-500">Manage hospital data and appointments</p>
      </div>

      <div class="text-right">
        <p class="font-semibold"><%=p.getName()%></p>
        <p class="text-sm text-gray-500"><%=p.getMail()%></p>
      </div>
    </div>

    <!-- Cards -->
    <div class="grid grid-cols-4 gap-6 mb-8">

      <div class="bg-white p-6 rounded-xl shadow">
        <p class="text-gray-500">Total Patients</p>
        <%List<Patient> lp = pdao.get_All_Patient();%>
        <%long count = lp.stream().filter(p1->p1.getRole().equalsIgnoreCase("patient")).count();%>
        <h1 class="text-3xl font-bold text-blue-700"><%=count%></h1>
      </div>

      <div class="bg-white p-6 rounded-xl shadow">
        <p class="text-gray-500">Doctors</p>
        <%List<Doctor> ld = ddao.get_AllDoctor();%>
        <h1 class="text-3xl font-bold text-green-700"><%=ld.size()%></h1>
      </div>

      <div class="bg-white p-6 rounded-xl shadow">
        <p class="text-gray-500">Appointments</p>
        <%List<Appointment> la = adao.getAllAppointment();%>
        <h1 class="text-3xl font-bold text-purple-700"><%=la.size()%></h1>
      </div>

      <div class="bg-white p-6 rounded-xl shadow">
        <p class="text-gray-500">Pending</p>
        <h1 class="text-3xl font-bold text-orange-600"><%=la.stream().filter((a)->a.getStatus().equalsIgnoreCase("booked")).count()%>
		</h1>
      </div>

    </div>

    <!-- Quick Actions -->
    <div class="grid grid-cols-3 gap-6 mb-8">

      <a href="add_doctor.jsp" class="bg-blue-600 text-white p-6 rounded-xl shadow hover:bg-blue-700">
        <h2 class="text-xl font-bold">➕ Add Doctor</h2>
        <p class="text-sm mt-2">Register new doctors</p>
      </a>

      <a href="view_patients.jsp" class="bg-green-600 text-white p-6 rounded-xl shadow hover:bg-green-700">
        <h2 class="text-xl font-bold">👨‍⚕️ View Patients</h2>
        <p class="text-sm mt-2">See all registered patients</p>
      </a>

      <a href="view_appointments.jsp" class="bg-purple-600 text-white p-6 rounded-xl shadow hover:bg-purple-700">
        <h2 class="text-xl font-bold">📅 Appointments</h2>
        <p class="text-sm mt-2">Manage all appointments</p>
      </a>

    </div>

    <!-- Recent Appointments -->
    <div class="bg-white rounded-xl shadow p-6">
      <h2 class="text-2xl font-bold mb-5">Recent Appointments</h2>

      <table class="w-full">
        <tr class="bg-gray-100 text-left">
          <th class="p-3">Patient</th>
          <th class="p-3">Doctor</th>
          <th class="p-3">Date</th>
          <th class="p-3">Status</th>
        </tr>
        
        <%for(Appointment aa : la){%>
        <%Doctor d1 = ddao.get_DoctorById(aa.getDoctor_id());%>
        <%Patient p1 = pdao.getById(aa.getPatient_id());%>
        <tr class="border-b">
          <td class="p-3"><%=p1.getName()%></td>
          <td class="p-3"><%=d1.getName()%></td>
          <%String dat = aa.getAppointment_date();
          LocalDate ldd = LocalDate.parse(dat);
          DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");%>
          <td class="p-3"><%=ldd.format(dtf)%></td>
          <%if(aa.getStatus().equalsIgnoreCase("booked")){%>
          <td class="p-3 text-orange-600 font-semibold"><%=aa.getStatus()%></td>
          <%}else { %>
          <td class="p-3 text-green-600 font-semibold"><%=aa.getStatus()%></td>
          <%}%>
        </tr>
         <%}%>

      </table>
    </div>

  </div>
</div>

</body>
<%}%>
</html>