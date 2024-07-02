package com.user.servlet;

import java.io.IOException;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
	    int availableBeds = dao.getAvailbleBeds();
	    
	    HttpSession session = req.getSession();
	    session.setAttribute("availableBeds", availableBeds);
	    req.getRequestDispatcher("index.jsp").forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId=Integer.parseInt(req.getParameter("userid"));
		String fullName=req.getParameter("fullname");
		String gender=req.getParameter("gender");
		String age=req.getParameter("age");
		String appoint_date=req.getParameter("appoint_date");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String diseases=req.getParameter("diseases");
		int doctor_id=Integer.parseInt(req.getParameter("doct"));
		String address=req.getParameter("address");
		String temp = req.getParameter("admit");
		Boolean admit=temp==null? false : req.getParameter("admit").equals("on");

		Appointment ap=new Appointment(userId, fullName, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "Pending", admit);
		
		AppointmentDAO dao=new AppointmentDAO(DBConnect.getConn());
		
		HttpSession session=req.getSession();
		
		if(admit && dao.getAvailbleBeds() < 1) {
			session.setAttribute("errorMsg", "Urgent Slots Unavailable");
			resp.sendRedirect("user_appointment.jsp");
		}
		
		else if(dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment Successfully");
			 if (admit) {
	                int availableBeds = dao.getAvailbleBeds();
	                session.setAttribute("availableBeds", availableBeds);
	            }
			resp.sendRedirect("user_appointment.jsp");
			
		}else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("user_appointment.jsp");
		}
		
		
	}
}
	
/*
 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException { AppointmentDAO dao = new
 * AppointmentDAO(DBConnect.getConn()); int availableBeds =
 * dao.getAvailbleBeds(); req.setAttribute("availableBeds", availableBeds);
 * req.getRequestDispatcher("index.jsp").forward(req, resp);
 * 
 * }
 * 
 * }
 */
