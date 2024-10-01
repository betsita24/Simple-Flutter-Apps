import 'package:flutter/material.dart';
import 'package:roll_dice_app/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.mycolors, {super.key});

  final List<Color> mycolors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: mycolors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
// class GradientContainer extends StatelessWidget {
//   const GradientContainer(this.color1, this.color2, {super.key});

//   final Color color1, color2;
//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [color1, color2],
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText("Hello World!"),
//       ),
//     );
//   }
// }
