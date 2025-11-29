<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Search - Airline Booking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .search-container {
            background: #ffffffcc;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
            width: 400px;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #34495e;
            font-weight: 600;
        }
        input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 20px;
            border: 2px solid #bdc3c7;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus {
            border-color: #2980b9;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #3498db;
            color: white;
            padding: 12px;
            font-size: 1.1rem;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-weight: 700;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .error-message {
            background-color: #e74c3c;
            color: white;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-weight: 600;
            text-align: center;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div class="search-container">
    <h1>Search Flights</h1>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) {
    %>
    <div class="error-message"><%= error %></div>
    <% } %>
    <form action="search" method="post" autocomplete="off">
        <label for="source">Source City *</label>
        <input type="text" id="source" name="source" placeholder="Enter source city" required value="<%= request.getParameter("source") != null ? request.getParameter("source") : "" %>">
        
        <label for="destination">Destination City *</label>
        <input type="text" id="destination" name="destination" placeholder="Enter destination city" required value="<%= request.getParameter("destination") != null ? request.getParameter("destination") : "" %>">
        
        <label for="departDate">Departure Date *</label>
        <input type="date" id="departDate" name="departDate" required value="<%= request.getParameter("departDate") != null ? request.getParameter("departDate") : "" %>">
        
        <label for="returnDate">Return Date (Optional)</label>
        <input type="date" id="returnDate" name="returnDate" value="<%= request.getParameter("returnDate") != null ? request.getParameter("returnDate") : "" %>">
        
        <label for="passengers">Number of Passengers *</label>
        <input type="number" id="passengers" name="passengers" min="1" max="10" required value="<%= request.getParameter("passengers") != null ? request.getParameter("passengers") : "1" %>">
        
        <input type="submit" value="Search Flights">
    </form>
</div>
</body>
</html>