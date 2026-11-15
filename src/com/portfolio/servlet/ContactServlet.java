package com.portfolio.servlet;

import com.portfolio.dao.ContactDAO;
import com.portfolio.model.ContactMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Controller Servlet handling contact form submissions.
 * Web Technology (BCS502) - Semester V
 * Mapped to URL pattern: /ContactServlet
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/ContactServlet"})
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ContactDAO contactDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        this.contactDAO = new ContactDAO();
    }

    /**
     * Handles HTTP POST requests submitted from index.html contact form.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Ensure UTF-8 character encoding for inputs
        request.setCharacterEncoding("UTF-8");

        // 1. Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // 2. Server-side validation
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            subject == null || subject.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required. Please fill in the entire form.");
            request.getRequestDispatcher("index.jsp#contact").forward(request, response);
            return;
        }

        // Basic email pattern check on server side
        if (!email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("errorMessage", "Invalid email address format.");
            request.getRequestDispatcher("index.jsp#contact").forward(request, response);
            return;
        }

        // 3. Populate model bean
        ContactMessage contactMessage = new ContactMessage(name.trim(), email.trim(), subject.trim(), message.trim());

        // 4. Save to database using DAO
        boolean isSaved = contactDAO.saveMessage(contactMessage);

        // 5. Set attributes for confirmation view
        request.setAttribute("submittedName", contactMessage.getName());
        request.setAttribute("submittedEmail", contactMessage.getEmail());
        request.setAttribute("submittedSubject", contactMessage.getSubject());
        request.setAttribute("submissionTime", new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new Date()));
        request.setAttribute("dbSuccess", isSaved);

        // 6. Forward to thankyou.jsp
        request.getRequestDispatcher("thankyou.jsp").forward(request, response);
    }

    /**
     * Handles HTTP GET requests - redirects to index page or admin view.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html#contact");
    }
}
