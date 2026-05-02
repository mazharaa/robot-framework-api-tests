# Robot Framework API Tests

API automation testing suite using Robot Framework with robotframework-requests library on DummyJSON.

## Description

This project demonstrates API testing skills using Robot Framework, covering CRUD operations across multiple endpoints (Products, Users, Posts, Carts, and Authentication). Built as part of SDET career transition journey.

## Features

- API testing on DummyJSON
- CRUD operations (Products, Users, Posts, Carts, Auth)
- 22 automated test cases
- Reusable keywords in resource files
- Centralized configuration in Python variable file
- Best practices with separation of concerns

## Tech Stack

| Tool | Version |
|------|---------|
| Robot Framework | 7.4.2 |
| robotframework-requests | 0.9.7 |
| Python | 3.11+ |

## Project Structure

```
robot-framework-api-tests/
├── tests/                    # Test cases
│   ├── products/            # 6 tests
│   ├── users/             # 5 tests
│   ├── posts/             # 4 tests
│   ├── carts/             # 4 tests
│   └── auth/             # 3 tests
├── resources/              # Keywords and helpers
│   ├── common.robot       # Base keywords
│   └── api_keywords.robot # API-specific keywords
├── variables/             # Configuration
│   └── config.py         # Centralized config
└── requirements.txt       # Dependencies
```

## Test Coverage

| Module | Tests | Endpoints Covered |
|--------|-------|-----------------|
| Products | 6 | GET /products, POST /products/add, PUT /products/{id}, DELETE /products/{id}, Search |
| Users | 5 | GET /users, POST /users/add, PUT /users/{id}, DELETE /users/{id} |
| Posts | 4 | GET /posts, POST /posts/add, DELETE /posts/{id} |
| Carts | 4 | GET /carts, POST /carts/add, DELETE /carts/{id} |
| Auth | 3 | POST /auth/login, GET /auth/me, POST /auth/refresh |

**Total: 22 test cases**

## Getting Started

### Prerequisites

- Python 3.11+
- pip

### Installation

```bash
# Clone the repository
git clone https://github.com/mazharaa/robot-framework-api-tests.git

# Navigate to the project
cd robot-framework-api-tests

# Create virtual environment
python -m venv venv

# Activate (macOS/Linux)
source venv/bin/activate

# Activate (Windows)
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Running Tests

```bash
# Run all tests
robot tests/

# Run specific module
robot tests/products/

# Run with output files
robot --outputdir results tests/
```

### View Results

```bash
# View HTML report
open results/report.html

# View log
open results/log.html
```

## API Endpoints Tested

| Endpoint | Method | Description |
|----------|--------|-------------|
| /products | GET | Get all products |
| /products/{id} | GET | Get single product |
| /products/add | POST | Add new product |
| /products/{id} | PUT | Update product |
| /products/{id} | DELETE | Delete product |
| /products/search | GET | Search products |
| /users | GET | Get all users |
| /users/add | POST | Create user |
| /users/{id} | PUT | Update user |
| /users/{id} | DELETE | Delete user |
| /posts | GET | Get all posts |
| /posts/add | POST | Create post |
| /posts/{id} | DELETE | Delete post |
| /carts | GET | Get all carts |
| /carts/add | POST | Create cart |
| /carts/{id} | DELETE | Delete cart |
| /auth/login | POST | User login |
| /auth/me | GET | Get current user |
| /auth/refresh | POST | Refresh token |

## Best Practices Implemented

- [x] Reusable keywords in resource files
- [x] Centralized configuration (config.py)
- [x] Independent test cases
- [x] Proper assertions with meaningful messages
- [x] Clean test case naming (TC001, TC002, ...)
- [x] Documentation on each test case
- [x] .gitignore for clean repository

## License

MIT

## Author

[mazharaa](https://github.com/mazharaa)