import 'package:first_design_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersScreen extends StatelessWidget {
  const HeadersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GradientTwisterHeader());
  }
}
