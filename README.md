# BirdClinicSystem - SWP391 Project

The BirdClinicSystem is a web-based system designed to help bird clinics manage their daily activities, including medical examinations, reservations, customer feedback, and more. This project is built using Java Servlet technology.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)

## Features

The BirdClinicSystem offers the following features:

- A home page with a welcoming message and navigation links
- A blog section with articles about birds and their health
- A services section with details of the services provided by the clinic
- A reservation form to enable users to make appointments for medical examinations
- A feedback form to allow customers to provide feedback on their experience with the clinic
- A user login and registration system
- A user profile page to display user information and reservations
- A reservation management system for the clinic staff to manage appointments
- An admin dashboard to manage the system settings, users, and appointments
- A stock status section to display the current stock status of the clinic

## Technologies Used

The BirdClinicSystem is built using the following technologies:

- Java Servlet
- JSP (JavaServer Pages)
- HTML/CSS
- Bootstrap framework
- SQL Server database

## Installation

To install the BirdClinicSystem, follow these steps:

1. Clone the repository to your local machine using `git clone https://github.com/dkmtech32/SWP_391-BirdClinicSystem.git`
2. Install Apache Tomcat and SQL Server on your machine
3. Create a new database and import the `birdclinic.sql` file from the project's root directory
4. Configure the SQL Server connection details in the `DBUtil.java` file located in `src/main/java/util/`
5. Deploy the project to your Tomcat server using your preferred method (e.g., copying the WAR file to the `webapps` folder)

## Usage

To use the BirdClinicSystem, follow these steps:

1. Open your web browser and navigate to `http://localhost:8080/BirdClinicSystem/`
2. Use the navigation links to explore the different sections of the system
3. Register a new user account or log in to an existing one
4. Make a reservation for a medical examination or provide feedback on your experience with the clinic
5. Clinic staff can manage appointments and view the stock status using the admin dashboard

## Contributing

Contributions are always welcome! If you would like to contribute to the project, please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/feature-name`)
3. Commit your changes (`git commit -m "Add feature-name"`)
4. Push your changes to your branch (`git push origin feature/feature-name`)
5. Open a pull request
