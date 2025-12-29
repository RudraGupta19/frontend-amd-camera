import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Future.microtask(() => setState(() => _visible = true));
  }
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
                      onTap: () => context.go('/primary'),
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
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: _FigmaButtonsRow(),
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

class _StartRecButton extends StatelessWidget {
  final ValueChanged<bool>? onExpandedChanged;
  const _StartRecButton({this.onExpandedChanged});
  @override
  Widget build(BuildContext context) {
    const size = 290.63;
    return GestureDetector(
      onTap: () => onExpandedChanged?.call(true),
      child: SizedBox(
        width: size,
        height: size,
        child: SvgPicture.asset('assets/icons/start_rec_default.svg', fit: BoxFit.contain),
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

class _FigmaButtonsRow extends StatefulWidget {
  const _FigmaButtonsRow();
  @override
  State<_FigmaButtonsRow> createState() => _FigmaButtonsRowState();
}

class _FigmaButtonsRowState extends State<_FigmaButtonsRow> {
  bool _expanded = false;
  bool _bottomPauseVariant = false;
  void _setExpanded(bool v) => setState(() {
        _expanded = v;
        _bottomPauseVariant = false;
      });
  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 46.015625;
    return SizedBox(
      width: 992,
      height: 630,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 82.828125),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _ScreenshotButton(),
                GestureDetector(
                  onTap: _expanded ? null : () => _setExpanded(true),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: _expanded ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: SizedBox(
                          width: 290.63,
                          height: 290.63,
                          child: SvgPicture.asset('assets/icons/start_rec_default.svg', fit: BoxFit.contain),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _expanded ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: SizedBox(
                          width: 290.63,
                          height: 439.34,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: SvgPicture.asset(
                                  'assets/icons/expanded_background_recording_rectangle.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 32.45),
                                  child: GestureDetector(
                                    onTap: () => _setExpanded(false),
                                    child: SizedBox(
                                      width: 163.72,
                                      height: 163.72,
                                      child: SvgPicture.asset('assets/icons/pause.svg', fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 32.45),
                                  child: GestureDetector(
                                    onTap: () => setState(() => _bottomPauseVariant = !_bottomPauseVariant),
                                    child: SizedBox(
                                      width: 163.72,
                                      height: 163.72,
                                      child: Stack(
                                        children: [
                                          AnimatedOpacity(
                                            opacity: _bottomPauseVariant ? 0.0 : 1.0,
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                            child: SvgPicture.asset('assets/icons/Property 1=PAUSE.svg', fit: BoxFit.contain),
                                          ),
                                          AnimatedOpacity(
                                            opacity: _bottomPauseVariant ? 1.0 : 0.0,
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                            child: SvgPicture.asset('assets/icons/Property 1=Variant2 (2).svg', fit: BoxFit.contain),
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
                      ),
                    ],
                  ),
                ),
                const _WhiteBalanceButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
