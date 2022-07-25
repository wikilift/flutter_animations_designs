import 'package:flutter/material.dart';

class AnimatedSquareScreen extends StatelessWidget {
  const AnimatedSquareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedSquareChallenge(),
      ),
    );
  }
}

class AnimatedSquareChallenge extends StatefulWidget {
  const AnimatedSquareChallenge({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSquareChallenge> createState() => _AnimatedSquareChallengeState();
}

class _AnimatedSquareChallengeState extends State<AnimatedSquareChallenge> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> translateRight;
  late Animation<double> translateLeft;
  late Animation<double> translateUp;
  late Animation<double> translateDown;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));
    translateRight = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.bounceOut)));
    translateUp = Tween(begin: 0.0, end: -100.0)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));
    translateLeft = Tween(begin: 0.0, end: -100.0)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));
    translateDown = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.75, 1, curve: Curves.bounceOut)));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(translateRight.value + translateLeft.value, translateUp.value + translateDown.value),
          child: child,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
