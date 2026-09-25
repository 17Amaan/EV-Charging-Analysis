
# EV-Charging-Analysis

A complete **SQL portfolio project** focused on analyzing EV registrations, EV sales, charging infrastructure, charging-session activity, and charging revenue using **Microsoft SQL Server**.

This project demonstrates practical SQL skills required for **Data Analyst roles, including data exploration, aggregation, CTEs, JOINs, window functions, KPI analysis, and business-oriented problem solving.

---

## 📌 Project Overview

The **EV Charging Analysis** project analyzes four connected datasets to understand the relationship between:

- EV adoption
- EV sales
- Charging infrastructure
- Charging-session activity
- Charging energy consumption
- Charging revenue

The project uses **synthetic datasets** created for educational and portfolio purposes.

The main objective is to use SQL to identify business patterns such as:

- High EV adoption with limited charging infrastructure
- High EV sales relative to charging infrastructure
- Charging station utilization
- Charging-session activity
- Charging revenue performance
- Potential charging infrastructure gaps

---

# 🎯 Project Objectives

- Analyze EV registrations across states and regions
- Analyze EV sales performance
- Evaluate charging-station infrastructure
- Analyze charging-session activity
- Calculate charging revenue
- Calculate important business KPIs
- Compare EV adoption with charging infrastructure
- Compare EV sales with charging infrastructure
- Analyze charging-station utilization
- Identify potential infrastructure gaps
- Perform cross-dataset analysis
- Practice real-world SQL business problem solving
- Build a portfolio-ready SQL project

---

# 🛠️ Tech Stack

| Technology | Usage |
|---|---|
| **Microsoft SQL Server** | Database |
| **SQL Server Management Studio (SSMS)** | SQL development and analysis |
| **SQL** | Data analysis |
| **CSV** | Dataset format |
| **Git** | Version control |
| **GitHub** | Project repository |

---

# 🗂️ Dataset Overview

The project contains four main datasets.

---

## 1. EV Registrations

The `EV_REGISTRATIONS` dataset contains EV registration information by state, region, and month.

| Column | Description |
|---|---|
| `RegistrationRecordID` | Unique registration record |
| `StateID` | State identifier |
| `State` | State name |
| `Region` | Geographic region |
| `Month` | Registration month |
| `EV_Registrations` | Number of EV registrations |
| `Total_Vehicle_Registrations` | Total vehicle registrations |
| `EV_Penetration_Pct` | EV penetration percentage |

**Records:** 600

---

## 2. Charging Stations

The `CHARGING_STATIONS` dataset contains charging-station infrastructure information.

| Column | Description |
|---|---|
| `StationID` | Unique charging station ID |
| `StateID` | State identifier |
| `State` | State name |
| `Region` | Geographic region |
| `City` | City name |
| `StationName` | Charging station name |
| `StationType` | Charging station type |
| `TotalChargers` | Number of chargers at the station |
| `Status` | Station status |
| `InstallationDate` | Station installation date |

**Records:** 600

---

## 3. EV Sales

The `EV_SALES` dataset contains EV sales information by state, month, vehicle segment, and brand.

| Column | Description |
|---|---|
| `SalesRecordID` | Unique sales record |
| `StateID` | State identifier |
| `State` | State name |
| `Region` | Geographic region |
| `Month` | Sales month |
| `VehicleSegment` | Vehicle segment |
| `Brand` | EV brand |
| `UnitsSold` | Number of EV units sold |
| `AverageVehiclePrice` | Average vehicle selling price |
| `EstimatedSalesValue` | Estimated sales value |

**Records:** 600

---

## 4. Charging Sessions

The `CHARGING_SESSIONS` dataset contains individual EV charging-session information.

| Column | Description |
|---|---|
| `SessionID` | Unique charging session ID |
| `StationID` | Charging station ID |
| `StateID` | State identifier |
| `State` | State name |
| `StartTime` | Charging session start time |
| `EndTime` | Charging session end time |
| `DurationMinutes` | Charging duration |
| `EnergyConsumedKWh` | Energy consumed during session |
| `RatePerKWh` | Charging rate per kWh |
| `Amount` | Amount paid for the session |
| `PaymentMethod` | Payment method |
| `SessionStatus` | Charging-session status |

**Records:** 1,000

---

# 📊 Dataset Summary

| Dataset | Records | Main Purpose |
|---|---:|---|
| EV Registrations | 600 | Analyze EV adoption |
| Charging Stations | 600 | Analyze charging infrastructure |
| EV Sales | 600 | Analyze EV market activity |
| Charging Sessions | 1,000 | Analyze charging activity and revenue |
| **Total** | **2,800** | Complete EV ecosystem analysis |

---



# 🚀 Project Workflow

```text
Business Problem
       ↓
Dataset Preparation
       ↓
Create SQL Server Database
       ↓
Create Tables
       ↓
Import CSV Data
       ↓
Data Exploration
       ↓
Business Questions
       ↓
KPI Calculation
       ↓
Cross-Dataset Analysis
       ↓
Business Insights
       ↓
Documentation



# 📁 PROJECT STRUCTURE

```text
EV-Charging-Analysis/
│
├── 01_DATASET/
│   ├── EV_REGISTRATIONS.csv
│   ├── CHARGING_STATIONS.csv
│   ├── EV_SALES.csv
│   └── CHARGING_SESSIONS.csv
│
├── 02_SQL/
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   └── 03_SQL_Practice_Queries.sql
│
├── 03_DOCUMENTATION/
│   ├── Business_Problem.md
│   ├── KPI_Definitions.md
│   └── Business_Insights_and_Recommendations.md
│
├── README.md
└── LICENSE



📜 SQL Scripts
File	Description
01_Create_Database.sql	Creates the EV Charging Analysis database
02_Create_Tables.sql	Creates the required tables for the four datasets
03_SQL_Practice_Queries.sql	Contains data exploration, business analysis, KPI, cross-dataset, and ranking queries


🧠 SQL Concepts Demonstrated
Basic SQL
SELECT
WHERE
ORDER BY
GROUP BY
HAVING
DISTINCT
Aggregate Functions
COUNT()
SUM()
AVG()
MIN()
MAX()
JOIN Operations
INNER JOIN
LEFT JOIN
Multiple-table JOINs
Joining aggregated datasets
Joining CTEs
Advanced SQL
Common Table Expressions (CTEs)
CROSS JOIN
Window Functions
RANK()
NULLIF()
CAST()
Calculated columns
Multi-level aggregation
Business Analysis
EV adoption analysis
EV sales analysis
Charging infrastructure analysis
Charging revenue analysis
Charging station utilization
Cross-dataset analysis
Infrastructure gap analysis
KPI analysis
State-level benchmarking


💻 Simple SQL Query
Total EV Sales by State
SELECT
    STATE,
    SUM(UNITSSOLD) AS TOTAL_EV_SALES
FROM EV_SALES
GROUP BY STATE
ORDER BY TOTAL_EV_SALES DESC;

🎯 Why This Project?

This project demonstrates the ability to use SQL not only to retrieve data, but also to solve real-world business problems through structured data analysis.

The project shows the ability to:

Work with multiple datasets
Understand business requirements
Transform raw data into meaningful metrics
Write analytical SQL queries
Build reusable SQL logic
Create business KPIs
Compare different business metrics
Identify patterns and potential gaps
Translate SQL results into business insights
Document analytical work professionally
