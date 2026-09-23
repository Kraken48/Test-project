# Shop API — QA Portfolio Project

A hands-on API testing project built to demonstrate practical Junior QA skills with Postman.

> **Project type:** Educational / portfolio demo  
> **API:** Placeholder demo API (`https://api.example.com`)  
> **Status:** Portfolio-ready demo

## Project Overview

This project demonstrates how a QA engineer can analyze API requirements, design positive and negative scenarios, create Postman requests, and automate response validation with JavaScript assertions.

### Skills Demonstrated

- HTTP methods: GET, POST, PUT, PATCH, DELETE
- Path parameters and query parameters
- Request and response analysis
- JSON validation
- Positive and negative testing
- Boundary Value Analysis (BVA)
- Equivalence Partitioning
- Combination testing
- Authentication with Bearer tokens
- Postman environments and variables
- Chained API requests
- Automated API assertions
- Validation of JSON objects and arrays
- Collection Runner concepts
- Data-driven testing concepts
- SQL for database verification
- Bug reporting and defect analysis

## Repository Structure

```text
shop-api-qa-portfolio/
├── README.md
├── TEST_CASES.md
├── BUG_REPORTS.md
├── .gitignore
├── sql/
│   └── qa_queries.sql
└── postman/
    ├── Shop-API.postman_collection.json
    └── Shop-API.postman_environment.json
```

## API Areas Covered

```text
Shop API
├── 01 Authorization
│   └── Login
├── 02 Profile
│   └── Get Profile
├── 03 Products
│   ├── Get Products — Default
│   ├── Get Products — limit=50
│   ├── Get Products — limit=101
│   ├── Get Product by ID
│   └── Get Product — Invalid ID
├── 04 Orders
│   └── Get Orders
└── 05 Users
    ├── Create User — Valid
    ├── Create User — Invalid Age
    ├── Update User
    └── Delete User
```

## What Is Tested

### Authorization

- HTTP status code
- `success` value
- Token presence
- Token storage as an environment variable
- Bearer token usage in protected requests

### Profile

- HTTP status code
- Required `id` field
- `name` type
- Expected email of the authenticated test user
- Authorization header usage

### Products

- Default request behavior
- Query parameters: `category`, `page`, `limit`
- Valid and invalid `limit` values
- Pagination boundaries
- Invalid product IDs
- `products` presence and array type
- Product object structure
- `price > 0`
- `available` is a boolean

### Orders

- HTTP status code
- `orders` presence and array type
- Required order fields
- `status` is a string
- `total > 0`
- Authorization header presence

### SQL / Database Verification

- Basic SELECT queries
- Filtering with WHERE, AND, and OR
- Sorting with ORDER BY
- Counting records with COUNT(*)
- Pattern matching with LIKE
- NULL checks with IS NULL / IS NOT NULL
- INNER JOIN and LEFT JOIN
- Verification of created, updated, and deleted user records

### Users

- Successful user creation
- Age validation
- Rejection of invalid age
- Verification that a rejected creation response does not contain a created user object
- Partial update with PATCH
- User deletion

## Example Automated Assertions

```javascript
const json = pm.response.json();

pm.test("Status Code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Products is an array", function () {
    pm.expect(json.products).to.be.an("array");
});

pm.test("Every product has a valid price", function () {
    json.products.forEach(function(product) {
        pm.expect(product.price).to.be.above(0);
    });
});
```

## Authentication Flow

The collection demonstrates a simple chained flow:

```text
Login
  ↓
Receive token
  ↓
Save {{token}}
  ↓
GET /api/profile
  ↓
Use Authorization: Bearer {{token}}
```

The same token can be reused for other protected endpoints, such as `/api/orders`.

## How to Import the Project into Postman

1. Open Postman.
2. Select **Import**.
3. Import `postman/Shop-API.postman_collection.json`.
4. Import `postman/Shop-API.postman_environment.json`.
5. Select the `Shop API — Test` environment.
6. Replace `baseUrl` with the URL of a real test/demo API before sending requests.

## Important: Demo Data

This repository intentionally uses a placeholder base URL and fictional test data. The collection is a **portfolio demonstration**, not a connection to a live production API.

Do not publish real passwords, API keys, access tokens, cookies, customer data, or confidential client information in a public repository.

## Test Design Examples

The project applies several test design techniques:

- **Equivalence Partitioning:** valid vs. invalid ranges for `age`, `page`, and `limit`
- **Boundary Value Analysis:** values around `1` and `100` for `limit`, and around the minimum/maximum values of other fields
- **Negative Testing:** empty values, invalid formats, invalid IDs, invalid parameter types
- **Combination Testing:** valid/invalid combinations of multiple input fields

## Future Improvements

Planned additions to the portfolio:

- Git/GitHub workflow documentation
- More advanced Postman scripting
- Data-driven API tests
- Python API automation
- CI execution of API tests
- Additional web UI testing artifacts

