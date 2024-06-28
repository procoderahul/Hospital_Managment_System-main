package com.doctor.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			int did=Integer.parseInt(req.getParameter("did"));
			String comm=req.getParameter("comm");
			Boolean adm = Boolean.parseBoolean(req.getParameter("adm"));
			
			AppointmentDAO dao=new AppointmentDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			if(dao.updateCommentStatus(id,adm, did, comm)) {
				session.setAttribute("succMsg", "Comment Updated");
				dao.getAvailbleBeds();
				resp.sendRedirect("doctor/patient.jsp");
			}else {
				session.setAttribute("errorMsg", "Something Wrong on Server");
				resp.sendRedirect("doctor/patient.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}