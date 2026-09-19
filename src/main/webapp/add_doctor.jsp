<%@page import="com.hospital.dto.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Doctor</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%Patient p = (Patient)session.getAttribute("patient");%>
<%if(p != null){%>
<body class="bg-gradient-to-br from-gray-300 via-blue-300 to-white min-h-screen flex items-center justify-center p-6">

<div class="bg-white rounded-3xl shadow-2xl overflow-hidden max-w-5xl w-full grid md:grid-cols-2">

    <!-- Left Panel -->
    <div class="bg-blue-500 text-white p-10 flex flex-col justify-center">

        <div class="text-7xl text-center mb-6">
            👨‍⚕️
        </div>

        <h1 class="text-4xl font-bold text-center mb-4">
            Add Doctor
        </h1>

        <p class="text-center text-red-100">
            Register doctors into the hospital management system.
        </p>

        <div class="mt-8 space-y-4">

            <div class="bg-blue-300 p-4 rounded-xl">
                🏥 Manage Specialists
            </div>

            <div class="bg-blue-300 p-4 rounded-xl">
                📅 Appointment Scheduling
            </div>

            <div class="bg-blue-300 p-4 rounded-xl">
                👨‍⚕️ Doctor Records
            </div>

        </div>

    </div>

    <!-- Form Section -->
    <div class="p-10">

        <h2 class="text-3xl font-bold text-gray-800 mb-2">
            Doctor Information
        </h2>
        
        <%String message1 = (String)request.getAttribute("sucess");%>
		  <%if(message1 != null){%>
		  <h2 id="ms" class="text-green-300 text-xl"><%=message1%></h2>
		  <%}%>

        <p class="text-gray-500 mb-6">
            Enter doctor details below.
        </p>

        <form action="Doctor" method="post">

            <label class="font-semibold text-gray-700">
                Doctor Name
            </label>

            <input
                name="name"
                placeholder="Enter Doctor Name"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-red-500 outline-none">

            <label class="font-semibold text-gray-700">
                Specialization
            </label>

            <input
                name="specialization"
                placeholder="Cardiology / Neurology / ENT"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-red-500 outline-none">

            <label class="font-semibold text-gray-700">
                Phone Number
            </label>

            <input
                name="phone"
                placeholder="Enter Phone Number"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-red-500 outline-none">

            <label class="font-semibold text-gray-700">
                Email Address
            </label>

            <input
                name="mail"
                placeholder="Enter Email"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-red-500 outline-none">

            <label class="font-semibold text-gray-700">
                Experience (Years)
            </label>

            <input
                name="experience"
                placeholder="Enter Experience"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-red-500 outline-none">

            <label class="font-semibold text-gray-700">
                Consultation Fee
            </label>

            <input
                name="fee"
                placeholder="Enter Consultation Fee"
                class="w-full mt-1 mb-6 p-3 border rounded-xl focus:ring-2 focus:ring-red-500 outline-none">

            <button
                type="submit"
                class="w-full bg-blue-600 hover:bg-red-700 text-white p-3 rounded-xl font-semibold transition">

                ➕ Add Doctor

            </button>

            <a href="admin.jsp"
               class="block text-center mt-4 text-blue-600 font-semibold">

                ← Back to Dashboard

            </a>

        </form>

    </div>

</div>
<script>
let n = document.getElementById("ms");
setInterval(() => {
   n.style.display = 'none'
},2000)
</script>
</body>
<%} else { %>
<%request.setAttribute("error","session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request,response);%>
<%}%>
</html>