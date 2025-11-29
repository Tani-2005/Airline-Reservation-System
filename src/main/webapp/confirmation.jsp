<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Confirmed Flight - Airline Booking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            margin: 0;
            padding: 30px;
            display: flex;
            justify-content: center;
            min-height: 100vh;
            align-items: flex-start;
        }
        .container {
            background: #fff;
            padding: 35px 45px;
            border-radius: 15px;
            max-width: 600px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
        }
        h1 {
            color: #2e7d32;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
        }
        .success-message {
            background-color: #66bb6a;
            color: white;
            font-weight: 700;
            padding: 15px;
            text-align: center;
            border-radius: 12px;
            margin-bottom: 30px;
        }
        .btn-home {
            display: block;
            width: 100%;
            background-color: #2e7d32;
            color: white;
            text-align: center;
            padding: 12px 0;
            border-radius: 12px;
            font-weight: 700;
            font-size: 1.1rem;
            text-decoration: none;
            margin-top: 30px;
            transition: background-color 0.3s ease;
        }
        .btn-home:hover {
            background-color: #1b5e20;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Confirmed Flight!</h1>
    <div class="success-message">Your flight has been successfully confirmed.</div>
    <a class="btn-home" href="search">Book Another Flight</a>
</div>
</body>
</html>