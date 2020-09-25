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
<title>كشف الأصناف</title>

<link href="webjars/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<%@ include file="header.jsp"%>

	<br>

	<div style="text-align: center;" class="text-center container">


		<div dir="rtl" class="row">

			<form method="POST" action="save-sell-bill-info">

				<div class="form-group">
					<label>الجهة</label> <select class="form-control text-center"
						name="clientId">

						<c:forEach var="clientTemp" items="${clientsList}">

							<option value="${clientTemp.id}">${clientTemp.name}</option>

						</c:forEach>

					</select>
				</div>


				<label>آجل</label> <input type="checkbox" name="late">

				<button type="submit" class="btn btn-primary btn-lg w-100">عمل
					فاتورة</button>

			</form>



			<div class="mr-4 col-8">
				<table class="table table-striped table-sm table-bordered shadow">

					<thead>
						<tr>
							<th>الرقم</th>
							<th>الوحدة</th>
							<th>النوع</th>
							<th>التاريخ</th>
						</tr>
					</thead>

					<tbody>

						<c:forEach var="billTemp" items="${SellBillsList}">

							<tr>

								<td>${billTemp.id}</td>
								<td>${billTemp.client.name}</td>
								<td>${billTemp.late ? "آجل" : "نقدي" }</td>
								<td>${billTemp.date}</td>

							</tr>

						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>



	</div>
</body>
</html>