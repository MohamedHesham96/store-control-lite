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

<script type="text/javascript">
	
	function showAddForm(btn) {

		var addForm = document.getElementById("add-form");
		var updateForm = document.getElementById("update-form");
		
		if (addForm.style.display === "none") {
			addForm.style.display = "block";
			updateForm.style.display = "none";

		}
	}
	
	
	function showUpdateForm(btn, id) {

		var addForm = document.getElementById("add-form");
		var updateForm = document.getElementById("update-form");

		var itemId = document.getElementById("itemId"+id).innerText;
		var itemName = document.getElementById("itemName"+id).innerText;
		var itemQuantity = document.getElementById("itemQuantity"+id).innerText;
		var itemBuyPrice = document.getElementById("itemBuyPrice"+id).innerText;
		var itemSellPrice = document.getElementById("itemIdSellPrice"+id).innerText;

		var newId = document.getElementById("newId");
		var newName = document.getElementById("newName");
		var newQuantity = document.getElementById("newQuantity");
		var newBuyPrice = document.getElementById("newBuyPrice");
		var newSellPrice = document.getElementById("newSellPrice");

		newId.value = itemId;
		newName.value = itemName;
		newQuantity.value = itemQuantity;
		newBuyPrice.value = itemBuyPrice;
		newSellPrice.value = itemSellPrice;

		
		
		if (updateForm.style.display === "none")  {

			addForm.style.display = "none";
			updateForm.style.display = "block";
		}

	}
</script>


</head>
<body>

	<%@ include file="header.jsp"%>

	<br>

	<div style="text-align: center;" class="container">
		<div dir="rtl" class="row">
			<div>

				<div id="add-form">
					<form:form modelAttribute="item" method="post"
						action="add-new-item">

						<div class="form-group">
							<label>اسم الصنف</label>
							<form:input path="name" class="form-control text-center" />
						</div>

						<div class="form-group">
							<label>الكمية</label>
							<form:input path="quantity" class="form-control text-center" />
						</div>

						<div class="form-group">
							<label>سعر الشراء</label>
							<form:input path="buyPrice" class="form-control text-center" />
						</div>

						<div class="form-group">
							<label>سعر البيع</label>
							<form:input path="sellPrice" class="form-control text-center" />
						</div>

						<button type="submit" class="btn btn-primary btn-lg w-100">

							اضافة الصنف</button>

					</form:form>

				</div>

				<div style="display: none" id="update-form">



					<form:form modelAttribute="item" method="post" action="update-item">

						<div hidden="" class="form-group">
							<label>اسم الصنف</label>
							<form:input id="newId" path="id" class="form-control text-center" />
						</div>


						<div class="form-group">
							<label>اسم الصنف</label>
							<form:input id="newName" path="name"
								class="form-control text-center" />
						</div>

						<div class="form-group">
							<label>الكمية</label>
							<form:input id="newQuantity" path="quantity"
								class="form-control text-center" />
						</div>

						<div class="form-group">
							<label>سعر الشراء</label>
							<form:input id="newBuyPrice" path="buyPrice"
								class="form-control text-center" />
						</div>

						<div class="form-group">
							<label>سعر البيع</label>
							<form:input id="newSellPrice" path="sellPrice"
								class="form-control text-center" />
						</div>

						<button type="submit" class="btn btn-primary btn-lg w-100">

							تعديل الصنف</button>


						<button type="button" onclick="showAddForm(this)"
							class="btn btn-warning btn-sm mt-sm-2 w-100">ألغاء
							التعديل</button>

					</form:form>



				</div>

			</div>

			<div class="mr-4 col-8">
				<table class="table table-striped table-sm  table-bordered">

					<thead>
						<tr>
							<th>الكود</th>
							<th>الصنف</th>
							<th>الكمية</th>
							<th>سعر الشراء</th>
							<th>سعر البيع</th>
							<th></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="itemTemp" items="${itemsList}">

							<tr>
								<th id="itemId${itemTemp.id}">${itemTemp.id}</th>
								<td id="itemName${itemTemp.id}">${itemTemp.name}</td>
								<td id="itemQuantity${itemTemp.id}">${itemTemp.quantity}</td>
								<td id="itemBuyPrice${itemTemp.id}">${itemTemp.buyPrice}</td>
								<td id="itemIdSellPrice${itemTemp.id}">${itemTemp.sellPrice}</td>

								<td>
									<button type="button" class="btn btn-outline-secondary btn-sm"
										onclick="showUpdateForm(this,${itemTemp.id})">تعديل</button>
							</tr>

						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>

	</div>
</body>
</html>