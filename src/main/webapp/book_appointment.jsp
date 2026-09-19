<%@page import="com.hospital.dto.Patient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<%Patient p = (Patient)session.getAttribute("patient");%>
<%if(p != null){%>
<body class="bg-gradient-to-br from-green-100 via-white to-blue-100 min-h-screen flex items-center justify-center p-5">

    <div class="bg-white shadow-2xl rounded-3xl overflow-hidden max-w-4xl w-full grid md:grid-cols-2">

        <!-- Left Side -->
        <div class="bg-green-700 text-white p-10 flex flex-col justify-center">

            <h1 class="text-4xl font-bold mb-4">
                🏥 Book Appointment
            </h1>

            <p class="text-lg text-green-100 mb-6">
                Schedule your consultation with experienced doctors and get quality healthcare.
            </p>

            <div class="space-y-4">

                <div class="bg-green-600 p-4 rounded-xl">
                    <h3 class="font-semibold">✔ Easy Booking</h3>
                    <p class="text-sm text-green-100">
                        Book appointments in seconds.
                    </p>
                </div>

                <div class="bg-green-600 p-4 rounded-xl">
                    <h3 class="font-semibold">✔ Expert Doctors</h3>
                    <p class="text-sm text-green-100">
                        Consult trusted specialists.
                    </p>
                </div>

                <div class="bg-green-600 p-4 rounded-xl">
                    <h3 class="font-semibold">✔ Fast Service</h3>
                    <p class="text-sm text-green-100">
                        Skip long waiting queues.
                    </p>
                </div>

            </div>

        </div>

        <!-- Right Side Form -->
        <div class="p-10">

            <h2 class="text-3xl font-bold text-gray-800 mb-2">
                Appointment Form
            </h2>
            
             <%String message1 = (String)request.getAttribute("sucess");%>
			  <%if(message1 != null){%>
			  <h2 id="ms" class="text-green-300 text-xl"><%=message1%></h2>
			  <%}%>

            <p class="text-gray-500 mb-6">
                Fill the details below.
            </p>

            <form action="Appointment" method="post">

                <label class="font-semibold text-gray-700">
                    Patient ID
                </label>

                <input
                    name="patientId"
                    placeholder="Enter patient ID"
                    value="<%=p.getPatient_id()%>"
                    class="w-full mb-4 mt-1 p-3 border rounded-xl focus:ring-2 focus:ring-green-500 outline-none">
                    
                    
                     <label class="font-semibold text-gray-700">
                    Doctor ID
                </label>

                <input
                    name="doctorId"
                    value="<%=request.getParameter("doctorId")%>"
                    placeholder="Enter Doctor ID"
                    class="w-full mb-4 mt-1 p-3 border rounded-xl focus:ring-2 focus:ring-green-500 outline-none">
                    

                <label class="font-semibold text-gray-700">
                    Appointment Date
                </label>

                <input
                    name="date"
                    type="date"
                    class="w-full mb-4 mt-1 p-3 border rounded-xl focus:ring-2 focus:ring-green-500 outline-none">

                <label class="font-semibold text-gray-700">
                    Appointment Time
                </label>

                <input
                    name="time"
                    type="time"
                    class="w-full mb-4 mt-1 p-3 border rounded-xl focus:ring-2 focus:ring-green-500 outline-none">

                <label class="font-semibold text-gray-700">
                    Reason
                </label>

                <textarea
                    name="reason"
                    rows="4"
                    placeholder="Describe your health issue..."
                    class="w-full mb-6 mt-1 p-3 border rounded-xl focus:ring-2 focus:ring-green-500 outline-none"></textarea>

                <button
                    type="submit"
                    class="w-full bg-green-600 hover:bg-green-700 text-white font-semibold p-3 rounded-xl transition">

                     Book Appointment

                </button>

            </form>

        </div>

    </div>
<%} else { %>
<%request.setAttribute("error","session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request,response);%>
<%}%>

<script>
let n = document.getElementById("ms");
setInterval(() => {
   n.style.display = 'none'
},2000)
</script>
</body>
</html>