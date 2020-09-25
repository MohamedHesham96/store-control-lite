<%@page import="org.apache.taglibs.standard.tag.common.xml.IfTag"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>تحصيل الوحدة</title>

<link href="webjars/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<%@ include file="header.jsp"%>

	<br>

	<div style="text-align: center;" class="">
		<div dir="rtl" class="row">

			<div>

				<div class="card border-dark  mr-lg-5" style="max-width: 20rem;">
					<div class="card-header">
						<h4>التحصيل</h4>
					</div>
					<div class="card-body">

						<div class="form-group">
							<label>اسم الوحدة</label> <input name="companyName"
								value="${client.name}" disabled="disabled"
								class="form-control btn-outline-primary text-center" />
						</div>

						<div class="form-group">
							<label>الدين</label> <input name="companyName"
								value="${client.drawee}" disabled="disabled"
								class="form-control btn-outline-primary text-center" />
						</div>

						<form method="get" action="add-client-collect">
							<input hidden="" name="clientId" value="${client.id}">
							<div class="form-group">
								<label>المبلغ</label> <input name="amount"
									class="form-control text-center disable" />
							</div>

							<input type="submit" class="btn btn-outline-success btn-lg w-100"
								value="تحصيل المبلغ" />

						</form>

					</div>
				</div>
				<br>
			</div>

			<div class="mr-4 col-8 ">
				<table class="table table-striped table-sm table-bordered shadow">

					<thead>
						<tr>
							<th class="col-2">المبلغ</th>
							<th class="col-2">التاريخ</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="colllectTemp" items="${client.collectList}">

							<tr>

								<td>${colllectTemp.amount}</td>
								<td>${colllectTemp.date}</td>

							</tr>

						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>

	</div>
</body>
</html>