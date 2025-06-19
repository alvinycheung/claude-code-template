# Node.js Project Context

## Project Type: Node.js Application

### Key Technologies

- **Node.js**: JavaScript runtime for server-side development
- **Express.js**: Web framework for APIs and web applications
- **npm/yarn**: Package management
- **JavaScript/TypeScript**: Primary development language

### Project Structure Expectations

```
src/
├── controllers/         # Request handlers and business logic
├── models/             # Data models and database schemas
├── routes/             # API route definitions
├── middleware/         # Custom middleware functions
├── services/           # Business logic and external integrations
├── utils/              # Utility functions and helpers
├── config/             # Configuration files
├── types/              # TypeScript type definitions
└── __tests__/          # Test files
```

### Node.js-Specific Best Practices

#### Application Architecture

- Use MVC or similar architectural pattern
- Implement proper separation of concerns
- Use dependency injection for better testing
- Follow RESTful API design principles

#### Error Handling

- Implement centralized error handling middleware
- Use proper HTTP status codes
- Log errors with sufficient context
- Handle both sync and async errors properly

#### Security Practices

- Validate and sanitize all inputs
- Use helmet.js for security headers
- Implement rate limiting
- Use HTTPS in production
- Keep dependencies updated (npm audit)

#### Performance Optimization

- Use clustering for CPU-intensive tasks
- Implement proper caching strategies
- Use compression middleware
- Optimize database queries
- Monitor memory usage and garbage collection

### Common File Patterns

- `app.js/server.js` - Main application entry point
- `routes/index.js` - Route definitions
- `models/User.js` - Data model definitions
- `controllers/userController.js` - Request handlers
- `middleware/auth.js` - Authentication middleware

### Database Integration

- **MongoDB**: Use Mongoose for ODM
- **PostgreSQL/MySQL**: Use Sequelize or Prisma ORM
- **Redis**: For caching and session storage
- Implement proper connection pooling
- Use migrations for schema changes

### Testing Standards

- Use Jest or Mocha for unit testing
- Test API endpoints with supertest
- Mock external dependencies
- Implement integration tests for database operations
- Use test databases separate from development

### Environment Management

- Use environment variables for configuration
- Implement different configs for dev/staging/production
- Never commit secrets to version control
- Use tools like dotenv for local development

### API Development Guidelines

- Follow RESTful conventions
- Implement proper request validation
- Use middleware for cross-cutting concerns
- Document APIs with tools like Swagger/OpenAPI
- Implement proper authentication and authorization

### Common Express.js Patterns

- **Middleware Chain**: Authentication → Validation → Business Logic
- **Error Handling**: Centralized error middleware
- **Route Organization**: Group related routes in modules
- **Request Validation**: Use libraries like Joi or express-validator

### Anti-patterns to Avoid

- Callback hell (use async/await or Promises)
- Blocking the event loop with synchronous operations
- Not handling promise rejections
- Exposing internal server errors to clients
- Using console.log for production logging

### Package Management

- Keep package.json clean and organized
- Use exact versions for critical dependencies
- Regularly update dependencies with security patches
- Use npm scripts for common development tasks

### Logging and Monitoring

- Use structured logging (Winston, Bunyan)
- Log requests, errors, and important business events
- Implement health check endpoints
- Monitor application performance and errors
- Use tools like PM2 for process management

### Deployment Considerations

- Use process managers (PM2, Forever)
- Implement graceful shutdowns
- Use reverse proxies (nginx, Apache)
- Set up proper logging in production
- Configure environment-specific settings

---

_This context is loaded automatically when working on Node.js projects_
