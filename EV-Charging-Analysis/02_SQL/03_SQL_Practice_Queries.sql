-- ============================================================
-- Q1. TOTAL NUMBER OF CHARGING STATIONS
-- ============================================================

-- Purpose:
-- Find the total number of charging stations

SELECT COUNT(*) AS TOTAL_STATIONS
FROM CHARGING_STATIONS;

-- ============================================================
-- Q2. TOTAL NUMBER OF EV SALES RECORDS
-- ============================================================

-- Purpose:
-- Find the total number of EV sales records

SELECT COUNT(*) AS TOTAL_SALES_RECORDS
FROM EV_SALES;


-- ============================================================
-- Q3. TOTAL NUMBER OF CHARGING SESSIONS
-- ============================================================

-- Purpose:
-- Find the total number of charging sessions

SELECT COUNT(*) AS TOTAL_CHARGING_SESSIONS
FROM CHARGING_SESSIONS;


-- ============================================================
-- Q4. TOTAL NUMBER OF EV REGISTRATION RECORDS
-- ============================================================

-- Purpose:
-- Find the total number of EV registration records

SELECT COUNT(*) AS TOTAL_EV_REGISTRATION_RECORDS
FROM EV_REGISTRATIONS;



-- ============================================================
-- Q5. TOTAL NUMBER OF UNIQUE STATES
-- ============================================================

-- Purpose:
-- Find the total number of different states
-- represented in the EV registration data.

SELECT COUNT(DISTINCT STATE) AS TOTAL_UNIQUE_STATES
FROM EV_REGISTRATIONS


-- ============================================================
-- Q6. TOTAL NUMBER OF UNIQUE CITIES
-- ============================================================

-- Purpose:
-- Find the total number of different cities
-- represented in the charging station data.


SELECT COUNT(DISTINCT CITY) AS TOTAL_UNIQUE_CITIES
FROM CHARGING_STATIONS;


-- ============================================================
-- Q7. TOTAL EV UNITS SOLD
-- ============================================================

-- Purpose:
-- Find the total number of EV units sold
-- across all sales records.


SELECT SUM(UNITSSOLD) AS TOTAL_EV_UNITS_SOLD
FROM EV_SALES;


-- ============================================================
-- Q8. TOTAL EV REGISTRATIONS
-- ============================================================

-- Purpose:
-- Find the total number of EVs registered
-- across all states and months in the dataset.


SELECT SUM(EV_Registrations) AS TOTAL_EV_REGISTRATIONS
FROM EV_REGISTRATIONS;


-- ============================================================
-- Q9. TOTAL ENERGY CONSUMED
-- ============================================================

-- Purpose:
-- Find the total amount of energy consumed
-- across all recorded charging sessions.


SELECT SUM(ENERGYCONSUMEDKWH) AS TOTAL_ENERGY_CONSUMED_KWH
FROM CHARGING_SESSIONS;


-- ============================================================
-- Q10. TOTAL CHARGING REVENUE
-- ============================================================

-- Purpose:
-- Find the total revenue generated
-- from all recorded charging sessions.

SELECT * FROM CHARGING_SESSIONS

SELECT SUM(AMOUNT) AS TOTAL_CHARGING_REVENUE
FROM CHARGING_SESSIONS;


-- ============================================================
-- Q11. STATE-WISE EV REGISTRATIONS
-- ============================================================

-- Purpose:
-- Find the total EV registrations for each state
-- and arrange the states from highest to lowest
-- based on EV registrations.


SELECT 
STATE,
SUM(EV_REGISTRATIONS) AS TOTAL_EV_REGISTRATIONS
FROM EV_REGISTRATIONS
GROUP BY STATE 
ORDER BY TOTAL_EV_REGISTRATIONS DESC

SELECT * FROM EV_REGISTRATIONS



-- ============================================================
-- Q12. STATES WITH HIGH EV REGISTRATIONS
-- ============================================================

-- Purpose:
-- Identify states with more than 50,000 total
-- EV registrations and arrange them from
-- highest to lowest registrations.

SELECT 
    STATE,
    SUM(EV_REGISTRATIONS) AS TOTAL_EV_REGISTRATIONS
FROM EV_REGISTRATIONS
GROUP BY STATE
HAVING SUM(EV_REGISTRATIONS) > 50000
ORDER BY TOTAL_EV_REGISTRATIONS DESC;


-- ============================================================
-- Q13. AVERAGE EV PENETRATION BY STATE
-- ============================================================

-- Purpose:
-- Compare the average EV penetration percentage
-- across different states.


SELECT 
STATE,
AVG(EV_PENETRATION_PCT) AS AVG_PENETRATION
FROM EV_REGISTRATIONS
GROUP BY STATE 
ORDER BY AVG_PENETRATION DESC




-- ============================================================
-- Q14. TOTAL CHARGING STATIONS BY STATE
-- ============================================================

-- Purpose:
-- Compare the number of charging stations
-- available across different states.


SELECT 
STATE,
COUNT(*) AS TOTAL_STATION 
FROM CHARGING_STATIONS
GROUP BY STATE
ORDER BY  TOTAL_STATION DESC


-- ============================================================
-- Q15. TOTAL CHARGING STATIONS BY REGION
-- ============================================================

-- Purpose:
-- Compare the total number of charging stations
-- available across different regions.

SELECT 
REGION,
COUNT(*) AS TOTAL_STATION_REGION
FROM CHARGING_STATIONS
GROUP BY REGION
ORDER BY TOTAL_STATION_REGION DESC


-- ============================================================
-- Q16. TOTAL CHARGING STATIONS BY STATION TYPE
-- ============================================================

-- Purpose:
-- Compare the number of charging stations
-- across different station types.

SELECT
STATIONTYPE,
COUNT(*) AS TOTAL_STATIONS
FROM CHARGING_STATIONS
GROUP BY STATIONTYPE
ORDER BY TOTAL_STATIONS DESC


-- ============================================================
-- Q17. TOTAL CHARGING STATIONS BY STATUS
-- ============================================================

-- Purpose:
-- Analyze the current status of charging stations
-- in the network.

SELECT 
STATUS,
COUNT(*) AS TOTAL_STATIONS
FROM CHARGING_STATIONS
GROUP BY STATUS
ORDER BY TOTAL_STATIONS DESC


-- ============================================================
-- Q18. TOTAL CHARGERS BY STATE
-- ============================================================

-- Purpose:
-- Compare the total number of individual chargers
-- available across different states.

SELECT 
STATE,
SUM(TOTALCHARGERS) AS TOTAL_CHARGERS
FROM CHARGING_STATIONS
GROUP BY STATE
ORDER BY TOTAL_CHARGERS DESC


-- ============================================================
-- Q19. AVERAGE CHARGERS PER STATION BY STATE
-- ============================================================

-- Purpose:
-- Compare the average number of chargers available
-- at each charging station across different states.

SELECT 
STATE,
AVG(TOTALCHARGERS) AS AVG_CHARGERS
FROM CHARGING_STATIONS
GROUP BY STATE
ORDER BY AVG_CHARGERS DESC


-- ============================================================
-- Q20. HIGH EV REGISTRATIONS BUT LOW CHARGING INFRASTRUCTURE
-- ============================================================

-- Purpose:
-- Identify states where EV registrations are high
-- but charging infrastructure is relatively low.

WITH STATE_DATA AS
(
    SELECT
        R.STATE,
        SUM(R.EV_REGISTRATIONS) AS TOTAL_EV_REGISTRATIONS,
        COUNT(S.STATIONID) AS TOTAL_CHARGING_STATIONS
    FROM EV_REGISTRATIONS R
    LEFT JOIN CHARGING_STATIONS S
        ON R.STATE = S.STATE
    GROUP BY R.STATE
),
AVERAGES AS
(
    SELECT
        AVG(TOTAL_EV_REGISTRATIONS) AS AVG_EV_REGISTRATIONS,
        AVG(TOTAL_CHARGING_STATIONS) AS AVG_CHARGING_STATIONS
    FROM STATE_DATA
)
SELECT
    STATE,
    TOTAL_EV_REGISTRATIONS,
    TOTAL_CHARGING_STATIONS
FROM STATE_DATA
CROSS JOIN AVERAGES
WHERE TOTAL_EV_REGISTRATIONS > AVG_EV_REGISTRATIONS
  AND TOTAL_CHARGING_STATIONS < AVG_CHARGING_STATIONS
ORDER BY TOTAL_EV_REGISTRATIONS DESC;



-- ============================================================
-- Q21. STATES WITH THE HIGHEST TOTAL EV UNITS SOLD
-- ============================================================

-- Purpose:
-- Identify which states have sold the highest
-- number of EV units.

SELECT
STATE,
SUM(UNITSSOLD) AS TOTAL_EV_SOLD
FROM EV_SALES
GROUP BY STATE
ORDER BY TOTAL_EV_SOLD DESC



-- ============================================================
-- Q22. STATES WITH THE HIGHEST ESTIMATED EV SALES VALUE
-- ============================================================

-- Purpose:
-- Identify which states generate the highest
-- estimated sales value from EV sales.

SELECT
STATE,
SUM(ESTIMATEDSALESVALUE) AS TOTAL_ESTIMATED_VALUE
FROM EV_SALES
GROUP BY STATE
ORDER BY TOTAL_ESTIMATED_VALUE DESC


-- ============================================================
-- Q23. VEHICLE SEGMENTS WITH THE HIGHEST SALES VOLUME
-- ============================================================

-- Purpose:
-- Identify which vehicle segments have the
-- highest number of EV units sold.

SELECT 
VEHICLESEGMENT,
SUM(UNITSSOLD) AS TOTAL_UNIT_SOLD
FROM EV_SALES
GROUP BY VehicleSegment
ORDER BY TOTAL_UNIT_SOLD DESC



-- ============================================================
-- Q24. HIGH EV SALES BUT LOW CHARGING INFRASTRUCTURE
-- ============================================================

-- Purpose:
-- Identify states where EV sales are high
-- but charging infrastructure is comparatively low.

WITH SALES AS
(
    SELECT
        STATEID,
        STATE,
        SUM(UNITSSOLD) AS TOTAL_UNIT_SOLD
    FROM EV_SALES
    GROUP BY STATEID, STATE
),
STATIONS AS
(
    SELECT
        STATEID,
        STATE,
        COUNT(*) AS TOTAL_CHARGING_STATIONS
    FROM CHARGING_STATIONS
    GROUP BY STATEID, STATE
),
DATAA AS
(
    SELECT
        S.STATE,
        S.TOTAL_UNIT_SOLD,
        C.TOTAL_CHARGING_STATIONS
    FROM SALES S
    LEFT JOIN STATIONS C
        ON S.STATEID = C.STATEID
),
AVERAGE_DATA AS
(
    SELECT
        AVG(TOTAL_UNIT_SOLD) AS AVG_SALES,
        AVG(TOTAL_CHARGING_STATIONS) AS AVG_CHARGING_STATIONS
    FROM DATAA
)
SELECT
    STATE,
    TOTAL_UNIT_SOLD,
    TOTAL_CHARGING_STATIONS
FROM DATAA
CROSS JOIN AVERAGE_DATA
WHERE TOTAL_UNIT_SOLD > AVG_SALES
  AND TOTAL_CHARGING_STATIONS < AVG_CHARGING_STATIONS
ORDER BY TOTAL_UNIT_SOLD DESC;


-- ============================================================
-- Q24. EV REGISTRATIONS PER CHARGING STATION
-- ============================================================

-- Purpose:
-- Identify states where each charging station
-- supports a high number of EV registrations.


WITH REGISTER AS (
SELECT 
STATE,
SUM(EV_REGISTRATIONS) AS TOTAL_EV_REGISTRATION
FROM EV_REGISTRATIONS
GROUP BY STATE 
),
STATIONS AS (
SELECT 
STATE,
COUNT(*) AS TOTAL_CHARGING_STATIONS
FROM CHARGING_STATIONS
GROUP BY STATE
)

SELECT 
R.STATE,
R.TOTAL_EV_REGISTRATION,
S.TOTAL_CHARGING_STATIONS,
CAST(R.TOTAL_EV_REGISTRATION AS DECIMAL(10,2)) / NULLIF(S.TOTAL_CHARGING_STATIONS,0) AS EV_REGISTRATIONS_PER_STATION
FROM REGISTER R
JOIN STATIONS S
ON R.STATE = S.STATE
ORDER BY EV_REGISTRATIONS_PER_STATION DESC


-- ============================================================
-- Q25. EV SALES PER CHARGING STATION
-- ============================================================

-- Purpose:
-- Identify states where each charging station
-- is associated with a high number of EV sales.


WITH SALES AS (
SELECT 
STATE,
SUM(UNITSSOLD) AS TOTAL_UNIT_SOLD
FROM EV_SALES
GROUP BY STATE
),
STATIONSS AS (
SELECT 
STATE,
COUNT(*) AS TOTAL_CHARGING_STATIONSS
FROM CHARGING_STATIONS
GROUP BY STATE
)
SELECT 
S.STATE,
S.TOTAL_UNIT_SOLD,
SS.TOTAL_CHARGING_STATIONSS,
CAST(S.TOTAL_UNIT_SOLD AS DECIMAL(10,2))/NULLIF(SS.TOTAL_CHARGING_STATIONSS ,0) AS EV_SALES_PER_CHARGING_STATION
FROM SALES S
JOIN STATIONSS SS 
ON S.STATE = SS.STATE
ORDER BY  EV_SALES_PER_CHARGING_STATION DESC


-- ============================================================
-- Q26. HIGHEST CHARGING STATION UTILIZATION
-- ============================================================

-- Purpose:
-- Identify charging stations that handle the highest
-- number of charging sessions relative to their
-- available chargers.


WITH SESSIONN AS (
SELECT 
STATIONID,
COUNT(*) AS TOTAL_CHARGING_SESSIONS
FROM CHARGING_SESSIONS
GROUP BY STATIONID
),

CHARGERS AS (

SELECT 
STATIONID,
STATIONNAME,
SUM(TOTALCHARGERS) AS TOTAL_CHARGERS
FROM CHARGING_STATIONS
GROUP BY STATIONID , STATIONNAME
)

SELECT 
SE.STATIONID,
CH.STATIONNAME,
SE.TOTAL_CHARGING_SESSIONS,
CH.TOTAL_CHARGERS,
CAST(SE.TOTAL_CHARGING_SESSIONS AS DECIMAL (10,2)) / NULLIF(CH.TOTAL_CHARGERS,0) AS UTILIZATION_FOR_STATION
FROM SESSIONN SE
JOIN CHARGERS CH
ON SE.StationID = CH.StationID
ORDER BY UTILIZATION_FOR_STATION DESC



-- ============================================================
-- Q27. STATES WITH HIGH EV SALES AND CHARGING REVENUE
-- ============================================================

-- Purpose:
-- Identify states that contribute significantly to
-- both EV sales and charging revenue.


WITH UNITS AS (

SELECT 
STATE,
SUM(UNITSSOLD) AS TOTAL_EV_UNITSOLD
FROM EV_SALES
GROUP BY STATE
),

REVENUE AS (

SELECT
STATE,
SUM(AMOUNT) AS TOTAL_CHARGING_REVENUE
FROM CHARGING_SESSIONS
GROUP BY STATE
),

STATE_DATA AS (

SELECT 
U.STATE,
U.TOTAL_EV_UNITSOLD,
R.TOTAL_CHARGING_REVENUE
FROM UNITS U 
JOIN REVENUE R
ON U.STATE = R.STATE
), 

AVERAGE AS (

SELECT 
AVG(TOTAL_EV_UNITSOLD) AS AVG_EV_SALES,
AVG(TOTAL_CHARGING_REVENUE) AS AVG_CHARGING_REVENUE
FROM STATE_DATA
)

SELECT 
SD.STATE,
SD.TOTAL_EV_UNITSOLD,
SD.TOTAL_CHARGING_REVENUE
FROM STATE_DATA SD
CROSS JOIN AVERAGE A
WHERE SD.TOTAL_EV_UNITSOLD > A.AVG_EV_SALES AND SD.TOTAL_CHARGING_REVENUE > A.AVG_CHARGING_REVENUE
ORDER BY SD.TOTAL_EV_UNITSOLD DESC


-- ============================================================
-- Q28. HIGH EV ADOPTION, HIGH EV SALES, LOW INFRASTRUCTURE
-- ============================================================

-- Purpose:
-- Identify states that have high EV adoption and
-- high EV sales but comparatively low charging
-- infrastructure.



WITH ADOPTION AS (

SELECT
STATE,
SUM(EV_Registrations) AS TOTAL_EV_REGISTRATIONS
FROM EV_REGISTRATIONS
GROUP BY STATE
),

EVV_SALES AS (

SELECT
STATE,
SUM(UNITSSOLD) AS TOTAL_UNITSOLD
FROM EV_SALES
GROUP BY STATE
),

CHARGE AS (

SELECT 
STATE,
COUNT(*) AS TOTAL_STATIONS
FROM CHARGING_STATIONS
GROUP BY STATE

),

DATAA AS (

SELECT
A.STATE,
A.TOTAL_EV_REGISTRATIONS,
ES.TOTAL_UNITSOLD,
C.TOTAL_STATIONS
FROM ADOPTION A
JOIN EVV_SALES ES
      ON A.STATE = ES.STATE
JOIN CHARGE C
      ON A.STATE = C.STATE

),
AVERAGE AS 
(
SELECT 
AVG(TOTAL_EV_REGISTRATIONS) AS AVG_TOTAL_EV_REGISTRATIONS,
AVG(TOTAL_UNITSOLD) AS AVG_TOTAL_UNITSOLD,
AVG(TOTAL_STATIONS) AS AVG_TOTAL_STATIONS
FROM DATAA
)



SELECT
D.STATE,
D.TOTAL_EV_REGISTRATIONS,
D.TOTAL_UNITSOLD,
D.TOTAL_STATIONS
FROM DATAA D
CROSS JOIN AVERAGE AA
WHERE D.TOTAL_EV_REGISTRATIONS > AVG_TOTAL_EV_REGISTRATIONS AND D.TOTAL_UNITSOLD > AVG_TOTAL_UNITSOLD AND D.TOTAL_STATIONS < AVG_TOTAL_STATIONS
ORDER BY D.TOTAL_EV_REGISTRATIONS DESC



-- ============================================================
-- Q29. POTENTIAL NEED FOR ADDITIONAL CHARGING INFRASTRUCTURE
-- ============================================================

-- Purpose:
-- Identify states where EV demand and charging activity
-- are high compared with the available charging
-- infrastructure.




WITH TOTAL_EV AS (

SELECT
STATE,
SUM(EV_Registrations) AS TOTAL_EV_REGISTRATIONS
FROM EV_REGISTRATIONS
GROUP BY STATE
),

EVVV_SALES AS (

SELECT
STATE,
SUM(UNITSSOLD) AS TOTAL_UNITSOLD
FROM EV_SALES
GROUP BY STATE
),

EV_CHARGE AS (

SELECT 
STATE,
COUNT(*) AS TOTAL_STATIONS
FROM CHARGING_STATIONS
GROUP BY STATE

),

EV_SESSION AS (

SELECT
STATE,
COUNT(*) AS TOTAL_CHARGING_SESSIONS
FROM CHARGING_SESSIONS
GROUP BY STATE

),

FINAL AS (

SELECT 
T.STATE,
T.TOTAL_EV_REGISTRATIONS,
EVV.TOTAL_UNITSOLD,
C.TOTAL_STATIONS,
EVS.TOTAL_CHARGING_SESSIONS
FROM TOTAL_EV T
JOIN  EVVV_SALES EVV
      ON T.STATE = EVV.STATE
JOIN  EV_CHARGE C
       ON T.STATE = C.STATE
JOIN  EV_SESSION EVS
       ON T.STATE = EVS.STATE

),

REPORT_AVERAGE AS (

SELECT 
AVG(TOTAL_EV_REGISTRATIONS) AS AVG_TOTAL_EV_REGISTRATIONS,
AVG(TOTAL_UNITSOLD) AS AVG_TOTAL_INITSOLD,
AVG(TOTAL_STATIONS) AS AVG_TOTAL_STATIONS,
AVG(TOTAL_CHARGING_SESSIONS) AS AVG_TOTAL_CHARGING_SESSIONS
FROM FINAL

)

SELECT 
STATE,
F.TOTAL_EV_REGISTRATIONS,
F.TOTAL_UNITSOLD,
F.TOTAL_STATIONS,
F.TOTAL_CHARGING_SESSIONS
FROM FINAL F  
CROSS JOIN REPORT_AVERAGE RA
WHERE F.TOTAL_EV_REGISTRATIONS > RA.AVG_TOTAL_EV_REGISTRATIONS AND F.TOTAL_UNITSOLD > RA.AVG_TOTAL_INITSOLD AND F.TOTAL_CHARGING_SESSIONS > RA.AVG_TOTAL_CHARGING_SESSIONS AND F.TOTAL_STATIONS < RA.AVG_TOTAL_STATIONS
ORDER BY F.TOTAL_EV_REGISTRATIONS DESC














SELECT * FROM CHARGING_STATIONS 
SELECT * FROM EV_REGISTRATIONS
SELECT * FROM EV_SALES
SELECT * FROM CHARGING_SESSIONS





