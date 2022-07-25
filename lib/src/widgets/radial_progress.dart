import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double progress;
  final Color background;
  final Color progressColor;
  final double strokePrimary;
  final double strokeSecondary;
  final double width;
  final double height;
  const RadialProgress(
      {Key? key,
      required this.progress,
      required this.background,
      required this.progressColor,
      this.strokePrimary = 8,
      this.strokeSecondary = 16,
      this.width = double.infinity,
      this.height = double.infinity})
      : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double lastProgress;
  @override
  void initState() {
    lastProgress = widget.progress;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final differenceBetween = widget.progress - lastProgress;
    lastProgress = widget.progress;
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Container(
              padding: const EdgeInsets.all(10),
              width: widget.width,
              height: widget.height,
              child: CustomPaint(
                  painter: _MyRadialProgress(
                      progress: (widget.progress - differenceBetween) + (differenceBetween * controller.value),
                      background: widget.background,
                      progressColor: widget.progressColor,
                      strokePrimary: widget.strokePrimary,
                      strokeSecondary: widget.strokeSecondary)),
            ));

    // return
  }
}

class _MyRadialProgress extends CustomPainter {
  final double progress;
  final Color background;
  final Color progressColor;
  final double strokePrimary;
  final double strokeSecondary;
  _MyRadialProgress(
      {this.strokeSecondary = 16,
      this.strokePrimary = 6,
      required this.background,
      required this.progressColor,
      required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    //full circle
    final pencil = Paint()
      ..strokeWidth = strokePrimary
      ..color = background
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, pencil);

    final arcPencil = Paint()
      ..strokeWidth = strokeSecondary
      ..color = progressColor
      ..strokeCap = StrokeCap.round
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
