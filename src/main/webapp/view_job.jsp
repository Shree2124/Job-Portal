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
<title>Insert title here</title>
<%@ include file="Components/AllCss.jsp"%>
</head>
<body class="bg">
	<%@ include file="Components/Navbar.jsp"%>
	<c:if test="${userobj.getRole() ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container mt-5 ml-5 mb-5 p-3"  style="background: #C2C3C8;">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<c:if test="${not empty succMsg}">
					<h4 class="text-center text-danger">${succMsg}</h4>
					<c:remove var="succMsg" />
				</c:if>
				<%
				JobDAO dao = new JobDAO(DBConnection.getConn());
				List<Job> list = dao.getAllJobs();
				for (Job j : list) {
					out.println(j.getStatus());
				%>
				<div class="card mt-2"  style="background: #C2C3C8;">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h6>
							<%
							out.println(j.getTitle());
							%>
						</h6>
						<p>
							<%
							out.println(j.getDescription());
							%>
						</p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" readonly
									value="Location:<%out.println(j.getLocation());%>"
									class="form-control form-control-sm">
							</div>
							<div class="form-group col-md-3">
								<input type="text" readonly
									value="Category: <%out.println(j.getCategory());%>"
									class="form-control form-control-sm">
							</div>
							<div class="form-group col-md-3">
								<input type="text" readonly
									value="Status:<%out.println(j.getStatus());%>"
									class="form-control form-control-sm">
							</div>
						</div>
						<h6>
							Publish Date:<%
						out.println(j.getPdate());
						%>
						</h6>
						<div class="text-center">
							<a href="edit_job.jsp?id=<%out.println(j.getId());%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="delete?id=<%out.println(j.getId());%>"
								class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
					</div>
				</div>
				<%
				}
				%>



			</div>
		</div>
	</div>
	<%@ include file="Components/Footer.jsp"%>
</body>
</html>