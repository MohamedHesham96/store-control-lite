<%@page import="org.apache.taglibs.standard.tag.common.xml.IfTag"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>الرئيسية</title>


<link href="webjars/bootswatch/4.5.2/dist/darkly/bootstrap.min.css"
	rel="stylesheet">


</head>
<body background="images/background.jpg"
	style="background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">

	<%@ include file="header.jsp"%>

	<br>

	<div class="container mt-4 ">
		<div class="row w-100">


			<div class="col-md-3">
				<div class="card mx-sm-3 p-3 border-warning">
					<div
						class="card-header border-warning pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">رصيد الموردين</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${companyDraweeTotal}</h4>
					</div>
				</div>
			</div>

			<div dir="ltr" class="col-md-3">
				<div class="card mx-sm-3 p-3 border-warning">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">رصيد العملاء</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${clientDraweeTotal}</h4>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card mx-sm-3 p-3 border-warning">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">رصيد الخزنة اليوم</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${bank.balanceToday}</h4>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card mx-sm-3 p-3 border-warning">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">رصيد الخزنة</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${bank.balance}</h4>
					</div>
				</div>
			</div>

		</div>



		<div class="row w-100 mt-4">



			<div class="col-md-3 ">
				<div class="card mx-sm-3 p-3 border-warning ">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">مرتجع الموردين</h6>
					</div>

					<div class="text-center mt-3">
						<h4>${totalCompaniesReturns}</h4>
					</div>
				</div>
			</div>


			<div class="col-md-3 ">
				<div class="card mx-sm-3 p-3 border-warning ">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">مرتجع العملاء</h6>
					</div>

					<div class="text-center mt-3">
						<h4>${totalReturns}</h4>
					</div>
				</div>
			</div>



			<div class="col-md-3 ">
				<div class="card mx-sm-3 p-3 border-warning ">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">مبيعات آجل</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${totalLateSales}</h4>
					</div>
				</div>
			</div>


			<div class="col-md-3 ">
				<div class="card mx-sm-3 p-3 border-warning ">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">مبيعات نقدي</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${totalPayedSales}</h4>
					</div>
				</div>
			</div>

		</div>


		<div class="row w-100 mt-4">

			<div dir="ltr" class="col-md-3">
				<div class="card mx-sm-3 p-3 border-warning">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">صافي ارباح</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${totalGain - spendTotal}</h4>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card mx-sm-3 p-3 border-warning">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">المصاريف</h6>
					</div>

					<div class="text-center mt-3">
						<h4>${spendTotal}</h4>
					</div>
				</div>
			</div>


			<div class="col-md-3 ">
				<div class="card mx-sm-3 p-3 border-warning ">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">اجمالي ارباح</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${totalGain}</h4>
					</div>
				</div>
			</div>


			<div class="col-md-3 ">
				<div class="card mx-sm-3 p-3 border-warning ">
					<div class="card-header pt-2 border-warning p-1 text-center">
						<h6 class="font-weight-bold">مشتريات</h6>
					</div>

					<div class=" text-center mt-3">
						<h4>${totalBuys}</h4>
					</div>
				</div>
			</div>



		</div>
	</div>


</body>
</html>