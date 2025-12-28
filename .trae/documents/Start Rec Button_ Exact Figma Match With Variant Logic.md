## Goals
- Match the Start Rec button exactly to the Figma design across 3 states: Variant1 (idle), Variant2 (recording with pause), Variant3 (paused with resume).
- Make the button visually grow when switching between Variant2 and Variant3, while staying inside its designated canvas box.
- Implement precise hit-target logic: tapping red Start Rec square or play/pause should trigger the specified transitions.

## Figma Reference Dimensions
- Variant1 (idle): 600×600 (capsule with central ring/red circle)
- Variant2 (recording): 600×907 (top 00:00 header + capsule + upper ring + lower ring with pause)
- Variant3 (paused): 600×891 (top 00:00 header + capsule + upper ring + lower ring with play)
- Top time label: “00:00” SF Pro, ~91.7 px, weight ~590 (use w600 in Flutter)
- Rings: oval borders with 12 px stroke, white

## State Machine & Interactions
- States: v1 → v2 → v3
- Taps:
  - v1: tap Start Rec (red) → v2
  - v2: tap Start Rec (red square) → v1; tap Pause → v3
  - v3: tap Resume (play) → v2; tap Start Rec (red square) → v1

## Rendering Strategy
- Keep the button inside a fixed 290.63×290.63 box in the home row to avoid overflow/misalignment.
- Internally render Figma-accurate layouts at their native sizes and scale them down via FittedBox(BoxFit.contain).
- Animate growth between v2 and v3:
  - Use AnimatedContainer around the internal content, switching height from 907 (v2) → 891 (v3), plus a slight scale factor bump (e.g., v2 scale 0.48, v3 scale 0.50) so v3 appears visually larger within the same outer box.
- Draw shapes in Flutter for precision (capsule, rings, glyphs) and place hit areas exactly using Positioned/SizedBox.

## Implementation Steps
1) Create a StartRecState enum { v1, v2, v3 }.
2) Rewrite _StartRecButton as a StatefulWidget:
   - Outer: SizedBox(width: 290.63, height: 290.63)
   - Child: AnimatedContainer + FittedBox(BoxFit.contain) rendering one of three builders:
     - _buildV1(): 600×600 stack (capsule + center ring + red circle)
     - _buildV2(): 600×907 stack (00:00 at top; capsule; upper ring; lower ring with pause icon)
     - _buildV3(): 600×891 stack (00:00 at top; capsule; upper ring; lower ring with play icon)
3) Hit-targets:
   - Wrap the red square area with GestureDetector in v2/v3 for Start Rec.
   - Wrap the lower circle region with GestureDetector for Pause/Resume (v2 → v3, v3 → v2).
   - In v1, tap the center red circle → v2.
4) Animate transitions:
   - Use AnimatedContainer duration 200–300ms for height/scale changes.
   - Optionally add AnimatedOpacity for the green/grey header band to match Figma transitions.
5) Integrate in _FigmaButtonsRow without routing; keep gaps/padding; ensure BoxFit.scaleDown at the row level.

## Validation
- Verify visual match against Figma at 992×744.
- Toggle paths v1→v2→v3 and back per rules; confirm growth between v2 and v3.
- Ensure no overflow and consistent alignment within the row.

## Deliverables
- Updated _StartRecButton in home_screen.dart implementing exact Figma drawing and state transitions.
- No changes to assets are strictly required since shapes are drawn; if you prefer assets, I can import variant SVGs and swap them instead of drawing.

## Notes
- Font weight 590 approximated with FontWeight.w600.
- If you want the precise green/grey header colors, provide hex codes; otherwise I’ll read them from Figma and apply.