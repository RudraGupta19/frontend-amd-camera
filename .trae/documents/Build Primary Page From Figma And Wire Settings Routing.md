## Goal
Replicate the Figma PRIMARY page precisely using exported components, then wire navigation: Home settings box → Primary, and Primary settings box → Home.

## Assets To Extract
- PRIMARY frame components from Figma file hI7M73HO3qnuJHp6MUSghQ:
  - Top bar settings box: node 140:175 (reuse settings_box.svg if identical)
  - Section titles: Primary / Colour / Advanced (text rendered in Flutter per primary.md)
  - Divider lines: nodes 140:188, 140:193, 140:198 (thin SVG strokes)
  - Brightness slider instance: node 140:192 (with slider bob 115:172)
  - Zoom slider instance: node 140:197
  - Contrast slider instance: node 140:202
  - Low light gain button: component set 110:120 or 140:361 (exact variant present under PRIMARY)
- Store under assets/icons/, matching names: brightness_slider.svg, zoom_slider.svg, contrast_slider.svg, low_light_button.svg, dividers.svg (or separate divider svgs).

## Implementation
- Create lib/features/primary/primary_screen.dart:
  - Wrap with the existing _DesignCanvas-like fixed 992×744 canvas for consistent scaling.
  - Build top bar: “Settings” text at left; settings box component at right as a tappable target (navigates to Home).
  - Build middle content: three rows (Brightness, Zoom, Contrast) each combining the exact slider SVG plus left label, right numeric block as specified in primary.md.
  - Build bottom tab labels (Primary, Colour, Advanced) with exact sizes/opacity; keep black background.
- Use SvgPicture.asset for all component positions; respect primary.md paddings, sizes, and alignment constants.

## Routing
- Add a new route in router.dart: /primary → PrimaryScreen.
- Make HomeScreen top-bar settings box tappable to navigate to /primary.
- Make PrimaryScreen top-bar settings box tappable to navigate to /home.

## Verification
- Run on web and macOS at 992×744.
- Visually verify alignment against Figma for top bar, sliders, and bottom labels.
- Check that clicks on settings box navigate both ways and back/forward work.

## Deliverables
- New screen file primary_screen.dart implemented with exact Figma components.
- Updated router.dart and HomeScreen settings box interactions.
- Downloaded SVGs placed in assets/icons/ and used in the screen.

Proceeding to implement and verify after approval.