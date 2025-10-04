package com.DB;

import java.sql.*;

public class DBConnection {
	private static Connection conn;
	public static Connection getConn() {
		try {
			if(conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","shree");
				System.out.print(conn);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void main(String args[]) {
		Connection c = DBConnection.getConn();
		System.out.print(c);
	}
}
