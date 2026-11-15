# Personal Skills Portfolio Website
**Web Technology (BCS502) — Assignment 4**  
**B.Tech Computer Science & Engineering | Semester V | Session 2026-27**  
**Author:** Harsh  
**Submission Date:** 16.11.2026  

---

## 📌 Project Overview
This project is an individual personal portfolio web application built from scratch to fulfill the requirements of **BCS502 (Web Technology)** covering Units I to V. It demonstrates:
- **HTML5:** Semantic document structuring, navigation menu, ordered/unordered lists, structured academic qualifications table, images, and contact form.
- **CSS3:** External stylesheet (`css/style.css`), modern CSS Grid & Flexbox layouts, responsive design via media queries for all devices, smooth transitions, and hover animations.
- **JavaScript:** Client-side form validation with real-time feedback, interactive Dark/Light mode switcher with `localStorage` persistence, animated skill progress bars triggered via `IntersectionObserver`, dynamic typing hero effect, and project category filter.
- **Java (Servlet / JSP / JDBC):** Standard MVC architecture with `ContactServlet` processing POST submissions, `ContactDAO` executing JDBC `PreparedStatement` queries against MySQL `portfolio_db`, and dynamic rendering via `thankyou.jsp` and `admin-messages.jsp`.

---

## 📁 Project Directory Structure
```text
my portfolio as WT asssignment/
├── index.html                   # Main semantic HTML5 portfolio page (static / standalone)
├── index.jsp                    # JSP entry point for Tomcat deployment
├── thankyou.jsp                 # JSP confirmation view showing submitted details
├── admin-messages.jsp           # JSP admin/viva table querying MySQL database via JDBC
├── pom.xml                      # Maven build descriptor (packaging: war)
├── README.md                    # Quick start & execution manual
├── PROJECT_REPORT.md            # Complete academic project report ready to print
├── css/
│   └── style.css                # External CSS stylesheet (Flexbox, Grid, Themes, Responsive)
├── js/
│   └── script.js                # External JavaScript (Validation, Dark Mode, Animations)
├── assets/
│   └── images/
│       ├── avatar.svg           # Scalable vector profile avatar
│       ├── project1.svg         # Student portal project banner
│       ├── project2.svg         # Banking system project banner
│       └── project3.svg         # Developer tracker project banner
├── database/
│   └── schema.sql               # MySQL database & table creation script
├── WEB-INF/
│   └── web.xml                  # Servlet deployment descriptor
└── src/
    └── com/
        └── portfolio/
            ├── model/
            │   └── ContactMessage.java   # JavaBean / Model entity
            ├── dao/
            │   └── ContactDAO.java       # Data Access Object (JDBC Queries)
            ├── util/
            │   └── DBConnection.java     # JDBC Connection Manager
            └── servlet/
                └── ContactServlet.java   # Controller HttpServlet
```

---

## 🚀 Quick Execution Options

### Option 1: Instant Frontend Preview (No Server Required)
Simply double-click `index.html` or open it in any modern browser (Chrome, Edge, Firefox).
- All HTML5 semantic sections, CSS Grid/Flexbox styling, responsive design, dark/light toggle, and JavaScript client-side validations run directly in your browser.

---

### Option 2: Full-Stack Execution with Apache Tomcat & MySQL

#### Step 1: Initialize MySQL Database
1. Open MySQL Command Line Client or MySQL Workbench.
2. Execute the script located in `database/schema.sql`:
   ```sql
   SOURCE database/schema.sql;
   ```
   *Or paste the SQL statements:*
   ```sql
   CREATE DATABASE IF NOT EXISTS portfolio_db;
   USE portfolio_db;
   CREATE TABLE contact_messages (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       email VARCHAR(150) NOT NULL,
       subject VARCHAR(200) NOT NULL,
       message TEXT NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   ```
3. Default database credentials in `src/com/portfolio/util/DBConnection.java` are `root` / `root`. If your MySQL root password differs, update it in `DBConnection.java` line 16.

#### Step 2: Deploy to Apache Tomcat
##### Method A: Eclipse IDE (Recommended for Lab Demos)
1. Open Eclipse IDE for Enterprise Java and Web Developers.
2. Select **File &rarr; Import &rarr; General &rarr; Existing Projects into Workspace** (or **File &rarr; New &rarr; Dynamic Web Project** and point the WebContent to this folder).
3. Right-click the project &rarr; **Run As &rarr; Run on Server** &rarr; Select **Apache Tomcat v9.0 / v10.x**.
4. Open your browser and navigate to:
   ```
   http://localhost:8080/portfolio/index.html
   ```

##### Method B: Standalone Apache Tomcat (Drop-in Deployment)
1. Copy the entire project folder `my portfolio as WT asssignment` into your Tomcat installation's `webapps/` folder, and rename it to `portfolio`.
2. Place `mysql-connector-j-8.x.x.jar` inside `tomcat/lib/` or `WEB-INF/lib/`.
3. Start Tomcat using `bin/startup.bat` (Windows).
4. Access the site at: `http://localhost:8080/portfolio/`

##### Method C: Using Maven
1. Open PowerShell / Command Prompt in this folder.
2. Run:
   ```bash
   mvn clean package
   ```
3. Copy the generated `target/portfolio.war` to `tomcat/webapps/`.
4. Start Tomcat and navigate to `http://localhost:8080/portfolio/`.

---

## 🧪 Testing the Contact Form & JDBC Persistence
1. Scroll down to the **Contact** section.
2. Enter your Name, Email, Subject, and Message.
3. Click **Send Message**.
4. The request hits `ContactServlet`, validates server-side, executes `ContactDAO.saveMessage()`, and forwards to `thankyou.jsp`.
5. Click **View Database Records** (or visit `http://localhost:8080/portfolio/admin-messages.jsp`) to verify that the entry has been recorded in MySQL!
