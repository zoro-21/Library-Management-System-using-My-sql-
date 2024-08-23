# LMS OF DATABASE
Project Description: Library Management System by SQL
Overview:
The Library Management System (LMS) is a database-driven application developed using SQL, designed to manage the comprehensive operations of a library. The system enables efficient handling of book inventories, member accounts, book loans, returns, fines, and staff management. The underlying database schema is based on an Entity-Relationship (ER) model that accurately represents the relationships between various entities in the library ecosystem.

Objectives:

To develop a robust and scalable SQL-based database that centralizes all library-related data.
To manage the cataloging of books, including categorization, author information, and location tracking within the library.
To efficiently handle member registrations, account status, borrowing activities, and related fines.
To support library staff in managing book issues and returns, while also keeping track of requests and payments.
To provide easy access to detailed reports and queries for better decision-making and library management.
Entities and Relationships:
The ER model for the Library Management System includes the following key entities and relationships:

Books:
Attributes: book_id (Primary Key), ISBN_Code, book_title, category_id (Foreign Key), publisher_id (Foreign Key), publication_year, book_edition, copies_total, copies_available, location_id (Foreign Key).
Description: Stores information about the books available in the library, including their category, publisher, edition, and location.
Categories:
Attributes: category_id (Primary Key), category_name.
Description: Represents the different categories or genres of books available in the library.
Publishers:
Attributes: publisher_id (Primary Key), publisher_name, publication_language, publication_type.
Description: Stores information about the publishers of the books.
Locations:
Attributes: location_id (Primary Key), shelf_no, shelf_name, floor_no.
Description: Manages the physical location of books within the library, including shelf and floor details.
Authors:
Attributes: author_id (Primary Key), first_name, last_name.
Description: Contains details about the authors of the books.
Book-Author Relationship:
Attributes: book_id (Foreign Key), author_id (Foreign Key).
Description: Represents the many-to-many relationship between books and their authors.
Members:
Attributes: member_id (Primary Key), first_name, last_name, city, mobile_no, email_id, date_of_birth, active_status_id (Foreign Key).
Description: Stores information about library members, including their personal details and account status.
Member Status:
Attributes: active_status_id (Primary Key), account_type, account_status, membership_start_date, membership_end_date.
Description: Tracks the status and type of member accounts, including membership duration.
Book Issues:
Attributes: issue_id (Primary Key), book_id (Foreign Key), member_id (Foreign Key), issue_date, return_date, issue_status, issued_by_id (Foreign Key), fine_due.
Description: Manages the issuing and returning of books, along with tracking fines for overdue books.
Fines:
Attributes: fine_id (Primary Key), member_id (Foreign Key), issue_id (Foreign Key), fine_date, fine_total.
Description: Tracks fines associated with late book returns and other violations.
Book Requests:
Attributes: request_id (Primary Key), book_id (Foreign Key), member_id (Foreign Key), request_date, available_status_id (Foreign Key).
Description: Manages requests made by members for books that are not currently available.
Book Request Status:
Attributes: available_status_id (Primary Key), available_status, nearest_available_date.
Description: Tracks the availability status of requested books and the expected availability date.
Fine Payments:
Attributes: fine_payment_id (Primary Key), member_id (Foreign Key), payment_date, payment_amount.
Description: Manages the payment of fines by members.
Library Staff:
Attributes: issued_by_id (Primary Key), staff_name, staff_designation.
Description: Stores information about library staff members, including their roles in issuing books.
Features:

Book Management: Add, update, or delete book records; manage categories, authors, and locations.
Member Management: Register new members, update member details, manage account statuses, and track borrowing history.
Loan Management: Record book issues and returns, calculate and manage fines, and update loan statuses.
Request Management: Handle book requests from members and track the availability of requested books.
Fine Management: Automatically calculate fines for overdue books and process fine payments.
Staff Management: Keep track of library staff responsible for book transactions.
Technologies Used:

SQL Server: For managing the relational database that stores all library-related data.
SQL Scripts: For creating and maintaining database tables, establishing relationships, and performing queries.
SQL Server Management Studio (SSMS): For designing, executing, and managing SQL queries and database schema.
Potential Enhancements:

Developing a user-friendly interface to interact with the database.
Implementing automated notifications for overdue books and upcoming availability of requested books.
Integration with barcode/RFID systems for more efficient book check-in/check-out processes.
Conclusion:
The Library Management System project effectively utilizes an ER model to design a comprehensive SQL database that supports all key functions of a modern library. The system ensures accurate data management, streamlined operations, and enhanced service delivery to library users. The flexible and scalable design allows for future enhancements and integration with additional technologies.
