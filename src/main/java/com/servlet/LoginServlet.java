package com.servlet;

import java.io.IOException;

import com.DB.DBConnection;
import com.dao.UserDAO;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("email");
			String ps = req.getParameter("password");
			HttpSession session = req.getSession();
			User u = new User();

			if ("admin@gmail.com".equals(em) && "admin".equals(ps)) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			} else {
				UserDAO dao = new UserDAO(DBConnection.getConn());
				User user = dao.login(em, ps);
				System.out.println("in side loginservlet: -");
//				System.out.println(user.getQualification());
				if (user != null) {
					System.out.println(user.getName()+"\n"+user.getEmail()+"\n"+user.getQualification()+"\n"+user.getRole());
					session.setAttribute("userobj", user);
					resp.sendRedirect("home.jsp");
				} else {
					session.setAttribute("succMsg", "Invalid credentials");
					resp.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
