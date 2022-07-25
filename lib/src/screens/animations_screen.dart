import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: AnimationSquare()),
    );
  }
}

class AnimationSquare extends StatefulWidget {
  const AnimationSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimationSquare> createState() => _AnimationSquareState();
}

class _AnimationSquareState extends State<AnimationSquare> with SingleTickerProviderStateMixin {
  // Animation
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> rightTransform;
  late Animation<double> expand;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));
    //with controller
    // rotation = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(controller);
//with curve
    rotation = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    ));
    //opacity
    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut)),
    );
    //translation
    rightTransform = Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));
    expand = Tween(begin: 0.2, end: 2.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    ));

    controller.addListener(() {
      print(controller.status);
      if (controller.status == AnimationStatus.completed) {
        //prepare the animation again .reset();
        controller.reverse();
        //controller.repeat();
      } else if ((controller.status == AnimationStatus.dismissed)) {
        //change of screen
        controller.reset();
        print("finished");
      }
      if (opacity.value == 1) {
        opacity = Tween(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeOut),
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //darle al play

    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (context, child) {
        //print(rotation.value);
        return Transform.translate(
          offset: Offset(rightTransform.value, 0),
          child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                opacity: opacity.value,
                child: Transform.scale(scale: expand.value, child: child),
              )),
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
      decoration: const BoxDecoration(color: Colors.orange),
    );
  }
}
