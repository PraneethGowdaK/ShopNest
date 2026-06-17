<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shopNest.product.Cart" %>
<%@ page import="com.shopNest.product.Product" %>

<%-- Redirect to login if user is not in session --%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }

    List<Product> items = cart.getItems();
    double total = cart.getTotal();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - ShopNest</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background-color: gold;
            font-family: Arial, Helvetica, sans-serif;
            padding-bottom: 70px;
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

        .cart-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .cart-card {
            background-color: white;
            border-radius: 16px;
            width: 260px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }

        .cart-img {
            width: 100%;
            height: 180px;
            object-fit: contain;
            margin-bottom: 15px;
            border-radius: 8px;
        }

        .cart-card h2 {
            font-size: 16px;
            margin-bottom: 6px;
        }

        .cart-card .price {
            font-weight: bold;
            margin-bottom: 14px;
        }

        .btn-remove {
            background-color: #e74c3c;
            border: none;
            border-radius: 30px;
            padding: 8px 24px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-remove:hover {
            background-color: #c0392b;
        }

        .empty-msg {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            margin-top: 60px;
            color: #333;
        }

        .footer-total {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: black;
            color: gold;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            padding: 12px 0;
        }
    </style>
</head>
<body>

    <div class="topbar">
        ShopNest
        <div class="nav-buttons">
            <a href="home.jsp">&#x1F3E0; Home</a>
            <a href="log">Log Out</a>
        </div>
    </div>

    <h1 class="page-title">YOUR CART</h1>

    <% if (items.isEmpty()) { %>
        <div class="empty-msg">Your cart is empty. <a href="home.jsp">Start shopping!</a></div>
    <% } else { %>
        <div class="cart-grid">
            <% for (Product item : items) { %>
            <div class="cart-card">
                <img src="prodimg/<%= item.getPimg() %>" alt="<%= item.getPname() %>" class="cart-img">
                <h2><%= item.getPname() %></h2>
                <p class="price">&#8377; <%= item.getPprice() %></p>
                <form method="post" action="rem">
                    <input type="hidden" name="id" value="<%= item.getPid() %>">
                    <button type="submit" class="btn-remove">Remove</button>
                </form>
            </div>
            <% } %>
        </div>
    <% } %>

    <div class="footer-total">
        Grand Total: &#8377; <%= total %>
    </div>

</body>
</html>
