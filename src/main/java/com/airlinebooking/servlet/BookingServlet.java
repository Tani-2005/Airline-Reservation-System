package com.airlinebooking.servlet;

import com.airlinebooking.model.Booking;
import com.airlinebooking.model.Flight;
import com.airlinebooking.model.Passenger;
import com.airlinebooking.data.FlightData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle POST Booking submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read form parameters
        String flightId = request.getParameter("flightId");
        String passengerCountStr = request.getParameter("passengerCount");

        int passengerCount = 1;
        try {
            passengerCount = Integer.parseInt(passengerCountStr);
            if (passengerCount < 1) {
                passengerCount = 1;
            }
        } catch (NumberFormatException e) {
            passengerCount = 1;
        }

        // Check if flightId is valid
        if (flightId == null || flightId.trim().isEmpty()) {
            request.setAttribute("error", "Invalid flight selection.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
            return;
        }

        // Fetch the selected flight from the data
        Flight flight = FlightData.getFlightByNumber(flightId.trim());

        if (flight == null) {
            request.setAttribute("error", "Flight not found.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
            return;
        }

        // Check if there are enough available seats
        if (flight.getAvailableSeats() < passengerCount) {
            request.setAttribute("error", "Not enough available seats on this flight.");
            request.setAttribute("flight", flight);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
            return;
        }

        // Read passenger details dynamically based on the count
        List<Passenger> passengers = new ArrayList<>();
        for (int i = 1; i <= passengerCount; i++) {
            String name = request.getParameter("passengerName" + i);
            String ageStr = request.getParameter("passengerAge" + i);
            String gender = request.getParameter("passengerGender" + i);

            // Validate passenger information
            int age = 0;
            try {
                age = Integer.parseInt(ageStr);
            } catch (NumberFormatException e) {
                age = 0;
            }

            if (name == null || name.trim().isEmpty() || gender == null || gender.trim().isEmpty() || age <= 0) {
                request.setAttribute("error", "Please fill all passenger details correctly.");
                request.setAttribute("flight", flight);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            }

            // Add passenger to list
            passengers.add(new Passenger(name.trim(), age, gender.trim()));
        }

        // Create the booking object (in real-world, this should be saved to a DB)
        Booking booking = new Booking(flight, passengers);

        // Update the available seats for the flight
        flight.setAvailableSeats(flight.getAvailableSeats() - passengerCount);

        // Store the booking in the session (optional: for persistent state across multiple requests)
        HttpSession session = request.getSession();
        session.setAttribute("booking", booking);
        session.setAttribute("flight", flight);

        // Forward to confirmedFlight.jsp for user confirmation
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }

    // Handle GET request (show booking form)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Simply forward to the booking form
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }
}
