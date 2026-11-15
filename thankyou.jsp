<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Submission Successful | Harsh Portfolio</title>
  <link rel="stylesheet" href="css/style.css">
  <style>
    .confirmation-wrapper {
      min-height: 80vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 2rem 1rem;
    }
    .confirmation-card {
      background: var(--bg-card);
      border: 1px solid var(--border-color);
      border-radius: var(--radius-lg);
      padding: 2.5rem;
      max-width: 600px;
      width: 100%;
      box-shadow: var(--shadow-lg);
      text-align: center;
    }
    .status-icon {
      width: 70px;
      height: 70px;
      margin: 0 auto 1.5rem auto;
      border-radius: var(--radius-full);
      background-color: rgba(16, 185, 129, 0.15);
      color: var(--accent-color);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2rem;
    }
    .details-box {
      margin: 1.5rem 0;
      text-align: left;
      background: var(--bg-primary);
      padding: 1.25rem;
      border-radius: var(--radius-md);
      border: 1px solid var(--border-color);
      font-size: 0.95rem;
    }
    .details-row {
      display: flex;
      justify-content: space-between;
      padding: 0.35rem 0;
      border-bottom: 1px dashed var(--border-color);
    }
    .details-row:last-child {
      border-bottom: none;
    }
    .details-label {
      font-weight: 600;
      color: var(--text-secondary);
    }
    .details-value {
      color: var(--text-primary);
    }
  </style>
</head>
<body>
  <div class="confirmation-wrapper">
    <div class="confirmation-card">
      <div class="status-icon">✓</div>
      <h1 style="color: var(--text-primary); font-size: 1.8rem; margin-bottom: 0.5rem;">Message Received!</h1>
      <p style="color: var(--text-secondary);">
        Thank you for reaching out. Your contact details and message have been validated and persisted to the <strong>MySQL</strong> database via <strong>ContactServlet &amp; JDBC</strong>.
      </p>

      <%
        String name = (String) request.getAttribute("submittedName");
        String email = (String) request.getAttribute("submittedEmail");
        String subject = (String) request.getAttribute("submittedSubject");
        String time = (String) request.getAttribute("submissionTime");

        if (name == null) name = request.getParameter("name");
        if (email == null) email = request.getParameter("email");
        if (subject == null) subject = request.getParameter("subject");
        if (time == null) time = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new java.util.Date());
      %>

      <div class="details-box">
        <div class="details-row">
          <span class="details-label">Sender Name:</span>
          <span class="details-value"><%= (name != null && !name.isEmpty()) ? name : "Visitor" %></span>
        </div>
        <div class="details-row">
          <span class="details-label">Email Address:</span>
          <span class="details-value"><%= (email != null && !email.isEmpty()) ? email : "N/A" %></span>
        </div>
        <div class="details-row">
          <span class="details-label">Subject:</span>
          <span class="details-value"><%= (subject != null && !subject.isEmpty()) ? subject : "General Inquiry" %></span>
        </div>
        <div class="details-row">
          <span class="details-label">Logged At:</span>
          <span class="details-value"><%= time %></span>
        </div>
        <div class="details-row">
          <span class="details-label">Database Status:</span>
          <span class="details-value" style="color: var(--accent-color); font-weight: bold;">STORED (portfolio_db.contact_messages)</span>
        </div>
      </div>

      <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
        <a href="index.html" class="btn btn-primary">Return to Portfolio</a>
        <a href="admin-messages.jsp" class="btn btn-outline">View Database Records</a>
      </div>
    </div>
  </div>
</body>
</html>
