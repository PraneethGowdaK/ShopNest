<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shopNest.dbHandler.DataFetcher" %>

<%-- Only admin can access this page --%>
<%
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<String> userList = DataFetcher.fetchUsersInfo();
    List<String> prodList = DataFetcher.fetchProductsInfo();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - ShopNest</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f0f0f0;
        }

        /* Tab bar */
        .tab-bar {
            display: flex;
            background-color: #f1f1f1;
            border-bottom: 2px solid #ccc;
            align-items: center;
        }

        .tab-bar button {
            background-color: inherit;
            border: none;
            padding: 14px 20px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.2s;
        }

        .tab-bar button:hover,
        .tab-bar button.active {
            background-color: black;
            color: white;
        }

        .tab-bar a {
            margin-left: auto;
            margin-right: 10px;
        }

        .tab-bar a button {
            background-color: #e74c3c;
            color: white;
            border-radius: 6px;
        }

        /* Tab content */
        .tab-content {
            display: none;
            padding: 20px;
        }

        .tab-content.active {
            display: block;
        }

        h1.section-title {
            text-align: center;
            background-color: black;
            color: white;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px;
        }

        /* Tables */
        table {
            width: 95%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px 14px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: black;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Add product form */
        .form-wrapper {
            background-color: #ddd;
            border-radius: 10px;
            padding: 30px 40px;
            width: 600px;
            margin: 0 auto;
        }

        .form-wrapper label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            margin-top: 15px;
        }

        .form-wrapper input,
        .form-wrapper textarea {
            width: 100%;
            padding: 8px 12px;
            border-radius: 8px;
            border: 1px solid #aaa;
            font-size: 14px;
        }

        .form-wrapper textarea {
            height: 80px;
            resize: vertical;
        }

        .btn-submit {
            margin-top: 20px;
            height: 40px;
            width: 150px;
            border-radius: 30px;
            background-color: hsl(204, 95%, 58%);
            border: none;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: hsl(204, 95%, 45%);
        }

        .btn-remove {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 5px 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
        }

        .btn-remove:hover {
            background-color: #c0392b;
        }

        .error-msg {
            background-color: #ff4d4d;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            margin-bottom: 12px;
            text-align: center;
        }
    </style>

    <script>
        function openTab(evt, tabId) {
            // Hide all tab content panels
            var panels = document.getElementsByClassName("tab-content");
            for (var i = 0; i < panels.length; i++) {
                panels[i].classList.remove("active");
            }

            // Remove active class from all tab buttons
            var buttons = document.getElementsByClassName("tab-btn");
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove("active");
            }

            // Show the selected tab and mark the button as active
            document.getElementById(tabId).classList.add("active");
            evt.currentTarget.classList.add("active");
        }
    </script>
</head>
<body>

    <div class="tab-bar">
        <button class="tab-btn active" onclick="openTab(event, 'customers')">View Customers</button>
        <button class="tab-btn" onclick="openTab(event, 'products')">View Products</button>
        <button class="tab-btn" onclick="openTab(event, 'addProduct')">Add New Product</button>
        <a href="log"><button>Log Out</button></a>
    </div>


    <%-- CUSTOMERS TAB --%>
    <div id="customers" class="tab-content active">
        <h1 class="section-title">Customers Information</h1>
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <% for (String row : userList) {
                       String[] c = row.split(":");
                %>
                <tr>
                    <td><%= c[0] %></td>
                    <td><%= c[1] %></td>
                    <td><%= c[2] %></td>
                    <td><%= c.length > 3 ? c[3] : "" %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>


    <%-- PRODUCTS TAB --%>
    <div id="products" class="tab-content">
        <h1 class="section-title">Products Information</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <% for (String row : prodList) {
                       String[] p = row.split(":");
                %>
                <tr>
                    <td><%= p[0] %></td>
                    <td><%= p[1] %></td>
                    <td><%= p[2] %></td>
                    <td>&#8377; <%= p[3] %></td>
                    <td><img src="prodimg/<%= p[4] %>" alt="<%= p[1] %>" height="80" width="80"></td>
                    <td>
                        <form method="post" action="rem">
                            <input type="hidden" name="id" value="<%= p[0] %>">
                            <button type="submit" class="btn-remove">Remove</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>


    <%-- ADD PRODUCT TAB --%>
    <div id="addProduct" class="tab-content">
        <h1 class="section-title">Add New Product</h1>
        <div class="form-wrapper">

            <% String error = request.getParameter("error");
               if ("empty".equals(error)) { %>
                <div class="error-msg">Please fill in all required fields.</div>
            <% } else if ("invalid".equals(error)) { %>
                <div class="error-msg">Product ID and Price must be valid numbers.</div>
            <% } %>

            <form action="addP" method="post">
                <label for="product-id">Product ID:</label>
                <input type="number" id="product-id" name="product-id" required>

                <label for="product-name">Product Name:</label>
                <input type="text" id="product-name" name="product-name" required>

                <label for="product-description">Product Description:</label>
                <textarea id="product-description" name="product-description" required></textarea>

                <label for="product-price">Product Price (&#8377;):</label>
                <input type="number" id="product-price" name="product-price" required>

                <label for="product-image">Image Filename (e.g. shoe.jpg):</label>
                <input type="text" id="product-image" name="product-image" required>

                <button type="submit" class="btn-submit">Add Product</button>
            </form>
        </div>
    </div>

</body>
</html>
