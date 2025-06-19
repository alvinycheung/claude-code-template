# Python Project Context

## Project Type: Python Application

### Key Technologies

- **Python**: Primary programming language
- **pip/poetry**: Package management
- **Virtual environments**: Dependency isolation
- **Flask/Django/FastAPI**: Web frameworks (if applicable)

### Project Structure Expectations

```
project/
├── src/                # Source code
│   ├── __init__.py
│   ├── main.py        # Application entry point
│   ├── models/        # Data models
│   ├── services/      # Business logic
│   ├── utils/         # Utility functions
│   └── config/        # Configuration
├── tests/             # Test files
├── requirements.txt   # Dependencies
├── pyproject.toml     # Modern Python configuration
├── .env.example       # Environment variables template
└── README.md
```

### Python-Specific Best Practices

#### Code Style and Structure

- Follow PEP 8 style guidelines
- Use type hints for better code clarity
- Implement proper docstrings (Google or NumPy style)
- Use meaningful variable and function names
- Keep functions small and focused (single responsibility)

#### Package Management

- Use virtual environments (venv, conda, poetry)
- Pin dependency versions in requirements.txt
- Use requirements-dev.txt for development dependencies
- Regularly update dependencies with security patches

#### Error Handling

- Use specific exception types, not bare except clauses
- Implement proper logging with the logging module
- Handle exceptions at appropriate levels
- Use context managers for resource management

#### Testing Standards

- Use pytest for unit and integration testing
- Aim for high test coverage (80%+)
- Write descriptive test names
- Use fixtures for test setup and teardown
- Mock external dependencies and APIs

### Common File Patterns

- `main.py` - Application entry point
- `__init__.py` - Package initialization
- `requirements.txt` - Production dependencies
- `test_*.py` - Test files
- `conftest.py` - Pytest configuration and fixtures

### Web Framework Specifics

#### Flask Applications

- Use blueprints for organizing routes
- Implement proper error handling
- Use Flask-SQLAlchemy for database operations
- Implement request validation

#### Django Applications

- Follow Django project structure
- Use Django ORM for database operations
- Implement proper authentication and permissions
- Use Django's built-in security features

#### FastAPI Applications

- Use Pydantic models for request/response validation
- Implement proper dependency injection
- Use async/await for I/O operations
- Generate automatic API documentation

### Database Integration

- **SQLAlchemy**: Use for ORM operations
- **PostgreSQL/MySQL**: Recommended production databases
- **SQLite**: Good for development and testing
- Use migrations for schema changes
- Implement proper connection pooling

### Security Considerations

- Validate and sanitize all inputs
- Use environment variables for secrets
- Implement proper authentication and authorization
- Keep dependencies updated for security patches
- Use HTTPS in production

### Performance Optimization

- Use appropriate data structures (dict vs list lookups)
- Implement caching where appropriate
- Use generators for large datasets
- Profile code to identify bottlenecks
- Consider async programming for I/O-bound tasks

### Development Environment

- Use virtual environments for dependency isolation
- Configure IDE/editor with Python language server
- Use linting tools (flake8, pylint, black)
- Set up pre-commit hooks for code quality

### Common Python Patterns

- **Context Managers**: For resource management (with statements)
- **Decorators**: For cross-cutting concerns
- **Generators**: For memory-efficient iteration
- **List Comprehensions**: For concise data transformation

### Anti-patterns to Avoid

- Using bare except clauses
- Modifying lists while iterating over them
- Using mutable default arguments
- Not using virtual environments
- Ignoring PEP 8 style guidelines

### Testing and Quality Assurance

- Use pytest for testing framework
- Implement unit tests for all functions
- Use mock for external dependencies
- Set up continuous integration (GitHub Actions, etc.)
- Use coverage.py to measure test coverage

### Logging and Debugging

- Use the logging module instead of print statements
- Configure different log levels (DEBUG, INFO, WARNING, ERROR)
- Use structured logging for better analysis
- Implement proper exception logging with traceback

### Deployment Considerations

- Use WSGI servers (gunicorn, uWSGI) for web applications
- Implement proper configuration management
- Use Docker for containerization
- Set up monitoring and health checks
- Use environment-specific settings files

### Data Science Specific (if applicable)

- Use Jupyter notebooks for exploration
- Implement proper data validation
- Use pandas for data manipulation
- Use matplotlib/seaborn for visualization
- Version control data and models appropriately

---

_This context is loaded automatically when working on Python projects_
