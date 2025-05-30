<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Inventory</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            padding: 40px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 2rem;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 0.95rem;
        }
        th {
            background-color: #f8f9fa;
            font-weight: 600;
            color: #333;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .btn-secondary {
            background-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #545b62;
        }
        .no-products {
            text-align: center;
            color: #888;
            font-style: italic;
            font-size: 1rem;
            padding: 20px;
            background-color: #fdfdfd;
            border: 1px dashed #ccc;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .actions {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }
            th {
                background-color: #f0f0f0;
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
            td {
                border: none;
                position: relative;
                padding-left: 50%;
                margin-bottom: 12px;
            }
            td::before {
                position: absolute;
                top: 12px;
                left: 12px;
                width: 45%;
                white-space: nowrap;
                font-weight: bold;
                color: #555;
            }
            td:nth-of-type(1)::before { content: "Product ID"; }
            td:nth-of-type(2)::before { content: "Product Name"; }
            td:nth-of-type(3)::before { content: "Category"; }
            td:nth-of-type(4)::before { content: "Price"; }
            td:nth-of-type(5)::before { content: "Quantity"; }
            td:nth-of-type(6)::before { content: "Actions"; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Product Inventory</h2>

        <% 
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) { 
        %>
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Actions</th>
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
                        <td>
                            <a href="UpdateProductServlet?productId=<%= product.getProductId() %>" class="btn">Edit</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div class="no-products">
                No products found in inventory.
            </div>
        <% } %>

        <div class="actions">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
            <a href="productadd.jsp" class="btn">Add New Product</a>
        </div>
    </div>
</body>
</html>
