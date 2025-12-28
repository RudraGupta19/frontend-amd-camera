## Goals
- Remove navigation from home page buttons and switch their own Figma variants locally.
- Implement active/default variants for ScreenShow (screenshot), WhiteBalance, and Start Rec — all three should toggle.
- Keep each component strictly inside 290.63×290.63 boxes to prevent overflow/misalignment.

## Current Layout Analysis
- HomeScreen uses a fixed 992×744 canvas via _DesignCanvas.
- _FigmaButtonsRow composes three buttons with fixed gaps and padding.
- Each button currently navigates: screenshot/start-rec → /rec, white-balance → /settings.

## Implementation Plan
### 1) Asset Variants (Figma)
- Export active/default variants for all three components to assets/icons/:
  - screenshot_component.svg, screenshot_component_active.svg
  - white_balance_component.svg, white_balance_component_active.svg
  - start_rec_component.svg, start_rec_component_active.svg
- Ensure variant sizes match or can be safely rendered within 290.63×290.63.

### 2) Stateful Variant Buttons (All Toggle)
- Implement three stateful widgets:
  - _ScreenshotButton toggles default/active SVG on tap.
  - _WhiteBalanceButton toggles default/active SVG on tap.
  - _StartRecButton toggles default/active SVG on tap.
- Rendering contract for each:
  - SizedBox(width: 290.63, height: 290.63)
  - SvgPicture.asset(..., width: 290.63, height: 290.63, fit: BoxFit.contain)
  - Optional FittedBox(BoxFit.scaleDown) wrapper if an asset is slightly larger.

### 3) Replace Routing With Local Toggles
- Remove onScreenshot/onStartRec/onWhiteBalance callbacks from _FigmaButtonsRow.
- Instantiate the three new stateful buttons in the row.
- Preserve existing gaps and paddings to keep alignment.

### 4) Overflow/Misalignment Protection
- Fixed boxes for each button; BoxFit.contain to prevent runout.
- Keep row inside SizedBox(width: 992, height: 630) with FittedBox(BoxFit.scaleDown).
- Top bar remains unchanged.

### 5) Validation
- Static analysis to confirm code health.
- Visual verification at 992×744: toggle each button; confirm no navigation, no overflow, and accurate alignment.

### 6) Deliverables
- Updated home_screen.dart with local toggling for all three components.
- Downloaded active variant SVGs in assets/icons/.

## Confirmation
- Proceed with toggling for all three (Screenshot, WhiteBalance, Start Rec) and removing their routes.
- After your confirmation, I will download the variant assets and implement the changes.