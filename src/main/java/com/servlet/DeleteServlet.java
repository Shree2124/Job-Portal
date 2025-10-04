package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.dao.JobDAO;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			int id =  Integer.parseInt(req.getParameter("id"));
			JobDAO dao = new JobDAO(DBConnection.getConn());
			boolean f = dao.deleteJob(id);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("sussMsg", "job Deleted successfully..");
				resp.sendRedirect("view_job.jsp");
			}else {
				session.setAttribute("sussMsg", "something went wrong..");
				resp.sendRedirect("view_job.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
