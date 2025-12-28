import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _DesignCanvas(
        child: Column(
          children: [
            SizedBox(
              height: 129.33,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 824.89,
                    height: 113.83,
                    padding: const EdgeInsets.fromLTRB(36.8125, 8.234375, 67.328125, 8.234375),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Arthroscopy', style: Theme.of(context).textTheme.displayLarge),
                        const SizedBox(width: 14.046875),
                        SvgPicture.asset('assets/icons/pencil.svg', width: 72.66, height: 72.66),
                      ],
                    ),
                  ),
                  Container(
                    width: 167.11,
                    height: 113.83,
                    padding: const EdgeInsets.fromLTRB(35.359375, 4.84375, 36.8125, 4.84375),
                    child: GestureDetector(
                      onTap: () => context.push('/primary'),
                      child: Center(
                        child: SvgPicture.asset('assets/icons/gear.svg', width: 77.5, height: 77.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFF000000),
                child: Center(
                  child: const _FigmaButtonsRow(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  const _RoundButton({required this.iconPath, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(iconPath, width: 290.63, height: 290.63),
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
            child: SizedBox(
              width: 992,
              height: 744,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
class _WhiteBalanceButton extends StatefulWidget {
  const _WhiteBalanceButton();
  @override
  State<_WhiteBalanceButton> createState() => _WhiteBalanceButtonState();
}

class _WhiteBalanceButtonState extends State<_WhiteBalanceButton> {
  bool _active = false;
  void _toggle() => setState(() => _active = !_active);
  @override
  Widget build(BuildContext context) {
    const size = 290.63;
    return GestureDetector(
      onTap: _toggle,
      child: SizedBox(
        width: size,
        height: size,
        child: SvgPicture.asset(
          _active ? 'assets/icons/white_balance_component_active.svg' : 'assets/icons/white_balance_component.svg',
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _StartRecButton extends StatefulWidget {
  const _StartRecButton();
  @override
  State<_StartRecButton> createState() => _StartRecButtonState();
}

class _StartRecButtonState extends State<_StartRecButton> {
  int _state = 0; // 0 = default, 1 = variant2
  double _scale() {
    return _state == 0 ? 0.50 : 0.53;
  }
  Widget _default() {
    return SizedBox(
      width: 600,
      height: 600,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset('assets/icons/start_rec_home_default.svg', fit: BoxFit.contain),
          ),
          const Positioned(
            left: 131,
            top: 131,
            child: SizedBox(
              width: 338,
              height: 338,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(width: 12, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 150 + 45,
            top: 150 + 45,
            child: GestureDetector(
              onTap: () => setState(() => _state = 1),
              child: const SizedBox(width: 210, height: 210),
            ),
          ),
        ],
      ),
    );
  }
  Widget _variant2() {
    return SizedBox(
      width: 600,
      height: 907,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/icons/start_rec_home_variant2.svg',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            top: 101,
            child: SizedBox(
              width: 600,
              height: 807,
              child: Stack(
                children: [
                  const Positioned(
                    left: 131,
                    top: 67,
                    child: SizedBox(
                      width: 338,
                      height: 338,
                      child: DecoratedBox(
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 131,
                    top: 502,
                    child: SizedBox(
                      width: 338,
                      height: 338,
                      child: DecoratedBox(
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 131 + 84,
                    top: 37 + 84,
                    child: GestureDetector(
                      onTap: () => setState(() => _state = 0),
                      child: const SizedBox(width: 170, height: 170),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    const size = 290.63;
    return SizedBox(
      width: size,
      height: size,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        child: Transform.scale(
          scale: _scale(),
          child: FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.center,
            child: _state == 0 ? _default() : _variant2(),
          ),
        ),
      ),
    );
  }
}

class _ScreenshotButton extends StatefulWidget {
  const _ScreenshotButton();
  @override
  State<_ScreenshotButton> createState() => _ScreenshotButtonState();
}

class _ScreenshotButtonState extends State<_ScreenshotButton> {
  bool _active = false;
  void _toggle() => setState(() => _active = !_active);
  @override
  Widget build(BuildContext context) {
    const size = 290.63;
    return GestureDetector(
      onTap: _toggle,
      child: SizedBox(
        width: size,
        height: size,
        child: SvgPicture.asset(
          _active ? 'assets/icons/screenshot_component_active.svg' : 'assets/icons/screenshot_component.svg',
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _FigmaButtonsRow extends StatelessWidget {
  const _FigmaButtonsRow();
  @override
  Widget build(BuildContext context) {
    const gap = 38.265625;
    const horizontalPadding = 46.015625;
    return SizedBox(
      width: 992,
      height: 630,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 82.828125),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              _ScreenshotButton(),
              SizedBox(width: gap),
              _StartRecButton(),
              SizedBox(width: gap),
              _WhiteBalanceButton(),
            ],
          ),
        ),
      ),
    );
  }
}
