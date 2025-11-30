# Airline Reservation System

## Overview
The **Airline Reservation System** is a web-based application developed using Java Servlets and JSP. It provides a simple and user-friendly interface for users to search for flights, view available options, and book tickets. The system currently uses in-memory data storage for demonstration purposes.

## Features
*   **Flight Search:** Search for flights by specifying source, destination, and travel date.
*   **Flight Selection:** View a list of available flights matching the search criteria.
*   **Booking Management:** Enter passenger details (Name, Age, Gender) for booking.
*   **Real-time Availability:** Checks for seat availability before confirming a booking.
*   **Confirmation:** Generates a booking summary upon successful reservation.

## Technologies Used
*   **Language:** Java (JDK 8+)
*   **Web Technologies:** Servlet, JSP (JavaServer Pages)
*   **Frontend:** HTML5, CSS3
*   **Server:** Apache Tomcat (or any Servlet Container)
*   **IDE:** Eclipse / IntelliJ IDEA

## Project Structure
```
src/
├── main/
│   ├── java/
│   │   └── com/airlinebooking/
│   │       ├── data/       # Data source (Mock data)
│   │       ├── model/      # Data models (Flight, Booking, Passenger)
│   │       └── servlet/    # Controllers (Search, Booking, Confirmation)
│   └── webapp/             # Web resources (JSP files, CSS, WEB-INF)
```

## Setup & Installation

### Prerequisites
*   Java Development Kit (JDK) installed.
*   Apache Tomcat Server installed.
*   An IDE like Eclipse (Enterprise Java Developers edition) or IntelliJ IDEA.

### Steps to Run
1.  **Clone the Repository:**
    ```bash
    git clone <repository-url>
    ```
2.  **Import into Eclipse:**
    *   Open Eclipse.
    *   Go to `File` > `Import` > `General` > `Existing Projects into Workspace`.
    *   Select the root directory of the cloned repository.
    *   Click `Finish`.
3.  **Configure Server:**
    *   Ensure Apache Tomcat is configured in the "Servers" tab.
    *   Right-click on the project > `Run As` > `Run on Server`.
    *   Select your Tomcat server and click `Finish`.
4.  **Access the Application:**
    *   The application should open automatically in the Eclipse internal browser or your default web browser.
    *   URL: `http://localhost:8080/Airline-Reservation-System/` (Port and context path may vary).

## Usage
1.  **Home Page:** Click "Search Flights" to begin.
2.  **Search:** Enter "Source" (e.g., New York), "Destination" (e.g., London), and "Date".
3.  **Select Flight:** Choose a flight from the results list.
4.  **Book:** Enter the number of passengers and their details.
5.  **Confirm:** Review your booking confirmation.

## Sample Data (for testing)
*   **Route:** New York -> London
*   **Route:** London -> Paris
*   **Route:** Paris -> Rome
*   (Check `src/main/java/com/airlinebooking/data/FlightData.java` for more routes)
