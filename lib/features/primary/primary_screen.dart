import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key});
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
                          onTap: () => context.push('/home'),
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
            Positioned(
              left: 0,
              top: 114,
              child: SizedBox(
                width: 992,
                height: 500,
                child: Column(
                  children: [
                    const _SliderRow(
                      label: 'Brightness',
                      sliderAsset: 'assets/icons/brightness_slider.svg',
                    ),
                    const _SliderRow(
                      label: 'Zoom',
                      sliderAsset: 'assets/icons/zoom_slider.svg',
                    ),
                    const _SliderRow(
                      label: 'Contrast',
                      sliderAsset: 'assets/icons/contrast_slider.svg',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 294, vertical: 15),
                      child: _LowLightButton(),
                    ),
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
                          onTap: () {},
                          child: const Text(
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
                        const SizedBox(width: 20),
                        SvgPicture.asset('assets/icons/frame34_vector1.svg', width: 5, height: 70.5),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => context.push('/colour'),
                          child: const Opacity(
                            opacity: 0.5,
                            child: Text(
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
                        ),
                        const SizedBox(width: 20),
                        SvgPicture.asset('assets/icons/frame34_vector2.svg', width: 5, height: 70.5),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => context.push('/advanced'),
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

class _SliderRow extends StatelessWidget {
  final String label;
  final String sliderAsset;
  const _SliderRow({required this.label, required this.sliderAsset});
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
              width: 300,
              height: 129,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 36),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(label, style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
            ),
          ),
          Positioned(
            left: 255,
            top: 1,
            child: SizedBox(
              width: 737,
              height: 130,
              child: SvgPicture.asset(sliderAsset, width: 737, height: 130, fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}

class _LowLightButton extends StatefulWidget {
  const _LowLightButton({super.key});
  @override
  State<_LowLightButton> createState() => _LowLightButtonState();
}

class _LowLightButtonState extends State<_LowLightButton> {
  bool _active = false;
  void _toggle() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: SizedBox(
        width: 404,
        height: 83,
        child: _active
            ? SvgPicture.asset('assets/icons/low_light_button_active.svg', width: 404, height: 83, fit: BoxFit.contain)
            : SvgPicture.asset('assets/icons/low_light_button.svg', width: 404, height: 83, fit: BoxFit.contain),
      ),
    );
  }
}
