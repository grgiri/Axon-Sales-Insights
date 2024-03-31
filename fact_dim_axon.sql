-- Creating DimCustomer Table --

CREATE TABLE  DimCustomer  (
	customerKey INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    customerNumber INT ,
    customerName VARCHAR(50) ,
    contactLastName VARCHAR(50) ,
    contactFirstName VARCHAR(50),
    phone VARCHAR(20),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(20),
    country VARCHAR(50),
    salesRepEmployeeNumber INT,
    creditLimit DECIMAL(10,2)
    );
    
    -- Inserting Values into DimCustomer Table -- 
    
    INSERT INTO DimCustomer(
    customerNumber ,customerName ,contactLastName ,contactFirstName ,phone,
    addressLine1 ,addressLine2 ,city ,state ,postalCode ,country ,salesRepEmployeeNumber ,creditLimit
    )
    select * from customers;
    
   -- Creating DimEmployees --
   
   CREATE TABLE DimEmployees (
    EmployeeKey INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeNumber INT,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Extension VARCHAR(255),
    Email VARCHAR(255),
    OfficeCode INT,
    ReportsTo INT,
    JobTitle VARCHAR(255)
    );
    
    ALTER TABLE DimEmployees AUTO_INCREMENT = 10;
    
    -- Inserting Values into DimEmployees Table --
    
    INSERT INTO DimEmployees(
    EmployeeNumber,LastName ,FirstName ,Extension ,Email ,OfficeCode ,ReportsTo ,JobTitle )
    SELECT * from employees;
    
 
 
 -- Creating DimOffices --
 
 CREATE TABLE DimOffices (
    OfficeKey INT AUTO_INCREMENT PRIMARY KEY,
    OfficeCode VARCHAR(10),
    City VARCHAR(50),
    Phone VARCHAR(20),
    AddressLine1 VARCHAR(100),
    AddressLine2 VARCHAR(100),
    State VARCHAR(50),
    Country VARCHAR(50),
    PostalCode VARCHAR(20),
    Territory VARCHAR(50)
    );
    ALTER TABLE DimOffices AUTO_INCREMENT = 20;
    
  -- Inserting Values into DimOffices Table --  
    
 INSERT INTO DimOffices(
    officeCode, City, Phone, AddressLine1, AddressLine2, State, Country, PostalCode, Territory )
    SELECT * from offices;
    
-- Creating DimProducts --

CREATE TABLE DimProducts (
    ProductKey INT AUTO_INCREMENT PRIMARY KEY, 
    ProductCode VARCHAR(15),
    ProductName VARCHAR(255),
    ProductLine VARCHAR(50),
    ProductScale VARCHAR(10),
    ProductVendor VARCHAR(50),
    ProductDescription TEXT,
    QuantityInStock INT,
    BuyPrice DECIMAL(10, 2),
    MSRP DECIMAL(10, 2)
);
ALTER TABLE DimProducts AUTO_INCREMENT = 200;

-- Inserting Values into DimProducts Table --

INSERT INTO DimProducts (   
ProductCode ,ProductName ,ProductLine ,ProductScale ,ProductVendor ,ProductDescription ,
    QuantityInStock ,BuyPrice ,MSRP)
select productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP
from products;

-- Creating DimPayments -- 

CREATE TABLE DimPayments (
	PaymentKey INT AUTO_INCREMENT PRIMARY KEY,
    customerKey INT ,
	customerNumber int,
	checkNumber varchar(50),  
	paymentDate date ,
	amount decimal(10,2),
    FOREIGN KEY(customerKey) REFERENCES DimCustomer(customerKey)
    );
    ALTER TABLE  DimPayments AUTO_INCREMENT = 500;
    
    -- Inserting Values into DimPayments Table --
    
INSERT INTO DimPayments (customerKey,customerNumber,checkNumber ,paymentDate ,amount)
select dc.customerKey, p.customerNumber, p.checkNumber, p.paymentDate, p.amount 
from payments p
left join DimCustomer dc
on p.customerNumber = dc.customerNumber ;

 -- Creating FactOrders Table --
 
 CREATE TABLE FactOrders (
    OrderKey INT AUTO_INCREMENT PRIMARY KEY,
    OrderNumber INT,
    ProductCode VARCHAR(255),
    QuantityOrdered INT,
    PriceEach DECIMAL(10,2),
    OrderLineNumber INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    Status VARCHAR(255),
    Comments TEXT,
    customerNumber INT,
    customerKey INT,
    EmployeeKey INT,
    ProductKey INT,
    OfficeKey INT,    
    BuyPrice DECIMAL(10, 2),
    MSRP DECIMAL(10, 2) ,   
    FOREIGN KEY(customerKey) REFERENCES DimCustomer(customerKey),
    FOREIGN KEY(EmployeeKey) REFERENCES DimEmployees(EmployeeKey),
    FOREIGN KEY(ProductKey) REFERENCES DimProducts(ProductKey),
    FOREIGN KEY(OfficeKey) REFERENCES DimOffices(OfficeKey)
  );  
  ALTER TABLE FactOrders AUTO_INCREMENT = 500000;
  
  -- Inserting Values into FactOrders Table --
  
  insert into FactOrders(
  OrderNumber, ProductCode, QuantityOrdered, PriceEach, OrderLineNumber,
  OrderDate, RequiredDate, ShippedDate, Status, Comments,customerNumber, customerKey,
  EmployeeKey,ProductKey,OfficeKey, BuyPrice,MSRP)
    select od.orderNumber,od.productCode, od.quantityOrdered, od.priceEach, od.orderLineNumber,
		   o.orderDate, o.requiredDate, o.shippedDate, o.status, o.comments,O.customerNumber,
           dc.customerKey,de.EmployeeKey,dp.ProductKey,do.OfficeKey,
           p.buyPrice,p.MSRP 
    from orderdetails od
    left outer join orders o
    on od.orderNumber =o.orderNumber 
    left outer join DimCustomer dc
    on o.customerNumber = dc.customerNumber
    left outer join DimEmployees de
    on dc.salesRepEmployeeNumber = de.EmployeeNumber
    left outer join DimOffices do
    on de.OfficeCode = do.OfficeCode
    left outer join DimProducts dp
    on od.productCode = dp.ProductCode    
    left outer join products p
    on p.productCode = od.productCode;
    
    select * from factorders;
   
    
     
    
  
 
 
 
 
 