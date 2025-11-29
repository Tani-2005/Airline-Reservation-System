package com.airlinebooking.data;

import com.airlinebooking.model.Flight;

import java.util.ArrayList;
import java.util.List;

public class FlightData {

    private static final List<Flight> flights = new ArrayList<>();

    static {
        // Updated to remove the duplicate flight number "AA010"
    	flights.add(new Flight("AI101", "New York", "London", "08:00 AM", "08:00 PM", 850.0, 10));
    	flights.add(new Flight("BA202", "London", "Paris", "09:00 AM", "10:30 AM", 120.0, 15));
    	flights.add(new Flight("DL303", "Paris", "Rome", "11:00 AM", "01:00 PM", 150.0, 8));
    	flights.add(new Flight("UA404", "Rome", "Berlin", "02:00 PM", "04:00 PM", 180.0, 20));
    	flights.add(new Flight("AF505", "Berlin", "New York", "06:00 PM", "08:00 PM", 900.0, 5));
    	flights.add(new Flight("LH606", "New York", "Chicago", "07:30 AM", "09:00 AM", 200.0, 12));
    	flights.add(new Flight("EK707", "Dubai", "New York", "10:00 PM", "06:00 AM", 1200.0, 7));
    	flights.add(new Flight("QF808", "Sydney", "Melbourne", "01:00 PM", "02:30 PM", 100.0, 30));
    	flights.add(new Flight("SQ909", "Singapore", "Tokyo", "09:30 AM", "04:00 PM", 700.0, 10));
    	flights.add(new Flight("AA010", "Miami", "Los Angeles", "12:00 PM", "03:00 PM", 250.0, 18));

    }

    public static List<Flight> getFlights() {
        return flights;
    }

    public static Flight getFlightByNumber(String flightNumber) {
        if (flightNumber == null || flightNumber.trim().isEmpty()) {
            return null;
        }
        for (Flight flight : flights) {
            if (flight.getFlightNumber().equalsIgnoreCase(flightNumber.trim())) {
                return flight;
            }
        }
        return null;
    }
}
