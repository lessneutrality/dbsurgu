#1
CREATE TABLE publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255),
    publisher_city VARCHAR(255)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

#2
CREATE TABLE carModels (
    car_model VARCHAR(255) PRIMARY KEY,
    car_manufacturer VARCHAR(255)
);

CREATE TABLE raceResults (
    race_id INT,
    driver_id INT,
    car_model VARCHAR(255),
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model) REFERENCES CarModels(car_model)
);

#3
CREATE TABLE eventTypes (
    event_type VARCHAR(255) PRIMARY KEY,
    room_name VARCHAR(255)
);

CREATE TABLE events (
    event_name VARCHAR(255) PRIMARY KEY,
    event_type VARCHAR(255),
    FOREIGN KEY (event_type) REFERENCES EventTypes(event_type)
);

CREATE TABLE roomBookings (
    booking_time DATE,
    event_name VARCHAR(255),
    PRIMARY KEY (booking_time, event_name),
    FOREIGN KEY (event_name) REFERENCES Events(event_name)
);
