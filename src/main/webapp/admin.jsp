<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.Job"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - Online Job Portal</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
body {
    background: #f8f9fa;
}

.back-img {
    background: linear-gradient(135deg, rgba(13, 110, 253, 0.9), rgba(108, 117, 125, 0.9)), url("images/admin.jpg");
    width: 100%;
    min-height: 100vh;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    padding: 2rem 0;
}

.back-img::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
}

.admin-container {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 1200px;
    padding: 0 1rem;
}

.welcome-card {
    background: white;
    border-radius: 20px;
    padding: 3rem 2rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
    text-align: center;
    margin-bottom: 2rem;
}

.welcome-icon {
    font-size: 4rem;
    color: #0d6efd;
    margin-bottom: 1rem;
}

.welcome-card h1 {
    color: #333;
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
}

.welcome-card p {
    color: #666;
    font-size: 1.1rem;
    margin: 0;
}

.stats-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
    margin-top: 2rem;
}

.stat-card {
    background: white;
    border-radius: 15px;
    padding: 2rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    border-left: 5px solid;
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
}

.stat-card.jobs {
    border-left-color: #0d6efd;
}

.stat-card.users {
    border-left-color: #198754;
}

.stat-card.applications {
    border-left-color: #ffc107;
}

.stat-card.active {
    border-left-color: #dc3545;
}

.stat-icon {
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

.stat-card.jobs .stat-icon {
    color: #0d6efd;
}

.stat-card.users .stat-icon {
    color: #198754;
}

.stat-card.applications .stat-icon {
    color: #ffc107;
}

.stat-card.active .stat-icon {
    color: #dc3545;
}

.stat-card h3 {
    font-size: 2rem;
    font-weight: 700;
    color: #333;
    margin-bottom: 0.5rem;
}

.stat-card p {
    color: #666;
    font-size: 1rem;
    margin: 0;
}

.quick-actions {
    margin-top: 2rem;
    background: white;
    border-radius: 15px;
    padding: 2rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.quick-actions h2 {
    color: #333;
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    text-align: center;
}

.action-buttons {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
}

.action-btn {
    background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
    color: white;
    border: none;
    border-radius: 10px;
    padding: 1rem 1.5rem;
    font-size: 1rem;
    font-weight: 600;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    transition: all 0.3s ease;
}

.action-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 25px rgba(13, 110, 253, 0.3);
    color: white;
}

.action-btn.secondary {
    background: linear-gradient(135deg, #6c757d 0%, #5a6268 100%);
}

.action-btn.success {
    background: linear-gradient(135deg, #198754 0%, #157347 100%);
}

@media (max-width: 768px) {
    .welcome-card {
        padding: 2rem 1.5rem;
    }
    
    .welcome-card h1 {
        font-size: 2rem;
    }
    
    .stats-container {
        grid-template-columns: 1fr;
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
<%@ include file="Components/Navbar.jsp"%>

<div class="container-fluid back-img">
    <div class="admin-container">
        <!-- Welcome Card -->
        <div class="welcome-card">
            <div class="welcome-icon">
                <i class="fa fa-user-shield"></i>
            </div>
            <h1>Welcome Admin!</h1>
            <p>Manage your job portal efficiently from this dashboard</p>
        </div>
        
        <!-- Statistics Cards -->
        <div class="stats-container">
            <div class="stat-card jobs">
                <div class="stat-icon">
                    <i class="fa fa-briefcase"></i>
                </div>
                <h3>150</h3>
                <p>Total Jobs Posted</p>
            </div>
            
            <div class="stat-card users">
                <div class="stat-icon">
                    <i class="fa fa-users"></i>
                </div>
                <h3>1,250</h3>
                <p>Registered Users</p>
            </div>
            
            <div class="stat-card applications">
                <div class="stat-icon">
                    <i class="fa fa-file-alt"></i>
                </div>
                <h3>3,420</h3>
                <p>Applications Received</p>
            </div>
            
            <div class="stat-card active">
                <div class="stat-icon">
                    <i class="fa fa-chart-line"></i>
                </div>
                <h3>85</h3>
                <p>Active Job Listings</p>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="quick-actions">
            <h2><i class="fa fa-bolt me-2"></i>Quick Actions</h2>
            <div class="action-buttons">
                <a href="add_job.jsp" class="action-btn">
                    <i class="fa fa-plus-circle"></i>
                    Post New Job
                </a>
                <a href="view_job.jsp" class="action-btn secondary">
                    <i class="fa fa-eye"></i>
                    View All Jobs
                </a>
                <a href="#" class="action-btn success">
                    <i class="fa fa-users"></i>
                    Manage Users
                </a>
            </div>
        </div>
    </div>
</div>

<%@ include file="Components/Footer.jsp"%>
</body>
</html>