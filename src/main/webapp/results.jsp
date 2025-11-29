<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.airlinebooking.model.Flight" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Flights - Airline Booking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #FFDEE9 0%, #B5FFFC 100%);
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        h1 {
            color: #34495e;
            text-align: center;
            margin-bottom: 30px;
        }
        .summary {
            text-align: center;
            font-size: 1.1rem;
            margin-bottom: 25px;
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }
        th, td {
            padding: 15px 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            word-wrap: break-word;
        }
        th {
            background: #2980b9;
            color: white;
            font-weight: 700;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn-book {
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 8px 16px;
            cursor: pointer;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .btn-book:hover {
            background-color: #2980b9;
        }
        .no-flights {
            text-align: center;
            font-size: 1.2rem;
            color: #e74c3c;
            margin-top: 40px;
            font-weight: 600;
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
<div class="container">
    <h1>Available Flights</h1>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) {
    %>
    <div class="error-message"><%= error %></div>
    <% } %>

    <div class="summary">
        <strong>Passengers:</strong> <%= request.getAttribute("passengers") != null ? request.getAttribute("passengers") : "1" %> &nbsp;&nbsp;|&nbsp;&nbsp;
        <strong>Departure Date:</strong> <%= request.getAttribute("departDate") != null ? request.getAttribute("departDate") : "" %> &nbsp;&nbsp;|&nbsp;&nbsp;
        <strong>Return Date:</strong> <%= request.getAttribute("returnDate") != null ? request.getAttribute("returnDate") : "N/A" %>
    </div>

    <%
    	@SuppressWarnings("unchecked") 
        List<Flight> flights = (List<Flight>) request.getAttribute("flights");

        if (flights == null || flights.isEmpty()) {
    %>
        <div class="no-flights">No flights found matching your criteria.</div>
    <%
        } else {
    %>
    <table>
        <thead>
            <tr>
                <th>Flight Number</th>
                <th>Source</th>
                <th>Destination</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Price (USD)</th>
                <th>Available Seats</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Flight flight : flights) {
        %>
            <tr>
                <td><%= flight.getFlightNumber() %></td>
                <td><%= flight.getSource() %></td>
                <td><%= flight.getDestination() %></td>
                <td><%= flight.getDepartureTime() %></td>
                <td><%= flight.getArrivalTime() %></td>
                <td><%= String.format("%.2f", flight.getPrice()) %></td>
                <td><%= flight.getAvailableSeats() %></td>
                <td>
                    <a class="btn-book" href="flightDetails?flightId=<%= flight.getFlightNumber() %>">Book Now</a>
                    
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        }
    %>
</div>
</body>
</html>