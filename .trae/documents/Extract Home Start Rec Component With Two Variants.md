## Figma Targets
- Source: Home page START REC component set.
- Variants to use:
  - Variant 1 (Default): component id 140:441
  - Variant 2 (Recording): component id 140:446 (or instance 243:72 mapped to Variant2)

## Assets To Extract
- Export two SVGs from the component set:
  - start_rec_home_default.svg (from 140:441)
  - start_rec_home_variant2.svg (from 140:446)
- Keep native dimensions from Figma to ensure accurate scaling and placement.

## Flutter Integration
- Place the two SVGs under assets/icons/ and reference them in the app.
- Implement a stateful StartRecButton that:
  - Renders inside a fixed 290.63×290.63 box to avoid overflow.
  - Displays start_rec_home_default.svg by default.
  - On tap, toggles to start_rec_home_variant2.svg; on tap again, returns to default.
- Overlay transparent GestureDetector rectangles aligned to the Figma geometry (e.g., the central red square area in Variant2) to control toggling without altering visuals.

## Alignment & Sizing
- Use FittedBox(BoxFit.contain) for the internal SVG so native Figma sizes scale uniformly inside 290.63×290.63.
- Maintain consistent gaps and padding in _FigmaButtonsRow so the button sits correctly with Screenshot and WhiteBalance.

## Validation
- Run static analysis to confirm no errors.
- Visual verification at 992×744:
  - Confirm exact match to Figma visuals for both variants.
  - Ensure no overflow/misalignment in the row.

## Deliverables
- Two SVGs exported from Figma for START REC (default and Variant2) and added to assets/icons/.
- Updated StartRecButton in home_screen.dart using the two Figma variants with toggle logic and correct alignment.

## Confirmation
- Proceed with extracting the two SVGs and wiring the StartRecButton to toggle between them as described?