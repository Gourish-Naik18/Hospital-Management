<%@page import="com.hospital.dto.Doctor"%>
<%@page import="com.hospital.dao.Impl.DoctorDAOImpl"%>
<%@page import="com.hospital.dao.DoctorDAO"%>
<%@page import="com.hospital.dto.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Doctor</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%Patient p = (Patient)session.getAttribute("patient");%>
<%if(p != null){%>
<body class="bg-gradient-to-br from-blue-100 via-white to-purple-100 min-h-screen flex items-center justify-center p-6">

<div class="bg-white rounded-3xl shadow-2xl overflow-hidden max-w-5xl w-full grid md:grid-cols-2">

    <!-- Left Panel -->
    <div class="bg-blue-800 text-white p-10 flex flex-col justify-center">

        <div class="text-7xl text-center mb-6">
            🩺
        </div>

        <h1 class="text-4xl font-bold text-center mb-4">
            Update Doctor
        </h1>

        <p class="text-center text-blue-100">
            Modify doctor details, specialization, fee, and availability.
        </p>

        <div class="mt-8 space-y-4">

            <div class="bg-blue-700 p-4 rounded-xl">
                👨‍⚕️ Update Doctor Records
            </div>

            <div class="bg-blue-700 p-4 rounded-xl">
                💰 Manage Consultation Fee
            </div>

            <div class="bg-blue-700 p-4 rounded-xl">
                ✅ Update Availability
            </div>

        </div>

    </div>

    <!-- Form Section -->
    <div class="p-10">

        <h2 class="text-3xl font-bold text-gray-800 mb-2">
            Doctor Information
        </h2>
        
          <%String message = (String)request.getAttribute("error");%>
		  <%if(message != null){%>
		  <h2 id="msg" class="text-red-300 text-xl"><%=message%></h2>
		  <%}%>
		  
		  <%String message1 = (String)request.getAttribute("sucess");%>
		  <%if(message1 != null){%>
		  <h2 id="ms" class="text-green-300 text-xl"><%=message1%></h2>
		  <%}%>

        <p class="text-gray-500 mb-6">
            Enter updated doctor details below.
        </p>
        
        
        <%DoctorDAO ddao = new DoctorDAOImpl();%>
        <%Doctor d = ddao.get_DoctorById(Integer.parseInt(request.getParameter("doctorId")));%>
        <form action="UpdateDoctor" method="post">
            
            <input  type="hidden" name="doctorId" placeholder="Enter Doctor ID"
                value="<%=d.getDoctor_id()%>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">Doctor Name</label>
            <input required name="name" placeholder="Enter Doctor Name"
              value="<%=d.getName()%>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">Specialization</label>
            <input required name="specialization" placeholder="Cardiology / Neurology / ENT"
              value="<%=d.getSpecialization() %>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">Phone Number</label>
            <input required name="phone" placeholder="Enter Phone Number"
            value="<%=d.getPhone() %>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">Email Address</label>
            <input required name="email" placeholder="Enter Email"
            value="<%=d.getMail()%>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">Experience Years</label>
            <input required name="experience" placeholder="Enter Experience Years"
            value="<%=d.getExperience_years() %>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">Consultation Fee</label>
            <input required name="fee" placeholder="Enter Consultation Fee"
            value="<%=d.getConsultation_fee() %>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">Availability</label>
            <select required name="available"
                class="w-full mt-1 mb-6 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">
                <option value=""><%=d.getAvailable()%></option>
                <option value="YES">YES</option>
                <option value="NO">NO</option>
            </select>

            <button type="submit"
                class="w-full bg-blue-700 hover:bg-blue-800 text-white p-3 rounded-xl font-semibold transition">
                💾 Update Doctor
            </button>

            <a href="admin.jsp"
               class="block text-center mt-4 text-blue-700 font-semibold">
                ← Back to Dashboard
            </a>
            
            <a href="Manage_Doctors.jsp"
               class="block text-center mt-4 text-blue-700 font-semibold">
                ← Back to Update
            </a>

        </form>

    </div>

</div>
<%} else { %>
<%request.setAttribute("error","session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request,response);%>
<%}%>
</body>
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