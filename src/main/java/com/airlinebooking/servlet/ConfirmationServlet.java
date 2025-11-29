package com.airlinebooking.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/confirmation1")
public class ConfirmationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle GET requests to show booking confirmation page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // In this simple example, forwarding directly without extra processing, 
        // expects booking attribute present in request/session
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }
}
