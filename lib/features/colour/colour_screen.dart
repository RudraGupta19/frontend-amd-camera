import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/styled_slider.dart';
import 'package:go_router/go_router.dart';

class ColourScreen extends StatelessWidget {
  const ColourScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _DesignCanvas(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                width: 992,
                height: 129.33,
                child: Row(
                  children: [
                    SizedBox(
                      width: 824.89,
                      height: 113.83,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(36.81, 8.23, 67.33, 8.23),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Settings', style: Theme.of(context).textTheme.displayLarge),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 167.11,
                      height: 113.83,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(35.36, 4.84, 36.81, 4.84),
                        child: GestureDetector(
                          onTap: () => context.go('/home'),
                          child: Center(
                            child: SvgPicture.asset('assets/icons/settings_box.svg', width: 77.5, height: 77.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 0,
              top: 114,
              child: SizedBox(
                width: 992,
                height: 519,
                child: Column(
                  children: [
                    _SliderRow(label: 'Saturation'),
                    _SliderRow(label: 'Temperature'),
                    _SliderRow(label: 'Hue'),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 616,
              child: SizedBox(
                width: 992,
                height: 128,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 18),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => context.go('/primary'),
                          child: const Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Primary',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 64,
                                fontWeight: FontWeight.w700,
                                height: 1.193359375,
                                fontFamily: 'SF Pro',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SvgPicture.asset('assets/icons/frame34_vector1.svg', width: 5, height: 70.5),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Colour',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 64,
                              fontWeight: FontWeight.w700,
                              height: 1.193359375,
                              fontFamily: 'SF Pro',
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SvgPicture.asset('assets/icons/frame34_vector2.svg', width: 5, height: 70.5),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => context.go('/advanced'),
                          child: const Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Advanced',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 64,
                                fontWeight: FontWeight.w700,
                                height: 1.193359375,
                                fontFamily: 'SF Pro',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DesignCanvas extends StatelessWidget {
  final Widget child;
  const _DesignCanvas({required this.child});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          alignment: Alignment.center,
          color: const Color(0xFF000000),
          child: FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.center,
            child: SizedBox(width: 992, height: 744, child: child),
          ),
        );
      },
    );
  }
}

class _SliderRow extends StatefulWidget {
  final String label;
  const _SliderRow({required this.label});
  @override
  State<_SliderRow> createState() => _SliderRowState();
}

class _SliderRowState extends State<_SliderRow> {
  double _value = 50;
  final double _min = 0;
  final double _max = 100;
  final int _divisions = 100;
  String _format(double v) => v.round().toString();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 992,
      height: 128.75,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 1,
            child: SizedBox(
              width: 320,
              height: 129,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 36),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(widget.label, style: Theme.of(context).textTheme.headlineMedium),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 320,
            top: 1,
            child: SizedBox(
              width: 672,
              height: 130,
              child: StyledSlider(
                value: _value,
                min: _min,
                max: _max,
                divisions: _divisions,
                formatLabel: _format,
                onChanged: (v) => setState(() => _value = v),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
