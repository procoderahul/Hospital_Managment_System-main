<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.entity.Doctor"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
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

</style>
</head>
<body>
    <c:if test="${empty docObj }">
        <c:redirect url="../doctor_Login.jsp"></c:redirect>
    </c:if>

    <%-- Include Navbar --%>
    <%@include file="navbar.jsp"%>

    <div class="container-fluid p-5">
        <p class="text-center fs-3">Doctor Dashboard</p>

        <%-- Fetch Doctor and DAO --%>
        <%
        Doctor d = (Doctor) session.getAttribute("docObj");
        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        %>

        <div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card text-light">
					<div class="card-body text-center">
						<a href="edit_profile.jsp"
							style="text-decoration: none; color: white"> <i
							class="fas fa-user-md fa-3x"></i><br>
							<p class="fs-4">
								Edit Profile<br> <i class="fas fa-user-circle"></i>${docObj.fullName}

							</p>
					</div>
					</a>
				</div>
			</div>

            <div class="col-md-4 ">
                <div class="card paint-card text-light">
                    <div class="card-body text-center">
                        <i class="fas fa-calendar-check fa-3x"></i><br>
                        <a href="patient.jsp" style="text-decoration:none; color:#fff">
                            <p class="fs-4">
                                Total Appointment<br><%=dao.countAppointmentByDoctorId(d.getId())%>
                            </p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
