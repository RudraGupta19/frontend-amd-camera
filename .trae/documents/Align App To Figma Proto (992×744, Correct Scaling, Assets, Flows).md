## Objective
- Match the Figma proto behavior from the provided links
- Use file key hI7M73HO3qnuJHp6MUSghQ, start from node 140:159 (main frame)
- Fix window/canvas to 992×744, full-black background, no debug banner
- Balance icons/buttons using exact Figma measurements (no ad‑hoc scaling)

## Key Measurements To Apply
- Canvas: 992×744 (black)
- Top bar: height 129.33; title “Arthroscopy” font size 77.5; pencil icon 72.66×72.66; gear inner ~77.5×77.5 inside 167.11×113.83
- Main button row: height 630; padding 82.83; gaps 38.27; button diameter 290.63
- Inner assets: camera 161.52×120.8 @ x=64.42,y=78.47; red inner circle 145.32; WB text size 145.31 (opacity ~0.9)

## Implementation Steps
### Platform Sizing
1. macOS: lock window to 992×744 (min/max=992×744, aspectRatio 4:3, non‑resizable).
2. Web: wrap the app in a centered fixed 992×744 canvas; outer letterbox is black; use FittedBox(BoxFit.contain) to preserve proportions.

### Layout 
3. Build a reusable DesignCanvas(992×744) wrapper for all screens (HOME/REC/SETTINGS) with black background.
4. Recreate the top bar exactly (title + pencil + gear) using Figma sizes/padding.
5. Recreate the button row using Figma button diameter/gaps and inner placements.

### Assets/Fonts
6. Export correct pencil and gear icons from Figma and replace placeholders; keep existing screenshot/start_rec/WB assets.
7. If SF Pro font files are available, register them; otherwise keep system font with matching sizes/weights.

### Flows
8. Wire prototype interactions:
   - Start Rec toggles to active state with timer "00:00" (REC screen variant)
   - Screenshot action (confirm: navigate or overlay)
   - White Balance navigates to Settings

### Visual QA
9. Remove debug banner globally; ensure full-black backgrounds (scaffold + canvas + letterbox).
10. Verify no overflow at 992×744; confirm balanced icon/button sizes against Figma.

## File Changes (High-Level)
- macos/Runner/MainFlutterWindow.swift: set 992×744, aspect 4:3, non‑resizable
- lib/app.dart: disable debug banner
- lib/theme.dart: black scaffold/surfaces; text theme sizes per Figma
- lib/features/*: wrap with DesignCanvas(992×744); rebuild top bar + button row with Figma sizes; integrate new icons
- pubspec.yaml: register any new icons/fonts (if provided)

## Deliverables
- macOS + web builds render a fixed, scaled 992×744 canvas that matches the Figma proto
- Balanced buttons/icons with exact measurements
- Prototype flows functioning with go_router/state

## Confirmation
- Confirm to proceed with these changes and the icon exports from the specified Figma file; I will implement and verify on macOS and web next. 