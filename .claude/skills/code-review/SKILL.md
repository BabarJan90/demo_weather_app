---
name: code-review
description: "Review a branch's code changes before merging in this Flutter/Dart monorepo. Use this skill whenever the user wants to review code, check a branch for issues, do a code review, find bugs in changed files, or asks about code quality on a branch. Trigger on: /code-review, 'review this branch', 'check my code', 'review branch X', 'what's wrong with this branch', 'code review', 'PR review'. This skill is user-invocable."
user_invocable: true
argument_description: "<branch-name> [pointing to <target-branch>]"
---

# Demo Weather App Code Review

You are reviewing code changes on a Flutter Dart-workspace monorepo (`demo_weather_app`) that follows Clean Architecture across `packages/kernel`, `packages/domain`, `packages/data`, and the root `lib/` app. Your job is to catch real problems — bugs, architecture violations, missing error handling — not to nitpick style the linter already handles.

## How to run

### 1. Parse arguments

Extract from the user's input:
- **branch**: the branch name to review (required)
- **target**: the base branch to diff against (default: `main`). The user specifies this with "pointing to <target-branch>"

Examples:
- `/code-review feature/hourly-forecast` → branch=`feature/hourly-forecast`, target=`main`
- `/code-review feature/hourly-forecast pointing to develop` → branch=`feature/hourly-forecast`, target=`develop`

If `main` doesn't exist locally or on `origin` (this repo currently only has `master` and no configured remote), fall back to `master` and tell the user you did so rather than failing silently.

### 2. Fetch and diff

```bash
# Make sure we have latest refs (skip gracefully if there's no remote configured)
git fetch origin 2>/dev/null

# Get the diff (only changed files, not deleted)
git diff origin/<target>...origin/<branch> --name-status
git diff origin/<target>...origin/<branch>
```

If the branch doesn't exist on `origin` (or there's no remote at all), diff locally instead:
```bash
git diff <target>...<branch> --name-status
git diff <target>...<branch>
```

### 3. Read changed files

For each changed file, read the full file (not just the diff) so you can understand context — a function might look fine in isolation but violate patterns when you see the whole file. Focus on `.dart` files. Skip generated files (`*.freezed.dart`, `*.g.dart`, `*.config.dart`, `*.module.dart`).

### 4. Read project conventions

Read `CLAUDE.md` at the project root — it's this repo's own architecture brief (the Dart-workspace split, `Result<T>`/`Error`, DI via injectable/get_it, Cubit/Bloc + freezed state) and is the source of truth for what "correct" looks like here. Also check the user's `~/.claude/CLAUDE.md` if present, since it documents the same conventions at a general level.

This repo doesn't currently have nested per-package `CLAUDE.md` files or `docs/internals.md` — if one has been added to `packages/kernel`, `packages/domain`, or `packages/data` since this skill was written, read it too for module-specific rules.

### 5. Analyze the code

Go through each changed file and look for issues. Be thorough but practical — flag things that actually matter, not theoretical concerns.

#### What to check

**CRITICAL — Bugs, security, data loss:**
- Null safety violations (force-unwrapping that could crash)
- Race conditions or state mutation after disposal
- Emitting state after a Cubit/Bloc is closed — `FileUploadCubit` already guards this with `if (!isClosed) emit(...)` after its async gaps; any new Cubit/Bloc doing async work (isolates, network calls) before an `emit` needs the same guard
- Unhandled error paths that silently swallow failures
- Sensitive data exposure (API keys, tokens, or PII in logs or strings) — note that `DataModule` wires up `PrettyDioLogger(requestBody: true, responseBody: true)`, so any endpoint that starts requiring auth headers or returns PII needs those redacted before this logger ships them to the console
- SQL injection or command injection vectors
- Missing input validation at system boundaries (e.g. an empty/whitespace city name reaching `WeatherApi` unvalidated)

**HIGH — Architecture & patterns:**
- `packages/domain` importing Flutter, Dio, or anything from `data` — domain must stay pure Dart with zero Flutter/HTTP/JSON knowledge
- New business logic inlined into a Cubit/Bloc or widget instead of a dedicated use case (one class, one `call(...)` method, extending the `UseCase` marker) in `domain`
- Repository **interfaces** added to `domain` without a matching **implementation** in `data` (or vice versa) — annotated `@Singleton(as: <Contract>)`, matching `WeatherRepositoryImpl`
- Skipping the `Result<T>`/`Error` type for use case or repository returns — raw thrown exceptions crossing from `data` into the presentation layer instead of `Result.failed(...)`
- Cubits/Blocs not handling both `Result` branches (`.when(success: ..., failed: ...)`) — a failure case that's ignored or left to propagate
- New DTOs skipping `json_serializable` / hand-rolled JSON parsing instead of the established `fromJson`/`.g.dart` pattern
- Hardcoded URLs or magic strings where the codebase's convention is a `kPrefixName` top-level constant (see `kGeocodingSearchUrl`, `kWeatherForecastUrl` in `weather_api.dart`)
- New injectable classes missing or mismatching DI annotations (`@injectable` for per-resolution classes like Cubits/Blocs/use cases; `@lazySingleton`/`@Singleton(as: ...)` for shared instances like API clients and repositories) — and if a new injectable class was added, the generated `*.module.dart`/`injector.config.dart` should reflect it; flag stale generated files and mention `dart run build_runner build --delete-conflicting-outputs`
- DRY violations: duplicated logic across files that should be extracted
- Use cases doing more than one thing
- A screen/widget accumulating unrelated concerns (this codebase's `WeatherScreen` already mixes weather-fetching with an unrelated file-upload demo — don't let further unrelated features pile onto one screen without a comment)

**MEDIUM — Code smells & quality:**
- Missing tests for new use cases, repository methods, Cubits, or Blocs — each package (`domain`, `data`, and the app) owns its own `test/` directory; name the specific class that needs coverage
- Overly complex methods (deeply nested logic, long methods)
- Poor naming (vague names like `data`, `value`, `item` for domain concepts)
- Naming convention violations (files `snake_case`, classes `PascalCase`, constants `kPrefixName`)
- Widget trees that are too deep (nesting level > 5)
- Methods with more than 4 parameters
- Empty catch blocks or overly broad exception handling
- Unused imports or variables
- Missing `const` constructors where applicable
- `BlocBuilder`/`BlocConsumer` wrapping more of the widget tree than necessary, causing avoidable rebuilds

**LOW — Style & suggestions:**
- Import ordering (dart → flutter → external → internal)
- Trailing comma consistency
- Minor readability improvements
- Suggestions for better Flutter/Dart APIs
- Documentation that would help future developers

Don't invent lint rules this project doesn't enforce — check `analysis_options.yaml` before citing a specific rule name. Today it only includes `package:flutter_lints/flutter.yaml` with no custom rules added, so lean on `flutter analyze` output for anything mechanically checkable and reserve your own judgment for what analyze can't see (the architecture/pattern items above).

### 6. Produce the report

Structure your output exactly like this:

---

## Code Review: `<branch>` → `<target>`

**Files changed:** N files
**Lines added/removed:** +X / -Y

### Changed Files
List all changed files with their status (Added/Modified/Deleted).

---

### CRITICAL (if any)

For each finding:

> **[CATEGORY]** `file/path.dart:LINE`
>
> _Description of the issue and why it's critical._
>
> **Suggested fix:**
> ```dart
> // Show the fix or approach
> ```

---

### HIGH (if any)

Same format as CRITICAL.

---

### MEDIUM (if any)

Same format.

---

### LOW (if any)

Same format.

---

### Summary

| Severity | Count |
|----------|-------|
| Critical | N |
| High | N |
| Medium | N |
| Low | N |
| **Total** | **N** |

**Overall Assessment:** One paragraph summarizing the branch's readiness for merge. Be honest — if it's ready, say so. If it needs work, say what the blockers are (critical/high issues) vs. nice-to-haves (medium/low).

**Categories found:** List which categories appeared (bug, smell, dry, architecture, security, performance, style).

---

## Important guidelines

- If there are no issues at a severity level, skip that section entirely — don't show empty sections.
- Be specific. "This could be improved" is useless. Say exactly what's wrong and how to fix it.
- Don't flag things the linter/analyzer will already catch (like missing semicolons or obvious type errors). Focus on what requires human judgment.
- When suggesting architecture changes, reference the specific `CLAUDE.md` convention being violated.
- If a file is large, focus on the changed lines but use the surrounding context to understand intent.
- Group related findings (e.g., if the same pattern violation appears in 3 files, mention it once with all locations).
- If the branch looks clean, say so! A short report with no issues is a valid outcome.
- Consider the broader impact: does this change break anything? Does it need a `build_runner` regeneration? Are there downstream effects on other packages in the workspace?
