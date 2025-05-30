<!-- index.jsp - Main Dashboard -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management System</title>
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
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .menu-item {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .menu-item:hover {
            background-color: #0056b3;
        }
        .menu-item h3 {
            margin: 0 0 10px 0;
        }
        .menu-item p {
            margin: 0;
            font-size: 14px;
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Product Management System</h1>
        <p style="text-align: center; color: #666;">Welcome to the Product Management System. Choose an option below to get started.</p>
        
        <div class="menu">
            <a href="productadd.jsp" class="menu-item">
                <h3>Add Product</h3>
                <p>Add new products to inventory</p>
            </a>
            
            <a href="UpdateProductServlet" class="menu-item">
                <h3>Update Product</h3>
                <p>Modify existing product details</p>
            </a>
            
            <a href="productdelete.jsp" class="menu-item">
                <h3>Delete Product</h3>
                <p>Remove products from inventory</p>
            </a>
            
            <a href="DisplayProductsServlet" class="menu-item">
                <h3>View Products</h3>
                <p>Display all products in inventory</p>
            </a>
            
            <a href="ReportCriteriaServlet" class="menu-item">
                <h3>Generate Reports</h3>
                <p>View various product reports</p>
            </a>
        </div>
    </div>
</body>
</html>