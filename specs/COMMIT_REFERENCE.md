# Commit Message Quick Reference

## Format

```
[spec-type]([spec-name]): [Action] [description]
```

## Spec Types

### Task Completion ⭐ (Most Common)

```bash
task(auth-system): Complete setup-supabase implementation
task(user-dashboard): Complete profile-page UI components
task(payment-system): Complete stripe-integration testing
```

**File Location**: `specs/tasks/[spec-name]/[task-name].md`

### Feature Completion

```bash
feature(auth-system): Complete authentication feature - ready for testing
feature(user-dashboard): Complete dashboard feature - all tasks done
```

**File Location**: `specs/features/[spec-name].md`

### Project Plan Updates

```bash
project: Update project plan - mark Phase 1 complete
project: Add new Phase 2 requirements
```

**File Location**: `specs/project_plan.md`

### Spec Management

```bash
spec(auth-system): Create authentication feature specification
spec(auth-system): Move auth-system to completed archive
spec(payment): Update payment feature spec with new requirements
```

**File Location**: Various spec files

## Quick Lookup

### From Commit → Find Spec

- `task(auth-system): ...` → `specs/tasks/auth-system/[task].md`
- `feature(dashboard): ...` → `specs/features/dashboard.md`
- `project: ...` → `specs/project_plan.md`
- `spec(payment): ...` → `specs/features/payment.md` or related

### When to Commit

✅ **MUST commit when:**

- Task marked complete [✅] in any spec
- Feature marked complete [✅] in project plan
- Spec moved to completed/ archive
- Project plan updated with milestone

🚫 **Don't commit for:**

- Work in progress (unless specifically requested)
- Temporary changes or experiments
- Draft specs (until finalized)

---

_Keep this file handy for quick reference during development!_
