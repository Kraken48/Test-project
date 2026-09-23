# Bug Reports — Shop API

The examples below are fictional portfolio defects based on the demo requirements used in this repository.

## BUG-001 — API allows user creation with age below the minimum

**Severity:** Medium (preliminary)  
**Priority:** High (preliminary)  
**Environment:** Test API / Postman

### Preconditions

The user creation endpoint is available.

### Steps to Reproduce

1. Send `POST /api/users`.
2. Use the following JSON body:

```json
{
  "name": "Egor",
  "age": 17,
  "email": "test@mail.com"
}
```

### Expected Result

The API rejects the request because the allowed age range is `18–65`. The user is not created.

### Actual Result

The API returns `200 OK`, `success=true`, and creates a user with `age=17`.

### Notes

The exact technical root cause is not assumed in this report; the observed API behavior is compared against the stated requirement.

---

## BUG-002 — Login fails with valid credentials

**Severity:** High (preliminary)  
**Priority:** High (preliminary)  
**Environment:** Test API / Chrome / Postman

### Preconditions

The test user exists and the password is correct.

### Steps to Reproduce

1. Open the login page or send `POST /api/login`.
2. Use `test@mail.com`.
3. Use password `12345678`.
4. Submit the request.

### Expected Result

The user is successfully authenticated and the API returns `success=true` with a valid token.

### Actual Result

The API returns `success=false` with an authentication error, and the user is not logged in.

### Notes

This example demonstrates a defect where the actual authentication result does not match the valid test data and stated requirement.
