<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.airlinebooking.model.Flight" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking - Airline Booking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #FFB75E 0%, #ED8F03 100%);
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            min-height: 100vh;
            align-items: flex-start;
        }
        .container {
            background: #fff;
            border-radius: 15px;
            padding: 30px 40px;
            width: 500px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }
        h1 {
            text-align: center;
            color: #5d4037;
            margin-bottom: 25px;
        }
        .flight-info {
            background-color: #f5f5f5;
            padding: 15px 20px;
            border-radius: 12px;
            margin-bottom: 25px;
            color: #3e2723;
            font-weight: 600;
            font-size: 1rem;
        }
        label {
            display: block;
            margin-bottom: 6px;
            margin-top: 15px;
            font-weight: 600;
            color: #3e2723;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px 10px;
            border: 2px solid #bcaaa4;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #ef6c00;
            outline: none;
        }
        .passenger-block {
            margin-bottom: 20px;
            border-bottom: 1px solid #d7ccc8;
            padding-bottom: 15px;
        }
        .btn-submit {
            width: 100%;
            background-color: #ef6c00;
            color: white;
            font-weight: 700;
            font-size: 1.1rem;
            padding: 12px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .btn-submit:hover {
            background-color: #d84315;
        }
        .error-message {
            background-color: #c62828;
            color: white;
            padding: 10px;
            border-radius: 8px;
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div class="container">
    <h1>Passenger Details</h1>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) {
    %>
    <div class="error-message"><%= error %></div>
    <% } %>

    <%
        Flight flight = (Flight) request.getAttribute("flight");
        if (flight == null) {
    %>
        <div class="error-message">Flight details not found. Please go back and select a flight.</div>
    <%
        } else {
            // Default to 1 passenger if attribute missing
            int passengerCount = 1;
            Object passengerCountObj = request.getAttribute("passengerCount");
            if (passengerCountObj != null) {
                if (passengerCountObj instanceof Integer) {
                    passengerCount = (Integer) passengerCountObj;
                } else {
                    try {
                        passengerCount = Integer.parseInt(passengerCountObj.toString());
                    } catch (Exception e) {
                        passengerCount = 1;
                    }
                }
            } else {
                // Try request param as fallback
                String pCountParam = request.getParameter("passengers");
                if (pCountParam != null) {
                    try {
                        passengerCount = Integer.parseInt(pCountParam);
                    } catch (Exception ignored) {}
                }
            }
    %>
    <div class="flight-info">
        <p><strong>Flight:</strong> <%= flight.getFlightNumber() %></p>
        <p><strong>From:</strong> <%= flight.getSource() %> &nbsp; <strong>To:</strong> <%= flight.getDestination() %></p>
        <p><strong>Departure:</strong> <%= flight.getDepartureTime() %> &nbsp; <strong>Arrival:</strong> <%= flight.getArrivalTime() %></p>
        <p><strong>Price Per Passenger:</strong> $<%= String.format("%.2f", flight.getPrice()) %></p>
        <p><strong>Available Seats:</strong> <%= flight.getAvailableSeats() %></p>
    </div>

    <form action="book" method="post" autocomplete="off">
        <input type="hidden" name="flightId" value="<%= flight.getFlightNumber() %>">
        <input type="hidden" name="passengerCount" value="<%= passengerCount %>">

        <%
            for (int i = 1; i <= passengerCount; i++) {
        %>
        <div class="passenger-block">
            <h3>Passenger <%= i %> Details</h3>
            <label for="passengerName<%= i %>">Name *</label>
            <input type="text" id="passengerName<%= i %>" name="passengerName<%= i %>" placeholder="Enter full name" required maxlength="50">

            <label for="passengerAge<%= i %>">Age *</label>
            <input type="number" id="passengerAge<%= i %>" name="passengerAge<%= i %>" min="1" max="120" required>

            <label for="passengerGender<%= i %>">Gender *</label>
            <select id="passengerGender<%= i %>" name="passengerGender<%= i %>" required>
                <option value="" disabled selected>Select gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <% } %>

        <a class="btn-book" href="confirmation.jsp?flightId=<%= flight.getFlightNumber() %>&passengers=<%= request.getAttribute("passengers") != null ? request.getAttribute("passengers") : "1" %>&departDate=<%= request.getAttribute("departDate") != null ? request.getAttribute("departDate") : "" %>&returnDate=<%= request.getAttribute("returnDate") != null ? request.getAttribute("returnDate") : "N/A" %>">Submit</a>
        
    </form>
    <% } %>
</div>
</body>
</html>