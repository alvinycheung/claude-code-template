# Master Project Plan

## Project Overview

### Phase 1: Github Repo

**Status**: Done
**Goal**: Get the github repo in

### Phase 2: DevOps, CI/CD & Quality Scaffold

**Status**: In Progress
**GOAL**: Create monorepo (React Native + Expo or bare RN) with TypeScript, ESLint/Prettier, Jest, React Testing Library, Detox (E2E), and GitHub Actions pipelines for build + test on iOS, Android, and Web. Wire Sentry for crash reporting from day one.

**JIRA Epic**: [STORY-1] Phase 2: DevOps, CI/CD & Quality Scaffold

#### Stories

**Status**: In Progress

- [x] [STORY-2] Setup React Native Monorepo Foundation with TypeScript (Complete)
- [x] [STORY-3] Configure Code Quality Tools (ESLint & Prettier)
- [ ] [STORY-4] Set Up Testing Infrastructure
- [ ] [STORY-5] Implement CI/CD with GitHub Actions
- [ ] [STORY-6] Integrate Monitoring and Error Tracking
- [ ] [STORY-43] Developer Environment Setup & Onboarding

#### Deliverables

- [x] Monorepo structure with React Native/Expo initialized
- [x] TypeScript configuration for type safety
- [x] ESLint and Prettier configured with consistent rules
- [ ] Jest and React Testing Library set up for unit tests
- [ ] Detox configured for E2E testing
- [ ] GitHub Actions pipelines running for iOS, Android, and Web
- [ ] Sentry integrated and receiving crash reports
- [ ] All configurations documented in README

### Phase 3: Cross‑Platform Core & Component Library v0

**Status**: Planning
**GOAL**: Implement the app shell (navigation, theming, responsive layout) and seed a reusable design system (buttons, forms, typography). Storybook (web) runs alongside the app so the UI library can evolve in isolation.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 4: Authentication & User Profiles MVP

**Status**: Planning
**GOAL**: Integrate Supabase auth with Apple, Google, and Facebook OAuth. Add basic profile data, parent email verification flow, and age gate. Protect routes with auth guards and write tests for happy/edge cases.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 5: Story List & Supabase Data Layer

**Status**: Planning
**GOAL**: Stand up “blank‑state” Story List screen backed by Supabase tables. Implement CRUD endpoints, RBAC rules, and pagination. Users can start the “Create Story” or “Create Character” flows from here.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 6: Character Creator MVP

**Status**: Planning
**GOAL**: Build the guided character‑creation UI (name, traits, avatar placeholder). Persist characters to Supabase and render them in the Story List context panel. Unit & snapshot tests cover all form logic.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 7: Story Generator MVP (OpenAI)

**Status**: Planning
**GOAL**: Hook up OpenAI text‑completion. Users pick characters, a genre/prompt, and receive a multi‑page story draft. Stream tokens to the UI for immediacy. Store drafts in Supabase with revision history.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 8: Story Reader & TTS (ElevenLabs)

**Status**: Planning
**GOAL**: Generate voice narration for each page via ElevenLabs, sync text‑highlighting with audio playback, and surface basic media controls (play, pause, scrub). Cache audio locally to minimize repeat API calls.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 9: Illustration Generation

**Status**: Planning
**GOAL**: Invoke OpenAI Image (or equivalent) to create page‑level illustrations. Render in a swipeable carousel; store image URLs in Supabase. Add fallback art if generation is throttled.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 10: Safety Layer & Moderation

**Status**: Planning
**GOAL**: Pipe every user prompt and AI response through OpenAI Moderation and a custom blocked‑word list. Add report/flag UI, parental control toggles, and audit logs to satisfy COPPA/GDPR‑K documentation.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 11: Monetization & Paywall

**Status**: Planning
**GOAL**: Implement tiered subscriptions (lower‑ vs higher‑quality models, N vs M stories/month) with App Store / Play Billing and Stripe for web. Gate premium actions and add in‑app purchase for “Print My Book.”

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 12: Internationalization & Accessibility Foundations

**Status**: Planning
**GOAL**: Install i18n framework, externalize copy, and prepare RTL support—even though v1 ships in English only. Audit color contrast, font scaling, and voice‑over labels for WCAG 2.1 AA compliance.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 13: Analytics, Experimentation & Observability

**Status**: Planning
**GOAL**: Track funnel events (login, story creation, subscription), user properties (age bracket), and feature flags via Sentry custom events or a lightweight analytics SDK. Enable A/B toggles for model quality experiments.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 14: Beta, Feedback & Optimization

**Status**: Planning
**GOAL**: Release TestFlight/Play Internal testing and gated web beta. Collect telemetry, parent feedback, and fix performance hot‑spots (bundle size, TTI, memory). Harden CI gates (100 % critical tests passing).

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

### Phase 15: 1.0 Launch & Post‑Launch Iteration

**Status**: Planning
**GOAL**: Ship to App Store, Play Store, and web. Monitor real‑time stability, iterate on onboarding nudges, and begin work on the next epic (offline reading, classroom mode, or new languages) using the same CI/CD pipeline.

#### Tasks

**Status**: Planning

- [ ] [Task 1 description]
- [ ] [Task 2 description]
      ...

#### Deliverables

- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
      ...

## Dependencies & Blockers

### Current Blockers

- None currently - ready to proceed with next phase 2 stories

### External Dependencies

_List external dependencies (APIs, services, approvals, etc.)_

## Recent Completed Work

### Phase 2 Progress

**STORY-2: Setup React Native Monorepo Foundation with TypeScript** (Completed)

- [x] STORY-7: Initialize Yarn Workspaces monorepo structure
- [x] STORY-8: Create React Native app with Expo
- [x] STORY-9: Configure TypeScript across monorepo
- [x] STORY-10: Create shared packages structure (@storybooks/core, @storybooks/types, @storybooks/ui)
- [x] STORY-11: Set up cross-package dependencies
- [x] STORY-12: Create example component demonstrating integration (StoryCard component)
- [x] STORY-13: Document monorepo setup and usage

**Key Achievements:**

- Established Yarn Workspaces monorepo with Turbo for efficient builds
- Created three shared packages for cross-platform code reuse
- Implemented TypeScript configuration with proper type sharing
- Set up ESLint and Prettier with consistent code standards
- Created example StoryCard component demonstrating package integration
- Comprehensive documentation in README.md

**STORY-3: Configure Code Quality Tools (ESLint & Prettier)** (Completed)

**Key Achievements:**

- Configured ESLint with comprehensive rules for TypeScript and React Native
- Set up Prettier with consistent formatting rules across the monorepo
- Integrated Husky for pre-commit hooks to enforce code quality
- Added lint-staged for efficient pre-commit checks
- Implemented commitlint for conventional commit message enforcement
- Created GitHub Actions workflow for automated PR code reviews
- All packages configured with consistent linting and formatting rules

## Archived Features

_Links to completed features moved to specs/completed/_

[See specs/completed/archive-index.md for full archive]

## Notes & Decisions

_Important architectural decisions, trade-offs, and project notes_

- **Project Management**: Using hierarchical specs system for token efficiency
- **Git Workflow**: Manual commits with conventional commit messages referencing JIRA tickets
- **AI Integration**: Claude manages specs and tracks progress
- **Monorepo Structure**: Yarn Workspaces + Turbo for efficient builds and code sharing
- **Shared Packages**: @storybooks/core (business logic), @storybooks/types (TypeScript), @storybooks/ui (components)

---

_This file is always loaded by the /prime command and serves as the master reference for project status._
