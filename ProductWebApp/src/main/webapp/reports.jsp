<!-- reports.jsp - Reports Dashboard -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 10px;
        }
        .description {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
        }
        .report-menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        .report-item {
            background-color: #28a745;
            color: white;
            padding: 25px 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        .report-item:hover {
            background-color: #218838;
        }
        .report-item h3 {
            margin: 0 0 10px 0;
            font-size: 20px;
        }
        .report-item p {
            margin: 0;
            font-size: 14px;
            opacity: 0.9;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            display: inline-block;
            margin-top: 30px;
            font-size: 15px;
            transition: background-color 0.3s ease;
        }
        .btn-secondary:hover {
            background-color: #545b62;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Reports Dashboard</h2>
        <p class="description">Generate various reports for your product inventory.</p>
        
        <div class="report-menu">
            <a href="ReportCriteriaServlet" class="report-item">
                <h3>Custom Reports</h3>
                <p>Generate reports based on specific criteria</p>
            </a>
        </div>
        
        <div style="text-align: center;">
            <a href="index.jsp" class="btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html>
