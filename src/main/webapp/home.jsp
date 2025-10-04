<%@page import="com.entity.Job"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="Components/AllCss.jsp"%>
<title>Browse Jobs - Online Job Portal</title>
<style>
body {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	min-height: 100vh;
	padding-top: 2rem;
	padding-bottom: 2rem;
}

.jobs-container {
	max-width: 1200px;
	margin: 2rem auto;
	padding: 0 1rem;
}

.search-card {
	background: white;
	border-radius: 20px;
	padding: 2.5rem;
	margin-bottom: 2rem;
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
}

.search-header {
	text-align: center;
	margin-bottom: 2rem;
}

.search-header i {
	font-size: 2.5rem;
	color: #667eea;
	margin-bottom: 1rem;
}

.search-header h2 {
	color: #333;
	font-size: 1.8rem;
	font-weight: 700;
	margin: 0;
}

.search-form {
	display: grid;
	grid-template-columns: 1fr 1fr auto;
	gap: 1rem;
	align-items: end;
}

.form-group-custom {
	display: flex;
	flex-direction: column;
}

.form-group-custom label {
	font-weight: 600;
	color: #333;
	margin-bottom: 0.5rem;
	font-size: 0.95rem;
}

.form-control, .custom-select {
	border: 2px solid #e0e0e0;
	border-radius: 10px;
	padding: 0.75rem 1rem;
	font-size: 1rem;
	transition: all 0.3s ease;
	width: 100%;
}

.form-control:focus, .custom-select:focus {
	border-color: #667eea;
	box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
	outline: none;
}

.btn-search {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	border: none;
	border-radius: 10px;
	padding: 0.75rem 2rem;
	font-size: 1rem;
	font-weight: 600;
	color: white;
	cursor: pointer;
	transition: all 0.3s ease;
	height: fit-content;
}

.btn-search:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
}

.alert-custom {
	background: #fff3cd;
	border: 2px solid #ffc107;
	border-radius: 10px;
	padding: 1rem;
	margin-bottom: 1.5rem;
	color: #856404;
	font-weight: 500;
	text-align: center;
}

.job-card {
	background: white;
	border-radius: 15px;
	padding: 2rem;
	margin-bottom: 1.5rem;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
	transition: all 0.3s ease;
}

.job-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.25);
}

.job-icon {
	text-align: center;
	margin-bottom: 1rem;
}

.job-icon i {
	font-size: 2.5rem;
	color: #667eea;
}

.job-title {
	font-size: 1.4rem;
	font-weight: 700;
	color: #333;
	margin-bottom: 1rem;
}

.job-description {
	color: #666;
	font-size: 1rem;
	line-height: 1.6;
	margin-bottom: 1.5rem;
}

.job-details {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 1rem;
	margin-bottom: 1.5rem;
}

.detail-badge {
	background: #f8f9fa;
	border: 2px solid #e0e0e0;
	border-radius: 10px;
	padding: 0.75rem 1rem;
	display: flex;
	align-items: center;
	gap: 0.5rem;
	font-size: 0.95rem;
}

.detail-badge i {
	color: #667eea;
}

.detail-badge strong {
	color: #333;
	font-weight: 600;
}

.publish-date {
	color: #666;
	font-size: 0.9rem;
	margin-bottom: 1rem;
}

.publish-date i {
	color: #667eea;
	margin-right: 0.5rem;
}

.btn-view-more {
	background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
	border: none;
	border-radius: 10px;
	padding: 0.75rem 2rem;
	font-size: 1rem;
	font-weight: 600;
	color: white;
	text-decoration: none;
	display: inline-block;
	transition: all 0.3s ease;
}

.btn-view-more:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
	color: white;
}

.no-jobs {
	background: white;
	border-radius: 15px;
	padding: 3rem;
	text-align: center;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}

.no-jobs i {
	font-size: 4rem;
	color: #ccc;
	margin-bottom: 1rem;
}

.no-jobs p {
	color: #666;
	font-size: 1.2rem;
	margin: 0;
}

@media (max-width: 768px) {
	.search-form {
		grid-template-columns: 1fr;
	}
	
	.btn-search {
		width: 100%;
	}
	
	.job-details {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>
	<%@ include file="Components/Navbar.jsp"%>
	<c:if test="${ empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<div class="jobs-container">
		<c:if test="${not empty succMsg }">
			<div class="alert-custom">
				<i class="fa fa-check-circle me-2"></i>${ succMsg }
			</div>
			<c:remove var="succMsg" />
		</c:if>
		
		<!-- Search Card -->
		<div class="search-card">
			<div class="search-header">
				<i class="fas fa-search"></i>
				<h2>Find Your Perfect Job</h2>
			</div>
			
			<form action="more_view.jsp" method="get" class="search-form">
				<div class="form-group-custom">
					<label>
						<i class="fas fa-map-marker-alt me-2"></i>Location
					</label>
					<select name="loc" class="custom-select">
						<option selected value="lo">Choose Location...</option>
						<option value="Odisha">Odisha</option>
						<option value="Gujrat">Gujarat</option>
						<option value="Bhuneshwar">Bhubaneswar</option>
						<option value="Delhi">Delhi</option>
						<option value="Banglore">Bangalore</option>
						<option value="Chennai">Chennai</option>
						<option value="Hydrabad">Hyderabad</option>
					</select>
				</div>
				
				<div class="form-group-custom">
					<label>
						<i class="fas fa-tag me-2"></i>Category
					</label>
					<select name="cat" class="custom-select">
						<option value="ca" selected>Choose Category...</option>
						<option value="IT">IT</option>
						<option value="Developer">Developer</option>
						<option value="Banking">Banking</option>
						<option value="Engineer">Engineer</option>
						<option value="Teacher">Teacher</option>
					</select>
				</div>
				
				<button type="submit" class="btn-search">
					<i class="fas fa-search me-2"></i>Search
				</button>
			</form>
		</div>
		
		<!-- Job Listings -->
		<%
		JobDAO dao = new JobDAO(DBConnection.getConn());
		List<Job> list = dao.getAllJobsForUser();
		
		if (list != null && !list.isEmpty()) {
			for (Job j : list) {
		%>
		<div class="job-card">
			<div class="job-icon">
				<i class="far fa-clipboard"></i>
			</div>
			
			<h3 class="job-title"><%= j.getTitle() %></h3>
			
			<div class="job-description">
				<%
				String description = j.getDescription();
				if (description != null && description.length() > 0) {
					if (description.length() < 120) {
						out.println(description);
					} else {
						out.println(description.substring(0, 120) + "...");
					}
				}
				%>
			</div>
			
			<div class="job-details">
				<div class="detail-badge">
					<i class="fas fa-map-marker-alt"></i>
					<div>
						<strong>Location:</strong> <%= j.getLocation() %>
					</div>
				</div>
				
				<div class="detail-badge">
					<i class="fas fa-tag"></i>
					<div>
						<strong>Category:</strong> <%= j.getCategory() %>
					</div>
				</div>
			</div>
			
			<div class="publish-date">
				<i class="far fa-calendar-alt"></i>
				<strong>Published:</strong> <%= j.getPdate() %>
			</div>
			
			<div class="text-center">
				<a href="one_view.jsp?id=<%= j.getId() %>" class="btn-view-more">
					<i class="fas fa-eye me-2"></i>View Details
				</a>
			</div>
		</div>
		<%
			}
		} else {
		%>
		<div class="no-jobs">
			<i class="fas fa-inbox"></i>
			<p>No jobs available at the moment. Please check back later!</p>
		</div>
		<%
		}
		%>
	</div>

	<%@ include file="Components/Footer.jsp"%>
</body>
</html>