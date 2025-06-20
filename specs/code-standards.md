# Universal Code Standards

## Overview

This document establishes fundamental coding principles and practices that apply across all programming languages and project types. These standards ensure consistent, maintainable, secure, and performant code.

## Core Principles

### 1. Clarity Over Cleverness

- Write code that is easy to read and understand
- Choose descriptive names over short, cryptic ones
- Prefer explicit logic over implicit "clever" solutions
- Comment complex algorithms and business logic

### 2. Consistency First

- Follow established patterns within the project
- Use consistent naming conventions throughout
- Maintain consistent code structure and organization
- Apply the same error handling approach project-wide

### 3. Security by Default

- Validate all inputs at boundaries
- Use parameterized queries/prepared statements
- Implement proper authentication and authorization
- Never expose sensitive data in logs or error messages

### 4. Performance Awareness

- Consider performance implications of code choices
- Avoid premature optimization, but don't ignore obvious inefficiencies
- Use appropriate data structures for the task
- Monitor and measure performance-critical sections

### 5. Test-Driven Development (TDD)

- Write tests before implementing functionality
- All code should have reasonable test coverage to prevent breakage
- Tests should be clear, maintainable, and reliable
- Use the Red-Green-Refactor cycle: Write failing test → Make it pass → Refactor

## Naming Conventions

### Variables

- Use descriptive, meaningful names: `userEmail` not `e`
- Use camelCase for most languages, snake_case where conventional
- Boolean variables should be questions: `isActive`, `hasPermission`
- Avoid abbreviations unless they're widely understood

### Functions/Methods

- Use verbs that describe what the function does: `calculateTax()`, `sendEmail()`
- Be specific: `getUserById()` not `getUser()`
- Keep functions focused on a single responsibility
- Use consistent naming patterns: `create`, `update`, `delete`, `get`, `list`

### Classes/Components

- Use nouns that represent what the class models: `User`, `EmailService`
- Use PascalCase in most languages
- Be specific about the class purpose: `UserRepository` not `UserStuff`

### Files and Directories

- Use descriptive names that indicate content
- Follow project/language conventions for casing
- Group related files in logical directories
- Use consistent file naming patterns

## Error Handling & Logging

### Error Handling Principles

- Handle errors at the appropriate level
- Provide meaningful error messages to users
- Log technical details for developers
- Never expose internal system details to end users
- Use structured error handling (try/catch, Result types, etc.)

### Logging Standards

- Log at appropriate levels: ERROR, WARN, INFO, DEBUG
- Include context: user ID, request ID, timestamp
- Log enough information to debug issues
- Don't log sensitive information (passwords, tokens, PII)
- Use structured logging when possible (JSON format)

### Error Response Format

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "User-friendly error message",
    "details": ["Specific field errors"],
    "timestamp": "2024-01-XX"
  }
}
```

## Security Best Practices

### Input Validation

- Validate all inputs at system boundaries
- Use whitelist validation (allow known good) over blacklist
- Sanitize data for output context (HTML, SQL, etc.)
- Implement rate limiting on public endpoints

### Authentication & Authorization

- Use established authentication libraries/frameworks
- Implement proper session management
- Use JWT tokens securely with appropriate expiration
- Follow principle of least privilege for permissions

### Data Protection

- Encrypt sensitive data at rest and in transit
- Use environment variables for secrets, never hardcode
- Implement proper key management
- Follow data minimization principles

### API Security

- Use HTTPS for all communications
- Implement proper CORS policies
- Use API keys/tokens for authentication
- Validate and sanitize all API inputs

## Performance Guidelines

### General Principles

- Measure before optimizing
- Optimize for the common case
- Consider algorithmic complexity (Big O)
- Profile code to identify bottlenecks

### Database Operations

- Use appropriate indices
- Avoid N+1 query problems
- Use connection pooling
- Implement proper caching strategies

### Frontend Performance

- Minimize bundle sizes
- Use lazy loading for non-critical resources
- Optimize images and assets
- Implement proper caching headers

### API Performance

- Use pagination for large datasets
- Implement response caching where appropriate
- Optimize database queries
- Use appropriate HTTP status codes

## Testing Standards

### Test Coverage Requirements

- All public functions/methods must have tests
- Critical business logic must have comprehensive test coverage
- Edge cases and error conditions should be tested
- Aim for 80%+ code coverage, but prioritize quality over quantity

### Test Organization

- Group tests logically (unit, integration, end-to-end)
- Use descriptive test names that explain what is being tested
- Follow AAA pattern: Arrange, Act, Assert
- Keep tests independent and isolated

### Test Types

- **Unit Tests**: Test individual functions/methods in isolation
- **Integration Tests**: Test component interactions
- **End-to-End Tests**: Test complete user workflows
- **Contract Tests**: Test API contracts and data formats

### Test Maintainability

- Tests should be as simple as possible
- Use test helpers and utilities to reduce duplication
- Update tests when requirements change
- Remove or fix flaky tests immediately

## Code Organization

### File Structure

- Group related functionality together
- Separate concerns (business logic, data access, presentation)
- Use consistent directory structure across projects
- Keep configuration files at appropriate levels

### Module Organization

- Each module should have a single, clear responsibility
- Use proper import/export patterns
- Avoid circular dependencies
- Keep public interfaces minimal and stable

### Function/Method Organization

- Keep functions small and focused (generally < 20 lines)
- Use pure functions when possible
- Minimize side effects
- Group related functions together

## Documentation Standards

### Code Comments

- Comment the "why" not the "what"
- Update comments when code changes
- Use consistent comment formatting
- Document complex algorithms and business rules

### Function Documentation

- Document all public functions/methods
- Include parameter types and descriptions
- Document return values and possible exceptions
- Provide usage examples for complex functions

### API Documentation

- Document all endpoints with examples
- Include authentication requirements
- Document request/response formats
- Provide error code explanations

## Integration with Development Workflow

### Before Writing Code

1. Review relevant standards for the language/framework
2. Understand the existing codebase patterns
3. Plan the implementation approach
4. Consider security and performance implications
5. Write failing tests for the functionality (TDD Red phase)

### During Development

1. Follow established naming conventions
2. Implement code to make tests pass (TDD Green phase)
3. Implement proper error handling
4. Add appropriate logging
5. Write self-documenting code
6. Refactor code while keeping tests green (TDD Refactor phase)

### Before Committing

1. Ensure all tests are passing
2. Review code against these standards
3. Verify test coverage is adequate
4. Ensure all functions are properly documented
5. Verify error handling is implemented
6. Check for security vulnerabilities
7. Test performance with realistic data

---

_These standards should be reviewed and updated regularly to reflect best practices and lessons learned from projects._
