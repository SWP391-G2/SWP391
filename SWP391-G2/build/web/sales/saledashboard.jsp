<%-- 
    Document   : saledashboard
    Created on : Jul 12, 2024, 8:28:41 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="../css/dashboardcss/stylecss.css"/>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
            }

            .sidebar {
                width: 250px;
                height: 100vh;
                position: fixed;
            }

            .main-content {
                margin-left: 250px;
                flex: 1;
                padding: 20px;
            }

            header {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                margin-bottom: 20px;
            }

            header h1 {
                margin-bottom: 10px;
            }

            .date-inputs {
                display: flex;
                gap: 10px;
            }

            .dashboard-grid {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 20px;
            }

            .dashboard-item {
                background: white;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .dashboard-item h2 {
                font-size: 1.2em;
                margin-top: 0;
            }

            .trends {
                grid-column: span 2;
            }
        </style>

    </head>
    <body>

        <main class="main-content">
            <header>
                <h1>Admin Dashboard</h1>
                <div class="date-inputs">
                    <input type="date" id="start-date">
                    <input type="date" id="end-date">
                </div>
            </header>

            <section class="dashboard-grid">
                <div class="dashboard-item">
                    <h2>Order Statistics</h2>
                    <canvas id="orderChart"></canvas>
                </div>
                <div class="dashboard-item">
                    <h2>Revenues</h2>
                    <p>Total Revenue: $<span id="total-revenue"></span></p>
                    <canvas id="revenueChart"></canvas>
                </div>
                <div class="dashboard-item">
                    <h2>Feedbacks</h2>
                    <p>Average Rating: <span id="avg-rating"></span></p>
                    <canvas id="feedbackChart"></canvas>
                </div>
                <div class="dashboard-item">
                    <h2>Customers</h2>
                    <p>Newly Registered: <span id="new-registered"></span></p>
                    <p>Newly Bought: <span id="new-bought"></span></p>
                </div>
                <div class="dashboard-item trends">
                    <h2>Order Trends</h2>
                    <canvas id="trendChart"></canvas>
                </div>
            </section>
        </main>

        <script src="scripts.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const startDate = document.getElementById('start-date');
                const endDate = document.getElementById('end-date');

                // Placeholder data
                const data = {
                    orders: {
                        success: 120,
                        cancelled: 15,
                        submitted: 10,
                        daily_trend: {
                            dates: ["2024-06-17", "2024-06-18", "2024-06-19", "2024-06-20", "2024-06-21", "2024-06-22", "2024-06-23"],
                            success_counts: [20, 18, 15, 25, 10, 17, 15],
                            all_counts: [25, 20, 18, 30, 12, 20, 17]
                        }
                    },
                    revenue: {
                        total: 15000,
                        by_category: {
                            electronics: 8000,
                            fashion: 5000,
                            home_appliances: 2000
                        }
                    },
                    customers: {
                        newly_registered: 30,
                        newly_bought: 20
                    },
                    feedbacks: {
                        average_star: 4.5,
                        by_category: {
                            electronics: 4.6,
                            fashion: 4.3,
                            home_appliances: 4.7
                        }
                    }
                };

                // Update Revenue
                document.getElementById('total-revenue').textContent = data.revenue.total;

                // Update Customers
                document.getElementById('new-registered').textContent = data.customers.newly_registered;
                document.getElementById('new-bought').textContent = data.customers.newly_bought;

                // Update Feedbacks
                document.getElementById('avg-rating').textContent = data.feedbacks.average_star;

                // Order Chart
                const orderChartCtx = document.getElementById('orderChart').getContext('2d');
                new Chart(orderChartCtx, {
                    type: 'bar',
                    data: {
                        labels: ['Success', 'Cancelled', 'Submitted'],
                        datasets: [{
                                label: 'Order Statistics',
                                data: [data.orders.success, data.orders.cancelled, data.orders.submitted],
                                backgroundColor: ['green', 'red', 'blue']
                            }]
                    }
                });

                // Revenue Chart
                const revenueChartCtx = document.getElementById('revenueChart').getContext('2d');
                new Chart(revenueChartCtx, {
                    type: 'pie',
                    data: {
                        labels: ['Electronics', 'Fashion', 'Home Appliances'],
                        datasets: [{
                                label: 'Revenue by Category',
                                data: [data.revenue.by_category.electronics, data.revenue.by_category.fashion, data.revenue.by_category.home_appliances],
                                backgroundColor: ['blue', 'yellow', 'purple']
                            }]
                    }
                });

                // Feedback Chart
                const feedbackChartCtx = document.getElementById('feedbackChart').getContext('2d');
                new Chart(feedbackChartCtx, {
                    type: 'bar',
                    data: {
                        labels: ['Electronics', 'Fashion', 'Home Appliances'],
                        datasets: [{
                                label: 'Average Rating by Category',
                                data: [data.feedbacks.by_category.electronics, data.feedbacks.by_category.fashion, data.feedbacks.by_category.home_appliances],
                                backgroundColor: ['blue', 'yellow', 'purple']
                            }]
                    }
                });

                // Trend Chart
                const trendChartCtx = document.getElementById('trendChart').getContext('2d');
                new Chart(trendChartCtx, {
                    type: 'line',
                    data: {
                        labels: data.orders.daily_trend.dates,
                        datasets: [
                            {
                                label: 'Success Orders',
                                data: data.orders.daily_trend.success_counts,
                                borderColor: 'green',
                                fill: false
                            },
                            {
                                label: 'All Orders',
                                data: data.orders.daily_trend.all_counts,
                                borderColor: 'blue',
                                fill: false
                            }
                        ]
                    }
                });
            });

        </script>
    </body>
</html>