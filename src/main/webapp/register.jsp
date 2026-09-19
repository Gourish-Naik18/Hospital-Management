<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Patient Register</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body class="bg-gradient-to-br from-blue-100 via-green-300 to-white-100 min-h-screen flex items-center justify-center p-6">

<div class="bg-white w-full max-w-md rounded-3xl shadow-2xl p-8">

    <!-- Icon -->
    <div class="text-center mb-6">

        <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto">
            <i class="fa-solid fa-user-plus text-4xl text-green-700"></i>
        </div>

        <h1 class="text-3xl font-bold text-gray-800 mt-4">
            Patient Register
        </h1>

        <p class="text-gray-500 mt-2">
            Create your hospital account
        </p>

    </div>

    <form action="Register" method="post">

        <label class="font-semibold text-gray-700">
            Full Name
        </label>

        <div class="relative mt-1 mb-4">
            <i class="fa-solid fa-user absolute left-4 top-4 text-gray-400"></i>

            <input
                name="name"
                placeholder="Enter Full Name"
                class="w-full pl-11 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">
        </div>

        <label class="font-semibold text-gray-700">
            Phone Number
        </label>

        <div class="relative mt-1 mb-4">
            <i class="fa-solid fa-phone absolute left-4 top-4 text-gray-400"></i>

            <input
                name="phone"
                placeholder="Enter Phone Number"
                class="w-full pl-11 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">
        </div>

        <label class="font-semibold text-gray-700">
            Email
        </label>

        <div class="relative mt-1 mb-4">
            <i class="fa-solid fa-envelope absolute left-4 top-4 text-gray-400"></i>

            <input
                name="email"
                placeholder="Enter Email"
                class="w-full pl-11 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">
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
                class="w-full pl-11 p-3 border rounded-xl focus:ring-2 focus:ring-blue-500 outline-none">
        </div>

        <button
            type="submit"
            class="w-full bg-green-600 hover:bg-blue-700 text-white p-3 rounded-xl font-semibold transition">

            Register

        </button>

        <div class="text-center mt-5">

            <span class="text-gray-500">
                Already have an account?
            </span>

            <a href="login.jsp"
               class="text-blue-600 font-semibold hover:underline ml-1">
                Login
            </a>

        </div>

    </form>

</div>

</body>
</html>