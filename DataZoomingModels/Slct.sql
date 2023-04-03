CREATE TABLE d_meetings (
    meeting_id INT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    attendees VARCHAR(255) NOT NULL,
    agenda VARCHAR(255) NOT NULL
);

CREATE TABLE d_appointments (
    appointment_id INT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    purpose VARCHAR(255) NOT NULL
);

CREATE TABLE d_tasks (
    task_id INT PRIMARY KEY,
    time TIME NOT NULL,
    task_name VARCHAR(255) NOT NULL,
    date DATE NOT NULL ,
    priority VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL
);

INSERT INTO d_meetings (meeting_id, date, time, location, attendees, agenda)
VALUES (5, '2023-02-16', '10:00:00', 'Meeting Room 101','Team', 'Kickoff meeting');

INSERT INTO d_appointments (appointment_id, date, time, location, purpose)
VALUES (104, '2023-03-12', '11:00:00', 'Headquarters', 'Client Meeting');

INSERT INTO d_appointments (appointment_id, date, time, location, purpose)
VALUES (201, '2023-04-16', '10:30:00', 'Office', 'Evaluation Meeting');

INSERT INTO d_tasks (task_id, time, task_name, date, priority, status)
VALUES (101, '10:00:00', 'Review Project Report', '2023-04-12','High', 'Not Started');

INSERT INTO d_tasks (task_id, time, task_name, date, priority, status)
VALUES (102, '10:00:00', 'Follow up with Clients', '2023-03-28','Low', 'Not Started');

INSERT INTO d_tasks (task_id, time, task_name, date, priority, status)
VALUES (103, '10:00:00', 'Teams Catchup', '2023-03-28','Medium', 'Not Started');

CREATE VIEW aggr_view AS
SELECT meeting_id AS event_id, date, time, location, attendees, agenda
FROM d_meetings
UNION
SELECT appointment_id AS event_id, date, time, location, purpose
FROM d_appointments
UNION
SELECT task_id AS event_id, time, task_name, date, priority, status
FROM d_tasks
order by date, time;

CREATE VIEW aggr_view_app_meet AS
SELECT a.meeting_id, a.location, a.attendees, a.agenda, b.appointment_id, b.location AS venue, b.purpose,
c.task_id, c.task_name, c.priority, c.status
FROM d_meetings a
JOIN d_appointments b ON a.date = b.date
JOIN d_tasks c ON b.date = c.date;

CREATE VIEW aggr_view_app_meet AS
SELECT a.meeting_id, a.location, a.attendees, a.agenda, b.appointment_id, b.location AS venue, b.purpose
FROM d_meetings a
JOIN d_appointments b ON a.date = b.date;

CREATE VIEW aggr_view AS
SELECT a.meeting_id, a.location, a.attendees, a.agenda, a.date as meeting_date, b.appointment_id, b.location AS venue, b.purpose, b.date as appointment_date,
c.task_id, c.task_name, c.priority, c.status, c.date as task_date 
FROM d_meetings a, d_appointments b, d_tasks c
WHERE date = @my_date
group by date;

CREATE VIEW aggr_view_sample AS
SELECT meeting_id, location, attendees, agenda, date , appointment_id, location AS venue, purpose, date as appointment_date,
c.task_id, c.task_name, c.priority, c.status, c.date as task_date 
FROM d_meetings a, d_appointments b, d_tasks c;

SELECT *
FROM d_meetings
WHERE YEAR(date) = 2023;

SELECT *
FROM meetings_view
WHERE YEAR(date) = 2023 AND MONTH(date) = 3;

SELECT YEAR(date) as year, MONTH(date) as month, COUNT(*) as meetings_count
FROM meetings_view
GROUP BY YEAR(date), MONTH(date);


SELECT YEAR(date) as year, MONTH(date) as month, COUNT(*) as meetings_count
FROM d_meetings
GROUP BY YEAR(date), MONTH(date);

select * from d_appointments;
select * from aggr_view_same_day;
select * from  appointments_view WHERE date >= '2023-01-01' AND date <= '2023-03-31';
select * from tasks_view where Week(date) = 12;
select * from tasks_view where Month(date) = 3;
select * from appointments_view where YEAR(date) = 2023;