CREATE PROCEDURE sp_GetAllCustomers
AS
BEGIN
    SELECT * FROM Customers;
END

CREATE PROCEDURE sp_GetCustomerById
    @CustomerId INT
AS
BEGIN
    SELECT * FROM Customers WHERE CustomerId = @CustomerId;
END

CREATE PROCEDURE sp_AddCustomer
    @Name NVARCHAR(100),
    @Address NVARCHAR(255),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(15)
AS
BEGIN
    INSERT INTO Customers (Name, Address, Email, Phone) 
    VALUES (@Name, @Address, @Email, @Phone);
END

CREATE PROCEDURE sp_UpdateCustomer
    @CustomerId INT,
    @Name NVARCHAR(100),
    @Address NVARCHAR(255),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(15)
AS
BEGIN
    UPDATE Customers
    SET Name = @Name, Address = @Address, Email = @Email, Phone = @Phone
    WHERE CustomerId = @CustomerId;
END

CREATE PROCEDURE sp_DeleteCustomer
    @CustomerId INT
AS
BEGIN
    DELETE FROM Customers WHERE CustomerId = @CustomerId;
END
