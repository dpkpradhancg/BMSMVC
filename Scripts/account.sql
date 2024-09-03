CREATE PROCEDURE sp_GetAllAccounts
AS
BEGIN
    SELECT * FROM Accounts;
END

CREATE PROCEDURE sp_GetAccountById
    @AccountId INT
AS
BEGIN
    SELECT * FROM Accounts WHERE AccountId = @AccountId;
END

CREATE PROCEDURE sp_AddAccount
    @AccountNumber NVARCHAR(20),
    @CustomerId INT,
    @Balance DECIMAL(18, 2),
    @AccountType NVARCHAR(50)
AS
BEGIN
    INSERT INTO Accounts (AccountNumber, CustomerId, Balance, AccountType)
    VALUES (@AccountNumber, @CustomerId, @Balance, @AccountType);
END

CREATE PROCEDURE sp_UpdateAccount
    @AccountId INT,
    @AccountNumber NVARCHAR(20),
    @CustomerId INT,
    @Balance DECIMAL(18, 2),
    @AccountType NVARCHAR(50)
AS
BEGIN
    UPDATE Accounts
    SET AccountNumber = @AccountNumber, CustomerId = @CustomerId, Balance = @Balance, AccountType = @AccountType
    WHERE AccountId = @AccountId;
END

CREATE PROCEDURE sp_DeleteAccount
    @AccountId INT
AS
BEGIN
    DELETE FROM Accounts WHERE AccountId = @AccountId;
END



CREATE PROCEDURE sp_UpdateBalanceForCustomerAccounts
    @CustomerId INT
AS
BEGIN
    DECLARE @AccountId INT;
    DECLARE @Balance DECIMAL(18, 2);
 
    -- Declare a cursor to iterate over each account for the given customer
    DECLARE AccountCursor CURSOR FOR
    SELECT AccountId, Balance
    FROM Accounts
    WHERE CustomerId = @CustomerId;
 
    -- Open the cursor
    OPEN AccountCursor;
 
    -- Fetch the first row into the variables
    FETCH NEXT FROM AccountCursor INTO @AccountId, @Balance;
 
    -- Loop through the cursor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Update the balance by subtracting 100
        UPDATE Accounts
        SET Balance = @Balance - 100
        WHERE AccountId = @AccountId;
 
        -- Fetch the next row
        FETCH NEXT FROM AccountCursor INTO @AccountId, @Balance;
    END;
 
    -- Close and deallocate the cursor
    CLOSE AccountCursor;
    DEALLOCATE AccountCursor;
END;


CREATE PROCEDURE sp_UpdateBalanceForCustomerAccounts_Add100
    @CustomerId INT
AS
BEGIN
    DECLARE @AccountId INT;
    DECLARE @AccountNumber NVARCHAR(20);
    DECLARE @Balance DECIMAL(18, 2);
    DECLARE @AccountType NVARCHAR(50);
 
    -- Declare a cursor to iterate over each account for the given customer
    DECLARE AccountCursor CURSOR FOR
    SELECT AccountId, AccountNumber, Balance, AccountType
    FROM Accounts
    WHERE CustomerId = @CustomerId;
 
    -- Open the cursor
    OPEN AccountCursor;
 
    -- Fetch the first row into the variables
    FETCH NEXT FROM AccountCursor INTO @AccountId, @AccountNumber, @Balance, @AccountType;
 
    -- Loop through the cursor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Update the balance by adding 100
        SET @Balance = @Balance + 100;
 
        -- Call the sp_UpdateAccount stored procedure to update the account
        EXEC sp_UpdateAccount 
            @AccountId = @AccountId, 
            @AccountNumber = @AccountNumber, 
            @CustomerId = @CustomerId, 
            @Balance = @Balance, 
            @AccountType = @AccountType;
 
        -- Fetch the next row
        FETCH NEXT FROM AccountCursor INTO @AccountId, @AccountNumber, @Balance, @AccountType;
    END;
 
    -- Close and deallocate the cursor
    CLOSE AccountCursor;
    DEALLOCATE AccountCursor;
END;