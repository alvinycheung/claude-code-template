# Next.js Project Context

## Project Type: Next.js Application

### Key Technologies

- **Next.js**: React-based full-stack framework
- **React**: Component-based UI library (extends React context)
- **TypeScript**: Preferred language for type safety
- **Node.js**: Backend runtime (API routes)

### Project Structure Expectations

```
project/
├── app/                # App Router (Next.js 13+)
│   ├── layout.tsx     # Root layout
│   ├── page.tsx       # Home page
│   ├── globals.css    # Global styles
│   └── api/           # API routes
├── pages/             # Pages Router (legacy)
├── public/            # Static assets
├── components/        # Reusable components
├── lib/               # Utility functions
├── styles/            # Styling files
└── types/             # TypeScript definitions
```

### Next.js-Specific Best Practices

#### Routing and Navigation

- Use App Router (app/) for new projects (Next.js 13+)
- Implement proper file-based routing structure
- Use next/link for client-side navigation
- Implement proper SEO with metadata API

#### Server-Side Features

- Use Server Components by default for better performance
- Implement Client Components only when needed (use "use client")
- Use Server Actions for form submissions and mutations
- Implement proper data fetching patterns

#### API Routes

- Organize API routes in app/api/ directory
- Use proper HTTP methods and status codes
- Implement request validation and error handling
- Use middleware for authentication and CORS

#### Performance Optimization

- Use next/image for automatic image optimization
- Implement proper code splitting with dynamic imports
- Use Server Components to reduce client-side JavaScript
- Optimize fonts with next/font

#### Data Fetching Patterns

- Use fetch() with proper caching strategies
- Implement loading states and error boundaries
- Use Suspense for streaming and progressive loading
- Cache data appropriately (static, dynamic, revalidate)

### App Router Specifics (Next.js 13+)

#### File Conventions

- `page.tsx` - Page component
- `layout.tsx` - Layout component
- `loading.tsx` - Loading UI
- `error.tsx` - Error UI
- `not-found.tsx` - 404 page
- `route.ts` - API route handler

#### Metadata and SEO

- Use generateMetadata for dynamic metadata
- Implement proper Open Graph and Twitter cards
- Use structured data for better SEO
- Implement proper canonical URLs

#### Streaming and Suspense

- Use Suspense boundaries for loading states
- Implement progressive enhancement
- Stream components for better perceived performance

### Common Next.js Patterns

#### Authentication

- Use NextAuth.js for authentication
- Implement proper session management
- Use middleware for route protection
- Handle both client and server-side auth

#### State Management

- Use React state for local component state
- Use Context API for app-wide state
- Consider external libraries (Zustand, Redux) for complex state
- Use URL state for shareable state

#### Styling Approaches

- **Tailwind CSS**: Utility-first CSS framework
- **CSS Modules**: Scoped CSS
- **Styled Components**: CSS-in-JS
- **SCSS/Sass**: Enhanced CSS

### Environment and Configuration

- Use environment variables (.env.local)
- Configure next.config.js for custom settings
- Set up proper TypeScript configuration
- Use ESLint and Prettier for code quality

### Deployment Considerations

- Deploy to Vercel for optimal performance
- Configure proper environment variables
- Set up proper build and deployment pipelines
- Implement proper monitoring and analytics

### Testing Strategies

- Use React Testing Library for component tests
- Test API routes with proper mocking
- Implement E2E tests with Playwright or Cypress
- Use Jest for unit testing

### Security Best Practices

- Implement proper CSRF protection
- Use Content Security Policy (CSP) headers
- Validate all inputs on both client and server
- Implement proper authentication and authorization

### Anti-patterns to Avoid

- Using getServerSideProps when static generation is possible
- Not optimizing images and fonts
- Mixing App Router and Pages Router unnecessarily
- Not implementing proper error boundaries
- Overusing Client Components

### Common Third-party Integrations

- **Database**: Prisma, Drizzle, or direct SQL
- **Authentication**: NextAuth.js, Clerk, Auth0
- **Styling**: Tailwind CSS, styled-components
- **Forms**: React Hook Form, Formik
- **State**: Zustand, Redux Toolkit

### Performance Monitoring

- Use Next.js built-in analytics
- Implement proper Core Web Vitals monitoring
- Use tools like Vercel Analytics or Google Analytics
- Monitor API route performance

### Development Workflow

1. Set up project structure with proper routing
2. Implement layout and global styles
3. Create reusable components
4. Implement data fetching and API routes
5. Add authentication and authorization
6. Optimize performance and SEO
7. Deploy and monitor

---

_This context is loaded automatically when working on Next.js projects_
