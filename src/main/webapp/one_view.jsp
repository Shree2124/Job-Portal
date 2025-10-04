<%@page import="com.entity.Job"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Details - Online Job Portal</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
body {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	min-height: 100vh;
	padding-top: 2rem;
	padding-bottom: 2rem;
}

.job-detail-container {
	max-width: 900px;
	margin: 2rem auto;
	padding: 0 1rem;
}

.job-detail-card {
	background: white;
	border-radius: 20px;
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
	overflow: hidden;
}

.job-header {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	padding: 3rem 2rem;
	text-align: center;
	position: relative;
}

.job-header::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
}

.job-header-content {
	position: relative;
	z-index: 1;
}

.job-icon {
	color: white;
	font-size: 4rem;
	margin-bottom: 1.5rem;
	filter: drop-shadow(0 5px 15px rgba(0, 0, 0, 0.2));
}

.job-title {
	color: white;
	font-size: 2rem;
	font-weight: 700;
	margin-bottom: 0.5rem;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.job-badge {
	display: inline-block;
	background: rgba(255, 255, 255, 0.2);
	color: white;
	padding: 0.5rem 1.5rem;
	border-radius: 50px;
	font-weight: 600;
	margin-top: 1rem;
	backdrop-filter: blur(10px);
}

.job-body {
	padding: 3rem 2.5rem;
}

.section {
	margin-bottom: 2.5rem;
}

.section-title {
	font-size: 1.3rem;
	font-weight: 700;
	color: #333;
	margin-bottom: 1rem;
	display: flex;
	align-items: center;
	gap: 0.75rem;
	padding-bottom: 0.75rem;
	border-bottom: 3px solid #667eea;
}

.section-title i {
	color: #667eea;
	font-size: 1.5rem;
}

.job-description {
	color: #555;
	font-size: 1.05rem;
	line-height: 1.8;
	text-align: justify;
}

.job-details-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 1.5rem;
	margin-top: 1.5rem;
}

.detail-card {
	background: #f8f9fa;
	border: 2px solid #e0e0e0;
	border-radius: 15px;
	padding: 1.5rem;
	transition: all 0.3s ease;
}

.detail-card:hover {
	border-color: #667eea;
	box-shadow: 0 5px 15px rgba(102, 126, 234, 0.2);
	transform: translateY(-3px);
}

.detail-icon {
	font-size: 2rem;
	color: #667eea;
	margin-bottom: 1rem;
}

.detail-label {
	font-size: 0.9rem;
	color: #666;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	margin-bottom: 0.5rem;
}

.detail-value {
	font-size: 1.2rem;
	color: #333;
	font-weight: 700;
}

.publish-info {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
	border-radius: 15px;
	padding: 1.5rem;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 1rem;
}

.publish-info i {
	font-size: 2rem;
	color: #667eea;
}

.publish-info-text {
	font-size: 1rem;
	color: #555;
}

.publish-info-text strong {
	color: #333;
	font-weight: 700;
}

.action-section {
	padding: 2rem 2.5rem;
	background: #f8f9fa;
	border-top: 2px solid #e0e0e0;
	display: flex;
	justify-content: center;
	gap: 1rem;
}

.btn-action {
	padding: 0.875rem 2.5rem;
	border-radius: 10px;
	font-weight: 600;
	font-size: 1.05rem;
	border: none;
	cursor: pointer;
	transition: all 0.3s ease;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 0.5rem;
}

.btn-apply {
	background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
	color: white;
}

.btn-apply:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 20px rgba(40, 167, 69, 0.4);
	color: white;
}

.btn-back {
	background: linear-gradient(135deg, #6c757d 0%, #5a6268 100%);
	color: white;
}

.btn-back:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 20px rgba(108, 117, 125, 0.4);
	color: white;
}

@media (max-width: 768px) {
	.job-header {
		padding: 2rem 1.5rem;
	}
	
	.job-title {
		font-size: 1.5rem;
	}
	
	.job-body {
		padding: 2rem 1.5rem;
	}
	
	.job-details-grid {
		grid-template-columns: 1fr;
	}
	
	.action-section {
		flex-direction: column;
		padding: 1.5rem;
	}
	
	.btn-action {
		width: 100%;
		justify-content: center;
	}
}
</style>
</head>
<body>
<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>
<%@ include file="Components/Navbar.jsp"%>

<div class="job-detail-container">
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	JobDAO dao = new JobDAO(DBConnection.getConn());
	Job j = dao.getJobById(id);
	%>
	
	<div class="job-detail-card">
		<!-- Job Header -->
		<div class="job-header">
			<div class="job-header-content">
				<div class="job-icon">
					<i class="far fa-clipboard"></i>
				</div>
				<h1 class="job-title"><%= j.getTitle() %></h1>
				<div class="job-badge">
					<i class="fas fa-briefcase me-2"></i>Full Time Position
				</div>
			</div>
		</div>
		
		<!-- Job Body -->
		<div class="job-body">
			<!-- Description Section -->
			<div class="section">
				<h2 class="section-title">
					<i class="fas fa-file-alt"></i>
					Job Description
				</h2>
				<div class="job-description">
					<%= j.getDescription() %>
				</div>
			</div>
			
			<!-- Job Details Section -->
			<div class="section">
				<h2 class="section-title">
					<i class="fas fa-info-circle"></i>
					Job Information
				</h2>
				<div class="job-details-grid">
					<div class="detail-card">
						<div class="detail-icon">
							<i class="fas fa-map-marker-alt"></i>
						</div>
						<div class="detail-label">Location</div>
						<div class="detail-value"><%= j.getLocation() %></div>
					</div>
					
					<div class="detail-card">
						<div class="detail-icon">
							<i class="fas fa-tag"></i>
						</div>
						<div class="detail-label">Category</div>
						<div class="detail-value"><%= j.getCategory() %></div>
					</div>
				</div>
			</div>
			
			<!-- Publish Date Section -->
			<div class="section">
				<div class="publish-info">
					<i class="far fa-calendar-alt"></i>
					<div class="publish-info-text">
						<strong>Published on:</strong> <%= j.getPdate() %>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Action Buttons -->
		<div class="action-section">
			<a href="#" class="btn-action btn-apply">
				<i class="fas fa-paper-plane"></i>
				Apply Now
			</a>
			<a href="home.jsp" class="btn-action btn-back">
				<i class="fas fa-arrow-left"></i>
				Back to Jobs
			</a>
		</div>
	</div>
</div>

<%@ include file="Components/Footer.jsp"%>
</body>
</html>