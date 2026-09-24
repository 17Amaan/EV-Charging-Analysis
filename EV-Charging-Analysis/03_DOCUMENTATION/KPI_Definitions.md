# KPI Definitions

## 1. Total EV Registrations

Measures the total number of EV registrations recorded
for a state.

Formula:

Total EV Registrations = SUM(EV_Registrations)

---

## 2. Total EV Units Sold

Measures the total number of EVs sold.

Formula:

Total EV Units Sold = SUM(UnitsSold)

---

## 3. Total Charging Stations

Measures the number of charging stations available.

Formula:

Total Charging Stations = COUNT(StationID)

---

## 4. Total Charging Revenue

Measures the total revenue generated from charging sessions.

Formula:

Total Charging Revenue = SUM(Amount)

---

## 5. Total Charging Sessions

Measures the number of charging sessions recorded.

Formula:

Total Charging Sessions = COUNT(SessionID)

---

## 6. EV Registrations per Charging Station

Measures how many EV registrations are associated
with each charging station.

Formula:

EV Registrations per Charging Station
=
Total EV Registrations / Total Charging Stations

---

## 7. EV Sales per Charging Station

Measures EV sales relative to available charging
infrastructure.

Formula:

EV Sales per Charging Station
=
Total EV Units Sold / Total Charging Stations

---

## 8. Charging Station Utilization

Measures charging-session activity relative to the
number of available chargers.

Formula:

Charging Station Utilization
=
Total Charging Sessions / Total Chargers

---

## 9. Average EV Penetration

Measures the average percentage of total vehicle
registrations represented by EVs.

Formula:

Average EV Penetration
=
AVG(EV_Penetration_Pct)