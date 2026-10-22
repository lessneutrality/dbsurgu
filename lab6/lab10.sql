#1
CREATE TABLE projects(
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);

CREATE TABLE team_members(
    member_id INT PRIMARY KEY,
    member_name VARCHAR(255)
);

CREATE TABLE member_project(
    project_id INT,
    member_id INT,
    PRIMARY KEY (project_id, member_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (member_id) REFERENCES team_members(member_id)
);
#нарушение 1нф: атрибут team_members хранит составное значение, что ведет к невозможности оперировать со значениями, невозможности быстро изменить данные и сложности в ориентировке в данных

#2
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);

CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
);

CREATE TABLE EquipmentRentals (
    client_id INT,
    equipment_id INT,
    rental_date DATE,
    PRIMARY KEY (client_id, equipment_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);

#3
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_professor VARCHAR(255)
);

CREATE TABLE Grades (
    student_id INT,
    course_id INT,
    assignment_name VARCHAR(255),
    grade INT CHECK (grade BETWEEN 0 AND 100),
    PRIMARY KEY (student_id, course_id, assignment_name),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id)  REFERENCES Courses(course_id)
);
#нарушение 1нф: атрибут assignments_and_grades хранит составное значение, что ведет к невозможности оперировать со значениями, невозможности быстро изменить данные и сложности в ориентировке в данных