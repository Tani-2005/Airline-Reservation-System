package com.airlinebooking.model;

import java.util.List;

public class Booking {

    private Flight flight;
    private List<Passenger> passengers;

    public Booking() {
    }

    public Booking(Flight flight, List<Passenger> passengers) {
        this.flight = flight;
        this.passengers = passengers;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public List<Passenger> getPassengers() {
        return passengers;
    }

    public void setPassengers(List<Passenger> passengers) {
        this.passengers = passengers;
    }

}
