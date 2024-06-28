<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="java.util.List"%>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
}

.paint-card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border: none;
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)),
		url('img/home2.jpg');
	height: 25vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	display: flex;
	align-items: center;
	justify-content: center;
}

.backImg p {
	font-size: 2rem;
	color: #fff;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
}

.container {
	margin-top: 20px;
}

.card-body p {
	margin-bottom: 20px;
}

.form-label {
	font-weight: bold;
}

.btn-success {
	background-color: #28a745;
	border: none;
}

.btn-success:hover {
	background-color: #218838; . faq-section { margin-top : 40px;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}


</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid backImg">
		<p>Welcome to Our Appointment Section</p>

	</div>


	<div class="container">
		<div class="row">
			<!-- Left side with Doctor Image -->
			<div class="col-md-6 d-flex align-items-center">
				<img alt="Doctor Image" src="img/doc2.png" class="img-fluid">
			</div>

			<!-- Right side with Form -->
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="addAppointment" method="post">
							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="fullname" class="form-label">Full Name</label> <input
									required type="text" class="form-control" id="fullname"
									name="fullname">
							</div>

							<div class="col-md-6">
								<label for="gender" class="form-label">Gender</label> <select
									class="form-control" id="gender" name="gender" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="age" class="form-label">Age</label> <input required
									type="number" class="form-control" id="age" name="age">
							</div>

							<div class="col-md-6">
								<label for="appoint_date" class="form-label">Appointment
									Date</label> <input required type="date" class="form-control"
									id="appoint_date" name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									required type="email" class="form-control" id="email"
									name="email">
							</div>

							<div class="col-md-6">
								<label for="phno" class="form-label">Phone No</label> <input
									maxlength="10" required type="text" class="form-control"
									id="phno" name="phno">
							</div>

							<div class="col-md-6">
								<label for="diseases" class="form-label">Diseases</label> <input
									required type="text" class="form-control" id="diseases"
									name="diseases">
							</div>

							<div class="col-md-6">
								<label for="doct" class="form-label">Doctor</label> <select
									class="form-control" id="doct" name="doct" required>
									<option value="">--select--</option>
									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>">
										<%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="col-md-12">
								<label for="address" class="form-label">Full Address</label>
								<textarea required name="address" class="form-control"
									id="address" rows="3"></textarea>
							</div>

							<div class="col-md-12">
								<div class="form-check">
									<label for="admit" class="form-check-label">Admit</label> <input
										type="checkbox" class="form-check-input" id="admit"
										name="admit">
								</div>
							</div>

							<c:if test="${empty userObj }">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success"
									type="submit">Submit</button>
							</c:if>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>
