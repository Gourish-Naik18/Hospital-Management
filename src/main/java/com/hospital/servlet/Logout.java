package com.hospital.servlet;

import java.io.IOException;

import com.hospital.dto.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	HttpSession session = req.getSession();
    	Patient p = (Patient)session.getAttribute("patient");
    	if(p != null) {
    		session.invalidate();
    		req.setAttribute("sucess", "logged out sucessfully");
    		req.getRequestDispatcher("login.jsp").forward(req, resp);
    	}
    	else {
			req.setAttribute("error", "session already expired!");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
    }
}
