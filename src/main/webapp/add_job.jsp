<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Job - Admin Panel</title>
<%@ include file="Components/AllCss.jsp"%>

<style>
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    padding-top: 2rem;
    padding-bottom: 2rem;
}

.add-job-container {
    max-width: 900px;
    margin: 2rem auto;
    padding: 0 1rem;
}

.job-card {
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
    padding: 3rem 2.5rem;
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

.form-control, .custom-select, select, textarea {
    border: 2px solid #e0e0e0 !important;
    border-radius: 10px !important;
    padding: 0.75rem 1rem !important;
    font-size: 1rem !important;
    transition: all 0.3s ease !important;
    width: 100% !important;
    background-color: #FFFFFF !important;
}

.form-control:focus, .custom-select:focus, select:focus, textarea:focus {
    border-color: #667eea !important;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25) !important;
    outline: none !important;
}

.form-row {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
    margin-bottom: 1.5rem;
}

.form-row .form-group {
    margin-bottom: 0;
}

textarea.form-control {
    resize: vertical;
    min-height: 120px;
}

.btn-publish {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    border-radius: 10px;
    padding: 0.875rem 2.5rem;
    font-size: 1.1rem;
    font-weight: 600;
    color: white;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 100%;
    margin-top: 1rem;
}

.btn-publish:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
}

.btn-publish i {
    margin-right: 0.5rem;
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
    padding-left: 2.75rem !important;
}

.field-icon {
    color: #667eea;
    margin-right: 0.5rem;
    font-size: 0.9rem;
}

.form-section {
    background: #f8f9fa;
    padding: 1.5rem;
    border-radius: 10px;
    margin-bottom: 1.5rem;
}

.form-section-title {
    font-size: 1.1rem;
    font-weight: 700;
    color: #333;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid #667eea;
}

@media (max-width: 768px) {
    .card-body {
        padding: 2rem 1.5rem;
    }
    
    .card-header-custom {
        padding: 2rem 1.5rem;
    }
    
    .form-row {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }
    
    .btn-publish {
        padding: 0.875rem 1.5rem;
    }
}
</style>

</head>
<body>
<%@ include file="Components/Navbar.jsp"%>
<c:if test="${userobj.getRole() ne 'admin' }">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<div class="add-job-container">
    <div class="card job-card">
        <div class="card-header-custom">
            <i class="fas fa-briefcase" aria-hidden="true"></i>
            <h5>Post New Job</h5>
        </div>
        <div class="card-body">
            <c:if test="${not empty succMsg}">
                <div class="alert-custom">
                    <i class="fa fa-check-circle me-2"></i>${succMsg}
                </div>
                <c:remove var="succMsg" />
            </c:if>
            
            <form action="addJob" method="post">
                <!-- Job Title Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-heading me-2"></i>Job Information
                    </div>
                    <div class="form-group">
                        <label>
                            <i class="field-icon fas fa-briefcase"></i>Job Title
                        </label>
                        <input type="text" 
                               name="title"
                               required="required" 
                               class="form-control"
                               placeholder="e.g., Senior Java Developer" />
                    </div>
                </div>
                
                <!-- Location and Category Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-map-marker-alt me-2"></i>Location & Category
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>
                                <i class="field-icon fas fa-map-marker-alt"></i>Location
                            </label>
                            <select name="location" 
                                    class="form-control custom-select" 
                                    id="inlineFormCustomSelectPref"
                                    required>
                                <option value="" selected disabled>Choose Location...</option>
                                <option value="Odisha">Odisha</option>
                                <option value="Jharkhand">Jharkhand</option>
                                <option value="Gujarat">Gujarat</option>
                                <option value="Bhubaneswar">Bhubaneswar</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Banglore">Banglore</option>
                                <option value="Chennai">Chennai</option>
                                <option value="Hyderabad">Hyderabad</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label>
                                <i class="field-icon fas fa-tag"></i>Category
                            </label>
                            <select name="category" 
                                    id="inlineFormCustomSelect"
                                    class="form-control custom-select"
                                    required>
                                <option value="" selected disabled>Choose Category...</option>
                                <option value="IT">IT</option>
                                <option value="Developer">Developer</option>
                                <option value="Banking">Banking</option>
                                <option value="Engineer">Engineer</option>
                                <option value="Teacher">Teacher</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label>
                                <i class="field-icon fas fa-toggle-on"></i>Status
                            </label>
                            <select name="status" 
                                    class="form-control"
                                    required>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                </div>
                
                <!-- Description Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-align-left me-2"></i>Job Description
                    </div>
                    <div class="form-group">
                        <label>
                            <i class="field-icon fas fa-file-alt"></i>Description
                        </label>
                        <textarea required 
                                  name="desc" 
                                  rows="6"
                                  class="form-control"
                                  placeholder="Enter detailed job description, requirements, and qualifications..."></textarea>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-success btn-publish">
                    <i class="fas fa-paper-plane"></i>Publish Job
                </button>
            </form>
        </div>
    </div>
</div>

</body>
</html>