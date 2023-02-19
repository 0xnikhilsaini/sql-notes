-- Active: 1676824472950@@127.0.0.1@3306
-- show databases
SHOW DATABASES;
-- create databases
CREATE DATABASE mydb;
-- show databases
SHOW DATABASES;
CREATE DATABASE airbnbdb;
SHOW DATABASES;

-- use databases

USE airbnbdb;

-- create table
CREATE Table Users(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,   
    country VARCHAR(2)
);

-- insert single or multiple values.
INSERT INTO Users (email, bio, country)
VALUES (
    'hello56@gmail.com',
    'i love stranger!',
    'US'
),(
    'hello2@gmail.com',
    'i love stranger!',
    'US'
),(
    'hello3@gmail.com',
    'i love stranger!',
    'US'
),(
    'hello4@gmail.com',
    'i love stranger!',
    'US'
),(
    'hello5@gmail.com',
    'i love stranger!',
    'US'
);



SELECT * FROM Users;

SELECT email,id FROM Users
ORDER BY id DESC
LIMIT 2;

SELECT email,id FROM Users
WHERE country = 'US' 
OR email Like 'hello%'
ORDER BY id DESC
LIMIT 2;

-- INDEX
CREATE INDEX email_index ON Users(email);

-- relational TABLE

CREATE Table Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);


INSERT INTO Rooms (owner_id, street)
VALUES 
(1,'san diego sailboat'),
(1,'dan diego sailboat'),
(1,'kan diego sailboat');

-- first relational query using joins.
-- query users who own rooms
-- left, right , inerr , outer

SELECT * FROM Users
INNER JOIN Rooms
ON Rooms.owner_id = Users.id;

SELECT * FROM Users
LEFT JOIN Rooms
ON Rooms.owner_id = Users.id;

SELECT * FROM Users
RIGHT JOIN Rooms
ON Rooms.owner_id = Users.id;

-- as 
SELECT Users.id AS user_id, Rooms.id As room_id,email, street FROM Users
RIGHT JOIN Rooms
ON Rooms.owner_id = Users.id;


-- book a room from a another user.

CREATE Table Booking (
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,    
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    Foreign Key (guest_id) REFERENCES Users(id),
    Foreign Key (room_id) REFERENCES Rooms(id)
);

-- user has booked many rooms , room has been booked by USER_RESOURCES

ALTER Table Booking 
RENAME TO Bookings;

SELECT 
  guest_id, street, check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id = guest_id
WHERE guest_id = 1;

ALTER Table Booking 
RENAME TO Bookings;

SELECT 
  room_id, guest_id, email, bio
FROM Bookings
INNER JOIN Users ON Users.id = guest_id
WHERE room_id = 2;



DROP Table Users;

