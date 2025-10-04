<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<link rel="stylesheet" href="Components/Style.css">

<style>
/* Navbar Styling */
.bg-custom {
    background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%) !important;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
    transition: all 0.3s ease;
    position: relative;
}

.bg-custom::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.5), transparent);
    animation: shimmer 3s infinite;
}

@keyframes shimmer {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

.navbar {
    padding: 0.8rem 1rem;
}

.navbar-brand {
    font-weight: 700;
    font-size: 1.5rem;
    color: white !important;
    transition: all 0.3s ease;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.navbar-brand:hover {
    transform: scale(1.05);
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);
}

.navbar-brand i {
    animation: bounce 2s ease-in-out infinite;
}

@keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-5px); }
}

.nav-link {
    position: relative;
    color: rgba(255, 255, 255, 0.9) !important;
    transition: all 0.3s ease;
    padding: 0.5rem 1rem !important;
    margin: 0 0.2rem;
    font-weight: 500;
}

.nav-link::before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    width: 0;
    height: 3px;
    background: white;
    transition: all 0.3s ease;
    transform: translateX(-50%);
    border-radius: 2px;
}

.nav-link:hover::before,
.nav-link.active::before {
    width: 80%;
}

.nav-link:hover {
    color: white !important;
    transform: translateY(-2px);
}

.nav-link.active {
    color: white !important;
    font-weight: 600;
}

.nav-link i {
    margin-right: 0.5rem;
    transition: all 0.3s ease;
}

.nav-link:hover i {
    transform: scale(1.2) rotate(5deg);
}

/* Button Styling */
.btns {
    border-radius: 25px;
    padding: 0.5rem 1.5rem;
    transition: all 0.3s ease;
    margin: 0 0.25rem;
    font-weight: 500;
    border: 2px solid white;
    position: relative;
    overflow: hidden;
}

.btns::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    background: rgba(255, 255, 255, 0.3);
    border-radius: 50%;
    transform: translate(-50%, -50%);
    transition: width 0.5s, height 0.5s;
}

.btns:hover::before {
    width: 300px;
    height: 300px;
}

.btns:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

.btn-light {
    border-radius: 25px;
    padding: 0.5rem 1.5rem;
    transition: all 0.3s ease;
    margin: 0 0.25rem;
    font-weight: 600;
    background: white !important;
    color: #0d6efd !important;
    border: 2px solid white;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.btn-light:hover {
    transform: scale(1.05);
    box-shadow: 0 5px 20px rgba(255, 255, 255, 0.3);
    background: rgba(255, 255, 255, 0.95) !important;
}

.btn-outline-light {
    background: transparent !important;
    color: white !important;
}

.btn-outline-light:hover {
    background: white !important;
    color: #0d6efd !important;
}

.navbar-toggler {
    border-color: rgba(255, 255, 255, 0.5);
    transition: all 0.3s ease;
}

.navbar-toggler:hover {
    border-color: white;
    box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
}

.navbar-toggler-icon {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28255, 255, 255, 1%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}

@media (max-width: 991px) {
    .navbar-collapse {
        background: rgba(0, 0, 0, 0.2);
        padding: 1rem;
        border-radius: 15px;
        margin-top: 1rem;
        backdrop-filter: blur(10px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    
    .nav-link::before {
        display: none;
    }
    
    .nav-link {
        padding: 0.75rem 1rem !important;
        border-radius: 10px;
    }
    
    .nav-link:hover {
        background: rgba(255, 255, 255, 0.1);
        transform: translateX(5px);
    }
    
    .btns, .btn-light {
        display: block;
        margin: 0.5rem 0;
        width: 100%;
    }
}
</style>

<nav class="navbar navbar-expand-lg bg-custom navbar-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fa fa-briefcase me-2"></i>JobPortal
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">
                        <i class="fa fa-home"></i>Home
                    </a>
                </li>
                <c:if test="${userobj.role eq 'admin' }">
                    <li class="nav-item">
                        <a class="nav-link" href="add_job.jsp">
                            <i class="fa-regular fa-square-plus"></i>Post Job
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="view_job.jsp">
                            <i class="fa-solid fa-eye"></i>View Job
                        </a>
                    </li>
                </c:if>
            </ul>
            <form class="d-flex" role="search">
                <c:if test="${userobj.role eq '' || empty userobj }">
                    <a href="login.jsp" class="btn btns btn-outline-light me-2">
                        <i class="fa-solid fa-right-to-bracket"></i>Login
                    </a>
                    <a href="signup.jsp" class="btn btns btn-light">
                        <i class="fa-solid fa-user"></i>Signup
                    </a>
                </c:if>
                <c:if test="${userobj.role eq 'admin'}">
                    <a class="btn btn-light me-2">
                        <i class="fa-solid fa-user-shield me-1"></i>Admin
                    </a>
                    <a href="logout" class="btn btns btn-outline-light">
                        <i class="fa-solid fa-right-from-bracket"></i>Logout
                    </a>
                </c:if>
                <c:if test="${userobj.role eq 'User'}">
                    <a href="#" id="openModal" class="btn btn-light me-2">
                        <i class="fa-solid fa-user-circle me-1"></i>
                        <c:out value="${userobj.name}" />
                    </a>
                    <a href="logout" class="btn btns btn-outline-light">
                        <i class="fa-solid fa-right-from-bracket"></i>Logout
                    </a>
                </c:if>
            </form>
        </div>
    </div>
</nav>

<!-- Enhanced Modal -->
<style>
.modal-content {
    border-radius: 15px;
    border: none;
    animation: slideDown 0.3s ease-out;
}

@keyframes slideDown {
    from {
        opacity: 0;
        transform: translateY(-50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.modal-header {
    background: linear-gradient(135deg, #0d6efd, #6c757d);
    color: white;
    border-radius: 15px 15px 0 0;
    padding: 1.5rem;
}

.modal-title {
    font-weight: 600;
}

.close {
    border: none;
    background: rgba(255, 255, 255, 0.2);
    color: white;
    border-radius: 50%;
    width: 35px;
    height: 35px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    cursor: pointer;
}

.close:hover {
    background: rgba(255, 255, 255, 0.3);
    transform: rotate(90deg);
}

.modal-body .card {
    border: none;
    box-shadow: none;
}

.table th {
    color: #0d6efd;
    font-weight: 600;
    border-bottom: 2px solid #0d6efd;
}

.table td {
    padding: 1rem 0.75rem;
}

.fa-user-circle {
    color: #0d6efd;
    animation: pulse 2s ease-in-out infinite;
}

.modal-footer {
    border-top: none;
    padding: 1.5rem;
}

.modal-footer .btn {
    border-radius: 25px;
    padding: 0.5rem 2rem;
    font-weight: 500;
    transition: all 0.3s ease;
}

.modal-footer .btn:hover {
    transform: scale(1.05);
}
</style>

<c:if test="${ not empty userobj }">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <i class="fa fa-user-circle me-2"></i>User Profile
                </h5>
                <button type="button" class="close" id="closeModalButton"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="editProfile.jsp" method="post">
                <div class="modal-body">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center mb-4">
                                <i class="fas fa-user-circle fa-5x"></i>
                            </div>
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th scope="row"><i class="fa fa-user me-2"></i>Name</th>
                                        <td><c:out value="${userobj.getName()}" /></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><i class="fa fa-envelope me-2"></i>Email</th>
                                        <td><c:out value="${userobj.getEmail()}" /></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><i class="fa fa-graduation-cap me-2"></i>Qualification</th>
                                        <td><c:out value="${userobj.getQualification()}" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-edit me-2"></i>Update Profile
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
document.getElementById('openModal').addEventListener('click', function(e) {
    e.preventDefault();
    $('#exampleModal').modal('show');
});

document.getElementById('closeModalButton').addEventListener('click', function() {
    $('#exampleModal').modal('hide');
});
</script>
</c:if>