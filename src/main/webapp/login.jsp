<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Online Job Portal</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.login-container {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem 0;
}

.login-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    overflow: hidden;
    border: none;
}

.card-header-custom {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 2.5rem 2rem;
    text-align: center;
    border: none;
}

.card-header-custom i {
    color: white;
    font-size: 3.5rem;
    margin-bottom: 1rem;
    display: block;
}

.card-header-custom h5 {
    color: white;
    font-size: 1.8rem;
    font-weight: 700;
    margin: 0;
    letter-spacing: 0.5px;
}

.card-body {
    padding: 2.5rem;
}

.form-group label {
    font-weight: 600;
    color: #333;
    margin-bottom: 0.5rem;
    font-size: 0.95rem;
}

.form-control {
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    padding: 0.75rem 1rem;
    font-size: 1rem;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
    outline: none;
}

.form-control::placeholder {
    color: #aaa;
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

.signup-link {
    text-align: center;
    margin-top: 1.5rem;
    padding-top: 1.5rem;
    border-top: 1px solid #e0e0e0;
}

.signup-link p {
    color: #666;
    margin: 0;
    font-size: 0.95rem;
}

.signup-link a {
    color: #667eea;
    font-weight: 600;
    text-decoration: none;
}

.signup-link a:hover {
    color: #764ba2;
    text-decoration: underline;
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
}

.input-icon .form-control {
    padding-left: 2.75rem;
}

@media (max-width: 768px) {
    .login-card {
        margin: 1rem;
    }
    
    .card-body {
        padding: 2rem 1.5rem;
    }
    
    .card-header-custom {
        padding: 2rem 1.5rem;
    }
}
</style>
</head>
<body>
<%@ include file="Components/Navbar.jsp"%>

<div class="login-container">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                <div class="card login-card">
                    <div class="card-header-custom">
                        <i class="fa fa-user-circle" aria-hidden="true"></i>
                        <h5>Welcome Back</h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty succMsg}">
                            <div class="alert-custom">
                                ${succMsg}
                            </div>
                            <c:remove var="succMsg" />
                        </c:if>
                        
                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">
                                    <i class="fa fa-envelope me-2"></i>Email Address
                                </label>
                                <div class="input-icon">
                                    <i class="fa fa-envelope"></i>
                                    <input type="email" 
                                           class="form-control" 
                                           id="exampleInputEmail1"
                                           aria-describedby="emailHelp" 
                                           placeholder="Enter your email"
                                           name="email"
                                           required>
                                </div>
                            </div>
                            
                            <div class="form-group mt-3">
                                <label for="exampleInputPassword1">
                                    <i class="fa fa-lock me-2"></i>Password
                                </label>
                                <div class="input-icon">
                                    <i class="fa fa-lock"></i>
                                    <input type="password" 
                                           class="form-control" 
                                           id="exampleInputPassword1"
                                           placeholder="Enter your password" 
                                           name="password"
                                           required>
                                </div>
                            </div>
                            
                            <button type="submit" class="btnLogin btn btn-primary">
                                <i class="fa fa-sign-in me-2"></i>Login
                            </button>
                        </form>
                        
                        <div class="signup-link">
                            <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>