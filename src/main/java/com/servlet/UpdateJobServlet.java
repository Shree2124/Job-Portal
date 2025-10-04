package com.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.DBConnection;
import com.dao.JobDAO;
import com.entity.Job;

import javax.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category= req.getParameter("category");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");
			
			
			Job j = new Job();
			j.setId(id);
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(desc);
			
			
			HttpSession session = req.getSession();
			JobDAO dao = new JobDAO(DBConnection.getConn());
			boolean f = dao.updateJob(j);
			if(f) {
				session.setAttribute("sussMsg", "job Updated successfully..");
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
