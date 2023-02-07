import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../../common/providers/theme_provider.dart';
import 'package:e_commerce_app/src/feature/widget/greetings/prelogin_screen.dart';

class PreloaderScreen extends StatefulWidget {
  const PreloaderScreen({super.key});

  @override
  State<PreloaderScreen> createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen>
    with TickerProviderStateMixin {
  route() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PreloginScreen()));
  }

  startTimer() async {
    return Timer(const Duration(milliseconds: 600), route);
  }

  late final AnimationController _controller;

  @override
  void initState() {
    // startTimer();
    _controller = AnimationController(vsync: this)
      ..addListener(() {
        if (_controller.isCompleted) {
          startTimer();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ThemeProvider>(context).getThemeMode(),
      builder: (context, AsyncSnapshot snapshot) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset(
              'assets/animations/welcome.json',
              controller: _controller,
              fit: BoxFit.cover,
              onLoaded: (p0) {
                _controller.duration = p0.duration;
                _controller.forward();
              },
            ),
          ],
        ),
      ),
    );
  }
}
