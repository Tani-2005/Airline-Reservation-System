package com.airlinebooking.servlet;

import com.airlinebooking.model.Flight;
import com.airlinebooking.data.FlightData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search")
public class FlightSearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle GET request - show flight search form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to search.jsp
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    // Handle POST request - process flight search
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read request parameters
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String departDate = request.getParameter("departDate");
        String returnDate = request.getParameter("returnDate"); // Optional or can be empty
        String passengersStr = request.getParameter("passengers");

        int passengers = 1;
        try {
            passengers = Integer.parseInt(passengersStr);
            if (passengers < 1) {
                passengers = 1;
            }
        } catch (NumberFormatException e) {
            passengers = 1;
        }

        // Validate required parameters
        if (source == null || destination == null || departDate == null ||
                source.trim().isEmpty() || destination.trim().isEmpty() || departDate.trim().isEmpty()) {
            request.setAttribute("error", "Please fill all required fields (source, destination, departure date).");
            request.getRequestDispatcher("search.jsp").forward(request, response);
            return;
        }

        // Get all flights from data source
        List<Flight> allFlights = FlightData.getFlights();

        // Filter flights matching source, destination, and available seats >= passengers
        List<Flight> matchedFlights = new ArrayList<>();
        for (Flight flight : allFlights) {
            if (flight.getSource().equalsIgnoreCase(source.trim()) &&
                flight.getDestination().equalsIgnoreCase(destination.trim()) &&
                flight.getAvailableSeats() >= passengers) {
                // For simplicity, ignoring date matching logic which could be improved later
                matchedFlights.add(flight);
            }
        }

        // Set attributes for JSP
        request.setAttribute("flights", matchedFlights);
        request.setAttribute("passengers", passengers);
        request.setAttribute("departDate", departDate);
        request.setAttribute("returnDate", returnDate);

        // Forward to results JSP to display available flights
        request.getRequestDispatcher("results.jsp").forward(request, response);
    }
}

