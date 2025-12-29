import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    Future<void>(() async {
      for (int i = 0; i < 3; i++) {
        await _controller.forward();
        await _controller.reverse();
      }
      if (mounted) GoRouter.of(context).go('/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Align(
        alignment: const Alignment(0, -0.22),
        child: FadeTransition(
          opacity: _opacity,
          child: Image.asset('assets/icons/amd_upper_full.png', width: 700, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
