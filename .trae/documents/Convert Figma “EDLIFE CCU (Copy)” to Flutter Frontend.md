## Inputs Confirmed
- Figma file key: hI7M73HO3qnuJHp6MUSghQ
- Initial target: HOME screen (node 211:159 under canvas 211:158)
- Packages: go_router and flutter_svg

## Read-only Findings
- HOME contains: top bar (settings icon), preset box with label “Arthroscopy” and a small frame icon, and a main buttons frame with three actions: SCREENSHOT, START REC, and white balance (with “WB” text).
- Related destination frames for routing exist: “rec on” (309:255) and “SETTINGS” (211:278).

## Asset Extraction Plan
- Export SVG icons/images used on HOME:
  - settings box [211:253] → assets/icons/settings_box.svg
  - preset frame icon [211:259] → assets/icons/preset_frame.svg
  - SCREENSHOT (component 55:964) → assets/icons/screenshot.svg
  - START REC default (component 140:441) → assets/icons/start_rec_default.svg
  - START REC active (component 140:446) → assets/icons/start_rec_active.svg (for “rec on” state)
  - white balance base [I211:264;55:134] → assets/icons/white_balance.svg (label “WB” rendered as Text in Flutter)
- Extract colors and text styles referenced by fills/styles to map into ThemeData and TextTheme.

## Flutter Structure
- lib/main.dart (entry), lib/app.dart (MaterialApp), lib/router.dart (go_router setup), lib/theme.dart (ThemeData from Figma styles)
- lib/features/home/home_screen.dart: exact HOME layout
- lib/features/rec/rec_screen.dart: simple placeholder matching “rec on” for routing
- lib/features/settings/settings_screen.dart: simple placeholder matching “SETTINGS” for routing
- assets/icons/*, assets/images/*, assets/fonts/* (if needed)

## HOME Screen Implementation
- Top bar: settings icon at the left/right per design positioning; background and elevation/shadow per Figma.
- Preset box: “Arthroscopy” text style and a small frame icon; spacing consistent with design.
- Main buttons frame: three circular/rect buttons aligned and sized per Figma; use flutter_svg for icons.
- Exact spacing, radii, shadows, and colors replicated from Figma values.

## Routing
- /home: HOME
- /rec: “rec on”
- /settings: “SETTINGS”
- Wire onPressed:
  - START REC → /rec
  - white balance → /settings
  - SCREENSHOT → either a dedicated /screenshot route or a temporary no-op/visual feedback (confirm prototype target; default to /rec overlay if specified by Figma interactions).

## Verification
- Visual compare HOME against Figma; check alignment, sizes, colors, icons.
- Navigate buttons and confirm routes reach the correct screens.

## Deliverables (Phase 1)
- Flutter app with HOME fully implemented, assets integrated, and routing wired to /rec and /settings.
- Exact-match UI for HOME; stubs for destination screens to validate navigation.

## Next Steps (on confirmation)
- Download/export the listed SVGs and styles from Figma.
- Scaffold Flutter project, add go_router and flutter_svg, register assets.
- Implement HOME, wire routes, add placeholder screens, and verify.

## Optional Clarification
- If Figma’s prototype sets a specific target for SCREENSHOT, I will mirror it (route or overlay). If unspecified, I’ll add a non-blocking visual feedback or a placeholder route you prefer.