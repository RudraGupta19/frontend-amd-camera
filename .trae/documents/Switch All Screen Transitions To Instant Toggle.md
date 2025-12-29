## Goal
Remove slide animations when switching screens so navigation feels like an immediate toggle.

## Approach
- Replace default go_router page transitions with instant, no-animation pages.
- Keep existing navigation semantics; optionally convert some `push` calls to `go` for stronger “toggle” behavior.

## Implementation Steps
1. Update all routes to use `NoTransitionPage`:
   - Edit `lib/router.dart:12-41` to change each `GoRoute` from `builder:` to `pageBuilder:` returning `NoTransitionPage(child: ...)`.
   - Example:
     - Before: `builder: (context, state) => const HomeScreen()`
     - After: `pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen())`
2. Optional toggle semantics:
   - Review places that use `context.push(...)` and switch to `context.go(...)` where you want replacement-style toggling.
   - Notable call: `lib/features/home/home_screen.dart:37` (`context.push('/primary')`). We can keep `push` if back navigation is desired, or switch to `go` for a stricter toggle.

## Verification
- Run on Chrome and navigate between Home, Primary, Colour, Advanced, Rec, Settings.
- Confirm transitions are instantaneous with no slide/fade.
- Validate back behavior still matches expectations (based on `push` vs `go`).

## Scope & Impact
- Changes isolated to `lib/router.dart` (and optionally specific `context.push` occurrences).
- No UI component visuals or in-screen animations are altered.
- Deep links and route names remain the same.

## Next
- If you prefer replacement navigation everywhere, confirm and I will convert `push` → `go` where appropriate after applying no-animation pages.
