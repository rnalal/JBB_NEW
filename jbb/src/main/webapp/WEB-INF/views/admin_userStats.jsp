<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBB</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>  <%-- Chart.js CDN --%>
<style>
	html, body {
	    height: 100%;
	    margin: 0;
	    padding: 0;
	}

	body {
        min-width: 1080px;
    }
	
	.content-container {
		display: flex;
        align-items: stretch;
        min-height: calc(100vh - 70px);
	}
	
	.chart1{
		display:flex;	
	}
	
	.menu-container {
		flex-shrink: 0;
		width: 250px;
	}

    .top-bar{
    	display:flex;
    	align-items: center;
    	justify-content: space-between;
    	background-color:#5a5a5a;
    	height:70px;
    	margin-top: 0;
    	padding: 0 20px;
    }

    .main-title{
    	font-size:30px;
    	font-weight:bold;
    	color:#FF8C00;
    	margin-right:10px;
    	margin-left:10px;
    }

    .side-title{
    	font-size:20px;
    	font-weight:bold;
    	color:#ddd;
    }
	
    .chart-container {
        display: flex;
        flex-wrap: wrap;
        gap: 24px;
        align-items: stretch;
    }
    
    .container {
        flex: 1;
        display: flex;
        flex-direction: column;
        padding: 40px 50px;
        box-sizing: border-box;
    }

    .chart-box {
        background: #ffffff;
        border: 1px solid #ffe0b2;
        border-radius: 18px;
        box-shadow: 0 6px 18px rgba(255, 140, 0, 0.08);
        padding: 24px 24px 24px;
        width: calc(50% - 12px);
        min-width: 420px;
        box-sizing: border-box;
    }

    .chart-box h3 {
        margin: 0 0 18px 0;
        font-size: 20px;
        font-weight: 700;
        color: #444;
        padding-bottom: 10px;
        border-bottom: 2px solid #fff1dc;
    }

    .chart-box:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 24px rgba(255, 140, 0, 0.14);
    }

    .chart-box:last-child {
        width: 100%;
        min-height: 460px;
    }

    canvas {
        display: block;
        width: 100% !important;
        height: 360px !important;
    }
    
    .tit {
        margin: 0 0 24px 0;
        font-size: 28px;
        font-weight: 800;
        color: #ff8c00;
    }

    .chart1 {
        display: flex;
    }
</style>
</head>
<body>
<div class="top-bar">
	<div class="title">
		<span class="main-title">JBB</span>
		<span class="side-title">for admin only</span>
	</div>
</div>
<div class="content-container">    
    <%@ include file="side-menu.jsp" %>
   	<div class="container">
        <h2 class="tit">사용자 통계</h2>
        <div class="chart-container">
            <div class="chart-box">
                <h3>일별 신규 가입자</h3>
                <canvas id="dailyChart"></canvas>
            </div>
            <div class="chart-box">
                <h3>주별 신규 가입자</h3>
                <canvas id="weeklyChart"></canvas>
            </div>
            <div class="chart-box">
                <h3>월별 신규 가입자</h3>
                <canvas id="monthlyChart"></canvas>
            </div>
        </div>
    </div>
</div>

    <script>
        var dailyUsers = [];
        <c:forEach var="user" items="${dailyUsers}">
            dailyUsers.push({ date: "${user.date}", new_users: ${user.new_users} });
        </c:forEach>

        var weeklyUsers = [];
        <c:forEach var="user" items="${weeklyUsers}">
            weeklyUsers.push({ week: "${user.week}", new_users: ${user.new_users} });
        </c:forEach>

        var monthlyUsers = [];
        <c:forEach var="user" items="${monthlyUsers}">
            monthlyUsers.push({ month: "${user.month}", new_users: ${user.new_users} });
        </c:forEach>

        $(document).ready(function() {
            var dailyLabels = [], dailyData = [];
            $.each(dailyUsers, function(index, user) {
                dailyLabels.push(user.date);
                dailyData.push(user.new_users);
            });

            var weeklyLabels = [], weeklyData = [];
            $.each(weeklyUsers, function(index, user) {
                weeklyLabels.push(user.week + "주차");
                weeklyData.push(user.new_users);
            });

            var monthlyLabels = [], monthlyData = [];
            $.each(monthlyUsers, function(index, user) {
                monthlyLabels.push(user.month + "월");
                monthlyData.push(user.new_users);
            });

            console.log("Daily Data:", dailyLabels, dailyData);
            console.log("Weekly Data:", weeklyLabels, weeklyData);
            console.log("Monthly Data:", monthlyLabels, monthlyData);

            function getMaxYAxis(data) {
                if (!data || data.length === 0) {
                    return 100;
                }

                var maxValue = Math.max.apply(null, data);

                if (maxValue <= 100) {
                    return 100;
                }

                return Math.ceil(maxValue / 10) * 10;
            }

            function createChart(ctx, labels, data, labelText, maxYValue) {
                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: labelText,
                            data: data,
                            borderColor: '#f59e0b',
                            backgroundColor: 'rgba(245, 158, 11, 0.18)',
                            pointBackgroundColor: '#f59e0b',
                            pointBorderColor: '#f59e0b',
                            pointRadius: 4,
                            pointHoverRadius: 5,
                            borderWidth: 3,
                            fill: true,
                            lineTension: 0.3
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        layout: {
                            padding: {
                                top: 30,
                                right: 20,
                                bottom: 10,
                                left: 10
                            }
                        },
                        legend: {
                            labels: {
                                fontColor: '#333',
                                fontSize: 14
                            }
                        },
                        tooltips: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return tooltipItem.yLabel + "명";
                                }
                            }
                        },
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    min: 0,
                                    max: maxYValue,
                                    stepSize: 10,
                                    fontColor: '#555',
                                    padding: 8,
                                    callback: function(value) {
                                        if (value === maxYValue) {
                                            return value + "명이상";
                                        }
                                        return value + "명";
                                    }
                                }
                            }],
                            xAxes: [{
                                ticks: {
                                    fontColor: '#555'
                                }
                            }]
                        },
                        animation: {
                            onComplete: function() {
                                var ctx = this.chart.ctx;
                                ctx.font = "bold 14px Arial";
                                ctx.fillStyle = "#333";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "bottom";

                                this.data.datasets.forEach(function(dataset, i) {
                                    var meta = this.getDatasetMeta(i);
                                    meta.data.forEach(function(point, index) {
                                        var value = dataset.data[index];
                                        ctx.fillText(value + "명", point._model.x, point._model.y - 8);
                                    });
                                }, this);
                            }
                        }
                    }
                });
            }

            createChart(
                document.getElementById('dailyChart').getContext('2d'),
                dailyLabels,
                dailyData,
                '일별 신규 가입자',
                getMaxYAxis(dailyData)
            );

            createChart(
                document.getElementById('weeklyChart').getContext('2d'),
                weeklyLabels,
                weeklyData,
                '주별 신규 가입자',
                getMaxYAxis(weeklyData)
            );

            createChart(
                document.getElementById('monthlyChart').getContext('2d'),
                monthlyLabels,
                monthlyData,
                '월별 신규 가입자',
                getMaxYAxis(monthlyData)
            );
        });
    </script>
</body>
</html>