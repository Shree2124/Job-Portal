<%@page import="com.entity.Job"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<div class="container p-2 mt-5" >
		<div class="col-md-10 offset-md-1" >
			<div class="card" style="background: #C2C3C8;">
				<div class="card-body">
					<div class="card-body">
						<div class="text-center">
							<i class="fas fa-user-friends fa-3x" aria-hidden="true"></i>

							<%
							int id = Integer.parseInt(request.getParameter("id"));
							JobDAO dao = new JobDAO(DBConnection.getConn());
							Job j = dao.getJobById(id);
							%>

							<h5>Edit Jobs</h5>
							<c:if test="${not empty succMsg}">
								<h4 class="text-center text-danger">${succMsg}</h4>
								<c:remove var="succMsg" />
							</c:if>
						</div>
						<form action="update" method="post">
							<input type="hidden" value="<%=j.getId()%>" name="id" />
							<div class="form-group">
								<label>Enter Title</label><input
									value="<%out.println(j.getTitle());%>" type="text"
									name="title" required="required" class="form-control" />
							</div>
							<br>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label>Location</label><select name="location"
										class="curtom-select" id="iInlineFormCustomSelectPref">
										<option selected>
											<%
											out.println(j.getLocation());
											%>
										
										<option>
										<option value="Odisha">Odisha</option>
										<option value="Jharkhand">Jharkhand</option>
										<option value="Gujarat">Gujarat</option>
										<option value="Bhubaneswar">Bhubaneswar</option>
										<option value="Delhi">Delhi</option>
										<option value="Banglore">Banglore</option>
										<option value="Chennai">Chennai</option>
										<option value="Hydrabad">Hydrabad</option>
									</select>
								</div>
								<br>
								<div class="form-group col-md-4">
									<label class="mr-sm-2" for="inlineFormCustomSelect">Category</label><select
										name="category" id="inlineFormCustomSelect"
										class="custom-select mr-sm-2">
										<option selected>
											<%
											out.println(j.getCategory());
											%>
										</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>
									</select>
								</div>
								<br>
								<div class="form-group">
									<label>Status</label><select name="status" class="form-control">
										<option class="Active" selected>
											<%
											out.println(j.getStatus());
											%>
										</option>
										<option class="Active" value="Active">Active</option>
										<option class="Inactive" value="Inactive">Inactive</option>
									</select>
								</div>
								<br>
								<div class="form-group">
									<label>Enter Description</label>
									<textarea required name="desc" id="" cols="" rows="6"
										class="form-control">
										<%
										out.println(j.getDescription());
										%>
									</textarea>
								</div>
								<br>
								<button class="btn btn-success">Publish Job</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="Components/Footer.jsp"%>
</body>
</html>