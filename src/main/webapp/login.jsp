<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ShopNest</title>
    <style>
        body {
            background-color: gold;
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
        }

        h1 {
            text-align: center;
            margin-top: 80px;
        }

        fieldset {
            background-color: black;
            border-radius: 10px;
            padding: 30px 40px;
            width: 320px;
            margin: 20px auto;
            border: none;
        }

        label {
            color: white;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .input-field {
            height: 35px;
            width: 100%;
            border-radius: 8px;
            padding: 0 10px;
            font-size: 14px;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        .btn-submit {
            height: 40px;
            width: 100%;
            border-radius: 30px;
            background-color: hsl(204, 95%, 58%);
            border: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 5px;
        }

        .btn-submit:hover {
            background-color: hsl(204, 95%, 45%);
        }

        .link-area {
            text-align: center;
            margin-top: 12px;
        }

        .link-area a {
            color: white;
            font-weight: bold;
            text-decoration: underline;
        }

        .error-msg {
            background-color: #ff4d4d;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            margin-bottom: 12px;
            text-align: center;
            font-size: 14px;
        }

        .success-msg {
            background-color: #28a745;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            margin-bottom: 12px;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <h1>Login to start shopping</h1>

    <form action="login" method="post">
        <fieldset>

            <%-- Show feedback messages based on query params --%>
            <% String error = request.getParameter("error");
               String registered = request.getParameter("registered");
               String reset = request.getParameter("reset");

               if ("invalid".equals(error)) { %>
                <div class="error-msg">Invalid username or password.</div>
            <% } else if ("empty".equals(error)) { %>
                <div class="error-msg">Please enter your username and password.</div>
            <% } %>

            <% if ("true".equals(registered)) { %>
                <div class="success-msg">Registration successful! Please log in.</div>
            <% } %>

            <% if ("true".equals(reset)) { %>
                <div class="success-msg">Password reset successful! Please log in.</div>
            <% } %>

            <label for="name">User Name:</label>
            <input type="text" id="name" name="name" placeholder="Username" class="input-field" required>

            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" placeholder="Password" class="input-field" required>

            <div class="link-area" style="text-align:right; margin-top:-10px; margin-bottom:10px;">
                <a href="ForgotPassword.jsp">Forgot Password?</a>
            </div>

            <input type="submit" class="btn-submit" value="Log In">

            <div class="link-area">
                <a href="register.jsp">New user? Register here</a>
            </div>

        </fieldset>
    </form>
</body>
</html>
