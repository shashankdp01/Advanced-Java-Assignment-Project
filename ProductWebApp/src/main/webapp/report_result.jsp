<!-- report_result.jsp - Report Results Display -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
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
        .report-title {
            text-align: center;
            color: #555;
            font-style: italic;
            margin-bottom: 25px;
        }
        .summary {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #333;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .no-results {
            text-align: center;
            font-style: italic;
            color: #666;
            padding: 30px 0;
        }
        .actions {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 14px;
            border-radius: 5px;
            margin: 0 10px;
            display: inline-block;
            border: none;
            cursor: pointer;
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Report Results</h2>
        <div class="report-title"><%= request.getAttribute("reportTitle") %></div>

        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
        %>
            <div class="summary">
                Total Results: <%= products.size() %> product(s)
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product product : products) { %>
                        <tr>
                            <td><%= product.getProductId() %></td>
                            <td><%= product.getProductName() %></td>
                            <td><%= product.getCategory() %></td>
                            <td>$<%= String.format("%.2f", product.getPrice()) %></td>
                            <td><%= product.getQuantity() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div class="no-results">No products found matching the specified criteria.</div>
        <% } %>

        <div class="actions">
            <a href="ReportCriteriaServlet" class="btn">Generate Another Report</a>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html>
