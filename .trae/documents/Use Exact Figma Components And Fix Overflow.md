## What I Found
- Start Rec on HOME is custom-drawn, not the Figma component, so the outer circle differs. See [home_screen.dart:L130-L173](file:///Users/ishaan/Desktop/cam/lib/features/home/home_screen.dart#L130-L173).
- Buttons row uses Transform.scale, which scales paint but not layout, causing the yellow/black right-side overflow stripes. See [home_screen.dart:L190-L219](file:///Users/ishaan/Desktop/cam/lib/features/home/home_screen.dart#L190-L219).
- Exact components exist in Figma:
  - SCREENSHOT node: 140:170 (component 55:964)
  - START REC node: 140:171 (component 83:267)
  - WHITE BALANCE instance: 140:172 (component 55:207)
- Repo already contains screenshot_component.svg and start_rec_component.svg, but HOME uses screenshot.svg and a hand-drawn Start Rec.

## Plan
### Download Exact Figma Assets
- Export SVGs directly from the provided Figma file (fileKey hI7M73HO3qnuJHp6MUSghQ):
  - 140:170 → assets/icons/screenshot_component.svg (replace existing if needed)
  - 140:171 → assets/icons/start_rec_component.svg
  - 140:172 → assets/icons/white_balance_component.svg (full component with text)
- Keep size 290.63×290.63 and no extra padding to match layout.

### Replace HOME Buttons With Components
- Screenshot: swap to assets/icons/screenshot_component.svg.
- Start Rec: remove custom Stack and use assets/icons/start_rec_component.svg.
- White Balance: use assets/icons/white_balance_component.svg and remove manual Text/ClipOval overlay.
- File changes in [home_screen.dart](file:///Users/ishaan/Desktop/cam/lib/features/home/home_screen.dart):
  - Replace _StartRecButton to render a single SvgPicture.asset.
  - Update _FigmaButtonsRow to use component assets for all three.

### Fix Overflow Properly
- Replace Transform.scale with FittedBox(BoxFit.scaleDown) around the Row so layout and paint sizes are consistent.
- Keep design spacing (gap 38.265625) and button size (290.63) intact.
- Ensure the row container width respects 992px minus horizontal paddings; no overflow stripes.

### Verify
- Run on web and macOS at 992×744:
  - No right-side overflow; stripes gone.
  - All three buttons perfectly circular and identical to Figma.
- Cross-check against Figma prototype for alignment and color.

## Next
- After confirmation, I’ll download the exact Figma SVGs, update the assets, refactor HOME to use them, and switch the scaling to FittedBox to remove overflow.