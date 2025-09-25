create database revision;

use  revision;

-- customer table --
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

INSERT INTO Customer (CustomerID, Name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

select * from Customer ;

--order table--
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50)
);

INSERT INTO Orders (OrderID, CustomerID, Product) VALUES
(101, 1, 'Laptop'),
(102, 2, 'Phone'),
(103, 2, 'Tablet'),
(104, 5, 'Monitor');  -- CustomerID 5 does not exist in Customer table

select * from Orders;
-- inner join--
SELECT C.CustomerID, C.Name, O.OrderID, O.Product FROM Customer C
INNER JOIN Orders O ON  C.CustomerID = O.CustomerID;

--left join--
SELECT C.CustomerID, C.Name, O.OrderID, O.Product FROM Customer C
left JOIN Orders O ON  C.CustomerID = O.CustomerID;

--right join
select C.CustomerId,c.name,o.orderid,o.product from customer c
right join orders o on c.CustomerID = o.CustomerID;

--full outer join--
select C.CustomerId,c.name,o.orderid,o.product from customer c
full outer join orders o on c.CustomerID = o.CustomerID;

--left anti join--
SELECT C.CustomerID, C.Name, O.OrderID, O.Product FROM Customer C
left JOIN Orders O ON  C.CustomerID = O.CustomerID where o.CustomerID is NULL;

--right anti join--
SELECT O.CustomerID, O.OrderID, O.Product FROM Customer C
right JOIN Orders O ON  C.CustomerID = O.CustomerID where c.CustomerID is NULL;

--cross join--
SELECT C.CustomerID, C.Name, O.OrderID, O.Product FROM Customer C
cross JOIN Orders O 



-- Create procedure to get orders for a customer
CREATE PROCEDURE GetCustomerOrders1
    @custID INT  -- input parameter
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if customer exists
    IF EXISTS (SELECT 1 FROM Customer WHERE CustomerID = @custID)
    BEGIN
        -- Return orders for this customer
        SELECT 
            O.OrderID,
            O.Product
        FROM 
            Orders O
        WHERE 
            O.CustomerID = @custID;
    END
    ELSE
    BEGIN
        -- Customer does not exist
        SELECT 'Customer with ID ' + CAST(@custID AS NVARCHAR(10)) + ' does not exist.' AS Message;
    END
END
GO

EXEC GetCustomerOrders @custID = 2;

Exec  GetCustomerOrders @custID = 4;

EXEC GetCustomerOrders @custID = 10;