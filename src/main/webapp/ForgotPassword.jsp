<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - ShopNest</title>
    <style>
        body {
            background-color: gold;
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
        }

        h1 {
            text-align: center;
            margin-top: 60px;
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

        .error-msg {
            background-color: #ff4d4d;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            margin-bottom: 12px;
            text-align: center;
            font-size: 14px;
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
    </style>
</head>
<body>
    <h1>Password Reset</h1>

    <form action="forgot" method="post">
        <fieldset>

            <%-- Show error messages based on what went wrong --%>
            <% String error = request.getParameter("error");
               if ("mismatch".equals(error)) { %>
                <div class="error-msg">Passwords do not match. Please try again.</div>
            <% } else if ("email".equals(error)) { %>
                <div class="error-msg">Email does not match our records.</div>
            <% } %>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Username" class="input-field" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Email" class="input-field" required>

            <label for="newpass">New Password:</label>
            <input type="password" id="newpass" name="newpass" placeholder="Enter new password" class="input-field" required>

            <label for="repass">Confirm New Password:</label>
            <input type="password" id="repass" name="repass" placeholder="Re-enter new password" class="input-field" required>

            <input type="submit" class="btn-submit" value="Reset Password">

            <div class="link-area">
                <a href="login.jsp">Back to Login</a>
            </div>

        </fieldset>
    </form>
</body>
</html>
