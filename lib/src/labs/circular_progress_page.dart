import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({Key? key}) : super(key: key);

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> circleAnimation;
  double progress = 0.0;
  double newProgress = 0.0;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    controller.addListener(() {
      setState(() {
        progress = lerpDouble(progress, newProgress, controller.value)!;
      });
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => setState(() {
          if (newProgress >= 100) {
            progress = 0;
            newProgress = 0;
          } else {
            print(progress);
            progress = newProgress;
            newProgress += 10;
            controller.forward(from: 0.0);
          }
        }),
        child: const Icon(Icons.refresh_outlined),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(7),
          width: 300,
          height: 300,
          child: CustomPaint(painter: _MyRadialProgress(progress: progress)),
        ),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double progress;
  _MyRadialProgress({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    //full circle
    final pencil = Paint()
      ..strokeWidth = 8
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, pencil);

    final arcPencil = Paint()
      ..strokeWidth = 16
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    //part must be filled
    double arcAngle = 2 * pi * (progress / 100);
    //arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      arcPencil,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
