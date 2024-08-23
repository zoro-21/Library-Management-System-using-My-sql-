-- Table for storing categories of books
CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Table for storing publisher information
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    publication_language VARCHAR(255),
    publication_type VARCHAR(255)
);

-- Table for storing the location of books in the library
CREATE TABLE location (
    location_id INT PRIMARY KEY,
    shelf_no VARCHAR(255) NOT NULL,
    shelf_name VARCHAR(255),
    floor_no INT
);

-- Table for storing book information
CREATE TABLE book (
    book_id INT PRIMARY KEY,
    ISBN_Code VARCHAR(13) UNIQUE NOT NULL,
    book_title VARCHAR(255) NOT NULL,
    category_id INT,
    publisher_id INT,
    publication_year YEAR,
    book_edition VARCHAR(50),
    copies_total INT,
    copies_available INT,
    location_id INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

-- Table for storing author information
CREATE TABLE author (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255)
);

-- Table for storing the many-to-many relationship between books and authors
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Table for storing member information
CREATE TABLE member (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    city VARCHAR(255),
    mobile_no VARCHAR(15),
    email_id VARCHAR(255) UNIQUE,
    date_of_birth DATE,
    active_status_id INT,
    FOREIGN KEY (active_status_id) REFERENCES member_status(active_status_id)
);

-- Table for storing member status information
CREATE TABLE member_status (
    active_status_id INT PRIMARY KEY,
    account_type VARCHAR(255),
    account_status VARCHAR(255),
    membership_start_date DATE,
    membership_end_date DATE
);

-- Table for storing information about book issues
CREATE TABLE book_issue (
    issue_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    issue_status VARCHAR(255),
    issued_by_id INT,
    fine_due DECIMAL(10, 2),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (issued_by_id) REFERENCES library_staff(issued_by_id)
);

-- Table for storing fine details
CREATE TABLE fine (
    fine_id INT PRIMARY KEY,
    member_id INT,
    issue_id INT,
    fine_date DATE,
    fine_total DECIMAL(10, 2),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (issue_id) REFERENCES book_issue(issue_id)
);

-- Table for storing book requests
CREATE TABLE book_request (
    request_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    request_date DATE,
    available_status_id INT,
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (available_status_id) REFERENCES book_request_status(available_status_id)
);

-- Table for storing book request status information
CREATE TABLE book_request_status (
    available_status_id INT PRIMARY KEY,
    available_status VARCHAR(255),
    nearest_available_date DATE
);

-- Table for storing fine payment details
CREATE TABLE fine_payment (
    fine_payment_id INT PRIMARY KEY,
    member_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10, 2),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

-- Table for storing library staff information
CREATE TABLE library_staff (
    issued_by_id INT PRIMARY KEY,
    staff_name VARCHAR(255),
    staff_designation VARCHAR(255)
);
