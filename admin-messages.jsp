<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.portfolio.util.DBConnection" %>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Database Records | Portfolio Admin View (BCS502)</title>
  <link rel="stylesheet" href="css/style.css">
  <style>
    .admin-container {
      max-width: 1100px;
      margin: 40px auto;
      padding: 20px;
    }
    .header-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
      flex-wrap: wrap;
      gap: 15px;
    }
    .table-card {
      background: var(--bg-card);
      border: 1px solid var(--border-color);
      border-radius: var(--radius-lg);
      padding: 20px;
      box-shadow: var(--shadow-md);
      overflow-x: auto;
    }
    .db-badge {
      display: inline-block;
      padding: 4px 10px;
      border-radius: 9999px;
      font-size: 0.8rem;
      font-weight: 600;
      background: var(--primary-light);
      color: var(--primary-color);
    }
  </style>
</head>
<body>
  <div class="admin-container">
    <div class="header-bar">
      <div>
        <h1 style="font-size: 1.8rem; color: var(--text-primary);">🗄️ Stored Contact Messages (JDBC/MySQL)</h1>
        <p style="color: var(--text-secondary); font-size: 0.95rem;">
          Live records retrieved from table <code>contact_messages</code> in database <code>portfolio_db</code>.
        </p>
      </div>
      <div style="display: flex; gap: 10px;">
        <a href="index.html" class="btn btn-outline">&larr; Back to Portfolio</a>
        <a href="admin-messages.jsp" class="btn btn-primary">Refresh Data</a>
      </div>
    </div>

    <div class="table-card">
      <table class="academic-table" style="width: 100%;">
        <thead>
          <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Subject</th>
            <th>Message</th>
            <th>Timestamp</th>
          </tr>
        </thead>
        <tbody>
          <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            int count = 0;
            String errorMessage = null;

            try {
              conn = DBConnection.getConnection();
              stmt = conn.createStatement();
              String sql = "SELECT id, name, email, subject, message, created_at FROM contact_messages ORDER BY id DESC";
              rs = stmt.executeQuery(sql);

              while (rs.next()) {
                count++;
          %>
                <tr>
                  <td><strong>#<%= rs.getInt("id") %></strong></td>
                  <td><%= rs.getString("name") %></td>
                  <td><a href="mailto:<%= rs.getString("email") %>"><%= rs.getString("email") %></a></td>
                  <td><span class="db-badge"><%= rs.getString("subject") %></span></td>
                  <td><%= rs.getString("message") %></td>
                  <td><%= rs.getTimestamp("created_at") %></td>
                </tr>
          <%
              }
            } catch (Exception e) {
              errorMessage = e.getMessage();
            } finally {
              if (rs != null) try { rs.close(); } catch (Exception ignore) {}
              if (stmt != null) try { stmt.close(); } catch (Exception ignore) {}
              if (conn != null) try { conn.close(); } catch (Exception ignore) {}
            }

            if (errorMessage != null) {
          %>
              <tr>
                <td colspan="6" style="text-align: center; color: var(--danger-color); padding: 30px;">
                  <strong>Database Connection Notice:</strong><br>
                  <%= errorMessage %><br><br>
                  <small style="color: var(--text-secondary);">
                    Ensure MySQL Server is active and database <code>portfolio_db</code> is created using <code>database/schema.sql</code>.
                  </small>
                </td>
              </tr>
          <%
            } else if (count == 0) {
          %>
              <tr>
                <td colspan="6" style="text-align: center; color: var(--text-secondary); padding: 30px;">
                  No messages stored in the database yet. Submit the contact form on the home page to test JDBC storage!
                </td>
              </tr>
          <%
            }
          %>
        </tbody>
      </table>
    </div>

    <div style="margin-top: 20px; text-align: center; color: var(--text-muted); font-size: 0.85rem;">
      Web Technology (BCS502) - Unit IV &amp; V: Java Servlet, JSP &amp; JDBC Architecture
    </div>
  </div>
</body>
</html>
