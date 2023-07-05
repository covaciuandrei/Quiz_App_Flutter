import 'package:flutter/material.dart';

//asa implementasem pagina de start, dupa am facut alta ca in tutorial sa fiu sigur ca sunt toate elementele identice
class Pic extends StatelessWidget {
  const Pic({super.key});

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 70.0),
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
        ),
        const Text(
          'Learn Flutter the funny way',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 155, 65, 231),
          ),
          child: const Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
