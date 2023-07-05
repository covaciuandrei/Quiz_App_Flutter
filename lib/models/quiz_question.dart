class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    //new list shuffled va fi aici si
    //answers original ramane nemodificat
    return shuffledList;
  }
}
