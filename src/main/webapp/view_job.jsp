<%@page import="com.entity.Job"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View All Jobs - Admin Panel</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    padding-top: 2rem;
    padding-bottom: 2rem;
}

.view-jobs-container {
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
    border: none;
}

.job-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.25);
}

.job-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 1.5rem;
    padding-bottom: 1rem;
    border-bottom: 2px solid #f0f0f0;
}

.job-icon {
    color: #667eea;
    font-size: 2rem;
}

.job-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #333;
    margin: 0;
    flex: 1;
    margin-left: 1rem;
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
}

.detail-badge i {
    color: #667eea;
    font-size: 1.1rem;
}

.detail-badge strong {
    color: #333;
    font-weight: 600;
    margin-right: 0.25rem;
}

.detail-badge span {
    color: #666;
}

.status-active {
    border-color: #28a745;
    background: #d4edda;
}

.status-active strong {
    color: #155724;
}

.status-inactive {
    border-color: #dc3545;
    background: #f8d7da;
}

.status-inactive strong {
    color: #721c24;
}

.job-footer {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-top: 1rem;
    border-top: 2px solid #f0f0f0;
}

.publish-date {
    color: #666;
    font-size: 0.9rem;
}

.publish-date i {
    color: #667eea;
    margin-right: 0.5rem;
}

.job-actions {
    display: flex;
    gap: 0.75rem;
}

.btn-action {
    padding: 0.5rem 1.5rem;
    border-radius: 8px;
    font-weight: 600;
    font-size: 0.95rem;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.btn-edit {
    background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
    color: white;
}

.btn-edit:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
    color: white;
}

.btn-delete {
    background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
    color: white;
}

.btn-delete:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(220, 53, 69, 0.4);
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
    .job-header {
        flex-direction: column;
        text-align: center;
    }
    
    .job-title {
        margin-left: 0;
        margin-top: 1rem;
    }
    
    .job-details {
        grid-template-columns: 1fr;
    }
    
    .job-footer {
        flex-direction: column;
        gap: 1rem;
    }
    
    .job-actions {
        width: 100%;
    }
    
    .btn-action {
        flex: 1;
        justify-content: center;
    }
}
</style>
</head>
<body>
<%@ include file="Components/Navbar.jsp"%>
<c:if test="${userobj.getRole() ne 'admin' }">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<div class="view-jobs-container">
    <div class="page-header">
        <i class="fas fa-briefcase"></i>
        <h2>All Posted Jobs</h2>
    </div>
    
    <c:if test="${not empty succMsg}">
        <div class="alert-custom">
            <i class="fa fa-check-circle me-2"></i>${succMsg}
        </div>
        <c:remove var="succMsg" />
    </c:if>
    
    <%
    JobDAO dao = new JobDAO(DBConnection.getConn());
    List<Job> list = dao.getAllJobs();
    
    if (list != null && !list.isEmpty()) {
        for (Job j : list) {
    %>
    <div class="job-card">
        <div class="job-header">
            <i class="far fa-clipboard job-icon"></i>
            <h3 class="job-title"><%= j.getTitle() %></h3>
        </div>
        
        <p class="job-description"><%= j.getDescription() %></p>
        
        <div class="job-details">
            <div class="detail-badge">
                <i class="fas fa-map-marker-alt"></i>
                <div>
                    <strong>Location:</strong>
                    <span><%= j.getLocation() %></span>
                </div>
            </div>
            
            <div class="detail-badge">
                <i class="fas fa-tag"></i>
                <div>
                    <strong>Category:</strong>
                    <span><%= j.getCategory() %></span>
                </div>
            </div>
            
            <div class="detail-badge <%= j.getStatus().equalsIgnoreCase("Active") ? "status-active" : "status-inactive" %>">
                <i class="fas fa-circle"></i>
                <div>
                    <strong>Status:</strong>
                    <span><%= j.getStatus() %></span>
                </div>
            </div>
        </div>
        
        <div class="job-footer">
            <div class="publish-date">
                <i class="far fa-calendar-alt"></i>
                <strong>Published:</strong> <%= j.getPdate() %>
            </div>
            
            <div class="job-actions">
                <a href="edit_job.jsp?id=<%= j.getId() %>" class="btn-action btn-edit">
                    <i class="fas fa-edit"></i>Edit
                </a>
                <a href="delete?id=<%= j.getId() %>" class="btn-action btn-delete">
                    <i class="fas fa-trash"></i>Delete
                </a>
            </div>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <div class="no-jobs">
        <i class="fas fa-inbox"></i>
        <p>No jobs posted yet. Start by adding your first job!</p>
    </div>
    <%
    }
    %>
</div>

<%@ include file="Components/Footer.jsp"%>
</body>
</html>