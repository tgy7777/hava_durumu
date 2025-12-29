import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(
    this.color1,
    this.color2, {
    super.key,
    required this.child,
  });

  const GradientContainer.blue({super.key, required this.child})
    : color1 = Colors.blue,
      color2 = const Color.fromARGB(255, 11, 79, 112);

  final Color color1;
  final Color color2;
  final Widget child;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: child,
    );
  }
}
