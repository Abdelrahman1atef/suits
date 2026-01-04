import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_image.dart';
import 'package:suits/core/widgets/app_text.dart';
import 'package:suits/views/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  bool _isMoved = false;
  bool _showText = false;

  @override
  void initState()  {
    super.initState();
    _startSequence();
    _startPush();
  }
  void _startPush() async{
   await Future<void>.delayed(const Duration(milliseconds: 3000));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const OnBoardingView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(2, 0), end: const Offset(0, 0)),
            ),
            child: child,
          );
        },
      ),
    );
  }
  void _startSequence() async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    setState(() => _isMoved = true);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    setState(() => _showText = true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              alignment: _isMoved ? const Alignment(-0.5, 0) : Alignment.center,
              child: const AppImage(image: "app_logo_s.png"),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              alignment: _isMoved ? const Alignment(0.5, 0) : Alignment.center,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: _showText ? 1.0 : 0.0,
                child: AppText(
                  "suits",
                  style: TextStyle(
                    fontFamily: "Waterfall",
                    fontSize: 128,
                    color: theme.colorScheme.onPrimary,
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
