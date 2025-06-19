# React Project Context

## Project Type: React Application

### Key Technologies

- **React**: Component-based UI library
- **JavaScript/TypeScript**: Primary development language
- **JSX**: JavaScript XML syntax for components
- **Node.js/npm/yarn**: Package management and build tools

### Project Structure Expectations

```
src/
├── components/          # Reusable UI components
├── pages/ or views/     # Page-level components
├── hooks/              # Custom React hooks
├── utils/              # Utility functions
├── types/              # TypeScript type definitions
├── styles/             # CSS/SCSS/styled-components
└── __tests__/          # Test files
```

### React-Specific Best Practices

#### Component Development

- Use functional components with hooks over class components
- Follow single responsibility principle for components
- Use proper prop typing (TypeScript interfaces or PropTypes)
- Implement proper error boundaries for robust UIs

#### State Management

- Use useState for local component state
- Use useReducer for complex state logic
- Consider Context API for app-wide state
- Use external libraries (Redux, Zustand) for complex applications

#### Performance Optimization

- Use React.memo for preventing unnecessary re-renders
- Implement useMemo and useCallback for expensive calculations
- Use lazy loading with React.lazy for code splitting
- Optimize bundle size with proper tree shaking

#### Testing Standards

- Test components with React Testing Library
- Focus on testing behavior, not implementation
- Use jest for unit tests and integration tests
- Mock external dependencies and API calls

### Common File Patterns

- `ComponentName.jsx/tsx` - Component implementation
- `ComponentName.test.jsx/tsx` - Component tests
- `ComponentName.module.css` - Component-specific styles
- `index.js/ts` - Barrel exports

### React-Specific Security Considerations

- Sanitize user inputs to prevent XSS attacks
- Validate props and state data
- Use HTTPS for all API communications
- Implement proper authentication and authorization

### Development Workflow

1. Create component structure first
2. Implement basic functionality
3. Add prop validation/TypeScript types
4. Write tests for component behavior
5. Add styling and responsive design
6. Optimize performance if needed

### Common React Patterns to Use

- **Container/Presentational Components**: Separate logic from presentation
- **Render Props**: Share code between components
- **Higher-Order Components (HOCs)**: Add functionality to existing components
- **Custom Hooks**: Extract and reuse stateful logic

### Anti-patterns to Avoid

- Modifying props directly (props are immutable)
- Using array indices as keys in lists
- Calling hooks conditionally or in loops
- Directly manipulating the DOM instead of using React state
- Creating objects/functions inside render methods without memoization

### Integration with Build Tools

- **Vite**: Modern build tool with fast HMR
- **Create React App**: Standard React starter
- **Webpack**: Module bundler configuration
- **Babel**: JavaScript transpilation

### Environment Setup

- Ensure Node.js LTS version is installed
- Use package.json scripts for common tasks
- Configure ESLint and Prettier for code quality
- Set up environment variables properly (.env files)

---

_This context is loaded automatically when working on React projects_
