-- Create Specializations Table
CREATE TABLE Specializations (
    specializationID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Doctors Table
CREATE TABLE Doctors (
    doctorID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    specializationID INT NOT NULL,
    FOREIGN KEY (specializationID) REFERENCES Specializations(specializationID)
);

-- Create Patients Table
CREATE TABLE Patients (
    patientID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    dateOfBirth DATE NOT NULL
);

-- Create Schedules Table
CREATE TABLE Schedules (
    scheduleID INT AUTO_INCREMENT PRIMARY KEY,
    doctorID INT NOT NULL,
    availableDate DATE NOT NULL,
    availableTime TIME NOT NULL,
    FOREIGN KEY (doctorID) REFERENCES Doctors(doctorID),
    UNIQUE (doctorID, availableDate, availableTime)
);

-- Create Appointments Table
CREATE TABLE Appointments (
    appointmentID INT AUTO_INCREMENT PRIMARY KEY,
    patientID INT NOT NULL,
    doctorID INT NOT NULL,
    scheduleID INT NOT NULL,
    reason TEXT,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patientID) REFERENCES Patients(patientID),
    FOREIGN KEY (doctorID) REFERENCES Doctors(doctorID),
    FOREIGN KEY (scheduleID) REFERENCES Schedules(scheduleID),
    UNIQUE (scheduleID, patientID)
);
