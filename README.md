# PlatinumRx Data Analyst Assignment

## Project Structure

```
Data_Analyst_Assignment/
│
├── SQL/
│   ├── 01_Hotel_Schema_Setup.sql
│   ├── 02_Hotel_Queries.sql
│   ├── 03_Clinic_Schema_Setup.sql
│   └── 04_Clinic_Queries.sql
│
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx
│
├── Python/
│   ├── 01_Time_Converter.py
│   └── 02_Remove_Duplicates.py
│
└── README.md
```

---

## Phase 1: SQL Proficiency

### Tools Used
- SQLite via VS Code (SQLite extension)

### Hotel Management System (Part A)
- **Q1** — Get user_id and last booked room_no for every user using a correlated subquery with MAX(booking_date)
- **Q2** — Get booking_id and total billing amount for November 2021 by joining bookings, booking_commercials and items
- **Q3** — Get bill_id and bill amount for October 2021 bills greater than 1000 using HAVING clause
- **Q4** — Determine most and least ordered item per month in 2021 using GROUP BY and ORDER BY
- **Q5** — Find customer with second highest bill per month in 2021 using a subquery with HAVING

### Clinic Management System (Part B)
- **Q1** — Revenue per sales channel using GROUP BY sales_channel and SUM
- **Q2** — Top 10 most valuable customers using ORDER BY total spend DESC and LIMIT 10
- **Q3** — Month wise revenue, expense, profit and status using two subqueries joined together
- **Q4** — Most profitable clinic per city using GROUP BY city and HAVING
- **Q5** — Second least profitable clinic per state using ROW_NUMBER() window function

---

## Phase 2: Spreadsheet Proficiency

### Tools Used
- Google Sheets

### Approach
- **Q1** — Used INDEX/MATCH to populate ticket_created_at in feedbacks sheet using cms_id as the common key
- **Q2a** — Added same_day helper column using INT() to compare date parts, then COUNTIFS per outlet
- **Q2b** — Added same_hour helper column using INT() and HOUR() to compare both date and hour, then COUNTIFS per outlet

---

## Phase 3: Python Proficiency

### Tools Used
- Python 3.x

### Approach
- **Q1 (Time Converter)** — Used integer division (//) for hours and modulo (%) for remaining minutes with edge case handling
- **Q2 (Remove Duplicates)** — Used a loop to iterate through each character and append to result string only if not already present

---

## Assumptions
- SQL queries use SQLite compatible syntax (strftime for date functions)
- Sample data from the assignment PDF is used for testing
- Spreadsheet formulas work on both Excel and Google Sheets
