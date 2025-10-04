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
<title>Search Results - Online Job Portal</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
body {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	min-height: 100vh;
	padding-top: 2rem;
	padding-bottom: 2rem;
}

.results-container {
	max-width: 1200px;
	margin: 2rem auto;
	padding: 0 1rem;
}

.page-header {
	background: white;
	border-radius: 15px;
	padding: 2rem;
	margin-bottom: 2rem;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	text-align: center;
}

.page-header h2 {
	color: #333;
	font-size: 2rem;
	font-weight: 700;
	margin: 0;
}

.page-header i {
	color: #667eea;
	font-size: 2.5rem;
	margin-bottom: 1rem;
}

.filter-info {
	background: #f8f9fa;
	border-radius: 10px;
	padding: 1rem 1.5rem;
	margin-top: 1rem;
	display: flex;
	gap: 2rem;
	justify-content: center;
	flex-wrap: wrap;
}

.filter-badge {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	color: #666;
	font-weight: 600;
}

.filter-badge i {
	color: #667eea;
}

.filter-badge span {
	color: #333;
}

.no-results {
	background: white;
	border-radius: 15px;
	padding: 3rem;
	text-align: center;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
	margin-top: 2rem;
}

.no-results i {
	font-size: 5rem;
	color: #dc3545;
	margin-bottom: 1.5rem;
}

.no-results h3 {
	color: #333;
	font-size: 1.8rem;
	font-weight: 700;
	margin-bottom: 1rem;
}

.no-results p {
	color: #666;
	font-size: 1.1rem;
	margin-bottom: 2rem;
}

.btn-back-search {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	border: none;
	border-radius: 10px;
	padding: 0.875rem 2rem;
	font-size: 1.05rem;
	font-weight: 600;
	color: white;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 0.5rem;
	transition: all 0.3s ease;
}

.btn-back-search:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
	color: white;
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

.results-count {
	background: white;
	border-radius: 10px;
	padding: 1rem;
	margin-bottom: 1.5rem;
	text-align: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.results-count p {
	margin: 0;
	color: #333;
	font-weight: 600;
	font-size: 1.05rem;
}

.results-count span {
	color: #667eea;
	font-weight: 700;
}

@media (max-width: 768px) {
	.filter-info {
		flex-direction: column;
		gap: 0.75rem;
	}
	
	.job-details {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>
<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>
<%@ include file="Components/Navbar.jsp"%>

<div class="results-container">
	<div class="page-header">
		<i class="fas fa-search"></i>
		<h2>Search Results</h2>
		<%
		String loc = request.getParameter("loc");
		String cat = request.getParameter("cat");
		
		if (loc != null && cat != null && !loc.equals("lo") && !cat.equals("ca")) {
		%>
		<div class="filter-info">
			<div class="filter-badge">
				<i class="fas fa-map-marker-alt"></i>
				Location: <span><%= loc %></span>
			</div>
			<div class="filter-badge">
				<i class="fas fa-tag"></i>
				Category: <span><%= cat %></span>
			</div>
		</div>
		<%
		}
		%>
	</div>
	
	<%
	String msg = "";
	JobDAO dao = new JobDAO(DBConnection.getConn());
	List<Job> list = null;
	
	if ("lo".equals(loc) && "ca".equals(cat)) {
		list = new ArrayList<Job>();
		msg = "Job not Available";
	} else if ("lo".equals(loc) || "ca".equals(cat)) {
		list = dao.getJobORLocationAndCate(cat, loc);
	} else {
		list = dao.getJobAndLocationAndCate(cat, loc);
	}
	
	if (list != null && !list.isEmpty()) {
	%>
	<div class="results-count">
		<p>Found <span><%= list.size() %></span> job(s) matching your criteria</p>
	</div>
	<%
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
	<div class="no-results">
		<i class="fas fa-search-minus"></i>
		<h3>No Jobs Found</h3>
		<p>We couldn't find any jobs matching your search criteria. Try adjusting your filters or search again.</p>
		<a href="home.jsp" class="btn-back-search">
			<i class="fas fa-arrow-left"></i>
			Back to All Jobs
		</a>
	</div>
	<%
	}
	%>
</div>

<%@ include file="Components/Footer.jsp"%>
</body>
</html>