delimiter //
CREATE PROCEDURE insert_appointment(
	appointment_id INT,
	date DATE,
    time TIME,
    location VARCHAR(255),
    purpose VARCHAR(255)
)
BEGIN
    INSERT INTO d_appointments (appointment_id, date, time, location, purpose)
    VALUES (202,'2023-05-16','10:30:00', 'Office', 'Evaluation Meeting');
END
;
delimiter //

delimiter //
CREATE PROCEDURE insert_meeting(
	meetingt_id INT,
	date DATE,
    time TIME,
    location VARCHAR(255),
    attendees VARCHAR(255),
    agenda VARCHAR(255)
)
BEGIN
    INSERT INTO d_meetings (meeting_id, date, time, location, attendees, agenda)
    VALUES (204, 2023-02-16, '10:30:10' , 'Meeting Room 101','Team', 'Kickoff meeting');
END
;

delimiter //
CREATE PROCEDURE insert_appointment(
	appointment_id INT,
	date DATE,
    time TIME,
    location VARCHAR(255),
    purpose VARCHAR(255)
)
BEGIN
    INSERT INTO d_appointments (appointment_id, date, time, location, purpose)
    VALUES (202, '2023-05-16', '10:30:00', 'Office', 'Evaluation Meeting');
END
;