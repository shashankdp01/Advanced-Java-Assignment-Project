<!-- report_form.jsp - Report Criteria Form -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #333;
        }
        select, input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            margin-top: 10px;
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #545b62;
        }
        .criteria-section {
            display: none;
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-top: 15px;
            border: 1px solid #ddd;
        }
        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
    <script>
        function showCriteria() {
            const reportType = document.getElementById('reportType').value;
            const sections = document.querySelectorAll('.criteria-section');
            sections.forEach(section => section.style.display = 'none');
            
            if (reportType) {
                const section = document.getElementById(reportType + 'Section');
                if (section) section.style.display = 'block';
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Generate Report</h2>

        <%-- Feedback message (success or error) --%>
        <% if (request.getAttribute("message") != null) { %>
            <div class="message <%= request.getAttribute("messageType") %>">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <form action="ReportServlet" method="post">
            <div class="form-group">
                <label for="reportType">Select Report Type:</label>
                <select id="reportType" name="reportType" onchange="showCriteria()" required>
                    <option value="">-- Select Report Type --</option>
                    <option value="priceGreater">Products with Price Greater Than</option>
                    <option value="category">Products by Category</option>
                    <option value="topProducts">Top Products by Quantity</option>
                </select>
            </div>

            <!-- Price Greater Than -->
            <div id="priceGreaterSection" class="criteria-section">
                <div class="form-group">
                    <label for="price">Minimum Price:</label>
                    <input type="number" id="price" name="price" step="0.01" min="0" placeholder="Enter minimum price">
                </div>
            </div>

            <!-- Category -->
            <div id="categorySection" class="criteria-section">
                <div class="form-group">
                    <label for="category">Category:</label>
                    <input type="text" id="category" name="category" placeholder="Enter category name">
                </div>
            </div>

            <!-- Top Products -->
            <div id="topProductsSection" class="criteria-section">
                <div class="form-group">
                    <label for="limit">Number of Top Products:</label>
                    <input type="number" id="limit" name="limit" min="1" max="100" placeholder="Enter number of top products">
                </div>
            </div>

            <button type="submit" class="btn">Generate Report</button>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </form>
    </div>
</body>
</html>
