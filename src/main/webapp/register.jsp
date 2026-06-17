<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ShopNest</title>
    <style>
        body {
            background-color: gold;
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
        }

        h1 {
            text-align: center;
            margin-top: 40px;
        }

        fieldset {
            background-color: black;
            border-radius: 10px;
            padding: 30px 40px;
            width: 360px;
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

        .radio-group {
            margin-bottom: 15px;
        }

        .radio-group label {
            display: inline;
            font-weight: normal;
            margin-left: 4px;
            margin-right: 12px;
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
    </style>
</head>
<body>
    <h1>Register Here</h1>

    <form action="register" method="post">
        <fieldset>

            <%-- Show error if registration failed --%>
            <% String error = request.getParameter("error");
               if ("empty".equals(error)) { %>
                <div class="error-msg">Please fill in all required fields.</div>
            <% } else if ("fail".equals(error)) { %>
                <div class="error-msg">Registration failed. Username may already exist.</div>
            <% } %>

            <label for="name">User Name:</label>
            <input type="text" id="name" name="name" placeholder="Username" class="input-field" required>

            <label for="mail">Email:</label>
            <input type="email" id="mail" name="mail" placeholder="Email" class="input-field" required>

            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" placeholder="Password" class="input-field" required>

            <label>Gender:</label>
            <div class="radio-group">
                <input type="radio" name="gender" value="Male" id="male">
                <label for="male">Male</label>
                <input type="radio" name="gender" value="Female" id="female">
                <label for="female">Female</label>
                <input type="radio" name="gender" value="Other" id="other">
                <label for="other">Other</label>
            </div>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" placeholder="Address" class="input-field">

            <input type="submit" class="btn-submit" value="Register">

            <div class="link-area">
                <a href="login.jsp">Already registered? Sign in instead</a>
            </div>

        </fieldset>
    </form>
</body>
</html>
