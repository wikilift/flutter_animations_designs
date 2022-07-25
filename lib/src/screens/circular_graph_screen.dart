import 'package:first_design_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphScreen extends StatefulWidget {
  const CircularGraphScreen({Key? key}) : super(key: key);

  @override
  State<CircularGraphScreen> createState() => _CircularGraphScreenState();
}

class _CircularGraphScreenState extends State<CircularGraphScreen> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => setState(() {
            if (progress >= 100)
              progress = 0;
            else
              progress += 10;
          }),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CustomRadialProgress(progress: progress, primaryColor: Colors.grey, secondaryColor: Colors.pink),
                _CustomRadialProgress(progress: progress, primaryColor: Colors.yellow, secondaryColor: Colors.green),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CustomRadialProgress(progress: progress, primaryColor: Colors.black, secondaryColor: Colors.red),
                _CustomRadialProgress(progress: progress, primaryColor: Colors.orange, secondaryColor: Colors.indigo),
              ],
            )
          ],
        ));
  }
}

class _CustomRadialProgress extends StatelessWidget {
  const _CustomRadialProgress({
    Key? key,
    required this.progress,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  final double progress;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        background: secondaryColor,
        progressColor: primaryColor,
        progress: progress,
      ),
    );
  }
}
