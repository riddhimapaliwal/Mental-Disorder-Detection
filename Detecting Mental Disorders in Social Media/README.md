# Title: "Detecting Mental Disorders in Social Media"
## description: 
  A Java-based web application built using JSP, Servlets, and MySQL. This system simulates analysis of user-submitted text
  (like social media posts) and detects potential signs of mental health conditions such as depression or anxiety using 
  rule-based logic. Designed for educational and demonstration purposes.

technologies:
  - Java (JDK 8 or 11)
  - JSP and Servlets
  - Apache Tomcat 8.5 or 9.0
  - MySQL (5.0 or newer)
  - HTML, CSS, JavaScript
  - JDBC
  - IDE: IntelliJ IDEA / Eclipse / NetBeans 8.2

project_structure: |
  SOURCE CODE/
  ├── nbproject/         # NetBeans project configuration
  ├── src/               # Java servlet source files
  ├── web/               # JSP pages, CSS, JS
  ├── build.xml          # Build file (NetBeans/Ant)
  └── README.md          # Project overview

setup_instructions:
  - step: "Install Java JDK"
    details: >
      Download and install JDK 8 or 11 from Oracle.
      Verify using 'java -version' and 'javac -version'.

  - step: "Use an IDE"
    options:
      - IntelliJ IDEA
      - Eclipse IDE for Java EE
      - NetBeans 8.2

  - step: "Install Apache Tomcat"
    details: >
      Download Tomcat 8.5 or 9.0 and configure it as a server in your IDE.

  - step: "Set Up MySQL Database"
    details: >
      Install MySQL, create a database (e.g., mental_disorder_db), and restore the provided .sql file.
      Default credentials: root/root (or update in SQLconnection.java).

  - step: "Run the Project"
    details: >
      Import the project in your IDE, configure Tomcat, and run the app.

features:
  - "User input form for submitting text"
  - "Keyword/rule-based detection of potential mental disorders"
  - "Admin dashboard to review submitted posts"
  - "MySQL backend for storing user input and results"
  - "JSP-based frontend UI"


author:
  name: "Riddhima Paliwal"
  github: "https://github.com/riddhimapaliwal"

license: >
  This project is intended for educational and academic demonstration only. Not for commercial use without permission.
