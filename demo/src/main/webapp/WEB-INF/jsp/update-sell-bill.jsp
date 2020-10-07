<%@page import="net.bytebuddy.asm.Advice.Local"%>
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
<title>تعديل فاتورة بيع</title>

<link href="webjars/bootswatch/4.5.2/dist/darkly/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript">
	
function showUpdateForm(btn, id) {

	var updateForm = document.getElementById("update-form");

	var itemId = document.getElementById(id).id;
	var itemName = document.getElementById(id).innerText;

	var itemQuantity = document.getElementById("itemQuantity"+id).innerText;
	var itemSellPrice = document.getElementById("itemSellPrice"+id).innerText;

	var newId = document.getElementById("newId");
	var newQuantity = document.getElementById("newQuantity");
	var newName = document.getElementById("newName");
	var newSellPrice = document.getElementById("newSellPrice");

	newId.value = itemId;
	newName.value = itemName;
	newQuantity.value = itemQuantity;
	newSellPrice.value = itemSellPrice;

	
	
	if (updateForm.style.display === "none")  {

		updateForm.style.display = "block";
	}

}
	
	</script>
</head>
<body>

	<%@ include file="header.jsp"%>

	<br>

	<div style="width: 100%; text-align: center;" class=" ">

		<div dir="rtl" class="row mr-3">
			<div class="card border-warning " style="max-width: 20rem;">
				<div class="card-header border-warning text-warning">${view ? '<h5>عرض للفاتور</h5>' :  '<h5>أضافة للفاتور</h5>'  }
				</div>
				<div class="card-body text-warning font-weight-bold">

					<input disabled="disabled"
						value="رقم الفاتورة :  S - ${billSell.id} "
						class="form-control text-center btn-outline-warning font-weight-bold" />

					<input disabled="disabled"
						value="التاريخ  :  <%=LocalDate.now().toString()%> "
						class="form-control text-center btn-outline-warning mt-2 font-weight-bold" />

					<input disabled="disabled"
						value="اسم الوحدة : ${billSell.client.name}"
						class="form-control text-center btn-outline-warning mt-2 font-weight-bold" />

					<div ${view ? '' :  'hidden'  } class="mt-2">


						<input disabled="disabled"
							value="  اسم البائع : ${billSell.user.name}"
							class="form-control text-center btn-outline-warning font-weight-bold" />


					</div>

					<div ${view ? 'hidden' :  ''  } class="mt-2 ">
						<form:form method="get" action="add-item-to-update-sell-bill"
							modelAttribute="item">

							<label>اسم الصنف</label>
							<form:select
								class="form-control text-center bg-light font-weight-bold"
								path="id">
								<form:options items="${itemsList}" itemLabel="name" />
							</form:select>

							<div class="form-group mt-1">
								<label>الكمية</label>
								<form:input path="quantity"
									class="form-control text-center  bg-light font-weight-bold" />
							</div>

							<button type="submit"
								class="btn btn-outline-warning btn-lg w-100">اضافة
								للفاتورة</button>


						</form:form>
					</div>
				</div>
			</div>

			<div class=" col-7 shadow pb-3 mr-2">

				<div class="shadow "
					style="position: relative; height: 425px; overflow: auto;">

					<table class="table table-striped table-sm  ">

						<thead class="bg-primary">
							<tr>
								<th class="col-1">الصنف</th>
								<th class="col-1">الكمية</th>
								<th class="col-1">سعر البيع</th>
								<th class="col-1">اجمالي السعر</th>
								<th ${view ? 'hidden' :  ''  } class="col-1">العميلة</th>
							</tr>
						</thead>

						<tbody class="shadow font-weight-bold">
							<c:forEach var="itemTemp" items="${billSell.billSellItems}">

								<tr>
									<td class="pt-2" id="${itemTemp.id}">${itemTemp.item.name}</td>
									<td class="pt-2" id="itemQuantity${itemTemp.id}">${itemTemp.quantity}</td>
									<td class="pt-2" id="itemSellPrice${itemTemp.id}"><fmt:formatNumber
											value="${itemTemp.sellPrice}" maxFractionDigits="2" /></td>

									<td class="pt-2"><fmt:formatNumber
											value="${itemTemp.sellPrice * itemTemp.quantity}"
											maxFractionDigits="2" /></td>

									<td ${view ? 'hidden' :  ''  }>

										<button type="button"
											class="btn btn-primary btn-sm font-weight-bold"
											onclick="showUpdateForm(this,${itemTemp.id})">تعديل</button>


										<a type="button"
										href="delete-sellBillItemUpdate?sellBillItemId=${itemTemp.id}"
										onclick="return confirm('هل انت متأكد من إلغاء الصنف ؟')"
										class="btn btn-danger btn-sm font-weight-bold">إلغاء</a>
									</td>
								</tr>

							</c:forEach>

						</tbody>
					</table>

				</div>

				<input
					class="btn btn-outline-success float-right mt-sm-4 font-weight-bold shadow text-white"
					value="اجمالي: <fmt:formatNumber value="${total}" maxFractionDigits="2" />">




				<div class="float-left pt-sm-4 ">

					<form:form>

						<a ${view ? 'hidden' :  ''  }
							href="retrieve-UpdateSellBill?sellBillId=${billSell.id}"
							class="btn btn-warning mr-1 font-weight-bold"
							onclick="return confirm('هل انت متأكد من إلغاء الفاتورة ؟')">
							إلغاء التحديث </a>

						<a href="delete-updateSellBill?sellBillId=${billSell.id}"
							class="btn btn-danger mr-1 font-weight-bold"
							onclick="return confirm('هل انت متأكد من إلغاء الفاتورة ؟')">
							إلغاء الفاتورة </a>

						<c:if test="${billSell.billSellItems.size() > 0 }">


							<a ${view ? 'hidden' :  ''  }
								href="update-sellBill?sellBillId=${billSell.id}"
								onclick="return confirm('هل انت متأكد من تحديث الفاتورة ؟')"
								class="btn btn-success mr-1 font-weight-bold ${billSellItems.size() eq 0 ? 'disabled' : ''} ">
								تحديث</a>

							<a href="show-printView?sellBillId=${billSell.id}"
								onclick="return confirm('هل انت متأكد من طباعة الفاتورة ؟')"
								class="btn btn-primary mr-1 font-weight-bold ${billSellItems.size() eq 0 ? 'disabled' : ''} ">
								طباعة</a>
						</c:if>



						<c:if test="${billSell.billSellItems.size() eq 0 }">


							<button class="btn btn-success mr-1 shadow font-weight-bold "
								disabled>حفظ</button>


							<button class="btn btn-primary shadow mr-1  font-weight-bold"
								disabled>طباعة</button>

						</c:if>








					</form:form>

				</div>

			</div>


			<div ${view ? 'hidden' :  ''  } class="card border-warning mr-2"
				style="max-width: 20rem;">
				<div class="card-header border-warning text-warning">
					<h5>تعديل الصنف</h5>
				</div>
				<div class="card-body text-warning font-weight-bold">

					<form:form modelAttribute="updateItem" method="get"
						action="update-sellBillItem">

						<div hidden="" class="form-group">
							<label>اسم الصنف</label>
							<form:input path="id" id="newId"
								class="form-control text-center font-weight-bold" />
						</div>

						<div class="form-group">
							<label>اسم الصنف</label> <input disabled="disabled" id="newName"
								class="form-control text-center btn-outline-warning font-weight-bold">
						</div>

						<div class="form-group">
							<label>الكمية</label>
							<form:input path="quantity" id="newQuantity"
								class="form-control text-center  bg-light font-weight-bold" />
						</div>

						<div class="form-group">
							<label>سعر البيع</label>
							<form:input path="sellPrice" id="newSellPrice"
								class="form-control text-center bg-light font-weight-bold" />
						</div>

						<button type="submit" class="btn btn-outline-warning btn-lg w-100">تعديل
							الصنف</button>


					</form:form>

				</div>

			</div>

		</div>
	</div>
</body>
</html>