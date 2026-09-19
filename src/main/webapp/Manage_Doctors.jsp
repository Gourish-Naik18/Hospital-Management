<%@page import="com.hospital.dto.Patient"%>
<%@page import="com.hospital.dto.Doctor"%>
<%@page import="com.hospital.dao.Impl.DoctorDAOImpl"%>
<%@page import="com.hospital.dao.DoctorDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Doctors</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<%Patient p = (Patient)session.getAttribute("patient");%>
<%if(p != null){%>
<body class="bg-gray-100 min-h-screen">

    <div class="bg-green-700 text-white p-5 flex justify-between items-center">
        <h1 class="text-2xl font-bold">🏥 All Doctors</h1>

        <a href="admin.jsp"
           class="bg-white text-green-700 px-4 py-2 rounded-lg font-semibold">
            Back
        </a>
    </div>

    <div class="p-8">

        <h2 class="text-3xl font-bold mb-2">
            Choose Your Doctor
        </h2>

        <p class="text-gray-500 mb-8">
            Update to Make Things Easier.
        </p>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <%DoctorDAO ddao = new DoctorDAOImpl();%>
          <%List<Doctor> ld = ddao.get_AllDoctor();%>
          <%for(Doctor d : ld){%>
          
            <!-- Doctor Card 1 -->
            <div class="bg-white rounded-2xl shadow p-6 hover:shadow-xl transition">

                <div class="flex items-center gap-4 mb-5">
                
                    <div class="w-16 h-16 rounded-full bg-green-100 flex items-center justify-center text-3xl">
                        👨‍⚕️
                    </div>

                    <div>
                        <h3 class="text-xl font-bold"><%=d.getName()%></h3>
                        <p class="text-green-600 font-semibold"><%=d.getSpecialization()%></p>
                    </div>
                    
                    <%if(d.getAvailable().equalsIgnoreCase("no")){%>
                <span class="bg-yellow-100 text-yellow-700 px-4 py-1 rounded-full font-semibold">
                    not available
                </span>
                <%}else{%>
                <span class="bg-green-200 text-green-700 px-4 py-1 rounded-full font-semibold">
                    available
                </span>
                <%}%>
                </div>
                       
                <div class="space-y-2 text-gray-600 mb-5">
                    <p>📞 <%=d.getPhone()%></p>
                    <p>📧 <%=d.getExperience_years()%></p>
                    <p>⭐  <%=d.getMail()%></p>
                    <p>💰 Consultation Fee: <%=d.getConsultation_fee()%></p>
                </div>
                
                <div class="flex flex-col gap-4">
                <a href="book_appointment.jsp"
                   class="block text-center bg-green-600 text-white py-2 rounded-lg hover:bg-green-700">
                    Book Appointment
                </a>
                
                 <a href="update_doctor.jsp?doctorId=<%=d.getDoctor_id()%>"
                   class="block text-center bg-orange-300 text-white py-2 rounded-lg hover:bg-green-700">
                    Update
                </a>
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