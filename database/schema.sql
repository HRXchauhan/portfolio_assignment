-- ===================================================================
-- WEB TECHNOLOGY (BCS502) - ASSIGNMENT 4: PERSONAL PORTFOLIO
-- Student: Harsh | Academic Session: 2026-27
-- Database Initialization & Schema Script
-- ===================================================================

-- 1. Create the database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS portfolio_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- 2. Switch to portfolio_db
USE portfolio_db;

-- 3. Drop table if recreating
DROP TABLE IF EXISTS contact_messages;

-- 4. Create the contact_messages table
CREATE TABLE contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Insert sample data for demo and testing
INSERT INTO contact_messages (name, email, subject, message) VALUES
('Dr. Ramesh Sharma', 'r.sharma@college.ac.in', 'Assignment Evaluation Inquiry', 'Great job on the portfolio structure and servlet integration.'),
('Priya Verma', 'priya.v@techcorp.com', 'Internship Opportunity', 'Loved your banking and student portal projects. Would like to connect regarding frontend & Java roles.');

-- 6. Verification query
SELECT * FROM contact_messages;
