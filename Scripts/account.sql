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
