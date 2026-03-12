# Tutor Scheduling System

## Overview

Tutor Scheduling System is a web application developed using the Spring MVC framework.
The system allows tutors and students to manage class schedules, register for teaching sessions, and organize tutoring activities efficiently.

The project follows the MVC architecture and connects to a relational database for storing user and scheduling data.

## Objectives

* Build a web-based system for managing tutor schedules.
* Apply the MVC architecture in a Java web application.
* Implement database interaction using Repository and Service layers.
* Allow tutors to register available teaching time slots.
* Provide a simple interface for managing timetable information.

## System Architecture

The project follows the Model – View – Controller (MVC) design pattern.

Model
Represents the data structure and business entities such as Tutor, Student, Subject, and Schedule.

View
Built using JSP pages to display the interface for users to interact with the system.

Controller
Handles HTTP requests and coordinates communication between the View and Service layers.

Service
Contains business logic for processing scheduling operations.

Repository
Handles database access and CRUD operations.

## Main Features

* Tutor registration and management
* Subject management
* Timetable registration
* Tutors can select teaching days (Monday to Saturday)
* Time slot selection (Morning, Noon, Afternoon)
* Schedule storage in the database
* Basic schedule management interface

## Technologies Used

* Java
* Spring MVC
* JSP
* HTML / CSS
* MySQL (or relational database)
* Maven
* Apache Tomcat

This layered structure separates responsibilities and improves maintainability.

## Database

The system stores information such as:

* Tutors
* Students
* Subjects
* Schedules
* Time slots

Each tutor can register multiple available schedules for different subjects and time periods.

## Learning Outcomes

This project demonstrates how to build a Java web application using the Spring MVC framework and apply layered architecture for maintainable and scalable systems.

It also provides experience in database integration, web development, and backend architecture design.

## Author

Mai Phu Hai

* Email: [maiphuhai123@gmail.com](mailto:maiphuhai123@gmail.com)
* Phone: +84 348043061
