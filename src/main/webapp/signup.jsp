<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up - Online Job Portal</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.signup-container {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem 0;
}

.signup-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    overflow: hidden;
    border: none;
}

.card-header-custom {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 2rem;
    text-align: center;
    border: none;
}

.card-header-custom i {
    color: white;
    font-size: 3rem;
    margin-bottom: 0.75rem;
    display: block;
}

.card-header-custom h5 {
    color: white;
    font-size: 1.6rem;
    font-weight: 700;
    margin: 0;
    letter-spacing: 0.5px;
}

.card-body {
    padding: 2.5rem;
}

.form-group {
    margin-bottom: 1.25rem;
}

.form-group label {
    font-weight: 600;
    color: #333;
    margin-bottom: 0.5rem;
    font-size: 0.95rem;
    display: block;
}

.form-control {
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    padding: 0.75rem 1rem;
    font-size: 1rem;
    transition: all 0.3s ease;
    width: 100%;
}

.form-control:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
    outline: none;
}

.form-control::placeholder {
    color: #aaa;
}

.input-icon {
    position: relative;
}

.input-icon i {
    position: absolute;
    left: 1rem;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
    z-index: 1;
}

.input-icon .form-control {
    padding-left: 2.75rem;
}

.btnLogin {
    display: block;
    width: 100%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    border-radius: 10px;
    padding: 0.875rem;
    font-size: 1.1rem;
    font-weight: 600;
    color: white;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 1.5rem;
}

.btnLogin:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
}

.btnLogin:active {
    transform: translateY(0);
}

.alert-custom-success {
    background: #d4edda;
    border: 2px solid #28a745;
    border-radius: 10px;
    padding: 1rem;
    margin-bottom: 1.5rem;
    color: #155724;
    font-weight: 500;
    text-align: center;
}

.login-link {
    text-align: center;
    margin-top: 1.5rem;
    padding-top: 1.5rem;
    border-top: 1px solid #e0e0e0;
}

.login-link p {
    color: #666;
    margin: 0;
    font-size: 0.95rem;
}

.login-link a {
    color: #667eea;
    font-weight: 600;
    text-decoration: none;
}

.login-link a:hover {
    color: #764ba2;
    text-decoration: underline;
}

.form-row {
    display: flex;
    gap: 1rem;
}

.form-row .form-group {
    flex: 1;
}

@media (max-width: 768px) {
    .signup-card {
        margin: 1rem;
    }
    
    .card-body {
        padding: 2rem 1.5rem;
    }
    
    .card-header-custom {
        padding: 1.75rem 1.5rem;
    }
    
    .form-row {
        flex-direction: column;
        gap: 0;
    }
}
</style>
</head>
<body>
<%@ include file="Components/Navbar.jsp"%>

<div class="signup-container">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card signup-card">
                    <div class="card-header-custom">
                        <i class="fa fa-user-plus" aria-hidden="true"></i>
                        <h5>Create Your Account</h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty succMsg }">
                            <div class="alert-custom-success">
                                <i class="fa fa-check-circle me-2"></i>${succMsg }
                            </div>
                            <c:remove var="succMsg" />
                        </c:if>
                        
                        <form action="register" method="post">
                            <div class="form-group">
                                <label for="nameInput">
                                    <i class="fa fa-user me-2"></i>Full Name
                                </label>
                                <div class="input-icon">
                                    <i class="fa fa-user"></i>
                                    <input type="text" 
                                           required="required" 
                                           class="form-control"
                                           id="nameInput" 
                                           placeholder="Enter your full name"
                                           name="name" />
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="qualificationInput">
                                    <i class="fa fa-graduation-cap me-2"></i>Qualification
                                </label>
                                <div class="input-icon">
                                    <i class="fa fa-graduation-cap"></i>
                                    <input type="text" 
                                           required="required" 
                                           class="form-control"
                                           id="qualificationInput" 
                                           placeholder="Enter your qualification"
                                           name="qua" />
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="emailInput">
                                    <i class="fa fa-envelope me-2"></i>Email Address
                                </label>
                                <div class="input-icon">
                                    <i class="fa fa-envelope"></i>
                                    <input type="email" 
                                           required="required" 
                                           class="form-control"
                                           id="emailInput" 
                                           placeholder="Enter your email"
                                           name="email" />
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="passwordInput">
                                    <i class="fa fa-lock me-2"></i>Password
                                </label>
                                <div class="input-icon">
                                    <i class="fa fa-lock"></i>
                                    <input type="password" 
                                           required="required" 
                                           class="form-control"
                                           id="passwordInput" 
                                           placeholder="Create a password"
                                           name="password" />
                                </div>
                            </div>
                            
                            <button type="submit" class="btnLogin btn btn-primary">
                                <i class="fa fa-user-plus me-2"></i>Sign Up
                            </button>
                        </form>
                        
                        <div class="login-link">
                            <p>Already have an account? <a href="login.jsp">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>