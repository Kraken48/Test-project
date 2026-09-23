# Test Cases — Shop API

## Authorization — Login

| ID | Scenario | Test data | Expected result |
|---|---|---|---|
| AUTH-01 | Login with valid credentials | `test@mail.com` / `12345678` | `200 OK`, `success=true`, token exists |
| AUTH-02 | Empty email | empty / `12345678` | Request rejected with a validation error |
| AUTH-03 | Invalid email format | `test@mail` / `12345678` | Request rejected |
| AUTH-04 | Empty password | `test@mail.com` / empty | Request rejected |
| AUTH-05 | Password below minimum | `test@mail.com` / `1234567` | Request rejected |
| AUTH-06 | Invalid email + valid password | invalid email / `12345678` | Request rejected |
| AUTH-07 | Valid email + invalid password | `test@mail.com` / invalid password | Request rejected |
| AUTH-08 | Invalid email + invalid password | invalid / invalid | Request rejected |
| AUTH-09 | Password at minimum boundary | valid email / 8 characters | Request accepted when credentials are valid |
| AUTH-10 | Missing Authorization token on protected endpoint | no token | Access rejected |
| AUTH-11 | Invalid Authorization token | invalid token | Access rejected |

## Products

| ID | Scenario | Expected result |
|---|---|---|
| PROD-01 | GET without parameters | `200 OK`, product list returned |
| PROD-02 | `limit=1` | Request accepted; no more than 1 product returned |
| PROD-03 | `limit=50` | `200 OK`, response contains `limit=50`; first full page contains 50 products when enough data exists |
| PROD-04 | `limit=100` | Request accepted as the maximum valid limit |
| PROD-05 | `limit=101` | Request rejected with a validation error |
| PROD-06 | `limit=0` | Request rejected with a validation error |
| PROD-07 | `limit=-1` | Request rejected with a validation error |
| PROD-08 | `limit=abc` | Request rejected with a validation error |
| PROD-09 | `page=0` | Request rejected with a validation error |
| PROD-10 | `page=-1` | Request rejected with a validation error |
| PROD-11 | `page=1` | First page returned successfully |
| PROD-12 | `page=2` with valid limit | Second page returned according to the API contract |
| PROD-13 | Non-existing category | Behavior matches the API contract, such as an empty result or a defined error |
| PROD-14 | Validate product objects | Each product has `id`, `name`, `price`, and `available`; `price > 0`; `available` is boolean |
| PROD-15 | Invalid product ID | Request rejected with the documented not-found response |

## Users

| ID | Scenario | Expected result |
|---|---|---|
| USER-01 | Create user with valid data | User created successfully |
| USER-02 | Create user with `age=17` | Request rejected; user must not be created |
| USER-03 | Create user with `age=18` | Request accepted when other data is valid |
| USER-04 | Create user with `age=65` | Request accepted when other data is valid |
| USER-05 | Invalid name | Request rejected |
| USER-06 | Invalid email | Request rejected |
| USER-07 | PATCH name only | Only the name changes; unrelated fields remain unchanged |
| USER-08 | DELETE user | User is deleted according to the API contract |

## Orders

| ID | Scenario | Expected result |
|---|---|---|
| ORDER-01 | GET orders with a valid token | `200 OK`, orders array returned |
| ORDER-02 | Missing Authorization header | Access rejected |
| ORDER-03 | Invalid token | Access rejected |
| ORDER-04 | Validate order objects | Each order has `id`, `status`, and `total`; `status` is a string; `total > 0` |
