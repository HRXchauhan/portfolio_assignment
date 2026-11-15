<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Personal Skills Portfolio Website - B.Tech CSE Web Technology Assignment-4">
  <meta name="author" content="Harsh">
  <title>Harsh | Personal Skills Portfolio (WT BCS502)</title>
  
  <!-- External CSS Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" type="image/svg+xml" href="assets/images/avatar.svg">
</head>
<body>

  <!-- ================= HEADER & NAVIGATION (Semantic HTML5) ================= -->
  <header class="navbar">
    <div class="container nav-container">
      <a href="#home" class="logo">
        <span>&lt;Harsh /&gt;</span> Portfolio
      </a>

      <!-- Navigation Menu -->
      <nav aria-label="Main Navigation">
        <ul class="nav-menu" id="navMenu">
          <li><a href="#home" class="nav-link active">Home</a></li>
          <li><a href="#about" class="nav-link">About Me</a></li>
          <li><a href="#skills" class="nav-link">Skills</a></li>
          <li><a href="#projects" class="nav-link">Projects</a></li>
          <li><a href="#contact" class="nav-link">Contact</a></li>
        </ul>
      </nav>

      <!-- Action Buttons: Dark Mode Toggle & Mobile Menu -->
      <div class="nav-actions">
        <button id="themeToggle" class="theme-btn" aria-label="Toggle Dark and Light Mode" title="Toggle Theme">
          🌙
        </button>
        <button id="hamburgerBtn" class="hamburger" aria-label="Open Mobile Menu">
          <span></span>
          <span></span>
          <span></span>
        </button>
      </div>
    </div>
  </header>

  <!-- ================= MAIN CONTENT CONTAINER ================= -->
  <main>

    <!-- SECTION 1: HOME / HERO -->
    <section id="home" class="hero">
      <div class="container hero-grid">
        <div class="hero-content">
          <span class="hero-greeting">Welcome to my Digital Space</span>
          <h1 class="hero-title">
            Hi, I'm <span class="highlight">Harsh</span>
          </h1>
          <h2 class="hero-subtitle">
            I am a <span id="typingText" class="highlight"></span>
          </h2>
          <p class="hero-description">
            Passionate Computer Science & Engineering undergraduate focusing on modern full-stack web applications, Java enterprise systems (Servlets &amp; JSP), relational database modeling, and scalable software solutions.
          </p>
          <div class="hero-cta">
            <a href="#projects" class="btn btn-primary">View My Work</a>
            <a href="#contact" class="btn btn-outline">Get In Touch</a>
          </div>
        </div>

        <div class="hero-avatar-wrapper">
          <figure>
            <img src="assets/images/avatar.svg" alt="Harsh - Profile Illustration" class="hero-avatar">
            <figcaption style="display:none;">Harsh - Software Developer Profile</figcaption>
          </figure>
        </div>
      </div>
    </section>

    <!-- SECTION 2: ABOUT ME -->
    <section id="about" class="section">
      <div class="container">
        <h2 class="section-title">About Me</h2>
        <p class="section-subtitle">Get to know more about my educational background, career goals, and development journey.</p>

        <div class="about-grid">
          <!-- Biography Card -->
          <article class="about-card">
            <h3>Background &amp; Aspirations</h3>
            <p>
              I am currently pursuing my <strong>B.Tech in Computer Science and Engineering (5th Semester)</strong>. My academic journey has grounded me in core computer science fundamentals including Data Structures, Algorithms, Database Management Systems, and Web Technologies.
            </p>
            <p>
              I take pride in translating intricate problem statements into user-friendly, responsive, and robust software applications. Whether building pixel-perfect frontends with HTML5/CSS3/JavaScript or architecting server-side pipelines with Java Servlets and JDBC, I prioritize writing clean, maintainable, and standards-compliant code.
            </p>
            
            <h4>Core Philosophy &amp; Highlights:</h4>
            <ul class="highlight-list">
              <li>Strong foundation in Object-Oriented Programming (Java) and Web Architectures.</li>
              <li>Hands-on experience with Relational Databases (MySQL, PostgreSQL) &amp; JDBC connectivity.</li>
              <li>Devoted to writing semantic, accessible, and responsive modern web interfaces.</li>
              <li>Active problem-solver with enthusiasm for competitive coding and open-source software.</li>
            </ul>
          </article>

          <!-- Education & Qualifications Table -->
          <article class="about-card">
            <h3>Academic Qualifications</h3>
            <p>Summary of my academic qualifications and educational track record:</p>

            <div class="table-responsive">
              <table class="academic-table" summary="Educational qualifications table listing degree, institution, board, year of completion, and score">
                <thead>
                  <tr>
                    <th scope="col">Qualification / Degree</th>
                    <th scope="col">Institution / Board</th>
                    <th scope="col">Year</th>
                    <th scope="col">Status / Score</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><strong>B.Tech (CSE)</strong></td>
                    <td>Faculty of Engineering &amp; Technology</td>
                    <td>2024 - 2028</td>
                    <td><span class="badge-status">Sem V (Pursuing)</span></td>
                  </tr>
                  <tr>
                    <td><strong>Senior Secondary (XII)</strong></td>
                    <td>CBSE Board</td>
                    <td>2024</td>
                    <td><span class="badge-status">88.4%</span></td>
                  </tr>
                  <tr>
                    <td><strong>Secondary School (X)</strong></td>
                    <td>CBSE Board</td>
                    <td>2022</td>
                    <td><span class="badge-status">92.0%</span></td>
                  </tr>
                  <tr>
                    <td><strong>Java &amp; Web Certification</strong></td>
                    <td>NPTEL / Oracle Academy</td>
                    <td>2025</td>
                    <td><span class="badge-status">Elite Certificate</span></td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div style="margin-top: 1.5rem;">
              <h4>Extracurricular Interests:</h4>
              <ol style="color: var(--text-secondary); margin-top: 0.5rem;">
                <li>Full-Stack Web Engineering and API Integration.</li>
                <li>Database Schema Optimization and SQL tuning.</li>
                <li>Technical writing, open-source mentoring, and tech communities.</li>
              </ol>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- SECTION 3: SKILLS -->
    <section id="skills" class="section" style="background-color: var(--bg-secondary);">
      <div class="container">
        <h2 class="section-title">Technical Skills</h2>
        <p class="section-subtitle">A balanced breakdown of my core competencies across frontend, backend, databases, and developer tooling.</p>

        <div class="skills-grid">
          <!-- Category 1: Frontend Development -->
          <div class="skill-category-card">
            <h3 class="category-title">🌐 Frontend Development</h3>
            
            <div class="skill-item">
              <div class="skill-info">
                <span>HTML5 (Semantic &amp; Forms)</span>
                <span>95%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="95%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>CSS3 (Flexbox, Grid &amp; Media Queries)</span>
                <span>90%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="90%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>JavaScript (DOM &amp; ES6+)</span>
                <span>85%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="85%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>Responsive Web Design</span>
                <span>92%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="92%"></div>
              </div>
            </div>
          </div>

          <!-- Category 2: Backend & Enterprise Java -->
          <div class="skill-category-card">
            <h3 class="category-title">☕ Backend &amp; Java Technologies</h3>
            
            <div class="skill-item">
              <div class="skill-info">
                <span>Core Java (OOP, Collections &amp; Exception Handling)</span>
                <span>90%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="90%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>Java Servlets &amp; JSP</span>
                <span>85%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="85%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>JDBC (Java Database Connectivity)</span>
                <span>88%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="88%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>Apache Tomcat Server</span>
                <span>82%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="82%"></div>
              </div>
            </div>
          </div>

          <!-- Category 3: Database & Tools -->
          <div class="skill-category-card">
            <h3 class="category-title">🛠️ Database &amp; Developer Tools</h3>
            
            <div class="skill-item">
              <div class="skill-info">
                <span>MySQL &amp; Relational Schema Design</span>
                <span>85%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="85%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>Git &amp; GitHub Version Control</span>
                <span>88%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="88%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>Maven &amp; Build Automation</span>
                <span>80%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="80%"></div>
              </div>
            </div>

            <div class="skill-item">
              <div class="skill-info">
                <span>REST APIs &amp; JSON Handling</span>
                <span>84%</span>
              </div>
              <div class="skill-progress-track">
                <div class="skill-progress-bar" data-progress="84%"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- SECTION 4: PROJECTS -->
    <section id="projects" class="section">
      <div class="container">
        <h2 class="section-title">Featured Projects</h2>
        <p class="section-subtitle">Real-world applications applying HTML5, CSS3, JavaScript, Java Servlets, JSP, and MySQL.</p>

        <!-- Category Filters -->
        <div class="project-filter">
          <button class="filter-btn active" data-filter="all">All Projects</button>
          <button class="filter-btn" data-filter="web">Frontend Web</button>
          <button class="filter-btn" data-filter="java">Java &amp; JDBC</button>
          <button class="filter-btn" data-filter="fullstack">Full-Stack J2EE</button>
        </div>

        <div class="projects-grid">
          <!-- Project 1 -->
          <article class="project-card" data-category="fullstack">
            <div class="project-thumbnail">
              <img src="assets/images/project1.svg" alt="Student Academic Management Portal">
            </div>
            <div class="project-body">
              <div class="project-tags">
                <span class="tag">Servlet</span>
                <span class="tag">JSP</span>
                <span class="tag">JDBC</span>
                <span class="tag">MySQL</span>
              </div>
              <h3 class="project-title">Student Academic Portal</h3>
              <p class="project-desc">
                A web portal enabling students to view grades, submit assignments, and manage profiles. Developed using MVC architecture with Java Servlets handling business logic, JSP for dynamic views, and MySQL for secure data persistence.
              </p>
              <div class="project-links">
                <a href="https://github.com/example/student-portal" target="_blank" rel="noopener noreferrer">Source Code &rarr;</a>
                <a href="#contact">Request Demo &rarr;</a>
              </div>
            </div>
          </article>

          <!-- Project 2 -->
          <article class="project-card" data-category="java">
            <div class="project-thumbnail">
              <img src="assets/images/project2.svg" alt="Online Banking System with JDBC">
            </div>
            <div class="project-body">
              <div class="project-tags">
                <span class="tag">Core Java</span>
                <span class="tag">JDBC</span>
                <span class="tag">MySQL</span>
                <span class="tag">Security</span>
              </div>
              <h3 class="project-title">Online Banking Transaction Core</h3>
              <p class="project-desc">
                A transactional enterprise module built with Java and JDBC. Implements ACID transaction controls, PreparedStatements against SQL injection, account balance audits, and comprehensive transaction logging.
              </p>
              <div class="project-links">
                <a href="https://github.com/example/banking-core" target="_blank" rel="noopener noreferrer">Source Code &rarr;</a>
                <a href="#contact">Read Architecture &rarr;</a>
              </div>
            </div>
          </article>

          <!-- Project 3 -->
          <article class="project-card" data-category="web">
            <div class="project-thumbnail">
              <img src="assets/images/project3.svg" alt="DevTracker REST API and Web App">
            </div>
            <div class="project-body">
              <div class="project-tags">
                <span class="tag">HTML5</span>
                <span class="tag">CSS3</span>
                <span class="tag">JavaScript ES6</span>
                <span class="tag">REST API</span>
              </div>
              <h3 class="project-title">Developer Task Tracker</h3>
              <p class="project-desc">
                An interactive task management dashboard featuring responsive CSS Grid layout, dynamic drag-and-drop tasks, client-side localStorage caching, and asynchronous REST API communication with JSON payload processing.
              </p>
              <div class="project-links">
                <a href="https://github.com/example/dev-task-tracker" target="_blank" rel="noopener noreferrer">Source Code &rarr;</a>
                <a href="#contact">Live Preview &rarr;</a>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- SECTION 5: CONTACT -->
    <section id="contact" class="section" style="background-color: var(--bg-secondary);">
      <div class="container">
        <h2 class="section-title">Contact Me</h2>
        <p class="section-subtitle">Feel free to reach out for collaborations, academic inquiries, or opportunities. Messages submitted are persisted to MySQL database via Java Servlet &amp; JDBC.</p>

        <div class="contact-grid">
          <!-- Contact Information Cards -->
          <div class="contact-info">
            <div class="info-item">
              <div class="info-icon">📍</div>
              <div class="info-text">
                <h4>Campus Address</h4>
                <p>Faculty of Engineering &amp; Technology, CSE Dept.</p>
              </div>
            </div>

            <div class="info-item">
              <div class="info-icon">📧</div>
              <div class="info-text">
                <h4>Direct Email</h4>
                <p><a href="mailto:harsh.student@example.ac.in">harsh.student@example.ac.in</a></p>
              </div>
            </div>

            <div class="info-item">
              <div class="info-icon">💼</div>
              <div class="info-text">
                <h4>Professional Profiles</h4>
                <p>
                  <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer">LinkedIn</a> | 
                  <a href="https://github.com" target="_blank" rel="noopener noreferrer">GitHub</a>
                </p>
              </div>
            </div>

            <div class="info-item">
              <div class="info-icon">🗄️</div>
              <div class="info-text">
                <h4>Database Inquiries</h4>
                <p><a href="admin-messages.jsp">View Stored Messages (Admin / Viva View) &rarr;</a></p>
              </div>
            </div>
          </div>

          <!-- Contact Form with Client-side JS Validation & Java Servlet Action -->
          <div class="contact-form-container">
            <form id="contactForm" action="ContactServlet" method="POST" novalidate>
              
              <div class="form-group">
                <label for="name">Full Name <span style="color: var(--danger-color);">*</span></label>
                <input type="text" id="name" name="name" class="form-control" placeholder="e.g. John Doe" required minlength="3">
                <span class="error-message" id="nameError"></span>
              </div>

              <div class="form-group">
                <label for="email">Email Address <span style="color: var(--danger-color);">*</span></label>
                <input type="email" id="email" name="email" class="form-control" placeholder="e.g. name@domain.com" required>
                <span class="error-message" id="emailError"></span>
              </div>

              <div class="form-group">
                <label for="subject">Subject <span style="color: var(--danger-color);">*</span></label>
                <input type="text" id="subject" name="subject" class="form-control" placeholder="e.g. Inquiry regarding Web Tech Assignment" required>
                <span class="error-message" id="subjectError"></span>
              </div>

              <div class="form-group">
                <label for="message">Your Message <span style="color: var(--danger-color);">*</span></label>
                <textarea id="message" name="message" class="form-control" rows="5" placeholder="Write your message here (min. 10 characters)..." required minlength="10"></textarea>
                <span class="error-message" id="messageError"></span>
              </div>

              <button type="submit" id="submitBtn" class="btn btn-primary" style="width: 100%;">
                <span>Send Message (Store via Servlet &amp; JDBC)</span>
              </button>
            </form>
          </div>
        </div>
      </div>
    </section>

  </main>

  <!-- ================= FOOTER (Semantic HTML5) ================= -->
  <footer class="footer">
    <div class="container">
      <div class="footer-content">
        <div>
          <h3>Harsh - Portfolio</h3>
          <p class="footer-academic-meta">
            B.Tech (CSE) | Semester: V | Paper Code: BCS502 (Web Technology)<br>
            Assignment-4: Personal Skills Portfolio Project | Academic Year: 2026-27
          </p>
        </div>
        <div class="footer-social-links">
          <a href="https://github.com" target="_blank" rel="noopener noreferrer" class="social-icon" aria-label="GitHub">GH</a>
          <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer" class="social-icon" aria-label="LinkedIn">IN</a>
          <a href="mailto:harsh.student@example.ac.in" class="social-icon" aria-label="Email">@</a>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; 2026 Harsh. Built with Semantic HTML5, CSS3 Flexbox/Grid, Modern JavaScript &amp; Java Servlets.</p>
      </div>
    </div>
  </footer>

  <!-- External JavaScript File -->
  <script src="js/script.js"></script>
</body>
</html>
