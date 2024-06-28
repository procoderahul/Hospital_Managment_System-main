<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
body {
	background-color: #f4f6f9;
}

.paint-card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	border-radius: 15px;
	overflow: hidden;
	border: none;
	background: linear-gradient(135deg, blue, violet);
	color: white;
}

.paint-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
}

.card-body {
	padding: 2rem;
	text-align: center;
}

.card-body i {
	margin-bottom: 1rem;
	font-size: 3rem;
}

.text-primary {
	color: #007bff !important;
}

.text-secondary {
	color: #6c757d !important;
}

.text-success {
	color: #28a745 !important;
}

.text-danger {
	color: #dc3545 !important;
}

.mt-2 {
	margin-top: 1rem;
}

.modal-content {
	border-radius: 15px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		<c:if test="${not empty succMsg }">
			<p class="text-center text-success fs-3">${succMsg}</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty errorMsg }">
			<p class="text-center text-danger fs-5">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<%
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		%>

		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card text-light">
					<div class="card-body">
						<i class="fas fa-user-md"></i><br> <a href="view_doctor.jsp"
							style="text-decoration: none; color: inherit;">
							<p class="fs-4">
								Doctor<br><%=dao.countDoctor()%>
							</p>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card text-light">
					<div class="card-body">
						<i class="fas fa-user-circle"></i><br>
						<p class="fs-4">
							User<br><%=dao.countUser()%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card text-light">
					<div class="card-body">
						<i class="fas fa-calendar-check"></i><br> <a
							href="patient.jsp" style="text-decoration: none; color: inherit;">
							<p class="fs-4">
								Total Appointment<br><%=dao.countAppointment()%>
							</p>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2 mx-auto">
				<div class="card paint-card text-light" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card-body text-center">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4">
							Specialist<br><%=dao.countSpecialist()%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">
						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
