package com.airlinebooking.servlet;

import com.airlinebooking.model.Flight;
import com.airlinebooking.data.FlightData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/flightDetails")
public class FlightDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle GET request - show details of the selected flight
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightId = request.getParameter("flightId");

        if (flightId == null || flightId.trim().isEmpty()) {
            request.setAttribute("error", "Invalid flight selection.");
            request.getRequestDispatcher("results.jsp").forward(request, response);
            return;
        }

        Flight selectedFlight = FlightData.getFlightByNumber(flightId.trim());

        if (selectedFlight == null) {
            request.setAttribute("error", "Flight not found.");
            request.getRequestDispatcher("results.jsp").forward(request, response);
            return;
        }

        // Set flight attribute for the booking page
        request.setAttribute("flight", selectedFlight);

        // Forward to booking.jsp for user to enter passenger details and select seats
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }

}
