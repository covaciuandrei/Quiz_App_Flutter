import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // var numberColor = Colors.pink;

    return SizedBox(
      //asta sa declaram cat de mare vr sa fie caseta pe verticala
      height: 300,
      child: SingleChildScrollView(
        //asta ca sa nu dea exceed la height ul de 300 si sa fie o caseta scrollable de 300
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: data['is_correct_answer'] == true
                        ? Colors.lightBlue
                        : Colors.pink,
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: TextStyle(
                            backgroundColor: data['is_correct_answer'] == true
                                ? Colors.lightBlue
                                : Colors.pink,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 202, 171, 252),
                            ),
                          ),
                          Text(
                            data['corect_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 181, 254, 246),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
