<%@page import="java.util.function.Predicate"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.dao.Impl.PatientDAOImpl"%>
<%@page import="com.hospital.dao.PatientDAO"%>
<%@page import="com.hospital.dto.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Patients</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%Patient p = (Patient)session.getAttribute("patient");%>
<%if(p != null){%>
<body class="bg-gradient-to-br from-green-100 via-white to-blue-100 min-h-screen p-8">

<div class="max-w-7xl mx-auto">

    <div class="flex justify-between items-center mb-8">

        <div>
            <h1 class="text-4xl font-bold text-gray-800">
                👨‍👩‍👧‍👦 View Patients
            </h1>

            <p class="text-gray-500 mt-2">
                See all registered patients in the hospital system.
            </p>
        </div>

        <a href="admin.jsp"
           class="bg-green-600 hover:bg-green-700 text-white px-5 py-2 rounded-xl font-semibold">
            ← Back
        </a>

    </div>

    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
      <%PatientDAO pdao = new PatientDAOImpl();%>
      <%List<Patient> li = pdao.get_All_Patient();%>
      <%Predicate<Patient> pp = (s)->s.getRole().equalsIgnoreCase("patient");%>
      <%for(Patient p1 : li){%>
        <%if(pp.test(p1)){%>
        <!-- Patient Card 1 -->
        <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition">

            <div class="flex items-center gap-4 mb-4">

                <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center text-3xl">
                    👤
                </div>

                <div>
                    <h2 class="text-xl font-bold text-gray-800">
                        <%=p1.getName()%>
                    </h2>

                    <p class="text-gray-500">
                        Patient ID : <%=p1.getPatient_id()%>
                    </p>
                </div>

            </div>

            <div class="space-y-3 text-gray-700">

                <p>
                    📞 <span class="font-semibold"><%=p1.getPhone()%></span>
                </p>

                <p>
                    📧 <span class="font-semibold"><%=p1.getMail() %></span>
                </p>

                <p>
                    📅 Registered :
                    <span class="font-semibold"><%=p1.getCreated_at()%></span>
                </p>

                <p>
                    🏷️ Role :
                    <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full text-sm font-semibold">
                        <%=p1.getRole()%>
                    </span>
                </p>

            </div>

        </div>
        <%}%>
        <%}%>
    </div>

</div>

</body>
<%} else { %>
<%request.setAttribute("error","session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request,response);%>
<%}%>
</html>