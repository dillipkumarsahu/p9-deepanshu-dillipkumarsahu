-- Create the CITIES table
CREATE TABLE CITIES (
  CITY CHAR(20),
  STATE CHAR(20),
  PRIMARY KEY (CITY)
);

-- Create the WAREHOUSES table
CREATE TABLE WAREHOUSES (
  WID INTEGER,
  WNAME CHAR(30),
  LOCATION CHAR(20),
  CITY CHAR(20),
  PRIMARY KEY (WID),
  FOREIGN KEY (CITY) REFERENCES CITIES(CITY)
);

-- Create the STORES table
CREATE TABLE STORES (
  SID INTEGER,
  STORE_NAME CHAR(20),
  LOCATION_CITY CHAR(20),
  PRIMARY KEY (SID),
  FOREIGN KEY (LOCATION_CITY) REFERENCES CITIES(CITY)
);

-- Create the CUSTOMER table
CREATE TABLE CUSTOMER (
  CNO INTEGER,
  CNAME CHAR(50),
  ADDR VARCHAR(50),
  CU_CITY CHAR(20),
  PRIMARY KEY (CNO),
  FOREIGN KEY (CU_CITY) REFERENCES CITIES(CITY)
);

-- Create the ORDERS table
CREATE TABLE ORDERS (
  ONO INT,
  ODATE DATE,
  CNO INTEGER,
  PRIMARY KEY (ONO),
  FOREIGN KEY (CNO) REFERENCES CUSTOMER(CNO)
);

-- Create the ITEMS table
CREATE TABLE ITEMS (
  ITEMNO INTEGER,
  DESCRIPTION TEXT,
  WEIGHT DECIMAL(5,2),
  COST DECIMAL(5,2),
  PRIMARY KEY (ITEMNO)
);

-- Create the ORDER_ITEMS table for the M to M relationship between ITEMS and ORDERS
CREATE TABLE ORDER_ITEMS (
  ONO INT,
  ITEMNO INTEGER,
  ORDERED_QUANTITY INTEGER,
  PRIMARY KEY (ONO, ITEMNO),
  FOREIGN KEY (ONO) REFERENCES ORDERS(ONO),
  FOREIGN KEY (ITEMNO) REFERENCES ITEMS(ITEMNO)
);

-- Create the STORE_ITEMS table for the M to M relationship between STORES and ITEMS
CREATE TABLE STORE_ITEMS (
  SID INTEGER,
  ITEMNO INTEGER,
  QUANTITY INTEGER,
  PRIMARY KEY (SID, ITEMNO),
  FOREIGN KEY (SID) REFERENCES STORES(SID),
  FOREIGN KEY (ITEMNO) REFERENCES ITEMS(ITEMNO)
);
