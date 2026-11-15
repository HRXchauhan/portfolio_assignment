/**
 * ===================================================================
 * WEB TECHNOLOGY (BCS502) - ASSIGNMENT 4: PERSONAL PORTFOLIO
 * Student: Harsh | Academic Session: 2026-27
 * File: js/script.js (Client-side Interactivity & DOM Manipulation)
 * ===================================================================
 */

document.addEventListener('DOMContentLoaded', () => {
  // 1. Mobile Navigation Toggle
  const hamburger = document.getElementById('hamburgerBtn');
  const navMenu = document.getElementById('navMenu');
  const navLinks = document.querySelectorAll('.nav-link');

  if (hamburger && navMenu) {
    hamburger.addEventListener('click', () => {
      navMenu.classList.toggle('active');
      hamburger.classList.toggle('toggle');
    });

    // Close mobile menu when a nav link is clicked
    navLinks.forEach(link => {
      link.addEventListener('click', () => {
        navMenu.classList.remove('active');
        hamburger.classList.remove('toggle');
      });
    });
  }

  // 2. Dark / Light Mode Switcher with LocalStorage Persistence
  const themeToggle = document.getElementById('themeToggle');
  const currentTheme = localStorage.getItem('portfolio-theme') || 'light';

  document.documentElement.setAttribute('data-theme', currentTheme);
  updateThemeIcon(currentTheme);

  if (themeToggle) {
    themeToggle.addEventListener('click', () => {
      const activeTheme = document.documentElement.getAttribute('data-theme');
      const newTheme = activeTheme === 'dark' ? 'light' : 'dark';
      
      document.documentElement.setAttribute('data-theme', newTheme);
      localStorage.setItem('portfolio-theme', newTheme);
      updateThemeIcon(newTheme);
    });
  }

  function updateThemeIcon(theme) {
    if (!themeToggle) return;
    if (theme === 'dark') {
      themeToggle.innerHTML = '☀️';
      themeToggle.setAttribute('title', 'Switch to Light Mode');
    } else {
      themeToggle.innerHTML = '🌙';
      themeToggle.setAttribute('title', 'Switch to Dark Mode');
    }
  }

  // 3. Dynamic Typing Effect for Hero Subtitle
  const typingTarget = document.getElementById('typingText');
  if (typingTarget) {
    const phrases = [
      'B.Tech CSE Student (Sem V)',
      'Full-Stack Web Enthusiast',
      'Java & Servlet Backend Developer',
      'Continuous Learner & Problem Solver'
    ];
    let phraseIndex = 0;
    let charIndex = 0;
    let isDeleting = false;
    let typingSpeed = 100;

    function typeEffect() {
      const currentPhrase = phrases[phraseIndex];

      if (isDeleting) {
        typingTarget.textContent = currentPhrase.substring(0, charIndex - 1);
        charIndex--;
        typingSpeed = 50;
      } else {
        typingTarget.textContent = currentPhrase.substring(0, charIndex + 1);
        charIndex++;
        typingSpeed = 100;
      }

      if (!isDeleting && charIndex === currentPhrase.length) {
        isDeleting = true;
        typingSpeed = 1800; // Pause at end of text
      } else if (isDeleting && charIndex === 0) {
        isDeleting = false;
        phraseIndex = (phraseIndex + 1) % phrases.length;
        typingSpeed = 400; // Pause before typing next
      }

      setTimeout(typeEffect, typingSpeed);
    }

    typeEffect();
  }

  // 4. Animated Skill Progress Bars using IntersectionObserver
  const skillSection = document.getElementById('skills');
  const progressBars = document.querySelectorAll('.skill-progress-bar');

  if (skillSection && progressBars.length > 0) {
    const skillObserver = new IntersectionObserver(
      (entries, observer) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            progressBars.forEach(bar => {
              const targetWidth = bar.getAttribute('data-progress') || '80%';
              bar.style.width = targetWidth;
            });
            observer.unobserve(entry.target); // Animate once
          }
        });
      },
      { threshold: 0.25 }
    );

    skillObserver.observe(skillSection);
  }

  // 5. Project Filtering Functionality
  const filterButtons = document.querySelectorAll('.filter-btn');
  const projectCards = document.querySelectorAll('.project-card');

  filterButtons.forEach(button => {
    button.addEventListener('click', () => {
      // Manage active button state
      filterButtons.forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');

      const filterValue = button.getAttribute('data-filter');

      projectCards.forEach(card => {
        const cardCategory = card.getAttribute('data-category');
        if (filterValue === 'all' || cardCategory === filterValue) {
          card.style.display = 'flex';
          card.style.animation = 'fadeIn 0.4s ease forwards';
        } else {
          card.style.display = 'none';
        }
      });
    });
  });

  // 6. Active Nav Link on Scroll (ScrollSpy)
  const sections = document.querySelectorAll('section[id]');
  window.addEventListener('scroll', () => {
    const scrollY = window.pageYOffset;

    sections.forEach(current => {
      const sectionHeight = current.offsetHeight;
      const sectionTop = current.offsetTop - 100;
      const sectionId = current.getAttribute('id');
      const matchingLink = document.querySelector(`.nav-menu a[href*="${sectionId}"]`);

      if (matchingLink) {
        if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
          matchingLink.classList.add('active');
        } else {
          matchingLink.classList.remove('active');
        }
      }
    });
  });

  // 7. Interactive Client-Side Form Validation (Contact Form)
  const contactForm = document.getElementById('contactForm');
  if (contactForm) {
    const nameInput = document.getElementById('name');
    const emailInput = document.getElementById('email');
    const subjectInput = document.getElementById('subject');
    const messageInput = document.getElementById('message');

    // Email regex format validator
    const isValidEmail = (email) => {
      const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return emailRegex.test(String(email).toLowerCase());
    };

    // Helper: Show error
    const showError = (input, message) => {
      input.classList.remove('is-valid');
      input.classList.add('is-invalid');
      const errorElem = document.getElementById(`${input.id}Error`);
      if (errorElem) {
        errorElem.textContent = message;
        errorElem.classList.add('visible');
      }
    };

    // Helper: Show success
    const showSuccess = (input) => {
      input.classList.remove('is-invalid');
      input.classList.add('is-valid');
      const errorElem = document.getElementById(`${input.id}Error`);
      if (errorElem) {
        errorElem.classList.remove('visible');
        errorElem.textContent = '';
      }
    };

    // Field Validators
    const validateName = () => {
      const val = nameInput.value.trim();
      if (val === '') {
        showError(nameInput, 'Full name is required.');
        return false;
      } else if (val.length < 3) {
        showError(nameInput, 'Name must be at least 3 characters.');
        return false;
      }
      showSuccess(nameInput);
      return true;
    };

    const validateEmail = () => {
      const val = emailInput.value.trim();
      if (val === '') {
        showError(emailInput, 'Email address is required.');
        return false;
      } else if (!isValidEmail(val)) {
        showError(emailInput, 'Please enter a valid email address (e.g., student@college.edu).');
        return false;
      }
      showSuccess(emailInput);
      return true;
    };

    const validateSubject = () => {
      const val = subjectInput.value.trim();
      if (val === '') {
        showError(subjectInput, 'Please specify a subject.');
        return false;
      }
      showSuccess(subjectInput);
      return true;
    };

    const validateMessage = () => {
      const val = messageInput.value.trim();
      if (val === '') {
        showError(messageInput, 'Message cannot be empty.');
        return false;
      } else if (val.length < 10) {
        showError(messageInput, 'Message must be at least 10 characters long.');
        return false;
      }
      showSuccess(messageInput);
      return true;
    };

    // Real-time validation feedback on blur and input
    nameInput.addEventListener('blur', validateName);
    nameInput.addEventListener('input', () => { if (nameInput.classList.contains('is-invalid')) validateName(); });

    emailInput.addEventListener('blur', validateEmail);
    emailInput.addEventListener('input', () => { if (emailInput.classList.contains('is-invalid')) validateEmail(); });

    subjectInput.addEventListener('blur', validateSubject);
    subjectInput.addEventListener('input', () => { if (subjectInput.classList.contains('is-invalid')) validateSubject(); });

    messageInput.addEventListener('blur', validateMessage);
    messageInput.addEventListener('input', () => { if (messageInput.classList.contains('is-invalid')) validateMessage(); });

    // Submit handler
    contactForm.addEventListener('submit', (e) => {
      const isNameValid = validateName();
      const isEmailValid = validateEmail();
      const isSubjectValid = validateSubject();
      const isMsgValid = validateMessage();

      if (!(isNameValid && isEmailValid && isSubjectValid && isMsgValid)) {
        e.preventDefault(); // Stop form submission if invalid
        // Scroll to the first invalid input
        const firstInvalid = document.querySelector('.form-control.is-invalid');
        if (firstInvalid) firstInvalid.focus();
      }
      // If valid, allows standard POST submission to ContactServlet on Apache Tomcat
    });
  }
});
