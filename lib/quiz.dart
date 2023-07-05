import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'start_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //inittializarile se fac cand se construieste tot
  // Widget? activeScreen; //POATE FI NULL SAU sa primeasca ceva
  //init state dupa ce obj a fost creat
  //dar nu e imd chemat in timpul crearii lui
  //trb conectat si butonul din startscreen si cel din switchScreen
  //si sa se pastreze state ul in quiz
  //lift the state up pct ca butonul e in startscreen si widget ul care
  //va fi afectat de aceasta schimbare e qestionsscreen
  //ne asiguram ca si startscreen widget child are acces la fct de schimbare a
  //starii din widget ul parinte

  // @override
  // void initState() {
  //   // aici se fac initializarile initiale
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState(); //are grija ca init normal inca sa fie exectuat
  // }
  List<String> selectedAnswers =
      []; //list cu ce answer a fost ales deja de user
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    // print(selectedAnswers.length);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuizz() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = RestultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuizz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
