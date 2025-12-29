import 'package:flutter/material.dart';

class StyledSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String Function(double v)? formatLabel;
  final Size size;
  final double readoutWidth;
  const StyledSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.divisions,
    this.formatLabel,
    this.size = const Size(672, 130),
    this.readoutWidth = 100.0,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _SliderPainter(value: value, min: min, max: max))),
          Positioned(
            left: size.width * (640.0 / 737.0),
            top: size.height * (37.0 / 130.0),
            width: size.width * (readoutWidth / 737.0),
            height: size.height * (55.0 / 130.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF262626),
                borderRadius: BorderRadius.circular(size.height * (10.0 / 130.0)),
              ),
              alignment: Alignment.center,
              child: Text(
                (formatLabel ?? _defaultFormat)(value),
                style: TextStyle(
                  color: const Color(0xFF00AEFF),
                  fontSize: size.height * (24.0 / 130.0),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * (38.0 / 737.0),
            width: size.width * (561.0 / 737.0),
            top: 0,
            height: size.height,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 0.1,
                activeTrackColor: Colors.transparent,
                inactiveTrackColor: Colors.transparent,
                thumbColor: Colors.transparent,
                overlayColor: Colors.transparent,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
              ),
              child: Slider(min: min, max: max, divisions: divisions, value: value, onChanged: onChanged),
            ),
          ),
        ],
      ),
    );
  }

  String _defaultFormat(double v) {
    return ((v - min) / (max - min) * 100).round().toString();
  }
}

class _SliderPainter extends CustomPainter {
  final double value;
  final double min;
  final double max;
  _SliderPainter({required this.value, required this.min, required this.max});
  @override
  void paint(Canvas canvas, Size size) {
    final sx = size.width / 737.0;
    final sy = size.height / 130.0;
    final t = ((value - min) / (max - min)).clamp(0.0, 1.0);
    final trackRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(38 * sx, 61 * sy, 561 * sx, 8 * sy),
      Radius.circular(4 * sy),
    );
    final basePaint = Paint()..color = const Color(0xFF262626);
    final progPaint = Paint()..color = const Color(0xFF00AEFF);
    canvas.drawRRect(trackRect, basePaint);
    final progW = (561 * sx) * t;
    final progRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(38 * sx, 61 * sy, progW, 8 * sy),
      Radius.circular(4 * sy),
    );
    canvas.drawRRect(progRect, progPaint);
    final cy = 65 * sy;
    final cx = (38 * sx) + (561 * sx) * t;
    final knobPaint = Paint()..color = const Color(0xFF44C4FF);
    canvas.drawCircle(Offset(cx, cy), 27.5 * sy, knobPaint);
  }

  @override
  bool shouldRepaint(covariant _SliderPainter oldDelegate) => oldDelegate.value != value;
}
