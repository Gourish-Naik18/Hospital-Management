<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body class="bg-gradient-to-br from-blue-100 via-green-300 to-white-100 min-h-screen flex items-center justify-center p-6">

<div class="bg-white w-full max-w-md rounded-3xl shadow-2xl p-8">

    <!-- Logo -->
    <div class="text-center mb-6">
        <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto">
            <i class="fa-solid fa-hospital text-4xl text-green-700"></i>
        </div>

        <h1 class="text-3xl font-bold text-gray-800 mt-4">
            Hospital Portal
        </h1>

        <p class="text-gray-500 mt-2">
            Login to continue
        </p>
    </div>

    <form action="Login" method="post">

        <%String message = (String)request.getAttribute("error");%>
        <%if(message != null){%>
        <h2 id="msg"
            class="bg-red-100 text-red-600 text-center p-3 rounded-xl mb-4 font-semibold">
            <%=message%>
        </h2>
        <%}%>

        <%String message1 = (String)request.getAttribute("sucess");%>
        <%if(message1 != null){%>
        <h2 id="ms"
            class="bg-green-100 text-green-600 text-center p-3 rounded-xl mb-4 font-semibold">
            <%=message1%>
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
                class="w-full pl-11 p-3 border rounded-xl focus:ring-2 focus:ring-green-500 outline-none">
        </div>

        <label class="font-semibold text-gray-700">
            Password
        </label>

        <div class="relative mt-1 mb-6">
            <i class="fa-solid fa-lock absolute left-4 top-4 text-gray-400"></i>

            <input
                name="password"
                type="password"
                placeholder="Enter Password"
                class="w-full pl-11 p-3 border rounded-xl focus:ring-2 focus:ring-green-500 outline-none">
        </div>

        <button
            type="submit"
            class="w-full bg-green-600 hover:bg-green-700 text-white p-3 rounded-xl font-semibold transition">
            Login
        </button>

        <div class="flex justify-between mt-5 text-sm">

            <a href="forgot.jsp"
               class="text-blue-600 font-semibold hover:underline">
                Forgot Password?
            </a>

            <a href="register.jsp"
               class="text-green-600 font-semibold hover:underline">
                Register
            </a>

        </div>

    </form>

</div>

<script>
let m = document.getElementById("msg");
    setTimeout(() => {
        m.style.display = 'none';
    },2000);


let n = document.getElementById("ms");
    setTimeout(() => {
        n.style.display = 'none';
    },2000);

</script>

</body>
</html>