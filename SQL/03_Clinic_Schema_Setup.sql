CREATE TABLE IF NOT EXISTS clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(100),
    present_state VARCHAR(100),
    country VARCHAR(100)
);

INSERT INTO clinics VALUES
('cnc-0100001', 'XYZ clinic', 'lorem', 'ipsum', 'dolor');

CREATE TABLE IF NOT EXISTS customer (
    uid VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    mobile VARCHAR(20)
);

INSERT INTO customer VALUES
('bk-09f3e-95hj', 'Jon Doe', '97XXXXXXXX');

CREATE TABLE IF NOT EXISTS clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50)
);

INSERT INTO clinic_sales VALUES
('ord-00100-00100', 'bk-09f3e-95hj', 'cnc-0100001', 24999, '2021-09-23 12:03:22', 'sodat');

CREATE TABLE IF NOT EXISTS expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description VARCHAR(255),
    amount DECIMAL(10,2),
    datetime DATETIME
);

INSERT INTO expenses VALUES
('exp-0100-00100', 'cnc-0100001', 'first-aid supplies', 557, '2021-09-23 07:36:48');




