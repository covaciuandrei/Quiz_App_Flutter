import 'pic.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startColor, this.endColor, {super.key});

  const GradientContainer.purple({super.key})
      : startColor = const Color.fromARGB(255, 133, 77, 231),
        endColor = const Color.fromARGB(255, 155, 74, 231);

  final Color startColor;
  final Color endColor;

  @override //ca sa aratam ca da override la fct build
  //default din stateless widget
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            startColor,
            endColor,
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: Pic(),
      ),
    );
  }
}
