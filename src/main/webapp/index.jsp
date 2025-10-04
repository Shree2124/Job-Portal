<%@page import="com.DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Job Portal - Home</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes float {
    0%, 100% {
        transform: translateY(0px);
    }
    50% {
        transform: translateY(-20px);
    }
}

.back-img {
    background: linear-gradient(135deg, rgba(13, 110, 253, 0.85), rgba(108, 117, 125, 0.85)), url("images/bg.jpg");
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
    overflow: hidden;
}

.back-img::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: radial-gradient(circle at 50% 50%, rgba(255,255,255,0.1) 0%, transparent 50%);
    animation: pulse 4s ease-in-out infinite;
}

@keyframes pulse {
    0%, 100% {
        opacity: 0.5;
    }
    50% {
        opacity: 0.8;
    }
}

.hero-content {
    z-index: 1;
    animation: fadeInUp 1s ease-out;
    padding: 2rem;
}

.hero-title {
    font-size: 3.5rem;
    font-weight: 700;
    text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);
    margin-bottom: 1.5rem;
    animation: fadeInUp 1s ease-out 0.2s both;
}

.hero-icon {
    font-size: 4rem;
    animation: float 3s ease-in-out infinite;
    display: inline-block;
    margin-right: 1rem;
    filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.5));
}

.hero-subtitle {
    font-size: 1.5rem;
    font-weight: 300;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    margin-bottom: 2rem;
    animation: fadeInUp 1s ease-out 0.4s both;
}

.feature-cards {
    display: flex;
    gap: 2rem;
    justify-content: center;
    flex-wrap: wrap;
    margin-top: 3rem;
    animation: fadeInUp 1s ease-out 0.6s both;
}

.feature-card {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 15px;
    padding: 2rem;
    width: 280px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease;
    cursor: pointer;
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
}

.feature-icon {
    font-size: 3rem;
    color: #0d6efd;
    margin-bottom: 1rem;
}

.feature-title {
    font-size: 1.3rem;
    font-weight: 600;
    color: #333;
    margin-bottom: 0.5rem;
}

.feature-text {
    color: #666;
    font-size: 0.95rem;
}

.cta-button {
    margin-top: 2rem;
    animation: fadeInUp 1s ease-out 0.8s both;
}

.btn-hero {
    padding: 1rem 3rem;
    font-size: 1.2rem;
    font-weight: 600;
    border-radius: 50px;
    transition: all 0.3s ease;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.btn-hero:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
}

@media (max-width: 768px) {
    .hero-title {
        font-size: 2.5rem;
    }
    
    .hero-icon {
        font-size: 3rem;
    }
    
    .hero-subtitle {
        font-size: 1.2rem;
    }
    
    .feature-card {
        width: 100%;
        max-width: 350px;
    }
}
</style>
</head>
<body>
<%@ include file="Components/Navbar.jsp"%>

<div class="container-fluid back-img">
    <div class="hero-content text-center">
        <h1 class="hero-title text-white">
            <i class="fa fa-book hero-icon" aria-hidden="true"></i>
            <br>
            Online Job Portal
        </h1>
        <p class="hero-subtitle text-white">
            Find Your Dream Job or Post Opportunities Today
        </p>
        
        <div class="feature-cards">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa fa-search"></i>
                </div>
                <h3 class="feature-title">Search Jobs</h3>
                <p class="feature-text">Browse thousands of job opportunities from top companies</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa fa-briefcase"></i>
                </div>
                <h3 class="feature-title">Post Jobs</h3>
                <p class="feature-text">Connect with talented professionals looking for opportunities</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa fa-users"></i>
                </div>
                <h3 class="feature-title">Build Network</h3>
                <p class="feature-text">Connect with industry professionals and grow your career</p>
            </div>
        </div>
        
        <div class="cta-button">
            <a href="signup.jsp" class="btn btn-light btn-hero">
                Get Started <i class="fa fa-arrow-right ms-2"></i>
            </a>
        </div>
    </div>
</div>

<%@ include file="Components/Footer.jsp"%>
</body>
</html>