<%@page import="com.hospital.dto.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Profile</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%Patient p = (Patient)session.getAttribute("patient");%>
<%if(p != null){%>
<body class="bg-gradient-to-br from-blue-100 via-white to-green-100 min-h-screen flex items-center justify-center p-6">

<div class="bg-white rounded-3xl shadow-2xl overflow-hidden max-w-4xl w-full grid md:grid-cols-2">

    <!-- Left Section -->
    <div class="bg-green-500 text-white p-10 flex flex-col justify-center">

        <div class="text-7xl mb-6 text-center">
            👤
        </div>

        <h1 class="text-4xl font-bold mb-4 text-center">
            My Profile
        </h1>

        <p class="text-center text-blue-100">
            Keep your personal information updated to ensure smooth appointment booking and communication.
        </p>

        <div class="mt-8 space-y-4">

            <div class="bg-green-600 p-4 rounded-xl">
                📞 Update Contact Information
            </div>

            <div class="bg-green-600 p-4 rounded-xl">
                📧 Update Email Address
            </div>

            <div class="bg-green-600 p-4 rounded-xl">
                🔒 Change Password Securely
            </div>

        </div>

    </div>

    <!-- Right Section -->
    <div class="p-10">

        <h2 class="text-3xl font-bold text-gray-800 mb-2">
            Update Profile
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
            Modify your account information below.
        </p>

        <form action="update" method="post">

            <label class="font-semibold text-gray-700">
                Full Name
            </label>

            <input
                placeholder="Enter Full Name"
                name="name"
                value="<%=p.getName()%>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">
                Phone Number
            </label>

            <input
                placeholder="Enter Phone Number"
                name="phone"
                value="<%=p.getPhone()%>"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">
                Email Address
            </label>

            <input
                placeholder="Enter Email"
                name="mail"
                class="w-full mt-1 mb-4 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <label class="font-semibold text-gray-700">
                Password
            </label>

            <input
                type="password"
                placeholder="Enter Password"
                name="password"
                value="<%=p.getPassword()%>"
                class="w-full mt-1 mb-6 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">

            <button
                type="submit"
                class="w-full bg-green-600 hover:bg-blue-700 text-white p-3 rounded-xl font-semibold transition">

                💾 Update Profile

            </button>

            <a href="patient_db.jsp"
               class="block text-center mt-4 text-blue-600 font-semibold">

                ← Back to Dashboard

            </a>

        </form>

    </div>

</div>
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
</body>
</html>