package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String qua = req.getParameter("qua");
			String email = req.getParameter("email");
			String ps = req.getParameter("password");
			
			UserDAO dao = new UserDAO(DBConnection.getConn());
			User u = new User();
			System.out.println("name-"+name);
			u = new User();
			u.setName(name);
			u.setQualification(qua);
			u.setEmail(email);
			u.setPassword(ps);
			u.setRole("User");
			boolean f = dao.addUser(u);
			System.out.print(f);
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("sussMsg", "Registr successfully..");
				resp.sendRedirect("login.jsp");
			}else {
				session.setAttribute("sussMsg", "something went wrong..");
				resp.sendRedirect("signup.jsp");
			}
			
		}catch(Exception e) {
			
		}
	}

}
