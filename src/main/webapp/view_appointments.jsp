<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.hospital.dto.Doctor"%>
<%@page import="com.hospital.dao.Impl.DoctorDAOImpl"%>
<%@page import="com.hospital.dao.DoctorDAO"%>
<%@page import="com.hospital.dao.Impl.PatientDAOImpl"%>
<%@page import="com.hospital.dao.PatientDAO"%>
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
<title>Manage Appointments</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%Patient p = (Patient)session.getAttribute("patient");%>
<%if(p != null){%>
<%AppointmentDAO adao = new AppointmentDAOImpl();%>
<%List<Appointment> li = adao.getAllAppointment();%>
<%PatientDAO pdao = new PatientDAOImpl();%>
<%DoctorDAO ddao = new DoctorDAOImpl();%>
<body class="bg-gradient-to-br from-purple-200 via-green-300 to-blue-200 min-h-screen p-8">

<div class="max-w-7xl mx-auto">

    <div class="flex justify-between items-center mb-8">
        <div>
            <h1 class="text-4xl font-bold text-gray-800">📅 Manage Appointments</h1>
            <p class="text-gray-500 mt-2">View and update all patient appointments.</p>
            <%String message = (String)request.getAttribute("error");%>
		  <%if(message != null){%>
		  <h2 id="msg" class="text-red-300 text-xl"><%=message%></h2>
		  <%}%>
		  
		  <%String message1 = (String)request.getAttribute("sucess");%>
		  <%if(message1 != null){%>
		  <h2 id="ms" class="text-blue-700 text-xl"><%=message1%></h2>
		  <%}%>
        </div>

        <a href="admin.jsp"
           class="bg-purple-600 text-white px-5 py-2 rounded-xl font-semibold">
            ← Back
        </a>
    </div>

    <div class="grid gap-6">

        <%for(Appointment aa : li){%>
        <%Patient p1 = pdao.getById(aa.getPatient_id());%>
        <%Doctor d = ddao.get_DoctorById(aa.getDoctor_id());%>
        <div class="bg-white rounded-2xl shadow-lg p-6">
            
            
            <div class="flex justify-between items-start">
                <div>
                    <h2 class="text-2xl font-bold">Appointment #<%=aa.getAppointment_id()%></h2>
                    <p class="text-gray-500 mt-1">Patient: <b><%=p1.getName()%></b></p>
                    <p class="text-gray-500">Doctor: <b>Dr. <%=d.getName()%></b></p>
                </div>
                
                <%if(aa.getStatus().equalsIgnoreCase("booked")){%>
                <span class="bg-yellow-100 text-yellow-700 px-4 py-1 rounded-full font-semibold">
                    <%=aa.getStatus()%>
                </span>
                <%}else{%>
                <span class="bg-green-200 text-green-700 px-4 py-1 rounded-full font-semibold">
                    <%=aa.getStatus()%>
                </span>
                <%}%>
            </div>

            <div class="grid md:grid-cols-4 gap-4 mt-6">
                <div class="bg-purple-50 p-4 rounded-xl">
                    <p class="text-sm text-gray-500">Date</p>
                    <%String dat = aa.getAppointment_date();
			          LocalDate ldd = LocalDate.parse(dat);
			          DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");%>
                    <p class="font-bold"><%=ldd.format(dtf)%></p>
                </div>

                <div class="bg-blue-50 p-4 rounded-xl">
                    <p class="text-sm text-gray-500">Time</p>
                    <%String time = aa.getAppointment_time();
                    LocalTime lt = LocalTime.parse(time);
                    DateTimeFormatter dt = DateTimeFormatter.ofPattern("hh:mm:ss a");%>
                    <p class="font-bold"><%=lt.format(dt)%></p>
                </div>

                <div class="bg-green-50 p-4 rounded-xl">
                    <p class="text-sm text-gray-500">Reason</p>
                    <p class="font-bold"><%=aa.getReason()%></p>
                </div>

                <div class="bg-orange-50 p-4 rounded-xl">
                    <p class="text-sm text-gray-500">Update Status</p>

                    <form action="UpdateAppointment" method="post" class="flex gap-2 mt-2">
                        <input type="hidden" name="appointmentId" value="<%=aa.getAppointment_id()%>">

                        <select name="status" class="border rounded-lg p-2 w-full">
                            <option value=""><%=aa.getStatus()%></option>
                            <option value="BOOKED">BOOKED</option>
                            <option value="COMPLETED">COMPLETED</option>
                        </select>

                        <button type="submit" class="bg-purple-600 text-white px-4 rounded-lg">
                            Save
                        </button>
                    </form>
                </div>
            </div>
        </div>
       <%}%>
    </div>

</div>

</body>
<%} else { %>
<%request.setAttribute("error","session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request,response);%>
<%}%>

<script>
let m = document.getElementById("msg");
setInterval(() => {
   m.style.display = 'none'
},2000)

  let n = document.getElementById("ms");
setInterval(() => {
   n.style.display = 'none'
},2000)

</script>
</html>