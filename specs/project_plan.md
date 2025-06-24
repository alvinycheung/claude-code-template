# Master Project Plan

## Project Overview

### Phase X: Description

**Status**:
**GOAL**:

**JIRA Epic**: [STORY-X] Phase X: Description

#### Stories

**Status**: In Progress

- [ ] [STORY-X] Description
- [ ] [STORY-X] Description
- [ ] [STORY-X] Description

#### Deliverables

- [ ] Description
- [ ] Description
- [ ] Description

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

### Phase X Progress

**STORY-X: Description**

- [ ] Ticket: Description
- [ ] Ticket: Description
- [ ] Ticket: Description

**Key Achievements:**

-
-
-

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
