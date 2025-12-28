import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
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
                      Text('Settings', style: Theme.of(context).textTheme.displayLarge),
                    ],
                  ),
                ),
                Container(
                  width: 167.11,
                  height: 113.83,
                  padding: const EdgeInsets.fromLTRB(35.359375, 4.84375, 36.8125, 4.84375),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/gear.svg', width: 77.5, height: 77.5),
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
                  child: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.displayLarge,
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
