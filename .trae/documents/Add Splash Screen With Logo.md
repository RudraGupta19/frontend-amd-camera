## Feasibility
Yes — we can show `amdlogo.png` as a splash, blink it three times, then navigate to the user panel. This fits well with your current router setup and works on web and mobile.

## Implementation (Router-based)
1. Asset
   - Place `amdlogo.png` in `assets/images/` (or `assets/icons/`).
   - Register the path in `pubspec.yaml` under `flutter.assets`.

2. Splash Screen
   - Create `lib/features/splash/splash_screen.dart`.
   - Full-screen black background, centered `Image.asset('assets/images/amdlogo.png')`.
   - Use `AnimationController` + `FadeTransition` to blink:
     - Configure a short fade in/out (e.g., 250–300 ms per half-cycle).
     - Repeat opacity cycle 3 times (fade in → fade out repeated 3×).
   - When the third blink completes, call `GoRouter.of(context).go('/home')`.
   - Add a resilience fallback (if disposed or errors), navigate after a fixed timeout.

3. Router
   - In `lib/router.dart` add a `GoRoute` for `/splash`: `NoTransitionPage(child: SplashScreen())`.
   - Set `initialLocation: '/splash'`.

4. Transitions 
   - Keep `NoTransitionPage` for instant handoff to the menu, or optionally add a final 150 ms fade-out.

## Timing Options
- Default: 3 blinks, total ~1.8–2.4 s (configurable with constants).
- You can change blink count/duration easily via variables.

## Testing
- Run on web and confirm: logo appears, blinks 3 times, menu shows.
- Ensure no layout shifts; verify navigation on reload.

## Info Needed
- Confirm the final asset path for `amdlogo.png`.
- Desired blink speed (e.g., 300 ms per fade in/out) and final pause duration before navigation.
- Background color and logo display size (e.g., fit within the 992×744 canvas or full-screen).