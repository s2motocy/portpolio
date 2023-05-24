<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>

<!-- CSS linked -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Style -->
<style type="text/css">
.container{
	margin-top:10px;}
.input-group input[type=text] {
	display:block;
	width: 120px;
	height: 30px; }
.input-group button[type=button] {
	height: 30px; }
.col-lg-6{
	float:right;
	padding-bottom:50px;}
</style>

<!-- Script -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$( function() {
     $( ".datepicker").datepicker({
    	 dateFormat: "yy-mm-dd",
    	 todayHighlight: true
     });
 });

/* ---------------------------------------------------------------- */

let myChart = null;
let mySecondChart = null;

$(document).ready(function() {
	/* 일일 회원가입 수 */
	$('#click-btn').on('click', function() {
		var startDate = $(".date-input.input1").val();
		var endDate = $(".date-input.input2").val();

		chartData = { startDate: startDate, endDate: endDate }

		$.ajax({
			url: "/admin/userChart",
			data: chartData,
			type: "GET",
			dataType: "json",
			success: function(result) {
				var label_list = [];
				var count_list = [];

				$.each(result, function(idx, data) {
					label_list.push(data["reg_date"]);
					count_list.push(Number(data["cnt"]));
				});

				let canvas = $("#myChart");
				if (myChart !== null) {
				  if (canvas && canvas.length && canvas[0].getContext("2d") === myChart.ctx) {
				    myChart.destroy();
				  }
				}
				const ctx = canvas[0].getContext("2d");
				myChart = new Chart(ctx, {
					type: 'bar',
					data: {
						labels: label_list,
						datasets: [{
							label: '일일 회원가입 수',
							data: count_list,
							backgroundColor: [
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)'
							],
							borderColor: [
								'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)'
							],
							borderWidth: 1
						}]
					},
					options: {
						scales: {
							y: {
								beginAtZero: true
							}
						}
					}
				});
			}
		});
	});
	/* 일일 주문량 수 */	
	$('#click-btn2').on('click', function() {
		var startDateB = $(".date-input.input3").val();
		var endDateB = $(".date-input.input4").val();

		chartData = { startDateB: startDateB, endDateB: endDateB }

		$.ajax({
			url: "/admin/useBuyChart",
			data: chartData,
			type: "GET",
			dataType: "json",
			success: function(result) {
				var label2_list = [];
				var count2_list = [];

				$.each(result, function(idx, data) {
					label2_list.push(data["buy_date"]);
					count2_list.push(Number(data["buyCnt"]));
				});

				let canvas = $("#mySecondChart");
				if (mySecondChart !== null) {
				  if (canvas && canvas.length && canvas[0].getContext("2d") === mySecondChart.ctx) {
				    mySecondChart.destroy();
				  }
				}
				const ctx2 = canvas[0].getContext("2d");
				mySecondChart = new Chart(ctx2, {
					type: 'bar',
					data: {
						labels: label2_list,
						datasets: [{
							label: '일일 주문량 수',
							data: count2_list,
							backgroundColor: [
								'rgba(75, 192, 192, 0.5)',
					            'rgba(255, 99, 132, 0.5)',
					            'rgba(3, 47, 249, 0.4)',
					            'rgba(153, 102, 255, 0.5)',
					            'rgba(106, 166, 45, 0.5)',
					            'rgba(255, 159, 64, 0.5)',
					            'rgba(52, 213, 94, 0.5)',
					            'rgba(213, 52, 162, 0.5)'
							],
							borderColor: [
								'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)'
							],
							borderWidth: 1
						}]
					},
					options: {
						scales: {
							y: {
								beginAtZero: true
							}
						}
					}
				});
			}
		});

	});
});
</script>

<body>
<div id="app">
	<div class="page-style-a">
	    <div class="container">
	        <div class="page-intro">
	            <h2>대시보드</h2>
	            <ul class="bread-crumb">
	                <li class="has-separator">
	                    <i class="ion ion-md-home"></i>
	                    <a href="home.html">Home</a>
	                </li>
	                <li class="is-marked">
	                    <a href="single-product.html">대시보드</a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</div>
	<div class="container">
		<!-- 일일 회원가입자 수 -->
		<form action="dashboard" class="dashboard-form">
			<div class="col-lg-6">
			<label id="chart_label">일일 회원가입자</label>
				<div class="input-group input-daterange">
				    <input type="text" class="date-input input1 datepicker" name="startDate" value="${list[0].startDate}"
				            readonly>
				    <input type="text" class="date-input input2 datepicker" name="endDate" value="${list[0].endDate}"
				            readonly>
				    <button type="button" id="click-btn">Check</button>
				</div>
				<c:forEach items="${list}" var="i">
					<div id="a">
						<input type="hidden" name="reg_date" value="${i.reg_date}">
						<input type="hidden" name="cnt" value="${i.cnt}">
					</div>
				</c:forEach>
				<div class="chart_canvas" style="position: relative; height:150px; width:30vw">
					<canvas id="myChart"></canvas>
				</div>
			</div>
			<!-- 일일 주문 수 -->
			<div class="flex-row d-flex justify-content-center">
				<label id="chart_label">일일 주문량</label>
				<div class="input-group input-daterange">
				    <input type="text" class="date-input input3 datepicker" name="startDateB" value="${ublist[0].startDateB}" readonly>
				    <input type="text" class="date-input input4 datepicker" name="endDateB" value="${ublist[0].endDateB}" readonly>
				    <button type="button" id="click-btn2">Check</button>
				</div>
				<c:forEach items="${ublist}" var="u">
					<div id="a">
						<input type="hidden" name="buy_date" value="${u.buy_date}">
						<input type="hidden" name="buyCnt" value="${u.buyCnt}">
					</div>
				</c:forEach>
				<div class="chart_canvas_userbuy" style="position: relative; height:150px; width:30vw">
					<canvas id="mySecondChart"></canvas>
				</div>
			</div>
		</form>
	</div>
</div>
</body>

<%@ include file="../include/footer.jsp" %>