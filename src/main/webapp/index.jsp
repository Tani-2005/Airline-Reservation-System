<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Welcome - Airline Booking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .welcome-container {
            background: rgba(255, 255, 255, 0.85);
            padding: 50px 65px;
            border-radius: 20px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
            text-align: center;
        }

        h1 {
            font-size: 3rem;
            color: #333;
            margin-bottom: 30px;
        }

        p {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 40px;
        }

        a.button {
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            padding: 18px 38px;
            font-weight: 700;
            font-size: 1.2rem;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(41, 128, 185, 0.5);
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        a.button:hover {
            background-color: #1c5980;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div class="welcome-container">
    <h1>Welcome to Airline Booking System</h1>
    <p>Your journey begins here. Find and book flights with ease.</p>
    <a href="search" class="button">Search Flights</a>
</div>
</body>
</html>