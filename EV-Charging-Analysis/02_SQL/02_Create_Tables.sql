-- ============================================================
-- 02_Create_Tables.sql
-- EV Charging Analysis
-- ============================================================

-- This script creates the four main tables used in the
-- EV Charging Analysis project.
--
-- Tables:
-- 1. EV_REGISTRATIONS
-- 2. CHARGING_STATIONS
-- 3. EV_SALES
-- 4. CHARGING_SESSIONS
--
-- NOTE:
-- The tables are created first.
-- Data is imported separately from CSV files using
-- SQL Server Import Flat File.


-- ============================================================
-- STEP 1: SELECT THE PROJECT DATABASE
-- ============================================================

USE EV_Charging_Analysis;
GO


-- ============================================================
-- TABLE 1: EV_REGISTRATIONS
-- ============================================================

-- Purpose:
-- Stores EV registration information by state and month.
--
-- Key Information:
-- State
-- Region
-- Monthly EV registrations
-- Total vehicle registrations
-- EV penetration percentage

CREATE TABLE EV_REGISTRATIONS
(
    RegistrationRecordID INT,
    StateID INT,
    State VARCHAR(50),
    Region VARCHAR(30),
    Month DATE,
    EV_Registrations INT,
    Total_Vehicle_Registrations INT,
    EV_Penetration_Pct DECIMAL(5,2)
);
GO


-- ============================================================
-- TABLE 2: CHARGING_STATIONS
-- ============================================================

-- Purpose:
-- Stores information about EV charging stations.
--
-- Key Information:
-- Station
-- State
-- City
-- Station type
-- Number of chargers
-- Station status
-- Installation date

CREATE TABLE CHARGING_STATIONS
(
    StationID INT,
    StateID INT,
    State VARCHAR(50),
    Region VARCHAR(30),
    City VARCHAR(50),
    StationName VARCHAR(100),
    StationType VARCHAR(30),
    TotalChargers INT,
    Status VARCHAR(30),
    InstallationDate DATE
);
GO


-- ============================================================
-- TABLE 3: EV_SALES
-- ============================================================

-- Purpose:
-- Stores EV sales information by state, month,
-- vehicle segment, and brand.
--
-- Key Information:
-- Vehicle segment
-- Brand
-- Units sold
-- Average vehicle price
-- Estimated sales value

CREATE TABLE EV_SALES
(
    SalesRecordID INT,
    StateID INT,
    State VARCHAR(50),
    Region VARCHAR(30),
    Month DATE,
    VehicleSegment VARCHAR(30),
    Brand VARCHAR(50),
    UnitsSold INT,
    AverageVehiclePrice DECIMAL(12,2),
    EstimatedSalesValue DECIMAL(15,2)
);
GO


-- ============================================================
-- TABLE 4: CHARGING_SESSIONS
-- ============================================================

-- Purpose:
-- Stores individual EV charging session information.
--
-- Key Information:
-- Charging station
-- Session timing
-- Charging duration
-- Energy consumed
-- Charging rate
-- Amount paid
-- Payment method
-- Session status

CREATE TABLE CHARGING_SESSIONS
(
    SessionID INT,
    StationID INT,
    StateID INT,
    State VARCHAR(50),
    StartTime DATETIME,
    EndTime DATETIME,
    DurationMinutes INT,
    EnergyConsumedKWh DECIMAL(10,2),
    RatePerKWh DECIMAL(10,2),
    Amount DECIMAL(12,2),
    PaymentMethod VARCHAR(30),
    SessionStatus VARCHAR(30)
);
GO


-- ============================================================
-- TABLE CREATION COMPLETED
-- ============================================================

-- The database now contains four tables:
--
-- EV_REGISTRATIONS
-- CHARGING_STATIONS
-- EV_SALES
-- CHARGING_SESSIONS
--
-- CSV data will be imported separately into these tables.
-- ============================================================