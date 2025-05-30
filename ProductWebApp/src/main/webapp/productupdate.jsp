<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            padding: 40px;
        }
        .container {
            max-width: 600px;
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
        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            text-align: center;
            font-weight: 500;
            font-size: 1rem;
        }
        .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .error   { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .search-form, .update-form {
            background-color: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .search-form h3 {
            margin-bottom: 20px;
            color: #34495e;
            font-size: 1.2rem;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #34495e;
            font-weight: 600;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        input:focus { border-color: #3498db; outline: none; }
        .btn {
            background-color: #3498db;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-right: 10px;
        }
        .btn:hover { background-color: #2980b9; transform: translateY(-2px); }
        .btn-secondary {
            background-color: #95a5a6;
        }
        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
        @media (max-width: 480px) {
            .btn { width: 100%; margin-bottom: 10px; }
            .btn-secondary { margin-right: 0; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Product</h2>

        <%-- Display messages --%>
        <% if (request.getAttribute("message") != null) { %>
            <div class="message <%= request.getAttribute("messageType") %>">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <%-- Search form --%>
        <div class="search-form">
            <h3>Find Product to Update</h3>
            <form action="UpdateProductServlet" method="get">
                <div class="form-group">
                    <label for="searchProductId">Product ID:</label>
                    <input type="number" id="searchProductId" name="productId" required>
                </div>
                <button type="submit" class="btn">Search</button>
            </form>
        </div>

        <%-- Update form --%>
        <% Product product = (Product) request.getAttribute("product"); %>
        <% if (product != null) { %>
        <div class="update-form">
            <form action="UpdateProductServlet" method="post">
                <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                <div class="form-group">
                    <label>Product ID:</label>
                    <input type="number" value="<%= product.getProductId() %>" disabled>
                </div>
                <div class="form-group">
                    <label for="productName">Name:</label>
                    <input type="text" id="productName" name="productName" value="<%= product.getProductName() %>" required>
                </div>
                <div class="form-group">
                    <label for="category">Category:</label>
                    <input type="text" id="category" name="category" value="<%= product.getCategory() %>" required>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0.01" min="0" value="<%= product.getPrice() %>" required>
                </div>
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" min="0" value="<%= product.getQuantity() %>" required>
                </div>
                <button type="submit" class="btn">Update Product</button>
            </form>
        </div>
        <% } %>

        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</body>
</html>
