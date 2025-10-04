<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.Job"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.JobDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Job - Admin Panel</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem 0;
}

.delete-container {
    max-width: 600px;
    width: 100%;
    padding: 0 1rem;
}

.delete-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    overflow: hidden;
}

.delete-header {
    background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
    padding: 2.5rem 2rem;
    text-align: center;
}

.delete-icon {
    font-size: 4rem;
    color: white;
    margin-bottom: 1rem;
    filter: drop-shadow(0 5px 15px rgba(0, 0, 0, 0.2));
}

.delete-header h2 {
    color: white;
    font-size: 1.8rem;
    font-weight: 700;
    margin: 0;
}

.delete-body {
    padding: 2.5rem;
}

.job-info {
    background: #f8f9fa;
    border-radius: 15px;
    padding: 2rem;
    margin-bottom: 2rem;
}

.job-info h3 {
    color: #333;
    font-size: 1.3rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    text-align: center;
}

.info-row {
    display: flex;
    justify-content: space-between;
    padding: 0.75rem 0;
    border-bottom: 1px solid #e0e0e0;
}

.info-row:last-child {
    border-bottom: none;
}

.info-label {
    font-weight: 600;
    color: #666;
}

.info-value {
    color: #333;
    font-weight: 500;
}

.warning-box {
    background: #fff3cd;
    border: 2px solid #ffc107;
    border-radius: 10px;
    padding: 1.5rem;
    margin-bottom: 2rem;
}

.warning-box i {
    color: #856404;
    font-size: 1.5rem;
    margin-right: 0.75rem;
}

.warning-box p {
    color: #856404;
    font-weight: 600;
    margin: 0;
    display: inline;
}

.action-buttons {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
}

.btn-action {
    padding: 0.875rem 1.5rem;
    border-radius: 10px;
    font-weight: 600;
    font-size: 1.05rem;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.btn-delete {
    background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
    color: white;
}

.btn-delete:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(220, 53, 69, 0.4);
    color: white;
}

.btn-cancel {
    background: linear-gradient(135deg, #6c757d 0%, #5a6268 100%);
    color: white;
}

.btn-cancel:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(108, 117, 125, 0.4);
    color: white;
}

@media (max-width: 768px) {
    .delete-body {
        padding: 2rem 1.5rem;
    }
    
    .action-buttons {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>
<c:if test="${userobj.getRole() ne 'admin' }">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%
int id = Integer.parseInt(request.getParameter("id"));
JobDAO dao = new JobDAO(DBConnection.getConn());
Job j = dao.getJobById(id);
%>

<div class="delete-container">
    <div class="delete-card">
        <div class="delete-header">
            <div class="delete-icon">
                <i class="fas fa-exclamation-triangle"></i>
            </div>
            <h2>Delete Job Confirmation</h2>
        </div>
        
        <div class="delete-body">
            <div class="job-info">
                <h3>Job Details</h3>
                <div class="info-row">
                    <span class="info-label">Job Title:</span>
                    <span class="info-value"><%= j.getTitle() %></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Location:</span>
                    <span class="info-value"><%= j.getLocation() %></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Category:</span>
                    <span class="info-value"><%= j.getCategory() %></span>
                </div>
                <div class="info-row">
                    <span class="info-label">Status:</span>
                    <span class="info-value"><%= j.getStatus() %></span>
                </div>
            </div>
            
            <div class="warning-box">
                <i class="fas fa-exclamation-circle"></i>
                <p>Are you sure you want to delete this job? This action cannot be undone.</p>
            </div>
            
            <form action="delete" method="post">
                <input type="hidden" name="id" value="<%= j.getId() %>">
                <div class="action-buttons">
                    <button type="submit" class="btn-action btn-delete">
                        <i class="fas fa-trash"></i>
                        Yes, Delete
                    </button>
                    <a href="view_job.jsp" class="btn-action btn-cancel">
                        <i class="fas fa-times"></i>
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>