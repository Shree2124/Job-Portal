<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile - Online Job Portal</title>
<%@ include file="Components/AllCss.jsp"%>
<style>
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    padding-top: 2rem;
    padding-bottom: 2rem;
}

.edit-profile-container {
    max-width: 600px;
    margin: 2rem auto;
    padding: 0 1rem;
}

.profile-card {
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

.form-group {
    margin-bottom: 1.5rem;
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

.input-icon-wrapper {
    position: relative;
}

.input-icon-wrapper i {
    position: absolute;
    left: 1rem;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
    z-index: 1;
}

.input-icon-wrapper .form-control {
    padding-left: 2.75rem;
}

.field-icon {
    color: #667eea;
    margin-right: 0.5rem;
    font-size: 0.9rem;
}

.btn-update {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    border-radius: 10px;
    padding: 0.875rem;
    font-size: 1.1rem;
    font-weight: 600;
    color: white;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 100%;
    margin-top: 1rem;
}

.btn-update:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
}

.btn-update i {
    margin-right: 0.5rem;
}

.back-link {
    text-align: center;
    margin-top: 1.5rem;
    padding-top: 1.5rem;
    border-top: 1px solid #e0e0e0;
}

.back-link a {
    color: #667eea;
    font-weight: 600;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.back-link a:hover {
    color: #764ba2;
    text-decoration: underline;
}

.password-toggle {
    position: absolute;
    right: 1rem;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #999;
    z-index: 2;
}

.password-toggle:hover {
    color: #667eea;
}

@media (max-width: 768px) {
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
<c:if test="${empty userobj }">
    <c:redirect url="login.jsp" />
</c:if>
<%@ include file="Components/Navbar.jsp"%>

<div class="edit-profile-container">
    <div class="card profile-card">
        <div class="card-header-custom">
            <i class="fa fa-user-edit" aria-hidden="true"></i>
            <h5>Edit Your Profile</h5>
        </div>
        <div class="card-body">
            <form action="update_profile" method="post">
                <input type="hidden" name="id" value="${userobj.id}" />
                
                <div class="form-group">
                    <label>
                        <i class="field-icon fas fa-user"></i>Full Name
                    </label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-user"></i>
                        <input type="text"
                               required="required" 
                               class="form-control" 
                               id="nameInput"
                               name="name"
                               placeholder="Enter your full name"
                               value="${userobj.getName()}" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label>
                        <i class="field-icon fas fa-graduation-cap"></i>Qualification
                    </label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-graduation-cap"></i>
                        <input type="text"
                               required="required" 
                               class="form-control" 
                               id="qualificationInput"
                               name="qua"
                               placeholder="Enter your qualification"
                               value="${userobj.getQualification()}" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label>
                        <i class="field-icon fas fa-envelope"></i>Email Address
                    </label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-envelope"></i>
                        <input type="email"
                               required="required" 
                               class="form-control" 
                               id="emailInput"
                               name="email"
                               placeholder="Enter your email"
                               value="${userobj.getEmail()}" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label>
                        <i class="field-icon fas fa-lock"></i>Password
                    </label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password"
                               required="required" 
                               class="form-control" 
                               id="passwordInput"
                               name="password"
                               placeholder="Enter your password"
                               value="${userobj.getPassword()}" />
                        <span class="password-toggle" onclick="togglePassword()">
                            <i class="fas fa-eye" id="toggleIcon"></i>
                        </span>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary btn-update">
                    <i class="fas fa-save"></i>Update Profile
                </button>
            </form>
            
            <div class="back-link">
                <a href="home.jsp">
                    <i class="fas fa-arrow-left"></i>Back to Home
                </a>
            </div>
        </div>
    </div>
</div>

<script>
function togglePassword() {
    const passwordInput = document.getElementById('passwordInput');
    const toggleIcon = document.getElementById('toggleIcon');
    
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        toggleIcon.classList.remove('fa-eye');
        toggleIcon.classList.add('fa-eye-slash');
    } else {
        passwordInput.type = 'password';
        toggleIcon.classList.remove('fa-eye-slash');
        toggleIcon.classList.add('fa-eye');
    }
}
</script>

<%@ include file="Components/Footer.jsp"%>
</body>
</html>