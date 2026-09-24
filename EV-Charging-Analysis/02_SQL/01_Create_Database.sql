-- ============================================================
-- 01_Create_Database.sql
-- EV Charging Analytics - India
-- ============================================================

-- This script creates the database for the
-- EV Charging Analytics project.
--
-- Database Purpose:
-- Store and analyze EV registrations, charging stations,
-- EV sales, and charging session data.
--
-- NOTE:
-- The DROP DATABASE section should only be used when
-- creating the project from scratch.
-- It will permanently delete the existing database and data.


-- ============================================================
-- STEP 1: CHECK IF DATABASE ALREADY EXISTS
-- ============================================================

IF EXISTS
(
    SELECT name
    FROM sys.databases
    WHERE name = 'EV_CHARGING_ANALYSIS'
)
BEGIN
    DROP DATABASE EV_CHARGING_ANALYSIS;
END
GO


-- ============================================================
-- STEP 2: CREATE THE DATABASE
-- ============================================================

CREATE DATABASE EV_CHARGING_ANALYSIS;
GO


-- ============================================================
-- STEP 3: SWITCH TO THE PROJECT DATABASE
-- ============================================================

USE EV_CHARGING_ANALYSIS;
GO


-- ============================================================
-- DATABASE SETUP COMPLETED
-- ============================================================




