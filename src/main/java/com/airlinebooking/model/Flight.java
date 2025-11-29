package com.airlinebooking.model;

public class Flight {

    private String flightNumber;
    private String source;
    private String destination;
    private String departureTime;   // e.g. "10:30 AM"
    private String arrivalTime;     // e.g. "1:30 PM"
    private double price;
    private int availableSeats;

    public Flight() {
    }

    public Flight(String flightNumber, String source, String destination, String departureTime,
                  String arrivalTime, double price, int availableSeats) {
        this.flightNumber = flightNumber;
        this.source = source;
        this.destination = destination;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.price = price;
        this.availableSeats = availableSeats;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }

    @Override
    public String toString() {
        return "Flight{" +
            "flightNumber='" + flightNumber + '\'' +
            ", source='" + source + '\'' +
            ", destination='" + destination + '\'' +
            ", departureTime='" + departureTime + '\'' +
            ", arrivalTime='" + arrivalTime + '\'' +
            ", price=" + price +
            ", availableSeats=" + availableSeats +
            '}';
    }
}
