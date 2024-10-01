import 'package:flutter/material.dart';
import 'package:quiz_application/data/questions.dart';
import 'package:quiz_application/questions_screen.dart';
import 'package:quiz_application/results_screen.dart';
import "package:quiz_application/start_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = "questions-scrreen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
      // selectedAnswer = [];
    }
    // final screenWidget = activeScreen == 'start-screen'
    /////     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 75, 4, 120),
                Color.fromARGB(255, 109, 15, 130)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}


// class _QuizState extends State<Quiz> {
//   Widget? activeScreen;
//   @override
//   void initState() {
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }

//   void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }

//   @override
//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 75, 4, 120),
//                 Color.fromARGB(255, 109, 15, 130)
//               ],
//             ),
//           ),
//           child: activeScreen,
//         ),
//       ),
//     );
//   }
// }
