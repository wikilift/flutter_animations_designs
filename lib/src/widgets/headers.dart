import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 300,
    );
  }
}

class RoundedHeader extends StatelessWidget {
  const RoundedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        color: Colors.red,
      ),
      width: double.infinity,
      height: 300,
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _CurvedHeader(),
        ));
  }
}

class _DiagonalHeaders extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades pincel
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke;
    paint.strokeWidth = 5.0;
    final path = Path();

    //draw with path and pencil
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _TriangleHeaders extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades pincel
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke;
    paint.strokeWidth = 5.0;
    final path = Path();

    //draw with path and pencil
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PeakHeader extends StatelessWidget {
  const PeakHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _PeakHeader(),
        ));
  }
}

class _PeakHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades pincel
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke;
    paint.strokeWidth = 5.0;
    final path = Path();

    //draw with path and pencil
    path.lineTo(0, size.height * 0.25); //left border
    path.lineTo(size.width * 0.5, size.height * 0.30); //peak
    path.lineTo(size.width, size.height * 0.25); //right border
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(size.width, 0);
    //path.lineTo(size.height * 0.35, 0);
    //path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CurvedHeader extends StatelessWidget {
  const CurvedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _CurvedHeader(),
        ));
  }
}

class _CurvedHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades pincel
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke;
    paint.strokeWidth = 15.0;
    final path = Path();

    //draw with path and pencil
    path.lineTo(0, size.height * 0.25); //left border
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.45, size.width, size.height * 0.25);
    path.lineTo(size.width, 0); //right border

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TwisterHeader extends StatelessWidget {
  const TwisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _TwisterHeader(),
        ));
  }
}

class _TwisterHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades pincel
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke;
    paint.strokeWidth = 15.0;
    final path = Path();

    //draw with path and pencil
    path.lineTo(0, size.height * 0.25); //left border
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);

    path.lineTo(size.width, 0); //right border

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class GradientTwisterHeader extends StatelessWidget {
  const GradientTwisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _GradientTwisterHeader(),
        ));
  }
}

class _GradientTwisterHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: const Offset(165, 25), radius: 180);
    const Gradient gradient = LinearGradient(/*begin: Alignment.topCenter, end: Alignment.bottomCenter*/ colors: [
      Color(0xff6d05e8),
      Color(0xffc012ff),
      Color(0xff6d05fa),
    ]);
    final paint = Paint()..shader = gradient.createShader(rect);
    //propiedades pincel
    // paint.color = Colors.red;
    paint.style = PaintingStyle.fill; //.stroke;
    paint.strokeWidth = 15.0;
    final path = Path();

    //draw with path and pencil
    path.lineTo(0, size.height * 0.25); //left border
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);

    path.lineTo(size.width, 0); //right border

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
