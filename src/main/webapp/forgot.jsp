<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body class="bg-gradient-to-br from-blue-100 via-green-300 to-white-100 min-h-screen flex items-center justify-center p-6">

<div class="bg-white w-full max-w-md rounded-3xl shadow-2xl p-8">

    <!-- Icon -->
    <div class="text-center mb-6">

        <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto">
            <i class="fa-solid fa-key text-4xl text-green-700"></i>
        </div>

        <h1 class="text-3xl font-bold text-gray-800 mt-4">
            Reset Password
        </h1>

        <p class="text-gray-500 mt-2">
            Enter your email and new password
        </p>

    </div>

    <form action="Forgot" method="post">

        <%String message = (String)request.getAttribute("error");%>
        <%if(message != null){%>
        <h2 id="msg"
            class="bg-red-100 text-red-600 text-center p-3 rounded-xl mb-4 font-semibold">
            <%=message%>
        </h2>
        <%}%>

        <label class="font-semibold text-gray-700">
            Email
        </label>

        <div class="relative mt-1 mb-4">

            <i class="fa-solid fa-envelope absolute left-4 top-4 text-gray-400"></i>

            <input
                name="email"
                placeholder="Enter Email"
                class="w-full pl-11 p-3 border rounded-xl focus:ring-2 focus:ring-purple-500 outline-none">

        </div>

        <label class="font-semibold text-gray-700">
            New Password
        </label>

        <div class="relative mt-1 mb-6">

            <i class="fa-solid fa-lock absolute left-4 top-4 text-gray-400"></i>

            <input
                name="newPassword"
                type="password"
                placeholder="Enter New Password"
                class="w-full pl-11 p-3 border rounded-xl focus:ring-2 focus:ring-purple-500 outline-none">

        </div>

        <button
            type="submit"
            class="w-full bg-green-600 hover:bg-purple-700 text-white p-3 rounded-xl font-semibold transition">

            Update Password

        </button>

        <div class="text-center mt-5">

            <a href="login.jsp"
               class="text-green-600 font-semibold hover:underline">

                Back to Login

            </a>

        </div>

    </form>

</div>

<script>
let m = document.getElementById("msg");

if(m){
    setTimeout(() => {
        m.style.display = 'none';
    },2000);
}
</script>

</body>
</html>