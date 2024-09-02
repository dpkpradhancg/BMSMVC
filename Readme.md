# Bank Management System

## Overview

This ASP.NET Core MVC application is designed for managing customers and accounts in a banking system. It uses stored procedures for all CRUD operations and is configured to connect to a SQL Server database using `appsettings.json` for configuration.

## Project Structure

The project is organized into several folders and files, each serving a specific purpose.

### Root Directory

- **`appsettings.json`**: Contains configuration settings, including the connection string for the SQL Server database.
- **`Program.cs`**: Configures services and the request pipeline for the application.

### Controllers

- **`/Controllers/CustomerController.cs`**: Manages customer-related operations (CRUD) and interacts with the database using stored procedures.
- **`/Controllers/AccountController.cs`**: Manages account-related operations (CRUD) and interacts with the database using stored procedures.
- **`/Controllers/UserController.cs`**: Manages user authentication and login functionality.

### Models

- **`/Models/Customer.cs`**: Represents the customer entity with properties such as `CustomerId`, `Name`, `Address`, `Email`, and `Phone`.
- **`/Models/Account.cs`**: Represents the account entity with properties such as `AccountId`, `AccountNumber`, `CustomerId`, `Balance`, `AccountType`, and `CreatedDate`.
- **`/Models/User.cs`**: Represents the user entity with properties for login functionality.

### Views

- **`/Views/Customer/Index.cshtml`**: Displays a list of all customers.
- **`/Views/Customer/Create.cshtml`**: Form for creating a new customer.
- **`/Views/Customer/Edit.cshtml`**: Form for editing an existing customer.
- **`/Views/Customer/Delete.cshtml`**: Confirmation page for deleting a customer.

- **`/Views/Account/Index.cshtml`**: Displays a list of all accounts.
- **`/Views/Account/Create.cshtml`**: Form for creating a new account.
- **`/Views/Account/Edit.cshtml`**: Form for editing an existing account.
- **`/Views/Account/Delete.cshtml`**: Confirmation page for deleting an account.

- **`/Views/User/Login.cshtml`**: Form for user login.

### SQL Scripts

- **`/SQLScripts/StoredProcedures.sql`**: Contains SQL scripts for creating and managing stored procedures used by the application.

## Configuration

1. **`appsettings.json`**: Add your SQL Server connection string in the `"ConnectionStrings"` section.

    ```json
    {
      "ConnectionStrings": {
        "DefaultConnection": "Server=your_server_name;Database=your_database_name;User Id=your_username;Password=your_password;"
      }
    }
    ```

2. **`Program.cs`**: Ensure that the connection string is correctly read and used to configure the application's services.

## Setup and Running the Application

1. **Database Setup**:
   - Open SQL Server Management Studio (SSMS) or your preferred SQL client.
   - Execute the SQL scripts from `SQLScripts/StoredProcedures.sql` to create the necessary stored procedures.

2. **Application Setup**:
   - Open the project in Visual Studio or your preferred IDE.
   - Ensure all necessary packages are installed.
   - Build and run the application.

3. **Access the Application**:
   - Navigate to `/Customer` to manage customers.
   - Navigate to `/Account` to manage accounts.
   - Navigate to `/User/Login` to authenticate users.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
