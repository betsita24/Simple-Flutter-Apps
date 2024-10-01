import 'package:flutter/material.dart';
import 'package:roll_dice_app/gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientContainer(
        [
          Color.fromARGB(251, 255, 244, 4),
          Color.fromARGB(255, 28, 239, 52),
        ],
      ),
    ),
  ));
}
// void main() {
//   runApp(const MaterialApp(
//     home: Scaffold(
//       body: GradientContainer(
//         Color.fromARGB(251, 255, 244, 4),
//         Color.fromARGB(255, 28, 239, 52),
//       ),
//     ),
//   ));
// }
