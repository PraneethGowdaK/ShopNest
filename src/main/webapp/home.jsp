<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shopNest.dbHandler.DataFetcher" %>

<%-- Redirect to login if user is not in session --%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopNest - Home</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background-color: gold;
            font-family: Arial, Helvetica, sans-serif;
        }

        .topbar {
            background-color: black;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            font-size: 28px;
            font-weight: bold;
        }

        .topbar .nav-buttons a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            margin-left: 15px;
            padding: 6px 14px;
            border-radius: 6px;
            background-color: #333;
        }

        .topbar .nav-buttons a:hover {
            background-color: silver;
            color: black;
        }

        h1.page-title {
            text-align: center;
            background-color: black;
            color: gold;
            padding: 10px 0;
            margin-bottom: 30px;
        }

        .products-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .product-card {
            background-color: white;
            border-radius: 16px;
            width: 260px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }

        .product-card img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 12px;
        }

        .product-card h2 {
            font-size: 16px;
            margin-bottom: 6px;
        }

        .product-card p {
            font-size: 14px;
            color: #555;
            margin-bottom: 6px;
        }

        .product-card .price {
            font-weight: bold;
            font-size: 15px;
            margin-bottom: 12px;
        }

        .btn-add {
            background-color: hsl(204, 95%, 58%);
            border: none;
            border-radius: 30px;
            padding: 8px 24px;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-add:hover {
            background-color: hsl(204, 95%, 45%);
        }
    </style>
</head>
<body>

    <div class="topbar">
        ShopNest
        <div class="nav-buttons">
            <a href="cart.jsp">&#x1F6D2; View Cart</a>
            <a href="log">Log Out</a>
        </div>
    </div>

    <h1 class="page-title">SHOPPING POINT</h1>

    <div class="products-grid">
        <%
            List<String> prodList = DataFetcher.fetchProductsInfo();
            for (String row : prodList) {
                String[] p = row.split(":");
                // p[0]=pid, p[1]=pname, p[2]=pdesc, p[3]=pprice, p[4]=pimg
        %>
        <div class="product-card">
            <img src="prodimg/<%= p[4] %>" alt="<%= p[1] %>">
            <h2><%= p[1] %></h2>
            <p><%= p[2] %></p>
            <p class="price">&#8377; <%= p[3] %></p>
            <form method="post" action="add-to-cart">
                <input type="hidden" name="productId" value="<%= p[0] %>">
                <button type="submit" class="btn-add">Add to Cart</button>
            </form>
        </div>
        <% } %>
    </div>

</body>
</html>
