<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Check if the session exists and user is logged in
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    String role = (session != null) ? (String) session.getAttribute("role") : null;

    if (username == null || role == null || !role.equals("user")) {
        // If user is not a normal user, redirect to login page
        response.sendRedirect("login.jsp");
        return;
    }

    username = username.substring(0, 1).toUpperCase() + username.substring(1); // Capitalize first letter
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - CoeusQuest</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="preload" href="favi.ico" as="image">
    <link rel="icon" href="favi.ico" type="image/x-icon">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #ffffff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .welcome-section {
            text-align: center;
            margin-bottom: 50px; /* Creates space between text and form */
        }

        .welcome-section h1 {
            color: #ff6600;
            font-size: 36px;
            margin-bottom: 10px;
        }

        .welcome-section p {
            color: #ff6600;
            font-size: 18px;
        }

        .user-actions {
            width: 100%;
            max-width: 400px;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1), 0 0 10px rgba(255, 102, 0, 0.5); /* Light glow */
            text-align: center;
            position: relative;
            transition: box-shadow 0.55s ease-in-out; /* Slower transition for glow */
        }

        .user-actions:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1), 0 0 25px rgba(255, 102, 0, 1); /* Brighter glow on hover */
        }

        .user-actions h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 30px;
            color: #ff6600;
        }

        .user-actions p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #333;
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: #ff6600;
            color: white;
            border: none;
            border-radius: 30px;
            font-size: 18px;
            cursor: pointer;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #ff8800;
        }

        /* Top Bar */
        .top-bar {
            position: fixed;
            top: 0;
            width: 100%;
            height: 60px;
            background: linear-gradient(to right, #ff6600, #ffcc33);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        .top-bar h3 {
            color: #fff;
            font-size: 20px;
            font-weight: 700;
        }

        .top-bar nav {
            display: flex;
        }

        .top-bar nav a {
            color: #fff;
            margin-left: 20px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
        }

        .top-bar nav a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <!-- Top Bar -->
    <div class="top-bar">
        <h3>CoeusQuest</h3>
    </div>

    <!-- Welcome Text Section -->
    <div class="welcome-section">
        <h1>Welcome <%= username %></h1>
    </div>

    <!-- User Actions -->
    <div class="user-actions">
        <h2><b>User Actions</b></h2>
        <p><i>Choose an action below</i></p>

        <form action="TakeTest.jsp" method="get">
            <button type="submit"><strong>Take Test</strong></button>
        </form>

        <form action="logout.jsp" method="get">
            <button type="submit"><strong>Logout</strong></button>
        </form>
    </div>

</body>
</html>
