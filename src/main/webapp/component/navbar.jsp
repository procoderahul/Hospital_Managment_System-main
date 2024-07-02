<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-laptop-medical"></i> MediHelp</a>
			<span class="navbar-text text-white ms-3">
                Urgent Slots: <c:out value="${availableBeds != null ? availableBeds : 'N/A'}" />
            </span>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty userObj}">

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp"><i
							class="fa-solid fa-user-tie"></i> ADMIN</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctor_login.jsp"><i
							class="fa-solid fa-user-doctor"></i> DOCTOR</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp"><i
							class="fa-solid fa-user"></i> USER</a></li>
					<li class="nav-item"><a class="nav-link bg-red active"
						aria-current="page" href="emergency.jsp">
							<button type="button" class="btn btn-danger btn-sm">Emergency</button>
					</a></li>



				</c:if>



				<c:if test="${not empty userObj }">

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp"><i
							class="fa-solid fa-file-medical"></i> APPOINTMENT</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_appointment.jsp"><i
							class="fa-solid fa-eye"></i> VIEW APPOINTMENT</a></li>


					<div class="dropdown">
						<button class="btn  bg-white dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i>${userObj.fullName  } </a>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="change_password.jsp">Change
									Password</a></li>
							<li><a class="dropdown-item" href="userLogout">Log out</a></li>
						</ul>
					</div>


				</c:if>


				<!-- <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> -->


			</ul>

		</div>
	</div>
</nav>
