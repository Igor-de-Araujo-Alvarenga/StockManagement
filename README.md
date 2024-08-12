## Stock Management

   - A project demonstrating my knowledge in .NET 6.0, where I developed a simple CRUD application for stock management.

### Stack

- C#, .NET 6, Entity framework Core, Xunit for tests;
- PostgreSQL;

### Archtecture

- API:
    - Controller - Conection by HTTP transfer data;

- Application:
    - A business logic layer where conditions and loops are handled;

- DAL:
    - Data Access Layer where linq queries are handled

- Persistence:
    - A data persistence layer where Entity Framework is used to manage and map objects. This layer handles the storage and retrieval of data through the use of data objects and context;

- Tests:
    - Tests the business logic, data objects, and rules to ensure that all functionalities work as expected;

### Routes

        api/get 

        api/get/{id}

        api/post
