# ACADEMIC PROJECT REPORT

---

```
========================================================================================
                          DEPARTMENT OF COMPUTER SCIENCE & ENGINEERING
                             FACULTY OF ENGINEERING & TECHNOLOGY
========================================================================================

                                  ASSIGNMENT REPORT
                                    Assignment - 4
                 Subject Name : Web Technology (Paper Code: BCS502)
                 Semester     : V (Fifth Semester)
                 Program      : B.Tech (Computer Science & Engineering)
                 Session      : 2026-27
                 Max Marks    : 10

========================================================================================
                 PROJECT TITLE: PERSONAL SKILLS PORTFOLIO WEB APPLICATION
========================================================================================

                 SUBMITTED TO:
                 Course Instructor / Evaluator
                 Department of Computer Science & Engineering

                 SUBMITTED BY:
                 Student Name : Harsh
                 Enrollment No: [Enter Your Enrollment Number]
                 Roll No      : [Enter Your Roll Number]
                 Class / Sec  : B.Tech CSE - 3rd Year (Sem V)

                 DATE OF SUBMISSION: 16.11.2026
========================================================================================
```

---

## 1. Course Objectives & Outcomes Mapping

| S. No | Course Objectives | Course Outcomes (COs) | Mapped in Project |
| :--- | :--- | :--- | :--- |
| **1.** | To design structured and semantic web pages using HTML5 – lists, tables, images, links and forms. | **CO1 (K3, K6)** | Fully Implemented in `index.html` (Semantic tags, qualifications table, lists, contact form, SVG images, navigation links). |
| **2.** | To style web pages and create responsive layouts using Cascading Style Sheets. | **CO2 (K3, K6)** | Fully Implemented in `css/style.css` (External CSS, Flexbox, Grid, Media queries for mobile/tablet/desktop, micro-interactions). |
| **3.** | To add interactivity, DOM manipulation and form validation using JavaScript. | **CO3 (K3, K6)** | Fully Implemented in `js/script.js` (Regex form validation, Dark/Light theme toggle with `localStorage`, animated progress bars via `IntersectionObserver`, dynamic typing effect). |
| **4.** | To implement server-side functionality using Java (Servlet / JSP) with database connectivity through JDBC. | **CO4, CO5 (K3, K6)** | Fully Implemented via `ContactServlet.java`, `ContactDAO.java`, `DBConnection.java`, `thankyou.jsp`, `admin-messages.jsp`, and MySQL `portfolio_db`. |

---

## 2. Executive Summary / Abstract
In accordance with the curriculum requirements of **Web Technology (BCS502)** for B.Tech CSE Semester V, this project delivers a production-grade, individual **Personal Skills Portfolio Website**. The primary goal is to synthesize client-side design and server-side enterprise architecture into a unified, interactive, and responsive web system.

The frontend is constructed using semantic **HTML5** structures, styled with a modern **CSS3** design system incorporating CSS variables, Flexbox, and CSS Grid, and enriched with native **JavaScript (ES6+)** for asynchronous behavior, dynamic DOM manipulation, real-time client-side validation, and theme switching. The backend follows the standard **Model-View-Controller (MVC)** architectural pattern, leveraging **Java Servlets (HttpServlet)** for request routing, **JavaBeans** for data encapsulation, **JDBC (Java Database Connectivity)** with `PreparedStatement` for SQL injection-safe persistence to **MySQL**, and **JavaServer Pages (JSP)** for dynamic response views.

---

## 3. System Architecture & Design Pattern

The application implements a classical **Three-Tier MVC Architecture**:

```
+-----------------------------------------------------------------------------------+
|                                PRESENTATION TIER                                  |
|   index.html / index.jsp   |   css/style.css   |   js/script.js   |   SVG Assets  |
|   (Semantic HTML5, CSS Grid/Flexbox, Client-side Regex Form Validation, Themes)   |
+-----------------------------------------------------------------------------------+
                                          |
                              HTTP POST (/ContactServlet)
                                          v
+-----------------------------------------------------------------------------------+
|                            APPLICATION / CONTROLLER TIER                          |
|                     Apache Tomcat 9.0 / 10.x Web Container                        |
|                                                                                   |
|   [ContactServlet.java] <=======> [ContactMessage.java] (Model Bean)             |
|          |                                                                        |
|          | (Invokes DAO)                                                          |
|          v                                                                        |
|   [ContactDAO.java] <============> [DBConnection.java] (DriverManager)            |
+-----------------------------------------------------------------------------------+
          |                                                 |
      JDBC SQL Query                                 Request Dispatcher
          |                                                 |
          v                                                 v
+-----------------------+                         +---------------------+
|      DATA TIER        |                         |     VIEW TIER       |
|   MySQL Database      |                         |   thankyou.jsp      |
|  (portfolio_db.       |                         | admin-messages.jsp  |
|   contact_messages)   |                         +---------------------+
+-----------------------+
```

---

## 4. Detailed Component Implementation

### 4.1. Semantic HTML5 Structure (`index.html` & `index.jsp`)
- **Semantic Page Landmarks:** Cleanly divided into `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<figure>`, `<figcaption>`, and `<footer>` tags, fulfilling accessibility and modern W3C standards.
- **Navigation Menu:** An accessible navigation bar linking smoothly to the five required anchor sections: `#home`, `#about`, `#skills`, `#projects`, and `#contact`.
- **Lists:** Ordered (`<ol>`) and unordered (`<ul>`) lists employed to present personal philosophies, education highlights, and extracurricular interests.
- **Academic Qualifications Table:** Structured using `<table>`, `<thead>`, `<tbody>`, `<tr>`, `<th>`, and `<td>` with CSS zebra striping, responsive overflow wrapping, and status chips.
- **Images & Graphics:** Scalable Vector Graphics (SVG) utilized for profile representation and project architectural previews (`avatar.svg`, `project1.svg`, `project2.svg`, `project3.svg`).
- **Contact Form:** Encapsulates inputs (`text`, `email`, `textarea`), explicitly defined `id` and `name` attributes, client-side validation triggers, and the target `action="ContactServlet" method="POST"`.

### 4.2. Responsive CSS3 Design System (`css/style.css`)
- **Design Tokens & CSS Variables:** Defines `:root` variables for light mode and a `[data-theme="dark"]` override for colors, backgrounds, borders, and elevations.
- **Layout Architecture:**
  - **Flexbox:** Utilized for navbar alignment, social links, project tags, and hero call-to-actions.
  - **CSS Grid:** Implemented for the hero layout, about me two-column distribution, skills three-column matrix, and projects showcase grid.
- **Micro-Interactions & Hover Effects:** Smooth CSS transitions on buttons, card elevation lifts (`transform: translateY(-6px)`), and glowing input focus states.
- **Responsive Media Queries:**
  - `@media screen and (max-width: 992px)`: Stacks grid elements for medium screens.
  - `@media screen and (max-width: 768px)`: Triggers the mobile slide-in navigation menu and hamburger icon.
  - `@media screen and (max-width: 480px)`: Optimizes font scales and button widths for handheld mobile screens.

### 4.3. Client-Side JavaScript Interactivity (`js/script.js`)
- **Dynamic Typing Animation:** Uses recursive `setTimeout` scheduling to cycle between student roles in the hero banner.
- **Dark/Light Theme Switcher:** Reads from and writes to browser `localStorage`, toggling the `data-theme` attribute on the root document element with instantaneous UI updates.
- **Scroll-Triggered Skill Progress Bars:** Uses the modern `IntersectionObserver` API to detect when the `#skills` section enters the user's viewport, smoothly animating each progress bar from `0%` to its target percentage.
- **Project Filtering:** Enables live categorizing of project cards (All, Frontend Web, Java & JDBC, Full-Stack J2EE) using `dataset` attributes without full-page reloads.
- **Real-Time Form Validation:**
  - Name: Verifies minimum length of 3 characters.
  - Email: Validates against RFC-compliant Regular Expression (`/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/`).
  - Message: Ensures a substantive message of at least 10 characters.
  - Immediate visual feedback: Green borders for valid inputs, red borders with contextual error messages for invalid inputs.

### 4.4. Server-Side Java (Servlet, JSP & JDBC Architecture)
- **Model Layer (`com.portfolio.model.ContactMessage`):**
  - Encapsulates submission properties: `id`, `name`, `email`, `subject`, `message`, and `createdAt`. Implements `Serializable`.
- **Database Utility (`com.portfolio.util.DBConnection`):**
  - Loads the MySQL JDBC Driver (`com.mysql.cj.jdbc.Driver`) and establishes pooled connections via `DriverManager.getConnection()`.
- **Data Access Object (`com.portfolio.dao.ContactDAO`):**
  - `saveMessage(ContactMessage msg)`: Uses parameterized `PreparedStatement` to insert form data securely into MySQL, thwarting SQL Injection vulnerabilities.
  - `getAllMessages()`: Retrieves historical records ordered by timestamp descending.
- **Controller Servlet (`com.portfolio.servlet.ContactServlet`):**
  - Extends `HttpServlet`, mapped to `/ContactServlet` via `@WebServlet` and `web.xml`.
  - In `doPost()`: Enforces UTF-8 encoding, extracts request parameters, applies secondary server-side validation, triggers DAO persistence, sets request attributes, and dispatches to `thankyou.jsp`.
- **View Layer (`thankyou.jsp` & `admin-messages.jsp`):**
  - `thankyou.jsp`: Greets the user dynamically, confirms database insertion, and renders timestamp and message details.
  - `admin-messages.jsp`: Queries the database and dynamically generates an HTML table displaying all stored inquiries, demonstrating full round-trip JDBC connectivity during project viva.

---

## 5. Database Schema & Script (`database/schema.sql`)

```sql
-- Database Initialization
CREATE DATABASE IF NOT EXISTS portfolio_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE portfolio_db;

-- Table Definition
CREATE TABLE contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

---

## 6. Deployment & Execution Instructions

### 6.1. Prerequisites
- **Java Development Kit (JDK):** Version 8, 11, 17, or 21.
- **Web Container:** Apache Tomcat v9.0 / v10.x.
- **Database:** MySQL Server 8.0+ or MariaDB.
- **Browser:** Any modern web browser (Google Chrome, Mozilla Firefox, Microsoft Edge).

### 6.2. Execution Steps
1. **Initialize Database:** Run `database/schema.sql` in MySQL command line or MySQL Workbench.
2. **Deploy Application:**
   - In **Eclipse IDE**: Import project as *Existing Project into Workspace* &rarr; Add to Tomcat Server &rarr; Start Server.
   - In **Standalone Tomcat**: Copy the project folder into `C:\apache-tomcat\webapps\portfolio\` and place `mysql-connector-j.jar` in `C:\apache-tomcat\lib\`.
3. **Open in Browser:** Navigate to:
   ```
   http://localhost:8080/portfolio/index.html
   ```
4. **Test Server-Side Flow:**
   - Fill in the contact form and submit.
   - Observe redirection to `thankyou.jsp`.
   - Access `http://localhost:8080/portfolio/admin-messages.jsp` to review the newly persisted row in the database table.

---

## 7. Viva Voce Preparation Guide (Questions & Answers)

### Q1. What are semantic HTML5 tags and why are they preferred?
**Answer:** Semantic tags (e.g., `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`) clearly describe their meaning to both the browser and the developer. Unlike generic `<div>` tags, semantic elements improve web accessibility (screen readers), enhance search engine optimization (SEO), and ensure standardized document structure.

### Q2. Explain the difference between CSS Flexbox and CSS Grid.
**Answer:**
- **Flexbox** is one-dimensional: it handles content distribution along either a single row or a single column (ideal for navigation menus, button groups, and horizontal alignments).
- **CSS Grid** is two-dimensional: it handles rows and columns simultaneously (ideal for macro-layouts, multi-column card grids, and full-page dashboards).

### Q3. How does client-side validation differ from server-side validation?
**Answer:**
- **Client-side validation (JavaScript):** Occurs directly in the user's browser before the HTTP request is dispatched. It provides instantaneous feedback and conserves server bandwidth.
- **Server-side validation (Java Servlet):** Occurs on the server after the request is received. It is strictly mandatory for security because client-side JavaScript can be disabled or bypassed by tools like Postman or cURL.

### Q4. Describe the lifecycle of a Java Servlet.
**Answer:** The Servlet lifecycle is managed by the Servlet Container (Apache Tomcat) and consists of three main phases:
1. **`init()`**: Called once when the servlet is first instantiated to perform initialization.
2. **`service()` (which delegates to `doGet()` / `doPost()`):** Invoked concurrently on separate threads for each incoming client request.
3. **`destroy()`**: Called once before the servlet instance is unloaded or the server is shut down to release resources.

### Q5. Why is `PreparedStatement` preferred over `Statement` in JDBC?
**Answer:**
1. **Security:** `PreparedStatement` parameterizes queries with `?` placeholders, completely preventing SQL Injection attacks.
2. **Performance:** The SQL statement is pre-compiled by the database engine once and can be executed multiple times with different parameter values efficiently.

### Q6. What is the role of `web.xml` in a Java Web Application?
**Answer:** `web.xml` is the Web Deployment Descriptor. It defines servlet definitions, servlet URL mappings, welcome file lists, session timeouts, and security constraints for the Java EE / Jakarta EE web container.

---

## 8. Conclusion
This project successfully satisfies all requirements specified in **Web Technology (BCS502) Assignment-4**. It demonstrates comprehensive competency across Course Outcomes **CO1, CO2, CO3, CO4, and CO5**, uniting modern, responsive frontend design with secure, robust, and standards-compliant Java enterprise backend services.
