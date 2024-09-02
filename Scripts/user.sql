CREATE PROCEDURE sp_LoginUser
    @Username NVARCHAR(50),
    @Password NVARCHAR(256)
AS
BEGIN
    SELECT UserId FROM Users WHERE Username = @Username AND PasswordHash = @Password;
END
