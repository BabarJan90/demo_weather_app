I want to build a Flutter feature/app called <NAME> following Clean Architecture,
split across a Dart pub workspace with three packages plus the root app:

- packages/kernel — shared DI plumbing only (a GetIt singleton export, an empty
  @module/@microPackageInit scaffold). No business logic, no tests expected here.
- packages/domain — pure business logic: entities (lib/model/), an empty marker
  `abstract class Repository {}` plus feature-specific contracts extending it
  (lib/repository/), an empty marker `abstract class UseCase {}` plus
  feature-specific use cases extending it (lib/usecase/), and a shared
  Result<T>/Error type in lib/common/ — a native Dart 3 `sealed class` union
  (success/failed), NOT dartz/Either. Zero Flutter/HTTP/JSON knowledge allowed here.
- packages/data — implements domain's repository contracts: DTOs using
  json_annotation/json_serializable (one class per file, each with its own
  generated .g.dart), a dio-based API client, repository implementations
  annotated @Singleton(as: <Contract>).
- Root app lib/ — presentation only: Cubits (or full Bloc where I ask for it)
  with @freezed sealed class states, screens using flutter_bloc, wired to
  domain's use cases via get_it/injectable.

Tooling:
- Dart pub workspaces (`resolution: workspace` in each package + a `workspace:`
  list in the root pubspec) — NOT Melos.
- A Makefile with get/test/analyze/gen targets that auto-discover every
  pubspec.yaml via `find`, skip packages with zero test files gracefully, and
  run build_runner for codegen.
- DI via injectable + get_it, using the micropackage pattern (@microPackageInit
  per package, an explicit ExternalModule(...) list in the root injector.dart —
  do NOT rely on includeMicroPackages: true auto-discovery).

Process — this matters as much as the code:
1. For every non-trivial class, give me the FAILING test first. I'll run it
   myself to confirm it's red before you give me the implementation.
2. Name tests in a given/when/should style even in plain flutter_test/bloc_test.
3. Never guess a dependency version or an unfamiliar package's API surface if
   you're not certain — verify it (check the installed package source, the
   changelog, or official docs) before giving me code that depends on it.
4. Don't write files for me — give me the code and file paths, I'll type/apply
   it myself.

Feature to build first: <describe the actual feature/use case here>.